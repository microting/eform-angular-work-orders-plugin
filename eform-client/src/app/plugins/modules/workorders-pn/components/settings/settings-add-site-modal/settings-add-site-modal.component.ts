import {Component, Input, OnInit, ViewChild} from '@angular/core';
import {SiteNameDto} from 'src/app/common/models';

@Component({
  selector: 'app-settings-add-site-modal',
  templateUrl: './settings-add-site-modal.component.html',
  styleUrls: ['./settings-add-site-modal.component.scss'],
})
export class SettingsAddSiteModalComponent implements OnInit {
  @ViewChild('frame', { static: false }) frame;
  assignedSites: SiteNameDto[] = [];
  sites: SiteNameDto[] = [];
  selectedSiteId: number;

  constructor() {}

  ngOnInit(): void {}

  show(sites: SiteNameDto[], assignedSites: SiteNameDto[]) {
    this.frame.show();
  }

  assignSite() {
    this.frame.hide();
  }
}
