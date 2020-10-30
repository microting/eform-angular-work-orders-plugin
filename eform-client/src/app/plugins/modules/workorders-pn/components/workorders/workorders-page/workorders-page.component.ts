import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { CommonImageModel, PageSettingsModel } from 'src/app/common/models';
import {WorkOrderModel, WorkOrdersModel, WorkOrdersRequestModel} from '../../../models';
import { Subject, Subscription } from 'rxjs';
import { PluginClaimsHelper } from 'src/app/common/helpers';
import {
  WorkOrdersPnClaims,
  WorkOrdersSortColumns,
} from 'src/app/plugins/modules/workorders-pn/const';
import { SharedPnService } from 'src/app/plugins/modules/shared/services';
import { TranslateService } from '@ngx-translate/core';
import { WorkOrdersService } from '../../../services';
import { debounceTime } from 'rxjs/operators';
import { AutoUnsubscribe } from 'ngx-auto-unsubscribe';
import {PlanningPnModel} from 'src/app/plugins/modules/items-planning-pn/models/plannings';

@AutoUnsubscribe()
@Component({
  selector: 'app-workorders-page',
  templateUrl: './workorders-page.component.html',
  styleUrls: ['./workorders-page.component.scss'],
})
export class WorkOrdersPageComponent implements OnInit, OnDestroy {
  @ViewChild('imagesModalComponent', { static: false }) imagesModalComponent;
  @ViewChild('deleteWorkOrderModal', { static: false }) deleteWorkOrderModal;
  localPageSettings: PageSettingsModel = new PageSettingsModel();
  workOrdersRequestModel: WorkOrdersRequestModel = new WorkOrdersRequestModel();
  workOrdersModel: WorkOrdersModel = new WorkOrdersModel();
  searchSubject = new Subject();
  getAllSub$: Subscription;

  get pluginClaimsHelper() {
    return PluginClaimsHelper;
  }

  get workOrdersPnClaims() {
    return WorkOrdersPnClaims;
  }

  get sortCols() {
    return WorkOrdersSortColumns;
  }

  constructor(
    private sharedPnService: SharedPnService,
    private translateService: TranslateService,
    private workOrdersService: WorkOrdersService
  ) {
    this.searchSubject.pipe(debounceTime(500)).subscribe((val) => {
      this.workOrdersRequestModel.searchString = val.toString();
      this.getWorkOrders();
    });
  }

  ngOnInit() {
    this.getLocalPageSettings();
    this.getWorkOrders();
  }

  getLocalPageSettings() {
    this.localPageSettings = this.sharedPnService.getLocalPageSettings(
      'workOrdersPnLocalSettings',
      'WorkOrdersList'
    ).settings;
  }

  updateLocalPageSettings() {
    this.sharedPnService.updateLocalPageSettings(
      'workOrdersPnLocalSettings',
      this.localPageSettings,
      'WorkOrdersList'
    );
    this.getWorkOrders();
  }

  showDeleteWorkOrderModal(workOrderModel: WorkOrderModel) {
    this.deleteWorkOrderModal.show(workOrderModel);
  }

  getWorkOrders() {
    this.workOrdersRequestModel.isSortDsc = this.localPageSettings.isSortDsc;
    this.workOrdersRequestModel.sort = this.localPageSettings.sort;
    this.workOrdersRequestModel.pageSize = this.localPageSettings.pageSize;

    this.getAllSub$ = this.workOrdersService
      .getAllWorkOrders(this.workOrdersRequestModel)
      .subscribe((data) => {
        if (data && data.success) {
          this.workOrdersModel = data.model;
        }
      });
  }

  sortTable(sort: string) {
    if (this.localPageSettings.sort === sort) {
      this.localPageSettings.isSortDsc = !this.localPageSettings.isSortDsc;
    } else {
      this.localPageSettings.isSortDsc = false;
      this.localPageSettings.sort = sort;
    }
    this.updateLocalPageSettings();
  }

  changePage(e: any) {
    if (e || e === 0) {
      this.workOrdersRequestModel.offset = e;
      this.getWorkOrders();
    }
  }

  onSearchInputChanged(e: any) {
    this.searchSubject.next(e.target.value);
  }

  getSortIcon(sort: string): string {
    if (this.workOrdersRequestModel.sort === sort) {
      return this.workOrdersRequestModel.isSortDsc
        ? 'expand_more'
        : 'expand_less';
    } else {
      return 'unfold_more';
    }
  }

  openPicturesModal(images: string[]) {
    this.imagesModalComponent.show(images);
  }

  ngOnDestroy(): void {}
}
