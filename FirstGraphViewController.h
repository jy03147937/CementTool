//
//  FirstGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-25.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import <Foundation/Foundation.h>
#import "Constant.h"


@interface FirstGraphViewController : UIViewController{
    float actualSPC_s;
    float intAdvancedSPC_s;
    float achievableSPC_s;
    float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
    float maximumAnnualSavingsOnPowerCostfromClinkerProduction_s;
    float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
    float achievableAnnualSavingsOnPowerCostfromClinkerProduction_s;
    NSString * name_s;
    NSString * selectedCurrency;
}

@property float actualSPC_s;
@property float intAdvancedSPC_s;
@property float achievableSPC_s;
@property float maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
@property float maximumAnnualSavingsOnPowerCostfromClinkerProduction_s;
@property float achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
@property float achievableAnnualSavingsOnPowerCostfromClinkerProduction_s;
@property NSString * name_s;
@property NSString * selectedCurrency;


@end
