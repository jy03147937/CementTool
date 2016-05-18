//
//  OutputViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-21.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import <Foundation/Foundation.h>
#import "Constant.h"

@interface ZoomInFirstGraphViewController : UIViewController{
    float actualSPC;
    float intAdvancedSPC;
    float achievableSPC;
    float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    float maximumAnnualSavingsOnPowerCostfromClinkerProduction;
    float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
    float achievableAnnualSavingsOnPowerCostfromClinkerProduction;
    NSString *name;
}

@property float actualSPC;
@property float intAdvancedSPC;
@property float achievableSPC;

@property float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
@property float maximumAnnualSavingsOnPowerCostfromClinkerProduction;
@property float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
@property float achievableAnnualSavingsOnPowerCostfromClinkerProduction;
@property NSString *name;
@end
