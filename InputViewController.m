//
//  ViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-2-20.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "InputViewController.h"
#import "ZoomInFirstGraphViewController.h"
#import "FourGraphViewController.h"

@interface InputViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)showPopover1:(id)sender;
- (IBAction)back:(id)sender;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)save:(id)sender;
- (void) saveData;
- (void) saving:(NSMutableDictionary*)plant;
- (void) override:(NSString*)name;
- (BOOL) isNameExiting:(NSString*)name;
- (IBAction)saveAs:(id)sender;

@end

@implementation InputViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.plantName1 != nil) {
        self.plantName.text = self.plantName1;

        self.totalPlantClinkerProductionLastYear.text = self.totalPlantClinkerProductionLastYear1;
        self.totalPlantCementProductionLastYear.text = self.totalPlantCementProductionLastYear1;
        
        self.plantClinkerSPC.text = self.plantClinkerSPC1;
        self.plantClinkerSHC.text = self.plantClinkerSHC1;
        self.plantCementFGSPC.text = self.plantCementFGSPC1;
        self.averageWHRNetPowerGeneration.text = self.averageWHRNetPowerGeneration1;
        
        self.averageClinkerLineCapacity.text = self.averageClinkerLineCapacity1;
        self.totalPlantCementMillOutput.text = self.totalPlantCementMillOutput1;
        
        self.averageSpecificHeatCost.text = self.averageSpecificHeatCost1;
        self.averageSpecificPowerCost.text = self.averageSpecificPowerCost1;
        self.averageSpecificPowerCostFromWHR.text = self.averageSpecificPowerCostFromWHR1;
        
        self.numberOfCementMills.text = self.numberOfCementMills1;
        self.numberOfClinkerLines.text  = self.numberOfClinkerLines1;
        self.averageNumberOfPreheaterStages.text = self.averageNumberOfPreheaterStages1;
        
        self.rawGrindingProcess.selectedSegmentIndex = [self.rawGrindingProcess1 intValue];
        self.kilnGasBypass.selectedSegmentIndex = [self.kilnGasBypass1 intValue];
        self.coolerType.selectedSegmentIndex = [self.coolerType1 intValue];
        self.dryingRequirment.selectedSegmentIndex  = [self.dryingRequirment1 intValue];
        self.burningProcess.selectedSegmentIndex = [self.burningProcess1 intValue];
        self.cementGrindingProcess.selectedSegmentIndex = [self.cementGrindingProcess1 intValue];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.scrollView.contentSize = CGSizeMake(1064,2065);  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
}

