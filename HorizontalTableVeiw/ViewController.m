//
//  ViewController.m
//  HorizontalTableVeiw
//
//  Created by Rana on 8/2/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listTableVIew.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
    self.listTableVIew.autoresizesSubviews=NO;
    
    Dict_name = [[NSMutableArray alloc] init];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cell height
    return 95;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:YES];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

// If the tableView Cell is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

// For deleteing any row from the table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Do some code here
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"TableViewCell";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.bgView.transform = CGAffineTransformMakeRotation(M_PI_2);
    [cell.listImage setImage:[UIImage imageNamed:@"1.png"]];
    [cell.listText setText:@"TEST LIST"];
    
    NSString *imageUrl = @"http://science-all.com/images/wallpapers/pic-of-nature/pic-of-nature-1.jpg";
    if (imageUrl) {
        cell.listImage.image = [UIImage imageNamed:imageUrl];
    }
    else
    {
        if (!isDragging_msg && !isDecliring_msg)
        {
            [Dict_name setObject:[UIImage imageNamed:@"1.png"] forKey:imageUrl];
            [self performSelectorInBackground:@selector(downloadImage_3:) withObject:indexPath];
        }
        else
        {
            cell.listImage.image=[UIImage imageNamed:@"Placeholder.png"];
        }
    }
    
    return cell;
}

-(void)downloadImage_3:(NSIndexPath *)path{
    NSString *str = @"http://science-all.com/images/wallpapers/pic-of-nature/pic-of-nature-1.jpg";
    
    UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:str]]];
    
    [Dict_name setObject:img forKey:str];
    
    [self.listTableVIew performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
