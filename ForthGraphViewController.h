//
//  ForthGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-27.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "ZoomInForthGraphViewController.h"
#import "Constant.h"

@interface ForthGraphViewController : UIViewController{
    float actualWHRClinkerSPG_s;
    float achievableWHRClinkerSPG_s;
    float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration_s;
    float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration_s;
    NSString * selectedCurrency;
}

@property float actualWHRClinkerSPG_s;
@property float achievableWHRClinkerSPG_s;
@property float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration_s;
@property float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGenerationv_s;
@property NSString * name_s;
@property NSString * selectedCurrency;

@end
