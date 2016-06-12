//
//  FourGraphViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-2-26.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface FourGraphViewController : UIViewController{
    Calculator *calculator;
    NSString *selectedCurrency;
}

@property Calculator *calculator;
@property NSString *selectedCurrency;

@end
