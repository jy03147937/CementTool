//
//  PlantsViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-3-14.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "PlantsViewController.h"
#import "Calculator.h"

@interface PlantsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scorllView;
- (IBAction)back:(id)sender;


@end

@implementation PlantsViewController
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//获取目录
-(NSString *)dataFilePath
{
    /*常量NSDocumentDirectory表明我们正在查找Documents目录路径，第二个常量NSUserDomainMask表示的是把搜索范围定在应用程序沙盒中，YES表示的是希望希望该函数能查看用户主目录*/
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"data"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //把数据从闪存提取出来
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:TRUE];
    
    NSString *filePath = [self dataFilePath];
    self.tableData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    
    NSLog(@"hello");
}

//返回tableview的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"table");
    return [self.tableData count];
    
}

-(NSString *)archivePath{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docDir stringByAppendingPathComponent:@"plantsInfo.dat"];
}

//存储数据到闪存
-(void)archivePlantInfo{
    [NSKeyedArchiver archiveRootObject:self.tableData toFile:[self archivePath] ];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"item";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    temp = [self.tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = [temp objectForKey:@"plantName"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"plantDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        InputViewController *destViewController = segue.destinationViewController;
        
        //传递数据
        destViewController.plantName1 = [[self.tableData objectAtIndex:(indexPath.row)]objectForKey:@"plantName"];
        
        destViewController.totalPlantCementProductionLastYear1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"totalPlantCementProductionLastYear"];
        destViewController.totalPlantClinkerProductionLastYear1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"totalPlantClinkerProductionLastYear"];
        
        destViewController.plantClinkerSPC1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"plantClinkerSPC"];
        destViewController.plantClinkerSHC1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"plantClinkerSHC"];
        destViewController.plantCementFGSPC1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"plantCementFGSPC"];
        destViewController.averageWHRNetPowerGeneration1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageWHRNetPowerGeneration"];
        
        destViewController.averageClinkerLineCapacity1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageClinkerLineCapacity"];
        destViewController.totalPlantCementMillOutput1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"totalPlantCementMillOutput"];
        
        destViewController.averageSpecificHeatCost1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageSpecificHeatCost"];
        destViewController.averageSpecificPowerCost1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageSpecificPowerCost"];
        destViewController.averageSpecificPowerCostFromWHR1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageSpecificPowerCostFromWHR"];
        
        destViewController.numberOfClinkerLines1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"numberOfClinkerLines"];
        destViewController.numberOfCementMills1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"numberOfCementMills"];
        destViewController.averageNumberOfPreheaterStages1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"averageNumberOfPreheaterStages"];
        
        destViewController.rawGrindingProcess1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"rawGrindingProcess"];
        destViewController.kilnGasBypass1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"kilnGasBypass"];
        destViewController.coolerType1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"coolerType"];
        destViewController.dryingRequirment1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"dryingRequirment"];
        destViewController.burningProcess1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"burningProcess"];
        destViewController.cementGrindingProcess1 = [[self.tableData objectAtIndex:(indexPath.row)] objectForKey:@"cementGrindingProcess"];
    }
}


//删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *filePath = [self dataFilePath];
    self.tableData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    [self.tableData removeObjectAtIndex:[indexPath row]];
    [self.tableData writeToFile:[self dataFilePath] atomically:YES];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop]; //删除cell

}

@end


