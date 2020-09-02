import {Component, OnDestroy, OnInit} from '@angular/core';
import {WorkOrdersSettingsModel} from '../../../models';
import {WorkOrdersSettingsService} from '../../../services';
import {Subscription} from 'rxjs';
import {AutoUnsubscribe} from 'ngx-auto-unsubscribe';

@AutoUnsubscribe()
@Component({
  selector: 'app-workorders-settings',
  templateUrl: './workorders-settings.component.html',
  styleUrls: ['./workorders-settings.component.scss'],
})
export class WorkOrdersSettingsComponent implements OnInit, OnDestroy {
  workOrdersSettingsModel: WorkOrdersSettingsModel = new WorkOrdersSettingsModel();
  settingsSub$: Subscription;
  constructor(private settingsService: WorkOrdersSettingsService) {}

  ngOnInit(): void {}

  getSettings() {
    this.settingsSub$ = this.settingsService.getAllSettings().subscribe((data) => {
      if (data && data.success) {
        this.workOrdersSettingsModel = data.model;
      }
    });
  }

  showAddNewSiteModal() {

  }

  ngOnDestroy(): void {}
}
