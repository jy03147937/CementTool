//
//  ZoomInThirdGraphViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-3-7.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "ZoomInThirdGraphViewController.h"

@interface ZoomInThirdGraphViewController ()
@property (strong, nonatomic) IBOutlet CPTGraphHostingView *hostView;
@property (nonatomic, strong) CPTBarPlot *SHC;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

-(void)initPlot;
-(void)configureGraph;
-(void)configurePlots;
-(void)configureAxes;
-(void)hideAnnotation:(CPTGraph *)graph;
- (IBAction)back:(id)sender;
-(NSString*)numberTransfer:(float)number;

@end

@implementation ZoomInThirdGraphViewController

CGFloat const CPDBarWidth3 = 0.5f;
CGFloat const CPDBarInitialX3 = 0.98f;

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
    
    CGFloat navHeight = 64.0f;
    CGRect frame = CGRectMake(0.0f, 0.0f, 1024.0f, navHeight);
    [_navBar setFrame:frame];
	
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //创建导航栏、导航栏集合、按钮
    /*UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 1024, 44)];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:nil];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(clickBackButton)];
    
    //设置导航栏集合的标题
    [navigationItem setTitle:@"Results"];
    
    //把导航栏集合添加入导航栏中，设置动画关闭
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    
    //把按钮添加入导航栏集合中
    [navigationItem setLeftBarButtonItem:backButton];
    
    //添加导航栏到视图中
    [self.view addSubview:navigationBar];*/
    
    //画图
    [self initPlot];
}

-(NSString*)numberTransfer:(float)number
{
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior: NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    int temp = number;
    NSString *numberString = [numberFormatter stringFromNumber: [NSNumber numberWithInt:temp]];
    return numberString;
}

#pragma mark - Chart behavior
-(void)initPlot {
    [self configureGraph];
    [self configurePlots];
    [self configureAxes];
}



- (void)clickBackButton
{
    [self showDialog:@"点击了Back按钮"];
}

-(void)showDialog:(NSString *) str
{
    
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (NSArray *)SPCValue
{
    NSArray *values = nil;
    if (!values)
    {
        values = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:self.intAdvancedSHC],
                  [NSDecimalNumber numberWithFloat:self.achievableSHC],
                  [NSDecimalNumber numberWithFloat:self.actualSHC],
                  nil];
    }
    return values;
}

-(void)configureGraph {
    // 1 - Create the graph
    CGRect bounds = self.hostView.bounds;
    bounds.origin.y = bounds.origin.y - 44.0f;
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:bounds];
    graph.plotAreaFrame.masksToBorder = NO;
    self.hostView.hostedGraph = graph;
    // 2 - Configure the graph
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainBlackTheme]];
    graph.fill = [CPTFill fillWithColor:[Constant defineGraghBackgroundColor]];   //background color
    graph.plotAreaFrame.fill = [CPTFill fillWithColor:[Constant defineGraghBackgroundColor]];    //background color
    graph.paddingBottom = 195.0f;
    graph.paddingLeft  = 60.0f;
    graph.paddingTop   = 0.0f;
    graph.paddingRight  = -10.0f;  //图表到边界的距离.之所以把值设为负值，其原因是图的上边与右边有白线，十分不美观，为了隐藏他们
    // 3 - Set up styles
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [Constant defineAxisLineTitleColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 22.0f;
    // 4 - Set up title
    NSString *title = @"Clinker SHC";
    graph.title = title;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(-20.0f, -30.0f);   //graph的title与graph的相对位置
    // 5 - Set up plot space
    CGFloat height = self.actualSHC;
    CGFloat xMin = 0.0f;
    CGFloat xMax = 4.0f;   //3个数据点
    CGFloat yMin = 0.0f;
    CGFloat yMax = 30.0f+self.actualSHC*1.1;   // should determine dynamically based on max price
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
}

