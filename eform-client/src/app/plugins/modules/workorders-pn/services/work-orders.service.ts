import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  OperationDataResult,
  OperationResult,
} from '../../../../common/models';
import { WorkOrdersModel, WorkOrdersRequestModel } from '../models';
import { ApiBaseService } from 'src/app/common/services';

export let WorkOrdersMethods = {
  WorkOrders: 'api/workorders-pn',
};

@Injectable()
export class WorkOrdersService {
  constructor(private apiBaseService: ApiBaseService) {}

  getAllWorkOrders(
    model: WorkOrdersRequestModel
  ): Observable<OperationDataResult<WorkOrdersModel>> {
    return this.apiBaseService.post(WorkOrdersMethods.WorkOrders, model);
  }

  deleteWorkOrder(id: number): Observable<OperationResult> {
    return this.apiBaseService.delete(WorkOrdersMethods.WorkOrders + '/' + id);
  }
}
