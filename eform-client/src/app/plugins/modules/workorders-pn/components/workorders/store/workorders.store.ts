import { Injectable } from '@angular/core';
import { persistState, Store, StoreConfig } from '@datorama/akita';
import {
  CommonPaginationState,
  FiltrationStateModel,
} from 'src/app/common/models';

export interface WorkordersState {
  pagination: CommonPaginationState;
  filters: FiltrationStateModel;
  total: number;
}

export function createInitialState(): WorkordersState {
  return <WorkordersState>{
    pagination: {
      pageSize: 10,
      sort: 'Id',
      isSortDsc: false,
      offset: 0,
    },
    filters: {
      nameFilter: '',
    },
  };
}

const workordersPersistStorage = persistState({
  include: ['workorders'],
  key: 'workordersPn',
  preStorageUpdate(storeName, state) {
    return {
      pagination: state.pagination,
      filters: state.filters,
    };
  },
});

@Injectable({ providedIn: 'root' })
@StoreConfig({ name: 'workorders', resettable: true })
export class WorkordersStore extends Store<WorkordersState> {
  constructor() {
    super(createInitialState());
  }
}

export const workordersPersistProvider = {
  provide: 'persistStorage',
  useValue: workordersPersistStorage,
  multi: true,
};
