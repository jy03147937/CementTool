//
//  ZoomInThirdGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-3-7.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "Constant.h"

@interface ZoomInThirdGraphViewController : UIViewController{
    float actualSHC;
    float achievableSHC;
    float intAdvancedSHC;
    float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction;
    float maximumAnnualSavingsOnHeatCostfromClinkerProduction;
    float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction;
    float achievableAnnualSavingsOnHeatCostfromClinkerProduction;
}

@property float actualSHC;
@property float achievableSHC;
@property float intAdvancedSHC;
@property float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction;
@property float maximumAnnualSavingsOnHeatCostfromClinkerProduction;
@property float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction;
@property float achievableAnnualSavingsOnHeatCostfromClinkerProduction;
@property NSString * name;
@end
