//
//  SecondGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-26.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "ZoomInSecondGraphViewController.h"
#import "Constant.h"

@interface SecondGraphViewController : UIViewController
{
    float actualFGSPC_s2;
    float achievableFGSPC_s2;
    float intAdvancedFGSPC_s2;
    float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
    float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
    NSString *name_s;
}
@property float actualFGSPC_s2;
@property float achievableFGSPC_s2;
@property float intAdvancedFGSPC_s2;
@property float maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
@property float achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
@property NSString *name_s;

@end