-(NSString *)dataFilePath
{
    /*常量NSDocumentDirectory表明我们正在查找Documents目录路径，第二个常量NSUserDomainMask表示的是把搜索范围定在应用程序沙盒中，YES表示的是希望希望该函数能查看用户主目录*/
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"data"];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"calculation"]) {
        FourGraphViewController *destViewController = segue.destinationViewController;//创建联线中目的视图的引用
        
        destViewController.calculator = [[Calculator alloc] init];
        
        //name
        destViewController.calculator.plantName = self.plantName.text;
        
        //production/Users/aocc/Documents/cementTool/cementTool.xcodeproj
        destViewController.calculator.totalPlantClinkerProduction = [self.totalPlantClinkerProductionLastYear.text floatValue];
        destViewController.calculator.totalPlantCementProduction = [self.totalPlantCementProductionLastYear.text floatValue];
        
        //KPIS
        destViewController.calculator.plantClinkerSPC = [self.plantClinkerSPC.text floatValue];
        destViewController.calculator.plantClinkerSHC = [self.plantClinkerSHC.text floatValue];
        destViewController.calculator.plantCementFGSPC = [self.plantCementFGSPC.text floatValue];
        destViewController.calculator.averageWHRnePowerGeneration = [self.averageWHRNetPowerGeneration.text floatValue];
        
        //capacity
        destViewController.calculator.averageClinkerLineCapacity = [self.averageClinkerLineCapacity.text floatValue];
        destViewController.calculator.totalPlantCementMilloutput = [self.totalPlantCementMillOutput.text floatValue];
        
        //plant cost
        destViewController.calculator.averageSpecificHeatCost = [self.averageSpecificHeatCost.text floatValue];
        destViewController.calculator.averageSpecificPowerCost = [self.averageSpecificPowerCost.text floatValue];
        destViewController.calculator.averageSpecificPowerCostFromWHR = [self.averageSpecificPowerCostFromWHR.text floatValue];
        
        //plant configuration
        destViewController.calculator.numberOfClinkerLines = [self.numberOfClinkerLines.text intValue];
        destViewController.calculator.numberOfCementMills = [self.numberOfCementMills.text intValue];
        destViewController.calculator.averageNumberOfPreheaterStages = [self.averageNumberOfPreheaterStages.text intValue];
        
        destViewController.calculator.rawGrindingProcess = [self.rawGrindingProcess titleForSegmentAtIndex:self.rawGrindingProcess.selectedSegmentIndex];
        destViewController.calculator.kilnGasBypass = [self.kilnGasBypass titleForSegmentAtIndex:self.kilnGasBypass.selectedSegmentIndex];
        destViewController.calculator.coolerType = [self.coolerType titleForSegmentAtIndex:self.coolerType.selectedSegmentIndex];
        destViewController.calculator.dryingRequirment = [self.dryingRequirment titleForSegmentAtIndex:self.dryingRequirment.selectedSegmentIndex];
        destViewController.calculator.burningProcess = [self.burningProcess titleForSegmentAtIndex:self.burningProcess.selectedSegmentIndex];
        destViewController.calculator.cementGrindingProcess = [self.cementGrindingProcess titleForSegmentAtIndex:self.cementGrindingProcess.selectedSegmentIndex];
    }
}

-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    NSLog(@"11");
}


- (IBAction)showPopover1:(id)sender {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void) saving:(NSMutableDictionary*)plant{
    [plant setObject:self.plantName.text forKey:@"plantName"];
    
    [plant setObject:self.totalPlantClinkerProductionLastYear.text forKey:@"totalPlantClinkerProductionLastYear"];
    [plant setObject:self.totalPlantCementProductionLastYear.text forKey:@"totalPlantCementProductionLastYear"];
    
    [plant setObject:self.plantClinkerSPC.text forKey:@"plantClinkerSPC"];
    [plant setObject:self.plantClinkerSHC.text forKey:@"plantClinkerSHC"];
    [plant setObject:self.plantCementFGSPC.text forKey:@"plantCementFGSPC"];
    [plant setObject:self.averageWHRNetPowerGeneration.text forKey:@"averageWHRNetPowerGeneration"];
    
    [plant setObject:self.averageClinkerLineCapacity.text forKey:@"averageClinkerLineCapacity"];
    [plant setObject:self.totalPlantCementMillOutput.text forKey:@"totalPlantCementMillOutput"];
    
    [plant setObject:self.averageSpecificHeatCost.text forKey:@"averageSpecificHeatCost"];
    [plant setObject:self.averageSpecificPowerCost.text forKey:@"averageSpecificPowerCost"];
    [plant setObject:self.averageSpecificPowerCostFromWHR.text forKey:@"averageSpecificPowerCostFromWHR"];
    
    [plant setObject:self.numberOfClinkerLines.text forKey:@"numberOfClinkerLines"];
    [plant setObject:self.numberOfCementMills.text forKey:@"numberOfCementMills"];
    [plant setObject:self.averageNumberOfPreheaterStages.text forKey:@"averageNumberOfPreheaterStages"];
    
    [plant setObject:[NSNumber numberWithInt:self.rawGrindingProcess.selectedSegmentIndex] forKey:@"rawGrindingProcess"];
    [plant setObject:[NSNumber numberWithInt:self.kilnGasBypass.selectedSegmentIndex] forKey:@"kilnGasBypass"];
    [plant setObject:[NSNumber numberWithInt:self.coolerType.selectedSegmentIndex] forKey:@"coolerType"];
    [plant setObject:[NSNumber numberWithInt:self.dryingRequirment.selectedSegmentIndex] forKey:@"dryingRequirment"];
    [plant setObject:[NSNumber numberWithInt:self.burningProcess.selectedSegmentIndex] forKey:@"burningProcess"];
    [plant setObject:[NSNumber numberWithInt:self.cementGrindingProcess.selectedSegmentIndex] forKey:@"cementGrindingProcess"];
}

