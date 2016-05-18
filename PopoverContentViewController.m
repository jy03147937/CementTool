//
//  PopoContentViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-3-11.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "PopoverContentViewController.h"

@interface PopoverContentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *FirstKiln;
@property (weak, nonatomic) IBOutlet UITextField *SecondKiln;
@property (weak, nonatomic) IBOutlet UITextField *ThirdKiln;
@property (weak, nonatomic) IBOutlet UITextField *ForthKiln;
@property (weak, nonatomic) IBOutlet UITextField *FifthKiln;
@property (weak, nonatomic) IBOutlet UITextField *SixthKiln;
- (IBAction)done:(id)sender;

@end

@implementation PopoverContentViewController

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
	self.contentSizeForViewInPopover = CGSizeMake(380.0, 310.0);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.first = [self.FirstKiln.text floatValue];
    self.second = [self.SecondKiln.text floatValue];
    self.third = [self.ThirdKiln.text floatValue];
    self.forth = [self.ForthKiln.text floatValue];
    self.fifth = [self.FifthKiln.text floatValue];
    self.sixth = [self.SixthKiln.text floatValue];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)done:(id)sender {
}
- (IBAction)goBack:(id)sender {
    
}
@end
