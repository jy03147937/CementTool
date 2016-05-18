//
//  NavigationViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-3-13.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "NavigationViewController.h"
#import "InputViewController.h"
#import "FourGraphViewController.h"

@interface NavigationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *userGuide;
@property (weak, nonatomic) IBOutlet UIButton *input;
@property (weak, nonatomic) IBOutlet UIButton *result;
@property (weak, nonatomic) IBOutlet UIButton *plantsList;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.userGuide.titleLabel.font = [UIFont fontWithName:@"helvetica" size:20];
    self.input.titleLabel.font = [UIFont fontWithName:@"helvetica" size:20];
    self.result.titleLabel.font = [UIFont fontWithName:@"helvetica" size:20];
    self.plantsList.titleLabel.font = [UIFont fontWithName:@"helvetica" size:20];
    self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"input"]) {
}
    if ([segue.identifier isEqualToString:@"result"]) {
        FourGraphViewController *destViewController = segue.destinationViewController;//创建联线中目的视图的引用
        
        destViewController.calculator = [[Calculator alloc] init];
        //name
        destViewController.calculator.plantName = @"Default Example";
        
        //production/Users/aocc/Documents/cementTool/cementTool.xcodeproj
        destViewController.calculator.totalPlantClinkerProduction = 2845671.0;
        destViewController.calculator.totalPlantCementProduction = 2479648.0;
        
        //KPIS
        destViewController.calculator.plantClinkerSPC = 63.0;
        destViewController.calculator.plantClinkerSHC = 3392.0;
        destViewController.calculator.plantCementFGSPC = 49.0;
        destViewController.calculator.averageWHRnePowerGeneration = 0.0;
        
        //capacity
        destViewController.calculator.averageClinkerLineCapacity = 5290.0;
        destViewController.calculator.totalPlantCementMilloutput = 160.0;
        
        //plant cost
        destViewController.calculator.averageSpecificHeatCost = 3.29;
        destViewController.calculator.averageSpecificPowerCost = 55.3;
        destViewController.calculator.averageSpecificPowerCostFromWHR = 0.0;
        
        //plant configuration
        destViewController.calculator.numberOfClinkerLines = 4;
        destViewController.calculator.numberOfCementMills = 4;
        destViewController.calculator.averageNumberOfPreheaterStages = 5;
        destViewController.calculator.rawGrindingProcess = @"Ball Mill";
        destViewController.calculator.kilnGasBypass = @"No";
        destViewController.calculator.coolerType = @"Grate Cooler";
        destViewController.calculator.dryingRequirment = @"M";
        destViewController.calculator.burningProcess = @"Modern Dry";
        destViewController.calculator.cementGrindingProcess = @"Ball Mill";
    }
    if ([segue.identifier isEqualToString:@"save"]) {
        PlantsViewController *destViewController = segue.destinationViewController;
        destViewController.tableData = [NSKeyedUnarchiver unarchiveObjectWithFile:[destViewController archivePath]];
        if (destViewController.tableData == nil) {
        destViewController.tableData = [[NSMutableArray alloc] init];
           }
        }

}


@end