-(void)configurePlots {
    // 1 - Set up the three plots
    self.SHC = [CPTBarPlot tubularBarPlotWithColor:[CPTColor cyanColor] horizontalBars:NO];
    self.SHC.identifier = @"SHC";
    // 2 - Set up line style
    CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
    barLineStyle.lineColor = [CPTColor lightGrayColor];
    barLineStyle.lineWidth = 0.7;
    // 3 - Add plots to graph
    CPTGraph *graph = self.hostView.hostedGraph;
    CGFloat barX = CPDBarInitialX3;
    NSArray *plots = [NSArray arrayWithObjects:self.SHC, nil];
    for (CPTBarPlot *plot in plots) {
        plot.dataSource = self;
        plot.delegate = self;
        plot.barWidth = CPTDecimalFromDouble(CPDBarWidth3);
        plot.barOffset = CPTDecimalFromDouble(barX);     //BAR的水平位置
        plot.lineStyle = barLineStyle;
        [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
        barX += CPDBarWidth3;
    }
}

-(void)configureAxes {
    // 1 - Configure styles
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [Constant defineAxisLineTitleColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 16.0f;
    CPTMutableTextStyle *yaxisTitleStyle = [CPTMutableTextStyle textStyle];
    yaxisTitleStyle.color = [Constant defineAxisLineTitleColor];
    yaxisTitleStyle.fontName = @"Helvetica-Bold";
    yaxisTitleStyle.fontSize = 13.0f;
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 5.0f;
    axisLineStyle.lineColor = [[Constant defineAxisLineTitleColor] colorWithAlphaComponent:1];
    // 2 - Get the graph's axis set
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostView.hostedGraph.axisSet;
    // 3 - Configure the x-axis
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    if (self.actualSHC < self.achievableSHC) {
        axisSet.xAxis.title = [[[NSString alloc] initWithFormat:
                               @"Int. Advanced:                        %.1f  KJ/t.cement\nAchievable Target:                 %.1f  KJ/t.cement\nActual:                                     %.1f  KJ/t.cement\nMaximum Annual Savings:               %@  GJ/a\n                                                             %@  Currency/a\nTarget Savings:                                  %@  GJ/a\n                                                             %@  Currency/a",self.intAdvancedSHC,(self.intAdvancedSHC+self.actualSHC)/2,self.actualSHC,[self numberTransfer:self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction],[self numberTransfer:self.maximumAnnualSavingsOnHeatCostfromClinkerProduction],[self numberTransfer:self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction/2],[self numberTransfer:self.maximumAnnualSavingsOnHeatCostfromClinkerProduction/2]] stringByReplacingOccurrencesOfString:@"Currency" withString:self.selectedCurrency];
    }
    else{
    axisSet.xAxis.title = [[[NSString alloc] initWithFormat:
                           @"Int. Advanced:                        %.1f  KJ/t.cement\nAchievable Target:                 %.1f  KJ/t.cement\nActual:                                     %.1f  KJ/t.cement\nMaximum Annual Savings:               %@  GJ/a\n                                                             %@  Currency/a\nTarget Savings:                                  %@  GJ/a\n                                                             %@  Currency/a",self.intAdvancedSHC,self.achievableSHC,self.actualSHC,[self numberTransfer:self.maximumAnnualSavingsOnHeatConsumptionfromClinkerProduction],[self numberTransfer:self.maximumAnnualSavingsOnHeatCostfromClinkerProduction],[self numberTransfer:self.achievableAnnualSavingsOnHeatConsumptionfromClinkerProduction],[self numberTransfer:self.achievableAnnualSavingsOnHeatCostfromClinkerProduction]] stringByReplacingOccurrencesOfString:@"Currency" withString:self.selectedCurrency];
    }
    axisSet.xAxis.titleTextStyle = axisTitleStyle;
    axisSet.xAxis.titleOffset = 25.0f;             //y坐标title的垂直坐标
    axisSet.xAxis.axisLineStyle = axisLineStyle;
    // 4 - Configure the y-axis
    axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyAutomatic;
    axisSet.yAxis.title = @"";
    axisSet.yAxis.titleTextStyle = axisTitleStyle;
    axisSet.yAxis.titleOffset = 5.0f;              //y坐标title的垂直坐标
    axisSet.yAxis.axisLineStyle = axisLineStyle;
    
    
#pragma mark -  x与y坐标的刻度与label设置
    // 1 - Create styles
    CPTMutableTextStyle *axisTextStyle = [[CPTMutableTextStyle alloc] init];
    axisTextStyle.color = [Constant defineAxisLineTitleColor];
    axisTextStyle.fontName = @"Helvetica-Bold";
    axisTextStyle.fontSize = 11.0f;
    CPTMutableLineStyle *tickLineStyle = [CPTMutableLineStyle lineStyle];
    tickLineStyle.lineColor = [Constant defineAxisLineTitleColor];
    tickLineStyle.lineWidth = 2.0f;
    CPTMutableLineStyle *gridLineStyle = [CPTMutableLineStyle lineStyle];
    tickLineStyle.lineColor = [Constant defineAxisLineTitleColor];
    tickLineStyle.lineWidth = 1.0f;
    // 3 - Configure x-axis tick
    axisSet.xAxis.majorTickLineStyle = axisLineStyle;
    axisSet.xAxis.majorTickLength = 4.0f;
    axisSet.xAxis.tickDirection = CPTSignNegative;
    NSMutableSet *xLabels = [NSMutableSet setWithCapacity:3];
    NSMutableSet *xLocations = [NSMutableSet setWithCapacity:9];
    NSArray *labels = [[NSArray alloc] initWithObjects:@"Int. Advanced",@"Achievable",@"Plant Actual",nil];
    // 4 - Configure y-axis tick
    axisSet.yAxis.majorTickLineStyle = axisLineStyle;
    axisSet.yAxis.labelTextStyle = yaxisTitleStyle;

    
    for (NSInteger i = 0; i<3; i++) {
        axisSet.xAxis.labelTextStyle = axisTitleStyle;
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:[labels objectAtIndex:i]  textStyle:axisSet.xAxis.labelTextStyle];
        CGFloat location = i+1;
        label.tickLocation = CPTDecimalFromCGFloat(location);
        label.offset = axisSet.xAxis.majorTickLength;
        if (label) {
            [xLabels addObject:label];
            [xLocations addObject:[NSNumber numberWithFloat:location]];
        }
    }
    axisSet.xAxis.axisLabels = xLabels;
    axisSet.xAxis.majorTickLocations = xLocations;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 3;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    if (fieldEnum == CPTBarPlotFieldBarTip)
    {
        return [[self SPCValue] objectAtIndex:index];
    }
    return [NSDecimalNumber numberWithUnsignedInteger:index];
    
}

#pragma mark - CPTBarPlotDelegate methods
-(void)barPlot:(CPTBarPlot *)plot barWasSelectedAtRecordIndex:(NSUInteger)index {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

-(float)trans:(float)RGB{
    return RGB/255.0;
}

//协议方法，为每一个Bar赋予不同的颜色
-(CPTFill *)barFillForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSUInteger)index;{
    switch (index) {
        case 0:
        {
            CPTFill *bar1 = [CPTFill fillWithColor:[Constant defineBar1Color]];
            return bar1;
            break;
        }
        case 1:
        {
            CPTFill *bar1 = [CPTFill fillWithColor:[Constant defineBar2Color]];
            return bar1;
            break;
        }
        case 2:
        {
            CPTFill *bar1 = [CPTFill fillWithColor:[Constant defineBar3Color]];
            return bar1;
            break;
        }
        default:
            break;
    }
    return nil;
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot
                  recordIndex:(NSUInteger)index {
    switch (index) {
        case 0:
        {
            CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
            textStyle.color = [Constant defineAxisLineTitleColor];
            textStyle.fontSize = 16.0f;
            textStyle.fontName = @"Helvetica-Bold";
            float ff = [[[self SPCValue] objectAtIndex:index] floatValue];
            NSString *tt = [[NSString alloc] initWithFormat:@"%.1f",ff];
            CPTTextLayer *textLayer = [[CPTTextLayer alloc] initWithText:tt style:textStyle];
            return textLayer;
            break;
        }
        case 1:
        {
            CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
            textStyle.color = [Constant defineAxisLineTitleColor];
            textStyle.fontSize = 16.0f;
            textStyle.fontName = @"Helvetica-Bold";
            float ff = [[[self SPCValue] objectAtIndex:index] floatValue];
            NSString *tt = [[NSString alloc] initWithFormat:@"%.1f",ff];
            CPTTextLayer *textLayer = [[CPTTextLayer alloc] initWithText:tt style:textStyle];
            return textLayer;
            break;
        }
        case 2:
        {
            CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
            textStyle.color = [Constant defineAxisLineTitleColor];
            textStyle.fontSize = 16.0f;
            textStyle.fontName = @"Helvetica-Bold";
            float ff = [[[self SPCValue] objectAtIndex:index] floatValue];
            NSString *tt = [[NSString alloc] initWithFormat:@"%.1f",ff];
            CPTTextLayer *textLayer = [[CPTTextLayer alloc] initWithText:tt style:textStyle];
            return textLayer;
            break;
        }
        default:
            break;
    }
}

@end
