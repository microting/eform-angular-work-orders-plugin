import {CommonImageModel} from 'src/app/common/models';

export class WorkOrderModel {
  id: number;
  createdAt: Date | string;
  createdBy: string;
  description: string;
  correctedAtLatest: Date;
  doneAt: Date | string;
  doneBy: string;
  picturesOfTask: CommonImageModel[] = [];
  picturesOfTaskDone: CommonImageModel[] = [];
  descriptionOfTaskDone: string;
}
