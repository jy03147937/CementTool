//
//  ZoomInForthGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-3-8.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "Constant.h"

@interface ZoomInForthGraphViewController : UIViewController{
    float actualWHRClinkerSPG;
    float achievableWHRClinkerSPG;
    float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
    float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration;
}

@property float actualWHRClinkerSPG;
@property float achievableWHRClinkerSPG;
@property float achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
@property float achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration;
@property NSString * name;
@end
