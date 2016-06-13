//
//  FourGraphViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-2-26.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "FourGraphViewController.h"
#import "FirstGraphViewController.h"
#import "SecondGraphViewController.h"
#import "ThirdGraphViewController.h"
#import "ForthGraphViewController.h"
#import "Calculator.h"

#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

@interface FourGraphViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *cumulatedAchievableAnnualCostSaving;
- (IBAction)Back:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *cumulatedLabel;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;


@end

@implementation FourGraphViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat navHeight = 64.0f;
    CGRect frame = CGRectMake(0.0f, 0.0f, 1024.0f, navHeight);
    [_navBar setFrame:frame];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    /*self.cumulatedAchievableAnnualCostSaving.title = [[NSString alloc] initWithFormat:@"Cumulated Achievable Annual Cost Saving:%.0f",(self.calculator.achievableAnnualSavingsOnPowerCostfromClinkerProduction+self.calculator.achievableAnnualSavingsOnPowerCostfromCementFinishGrinding+self.calculator.achievableAnnualSavingsOnHeatCostfromClinkerProduction+self.calculator.achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration)];*/
    
    //设置底部的总数额
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    float totalSavings = [self.calculator calculateTotalSavingsOnDisplay];
    NSString *numberString = [numberFormatter stringFromNumber: [NSNumber numberWithFloat:totalSavings]];
    
    self.cumulatedLabel.text = [[[NSString alloc] initWithFormat:@"Accumulated Achievable Annual Cost Savings: %@  Currency/y",numberString] stringByReplacingOccurrencesOfString:@"Currency" withString:self.selectedCurrency];
    self.cumulatedLabel.textColor = RGB(255.0, 66.0, 93.0);
    self.cumulatedLabel.highlighted = YES;
    self.cumulatedLabel.font = [UIFont boldSystemFontOfSize:19];
    self.cumulatedLabel.textAlignment = UITextAlignmentCenter;
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.calculator calculateSavings];    //计算SPC等KPI值
    if ([segue.identifier isEqualToString:@"first"]) {
        FirstGraphViewController *destViewController = segue.destinationViewController;
        destViewController.actualSPC_s = self.calculator.plantClinkerSPC;
        destViewController.achievableSPC_s = [self.calculator chooseAchievableSPC];
        destViewController.intAdvancedSPC_s = [self.calculator chooseIntAdvancedSPC];
        destViewController.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction_s = self.calculator.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction;
        destViewController.achievableAnnualSavingsOnPowerCostfromClinkerProduction_s = self.calculator.achievableAnnualSavingsOnPowerCostfromClinkerProduction;
        destViewController.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction_s = self.calculator.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction;
        destViewController.maximumAnnualSavingsOnPowerCostfromClinkerProduction_s = self.calculator.maximumAnnualSavingsOnPowerCostfromClinkerProduction;
        destViewController.name_s = self.calculator.plantName;
        destViewController.selectedCurrency = self.selectedCurrency;
    };
    
    if([segue.identifier isEqualToString:@"second"]){
        SecondGraphViewController *destViewController = segue.destinationViewController;
        destViewController.actualFGSPC_s2 = self.calculator.plantCementFGSPC;
        destViewController.achievableFGSPC_s2  = [self.calculator chooseAchievableFGSPC];
        destViewController.intAdvancedFGSPC_s2 = [self.calculator chooseIntAdvancedFGSPC];
        NSLog([NSString stringWithFormat:@"%f",[self.calculator chooseIntAdvancedFGSPC]]);
        destViewController.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = self.calculator.maximumAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
        destViewController.maximumAnnualSavingsOnPowerCostfromCementFinishGrinding = self.calculator.maximumAnnualSavingsOnPowerCostfromCementFinishGrinding;
        destViewController.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding = self.calculator.achievableAnnualSavingsOnPowerConsumptionfromCementFinishGrinding;
        destViewController.achievableAnnualSavingsOnPowerCostfromCementFinishGrinding = self.calculator.achievableAnnualSavingsOnPowerCostfromCementFinishGrinding;
        destViewController.name_s = self.calculator.plantName;
        destViewController.selectedCurrency = self.selectedCurrency;
    };
    
    if([segue.identifier isEqualToString:@"third"]){
        ThirdGraphViewController *destViewController = segue.destinationViewController;
        destViewController.actualClinkerSHC_s = self.calculator.plantClinkerSHC;
        destViewController.achievableClinkerSHC_s = [self.calculator chooseAchievableSHC];
        destViewController.intAdvancedClinkerSHC_s = [self.calculator chooseIntAdvancedSHC];
        destViewController.maximumAnnualSavingsOnHeatCostfromClinkerProduction_s = self.calculator.maximumAnnualSavingsOnHeatCostfromClinkerProduction;
        destViewController.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction_s = self.calculator.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction;
        destViewController.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction_s = self.calculator.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction;
        destViewController.achievableAnnualSavingsOnHeatCostfromClinkerProduction_s = self.calculator.achievableAnnualSavingsOnHeatCostfromClinkerProduction;
        destViewController.name_s = self.calculator.plantName;
        destViewController.selectedCurrency = self.selectedCurrency;
    };
    
    if([segue.identifier isEqualToString:@"forth"]){
        ForthGraphViewController *destViewController = segue.destinationViewController;
        destViewController.actualWHRClinkerSPG_s = self.calculator.averageWHRnePowerGeneration;
        destViewController.achievableWHRClinkerSPG_s = [self.calculator chooseIntAdvancedWHRClinkerSPG];
        destViewController.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGenerationv_s = self.calculator.achievableAnnualSavingsOnPowerConsumptionfromWHRPowerGeneration;
        destViewController.achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration_s = self.calculator.achievableAnnualSavingsOnPowerCostfromWHRPowerGeneration;
        destViewController.name_s = self.calculator.plantName;
        destViewController.selectedCurrency = self.selectedCurrency;
    };
    
}
- (IBAction)Back:(id)sender {
     [self dismissViewControllerAnimated:YES completion:^(void){}];
}
@end
