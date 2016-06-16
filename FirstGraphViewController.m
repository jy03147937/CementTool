//
//  FirstGraphViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-2-25.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "FirstGraphViewController.h"
#import "ZoomInFirstGraphViewController.h"

@interface FirstGraphViewController ()

@property (nonatomic, strong) IBOutlet CPTGraphHostingView *hostView_s;
@property (nonatomic, strong) CPTBarPlot *SPC_s;


-(void)initPlot_s;
-(void)configureGraph_s;
-(void)configurePlots_s;
-(void)configureAxes_s;
-(NSString*)numberTransfer:(float)number;

@end

@implementation FirstGraphViewController


CGFloat const CPDBarWidth_s = 0.5f;
CGFloat const CPDBarInitialX_s = 0.93f;


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
}

-(id)init{
    self = [super init];
    self.name_s = [[NSString alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self initPlot_s];
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
-(void)initPlot_s {
    [self configureGraph_s];
    [self configurePlots_s];
    [self configureAxes_s];
}

- (NSArray *)SPCValue
{
    NSArray *values = nil;
    if (!values)
    {
        values = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:self.intAdvancedSPC_s],
                  [NSDecimalNumber numberWithFloat:self.achievableSPC_s],
                  [NSDecimalNumber numberWithFloat:self.actualSPC_s],
                  nil];
    }
    return values;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"zoomIn"]) {
        ZoomInFirstGraphViewController *destViewController = segue.destinationViewController; 
        destViewController.actualSPC = self.actualSPC_s;
        destViewController.achievableSPC = self.achievableSPC_s;
        destViewController.intAdvancedSPC = self.intAdvancedSPC_s;
        destViewController.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction = self.achievableAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
        destViewController.achievableAnnualSavingsOnPowerCostfromClinkerProduction = self.achievableAnnualSavingsOnPowerCostfromClinkerProduction_s;
        destViewController.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction = self.maximumAnnualSavingsOnPowerConsumptionfromClinkerProduction_s;
        destViewController.maximumAnnualSavingsOnPowerCostfromClinkerProduction = self.maximumAnnualSavingsOnPowerCostfromClinkerProduction_s;
        destViewController.name = self.name_s;
        destViewController.selectedCurrency = self.selectedCurrency;
    }
    
}

-(void)configureGraph_s {
    // 1 - Create the graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView_s.bounds];
    graph.plotAreaFrame.masksToBorder = NO;
    //graph.background
    self.hostView_s.hostedGraph = graph;
    // 2 - Configure the graph
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainBlackTheme]];
    graph.fill = [CPTFill fillWithColor:[Constant defineGraghBackgroundColor]];   //background color
    graph.plotAreaFrame.fill = [CPTFill fillWithColor:[Constant defineGraghBackgroundColor]];    //background color
    
    graph.paddingBottom = 105.0f;
    graph.paddingLeft  = 50.0f;
    graph.paddingTop    = 0.0f;
    graph.paddingRight  = -10.0f;  //图表到边界的距离.之所以把值设为负值，其原因是图的上边与右边有白线，十分不美观，为了隐藏他们
    // 3 - Set up styles
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [Constant defineAxisLineTitleColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 16.0f;
    // 4 - Set up title
    NSString *title = @"Clinker SPC";
    graph.title = title;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(-20.0f, -25.0f);   //graph的title的位置
    // 5 - Set up plot space
    CGFloat height = self.actualSPC_s;
    CGFloat xMin = 0.0f;
    CGFloat xMax = 4.0f;   //3个数据点
    CGFloat yMin = 0.0f;
    CGFloat yMax;
    yMax = 30.0f+self.actualSPC_s*1.1;    //self.actualSPC*1.2; // should determine dynamically based on max price
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];

}

-(float)trans:(float)RGB{
    return RGB/255.0;
}

