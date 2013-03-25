//
//  ReasonViewController.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "ReasonViewController.h"

@interface ReasonViewController ()

@end

@implementation ReasonViewController
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBundle *bundle=[NSBundle mainBundle];
    arrReason = [[NSArray alloc] initWithContentsOfFile:[bundle pathForResource:@"reason.plist" ofType:nil]];
	[self initTopbar];
    
    tbWhy=[[UITableView alloc] initWithFrame:CGRectMake(0, 45, kDeviceWidth, KDeviceHeight-65) style:UITableViewStylePlain];
    tbWhy.dataSource=self;
    tbWhy.delegate=self;
    tbWhy.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbWhy];
}

-(void)initTopbar{
    UIImageView *topBar=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
    topBar.image=[UIImage imageNamed:@"top_bar"];
    topBar.userInteractionEnabled=YES;
    
    UIImageView *topBarName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-139)/2, 10, 139, 27)];
    topBarName.image=[UIImage imageNamed:@"whyus_header_txt"];
    [topBar addSubview:topBarName];
    [topBarName release];
    
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(10, 10, 26, 26);
    [btnBack setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    [btnBack setImage:[UIImage imageNamed:@"arrow_left_hover"] forState:UIControlStateHighlighted];
    [btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:btnBack];
    
    [self.view addSubview:topBar];
    [topBar release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Events
-(void)clickBack{
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

#pragma mark - TableView
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrReason.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ReasonCell";
    ReasonCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ReasonCell alloc] initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:CellIdentifier] autorelease];
        
    }
    int row=indexPath.row;
    NSDictionary* dict=(NSDictionary*)[arrReason objectAtIndex:row];
    [cell loadData:dict];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
@end
