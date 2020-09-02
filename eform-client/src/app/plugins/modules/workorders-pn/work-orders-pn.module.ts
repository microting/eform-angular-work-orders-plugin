import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslateModule } from '@ngx-translate/core';
import { WorkOrdersPnRoutingModule } from './work-orders-pn-routing.module';
import { WorkOrdersSettingsService, WorkOrdersService } from './services';
import { WorkOrdersPnLayoutComponent } from './layouts';
import {
  WorkOrdersSettingsComponent,
  WorkOrdersPageComponent,
  SettingsAddSiteModalComponent,
  SettingsRemoveSiteModalComponent
} from './components';
import {SharedPnModule} from 'src/app/plugins/modules/shared/shared-pn.module';
import {ButtonsModule, ModalModule, TableModule, TooltipModule} from 'angular-bootstrap-md';
import {FontAwesomeModule} from '@fortawesome/angular-fontawesome';
import {NgSelectModule} from '@ng-select/ng-select';
import {FormsModule} from '@angular/forms';

@NgModule({
  imports: [
    CommonModule,
    WorkOrdersPnRoutingModule,
    TranslateModule,
    SharedPnModule,
    TableModule,
    TooltipModule,
    FontAwesomeModule,
    ModalModule,
    NgSelectModule,
    FormsModule,
    ButtonsModule,
  ],
  declarations: [
    WorkOrdersPnLayoutComponent,
    WorkOrdersSettingsComponent,
    WorkOrdersPageComponent,
    SettingsAddSiteModalComponent,
    SettingsRemoveSiteModalComponent,
  ],
  providers: [WorkOrdersService, WorkOrdersSettingsService],
})
export class WorkOrdersPnModule {}
