//
//  PlantsViewController.h
//  cementTool
//
//  Created by AOCC2013 on 13-3-14.
//  Copyright (c) 2013年 aocc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "InputViewController.h"


@interface PlantsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *tableData;
    Calculator *tempo;
}

@property NSMutableArray *tableData;
@property Calculator *tempo;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(void)archivePlantInfo;
-(NSString *)archivePath;

@end
