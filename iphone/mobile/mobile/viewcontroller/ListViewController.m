//
//  ListViewController.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle];
    arrDiamond = [[NSArray alloc] initWithContentsOfFile:[bundle pathForResource:@"diamond.plist" ofType:nil]];
    
    tbWhy=[[UITableView alloc] initWithFrame:CGRectMake(0, 76, kDeviceWidth, KDeviceHeight-96) style:UITableViewStylePlain];
    tbWhy.dataSource=self;
    tbWhy.delegate=self;
    tbWhy.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tbWhy];
    
    [self initTopbar];
}

-(void)initTopbar{
    UIView *topBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 83)];
    topBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top_bg"]];
    
    UIImageView *toplogo=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-214)/2, 10, 214, 63)];
    toplogo.image=[UIImage imageNamed:@"logo"];
    toplogo.userInteractionEnabled=YES;
    [topBar addSubview:toplogo];
    
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(0, 5, 26, 30);
    [btnBack setImage:[UIImage imageNamed:@"left_img"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:btnBack];
    
    [self.view addSubview:topBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Click Events
-(void)clickBack{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - TableView
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int row=indexPath.row;
    if (row==0) {
        return 12.0;
    }
    return 70.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrDiamond.count+1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ListCell";
    ListCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:CellIdentifier] autorelease];
        
    }
    int row=indexPath.row;
    if (row==0) {
        [cell loadData:nil];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    else{
        NSDictionary* dict=(NSDictionary*)[arrDiamond objectAtIndex:row-1];
        [cell loadData:dict];
        cell.selectionStyle=UITableViewCellSelectionStyleGray;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int row=indexPath.row;
}
@end
