import {SiteNameDto} from 'src/app/common/models';

export class WorkOrdersSettingsModel {
  folderId?: number;
  folderName: string;
  assignedSites: SiteNameDto[] = [];
}
