import { Injectable } from '@angular/core';
import { persistState, Store, StoreConfig } from '@datorama/akita';
import { CommonPaginationState } from 'src/app/common/models/common-pagination-state';

export interface WorkordersState {
  pagination: CommonPaginationState;
}

export function createInitialState(): WorkordersState {
  return <WorkordersState>{
    pagination: {
      pageSize: 10,
      sort: 'Id',
      isSortDsc: false,
      nameFilter: '',
      offset: 0,
    },
  };
}

export const workordersPersistStorage = persistState({
  include: ['workordersPnWorkorders'],
  key: 'pluginsStore',
});

@Injectable({ providedIn: 'root' })
@StoreConfig({ name: 'workordersPnWorkorders', resettable: true })
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