- (void) saveData{
    if (self.plantName.text.length != 0 ){      //如果工厂名称为零，则不进行存储
        //获取文件的数组
        NSString *filePath = [self dataFilePath];
        NSMutableArray *file;
        if([[NSFileManager defaultManager]fileExistsAtPath:filePath]){
            file = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        }
        else{
            file = [[NSMutableArray alloc] init];
        }
        
        //创建存储当前plant信息的Dictionary，并存入文件数组
        NSMutableDictionary *plantInfomation = [[NSMutableDictionary  alloc] init];
        [self saving:plantInfomation];
        [file addObject:plantInfomation];
        
        //存入文件
        [file writeToFile:[self dataFilePath] atomically:YES];
        
        //提示存储成功
        UIAlertView *saveAlertView = [[UIAlertView alloc] initWithTitle:@"Save succesed" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [saveAlertView show];
    }
    else {
        //提示存储失败
        UIAlertView *saveAlertView = [[UIAlertView alloc] initWithTitle:@"Save failed" message:@"The plant name cannot be empty"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [saveAlertView show];
    }    
}

- (void) override:(NSString*)name{
    NSString *filePath = [self dataFilePath];
    NSMutableArray *tableData;
    tableData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    NSUInteger loop = [tableData count];
    int i=0;
    for (i ; i<loop;) {
        if ([name isEqualToString:[[tableData objectAtIndex:i] objectForKey:@"plantName"]])
        {
            break;
        }
        else {
            i++;
        }
    }
    [self saving:[tableData objectAtIndex:i]];
    [tableData writeToFile:[self dataFilePath] atomically:YES];
    
    UIAlertView *saveAlertView = [[UIAlertView alloc] initWithTitle:@"Save succesed" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    [saveAlertView show];
    
}

- (BOOL) isNameExiting:(NSString*)name {
    NSString *filePath = [self dataFilePath];
    self.tableData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    NSUInteger loop = [self.tableData count];
    int i=0;
    for (i ; i<loop;) {
        if ([name isEqualToString:[[self.tableData objectAtIndex:i] objectForKey:@"plantName"]])
        {
            break;
        }
        else {
            i++;
        }
    }
    if (i<loop) {
        return TRUE; 
    }
    else {
        return FALSE;
    };
}

- (IBAction)saveAs:(id)sender {
    UIAlertView *saveAsAlertView = [[UIAlertView alloc] initWithTitle:@"Input the name:" message:@""  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
    saveAsAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [saveAsAlertView show];
}

- (IBAction)save:(id)sender {
    if ([self isNameExiting:self.plantName.text]) {
        UIAlertView *overrideAlertView = [[UIAlertView alloc] initWithTitle:@"Override the previous data?" message:@""  delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO",nil];
        [overrideAlertView show];
    }
    else {
    [self saveData];
    }
}


- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alert.title isEqual: @"Override the previous data?"]) {
        if (buttonIndex == 0){
            [self override:self.plantName.text];
        }
    }
    else if([alert.title isEqual:@"Input the name:"]){
        if (buttonIndex == 0){
            UITextField *temp = self.plantName;
            self.plantName = [alert textFieldAtIndex:0];
            [self saveData];
            if (self.plantName.text.length == 0) {
                self.plantName = temp;
            }
            
        }
    }
}

- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex{
}


@end