-(void)configurePlots_s {
    // 1 - Set up the three plots
    self.SPC_s = [CPTBarPlot tubularBarPlotWithColor:[CPTColor colorWithComponentRed:[self trans:0] green:[self trans:255] blue:[self trans:255] alpha:1.0] horizontalBars:NO];
    self.SPC_s.identifier = @"SPC";
    // 2 - Set up line style
    CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
    barLineStyle.lineColor = [CPTColor lightGrayColor];
    barLineStyle.lineWidth = 0.8;
    // 3 - Add plots to graph
    CPTGraph *graph = self.hostView_s.hostedGraph;
    CGFloat barX = CPDBarInitialX_s;
    NSArray *plots = [NSArray arrayWithObjects:self.SPC_s, nil];
    for (CPTBarPlot *plot in plots) {
        plot.dataSource = self;
        plot.delegate = self;
        plot.barWidth = CPTDecimalFromDouble(CPDBarWidth_s);
        plot.barOffset = CPTDecimalFromDouble(barX);     //BAR的水平位置
        plot.lineStyle = barLineStyle;
        [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
        barX += CPDBarWidth_s;
    }
}

-(void)configureAxes_s {
    // 1 - Configure styles
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [Constant defineAxisLineTitleColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 11.0f;
    CPTMutableTextStyle *yaxisTitleStyle = [CPTMutableTextStyle textStyle];
    yaxisTitleStyle.color = [Constant defineAxisLineTitleColor];
    yaxisTitleStyle.fontName = @"Helvetica-Bold";
    yaxisTitleStyle.fontSize = 13.0f;
    
    
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 3.0f;
    axisLineStyle.lineColor = [[Constant defineAxisLineTitleColor] colorWithAlphaComponent:1];
    // 2 - Get the graph's axis set
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostView_s.hostedGraph.axisSet;
    // 3 - Configure the x-axis
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    if (self.actualSPC_s < self.achievableSPC_s) {
    axisSet.xAxis.title = [[[NSString alloc] initWithFormat:@"\nInt. Advanced:              %.1f  kWh/t.clinker\nAchievable Target:       %.1f  kWh/t.clinker\nActual:                          %.1f  kWh/t.clinker\nTarget Savings:            %@  Currency/a",self.intAdvancedSPC_s,(self.intAdvancedSPC_s+self.actualSPC_s)/2,self.actualSPC_s,[self numberTransfer:self.maximumAnnualSavingsOnPowerCostfromClinkerProduction_s/2]] stringByReplacingOccurrencesOfString:@"Currency" withString:self.selectedCurrency];
    }
    else{
    axisSet.xAxis.title = [[[NSString alloc] initWithFormat:@"\nInt. Advanced:              %.1f  kWh/t.clinker\nAchievable Target:       %.1f  kWh/t.clinker\nActual:                           %.1f  kWh/t.clinker\nTarget Savings:            %@  Currency/a",self.intAdvancedSPC_s,self.achievableSPC_s,self.actualSPC_s,[self numberTransfer:self.achievableAnnualSavingsOnPowerCostfromClinkerProduction_s]] stringByReplacingOccurrencesOfString:@"Currency" withString:self.selectedCurrency];
    }
    axisSet.xAxis.titleTextStyle = axisTitleStyle;
    axisSet.xAxis.titleOffset = 20.0f;             //y坐标title的垂直坐标
    axisSet.xAxis.axisLineStyle = axisLineStyle;
    // 4 - Configure the y-axis
    axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyAutomatic;
    axisSet.yAxis.title = @"";
    axisSet.yAxis.titleTextStyle = axisTitleStyle;
    axisSet.yAxis.titleOffset = 5.0f;              //y坐标title的垂直坐标
    axisSet.yAxis.axisLineStyle = axisLineStyle;
    
    
#pragma mark -  x与y坐标的刻度设置
    // 1 - Create styles
    CPTMutableTextStyle *axisTextStyle = [[CPTMutableTextStyle alloc] init];
    axisTextStyle.color = [Constant defineAxisLineTitleColor];
    axisTextStyle.fontName = @"Helvetica-Bold";
    axisTextStyle.fontSize = 6.0f;
    
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
    NSMutableSet *xLocations = [NSMutableSet setWithCapacity:3];
    NSArray *labels = [[NSArray alloc] initWithObjects:@"Int. Advanced",@"Achievable",self.name_s,nil];
    // 4 - Configure y-axis tick
    axisSet.yAxis.majorTickLineStyle = axisLineStyle;
    axisSet.yAxis.labelTextStyle = yaxisTitleStyle;

    
    // 5 - Configure x-axis label
    for (NSInteger i = 0; i<3; i++) {
        axisSet.xAxis.labelTextStyle = axisTitleStyle;
        
        //axisSet.yAxis.labelTextStyle = axisTitleStyle;
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

//协议方法，为每一个Bar的顶部赋予一个显示值的title
-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot
                  recordIndex:(NSUInteger)index {
    switch (index) {
        case 0:
        {
            CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
            textStyle.color = [Constant defineAxisLineTitleColor];
            textStyle.fontSize = 14.0f;
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
            textStyle.fontSize = 14.0f;
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
            textStyle.fontSize = 14.0f;
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

#pragma mark - CPTBarPlotDelegate methods
-(void)barPlot:(CPTBarPlot *)plot barWasSelectedAtRecordIndex:(NSUInteger)index {
}

@end
