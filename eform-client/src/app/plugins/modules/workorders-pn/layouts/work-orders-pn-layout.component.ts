import {AfterViewInit, Component, OnInit} from '@angular/core';
import {LocaleService} from 'src/app/common/services';
import {TranslateService} from '@ngx-translate/core';
import {SharedPnService} from '../../shared/services';
import {WorkOrdersPnLocalSettings} from '../const';
declare var require: any;

@Component({
  selector: 'app-workorders-pn-layout',
  template: '<router-outlet></router-outlet>'
})
export class WorkOrdersPnLayoutComponent implements  AfterViewInit, OnInit {
  constructor(private localeService: LocaleService,
              private translateService: TranslateService,
              private sharedPnService: SharedPnService) {
  }

  ngOnInit(): void {
    this.sharedPnService.initLocalPageSettings('workOrdersPnLocalSettings', WorkOrdersPnLocalSettings);
  }

  ngAfterViewInit() {
    setTimeout(() => {
      const lang = this.localeService.getCurrentUserLocale();
      const i18n = require(`../i18n/${lang}.json`);
      this.translateService.setTranslation(lang, i18n, true);
    }, 1000);
  }
}
