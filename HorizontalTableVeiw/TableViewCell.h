//
//  TableViewCell.h
//  HorizontalTableVeiw
//
//  Created by Rana on 8/2/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *listImage;
@property (weak, nonatomic) IBOutlet UILabel *listText;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
