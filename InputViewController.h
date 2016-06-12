//
//  ViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-20.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "PopoverContentViewController.h"
#import "PlantsViewController.h"



@interface InputViewController : UIViewController<UIPopoverControllerDelegate,UIAlertViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
    UIPopoverController *popoverController1;
    NSString *averageKiln1;
    NSString *plantName1;
    NSString *totalPlantClinkerProductionLastYear1;
    NSString *totalPlantCementProductionLastYear1;
    NSString *plantClinkerSPC1;
    NSString *plantClinkerSHC1;
    NSString *plantCementFGSPC1;
    NSString *averageClinkerLineCapacity1;
    NSString *totalPlantCementMillOutput1;
    NSString *averageSpecificHeatCost1;
    NSString *averageSpecificPowerCost1;
    NSString *averageSpecificPowerCostFromWHR1;
    NSString *numberOfClinkerLines1;
    NSString *numberOfCementMills1;
    NSString *averageWHRNetPowerGeneration1;
    NSString *averageNumberOfPreheaterStages1;
    NSString *selectedCurrency;
    NSNumber *rawGrindingProcess1;
    NSNumber *kilnGasBypass1;
    NSNumber *coolerType1;
    NSNumber *dryingRequirment1;
    NSNumber *burningProcess1;
    NSNumber *cementGrindingProcess1;
    
    NSMutableArray *tableData;
    
    NSArray *currencyOptions;
}
@property NSString *plantName1;
@property NSString *totalPlantClinkerProductionLastYear1;
@property NSString *totalPlantCementProductionLastYear1;
@property NSString *plantClinkerSPC1;
@property NSString *plantClinkerSHC1;
@property NSString *plantCementFGSPC1;
@property NSString *averageClinkerLineCapacity1;
@property NSString *totalPlantCementMillOutput1;
@property NSString *averageSpecificHeatCost1;
@property NSString *averageSpecificPowerCost1;
@property NSString *averageSpecificPowerCostFromWHR1;
@property NSString *numberOfClinkerLines1;
@property NSString *numberOfCementMills1;
@property NSString *averageWHRNetPowerGeneration1;
@property NSString *averageNumberOfPreheaterStages1;
@property NSString *selectedCurrency;
@property NSNumber *rawGrindingProcess1;
@property NSNumber *kilnGasBypass1;
@property NSNumber *coolerType1;
@property NSNumber *dryingRequirment1;
@property NSNumber *burningProcess1;
@property NSNumber *cementGrindingProcess1;

@property NSArray *currencyOptions;

@property (weak, nonatomic) IBOutlet UITextField *plantName;
@property (weak, nonatomic) IBOutlet UITextField *totalPlantClinkerProductionLastYear;
@property (weak, nonatomic) IBOutlet UITextField *totalPlantCementProductionLastYear;
@property (weak, nonatomic) IBOutlet UITextField *plantClinkerSPC;
@property (weak, nonatomic) IBOutlet UITextField *plantClinkerSHC;
@property (weak, nonatomic) IBOutlet UITextField *plantCementFGSPC;
@property (weak, nonatomic) IBOutlet UITextField *averageClinkerLineCapacity;
@property (weak, nonatomic) IBOutlet UITextField *totalPlantCementMillOutput;
@property (weak, nonatomic) IBOutlet UITextField *averageSpecificHeatCost;
@property (weak, nonatomic) IBOutlet UITextField *averageSpecificPowerCost;
@property (weak, nonatomic) IBOutlet UITextField *averageSpecificPowerCostFromWHR;
@property (weak, nonatomic) IBOutlet UITextField *numberOfClinkerLines;
@property (weak, nonatomic) IBOutlet UITextField *numberOfCementMills;
@property (weak, nonatomic) IBOutlet UITextField *averageWHRNetPowerGeneration;
@property (weak, nonatomic) IBOutlet UITextField *averageNumberOfPreheaterStages;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rawGrindingProcess;
@property (weak, nonatomic) IBOutlet UISegmentedControl *kilnGasBypass;
@property (weak, nonatomic) IBOutlet UISegmentedControl *coolerType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *dryingRequirment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *burningProcess;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cementGrindingProcess;

@property UIPopoverController *popoverController1;
@property NSString *averageKiln;
@property NSMutableArray *tableData;





@end
