//
//  UserGuideViewController.m
//  cementTool
//
//  Created by AOCC2013 on 13-4-23.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import "UserGuideViewController.h"

@interface UserGuideViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

- (IBAction)back:(id)sender;

@end

@implementation UserGuideViewController

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
    self.scrollView.contentSize = CGSizeMake(1024,7340);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}
@end
