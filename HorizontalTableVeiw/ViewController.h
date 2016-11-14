//
//  ViewController.h
//  HorizontalTableVeiw
//
//  Created by Rana on 8/2/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    BOOL isDragging_msg, isDecliring_msg;
    NSMutableDictionary *Dict_name;

}
@property (weak, nonatomic) IBOutlet UITableView *listTableVIew;

@end

