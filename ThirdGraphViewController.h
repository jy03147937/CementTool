//
//  ThirdGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-27.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface ThirdGraphViewController : UIViewController
{
    float actualClinkerSHC_s;
    float achievableClinkerSHC_s;
    float intAdvancedClinkerSHC_s;
    float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction_s;
    float maximumAnnualSavingsOnHeatCostfromClinkerProduction_s;
    float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction_s;
    float achievableAnnualSavingsOnHeatCostfromClinkerProduction_s;
}

@property float actualClinkerSHC_s;
@property float achievableClinkerSHC_s;
@property float intAdvancedClinkerSHC_s;
@property float maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction_s;
@property float maximumAnnualSavingsOnHeatCostfromClinkerProduction_s;
@property float achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction_s;
@property float achievableAnnualSavingsOnHeatCostfromClinkerProduction_s;
@property NSString *name_s;
@end
