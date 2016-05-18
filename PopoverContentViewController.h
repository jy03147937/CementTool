//
//  PopoContentViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-3-11.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"
@protocol PopoverContentViewControllerDelegate;

@interface PopoverContentViewController : UIViewController{
    float first;
    float second;
    float third;
    float forth;
    float fifth;
    float sixth;
}

- (IBAction)goBack:(id)sender;

@property (weak) id <PopoverContentViewControllerDelegate> delegate;
@property float first;
@property float second;
@property float third;
@property float forth;
@property float fifth;
@property float sixth;
@end

@protocol PopoverContentViewControllerDelegate <NSObject>

@required

- (void)dismissPop: (NSString *)value;

@end