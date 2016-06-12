//
//  ZoomInSecondGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-26.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface ZoomInSecondGraphViewController : UIViewController
{
    float actualFGSPC;
    float achievableFGSPC;
    float intAdvancedFGSPC;
    float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
    
    NSString * selectedCurrency;
}
@property float actualFGSPC;
@property float achievableFGSPC;
@property float intAdvancedFGSPC;

@property float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
@property NSString * name;
@property NSString * selectedCurrency;

@end
