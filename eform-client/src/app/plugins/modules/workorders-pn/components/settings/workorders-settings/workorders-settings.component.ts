import {Component, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {WorkOrdersSettingsModel} from '../../../models';
import {WorkOrdersSettingsService} from '../../../services';
import {Subscription} from 'rxjs';
import {AutoUnsubscribe} from 'ngx-auto-unsubscribe';
import {SettingsRemoveSiteModalComponent} from '../settings-remove-site-modal/settings-remove-site-modal.component';
import {SettingsAddSiteModalComponent} from '../settings-add-site-modal/settings-add-site-modal.component';
import {SitesService} from 'src/app/common/services/advanced';
import {SiteNameDto} from 'src/app/common/models';

@AutoUnsubscribe()
@Component({
  selector: 'app-workorders-settings',
  templateUrl: './workorders-settings.component.html',
  styleUrls: ['./workorders-settings.component.scss'],
})
export class WorkOrdersSettingsComponent implements OnInit, OnDestroy {
  @ViewChild('removeSiteModal') removeSiteModal: SettingsRemoveSiteModalComponent;
  @ViewChild('addSiteModal') addSiteModal: SettingsAddSiteModalComponent;
  workOrdersSettingsModel: WorkOrdersSettingsModel = new WorkOrdersSettingsModel();
  sites: SiteNameDto[] = [];
  settingsSub$: Subscription;
  sitesSub$: Subscription;
  constructor(private settingsService: WorkOrdersSettingsService, private sitesService: SitesService) {}

  ngOnInit(): void {
    // this.getSettings();
    this.getSites();
  }

  getSettings() {
    this.settingsSub$ = this.settingsService
      .getAllSettings()
      .subscribe((data) => {
        if (data && data.success) {
          this.workOrdersSettingsModel = data.model;
        }
      });
  }

  getSites() {
    this.sitesSub$ = this.sitesService.getAllSites().subscribe((data) => {
      if (data && data.success) {
        this.sites = data.model;
      }
    });
  }

  showAddNewSiteModal() {
    this.addSiteModal.show(this.sites, this.workOrdersSettingsModel.assignedSites);
  }

  showRemoveSiteModal(selectedSite: SiteNameDto) {
    this.removeSiteModal.show(selectedSite);
  }

  ngOnDestroy(): void {}
}
