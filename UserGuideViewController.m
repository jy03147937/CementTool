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
	// Do any additional setup after loading the view.
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
