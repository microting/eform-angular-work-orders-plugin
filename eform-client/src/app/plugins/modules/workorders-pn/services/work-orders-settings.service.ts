import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {
  OperationDataResult,
  OperationResult,
} from '../../../../common/models';
import { WorkOrdersSettingsModel } from '../models';
import { ApiBaseService } from 'src/app/common/services';

export let WorkOrdersSettingsMethods = {
  Settings: 'api/workorders-pn/settings',
  SettingsSites: 'api/workorders-pn/settings/sites',
  SettingsFolder: 'api/workorders-pn/settings/folder',
  SettingsTasksFolder: 'api/workorders-pn/settings/tasksfolder',
};
@Injectable()
export class WorkOrdersSettingsService {
  constructor(private apiBaseService: ApiBaseService) {}

  getAllSettings(): Observable<OperationDataResult<WorkOrdersSettingsModel>> {
    return this.apiBaseService.get(WorkOrdersSettingsMethods.Settings);
  }

  addSiteToSettings(siteId: number): Observable<OperationResult> {
    return this.apiBaseService.post(
      WorkOrdersSettingsMethods.SettingsSites,
      siteId
    );
  }

  removeSiteFromSettings(id: number): Observable<OperationResult> {
    return this.apiBaseService.delete(
      WorkOrdersSettingsMethods.SettingsSites + '/' + id
    );
  }

  updateSettingsFolder(folderId: number): Observable<OperationResult> {
    return this.apiBaseService.post(
      WorkOrdersSettingsMethods.SettingsFolder,
      folderId
    );
  }

  updateSettingsTasksFolder(folderId: number): Observable<OperationResult> {
    return this.apiBaseService.post(
      WorkOrdersSettingsMethods.SettingsTasksFolder,
      folderId
    );
  }
}
