//
//  HomeViewController.m
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "HomeViewController.h"
#define kTagStoreOffset 100
#define StoreBgColor [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]
#define StoreScrollBgColor [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1.0]


@interface HomeViewController ()

@end

@implementation HomeViewController
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle];
    arrStore = [[NSArray alloc] initWithContentsOfFile:[bundle pathForResource:@"store.plist" ofType:nil]];
    
    scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight-20)];
    scrollview.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scrollview];
    
    UIImageView *imgHeader=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerimg.jpg"]];
    imgHeader.frame=CGRectMake(0, 0, kDeviceWidth, 161);
    
	UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogin setImage:[UIImage imageNamed:@"quickreg_but"] forState:UIControlStateNormal];
    [btnLogin setImage:[UIImage imageNamed:@"quickreg_but_hover"] forState:UIControlStateHighlighted];
    btnLogin.frame=CGRectMake(10, 170, 143, 37);
    [btnLogin addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnPay=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnPay setImage:[UIImage imageNamed:@"onlinepay_but"] forState:UIControlStateNormal];
    [btnPay setImage:[UIImage imageNamed:@"onlinepay_but_hover"] forState:UIControlStateHighlighted];
    btnPay.frame=CGRectMake(kDeviceWidth-153, 170, 143, 37);
    [btnPay addTarget:self action:@selector(clickPay) forControlEvents:UIControlEventTouchUpInside];
    
//    UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
//    imgLogo.frame=CGRectMake((kDeviceWidth-146)/2, 215, 146, 43);
    
    UIImageView *imgBar=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"midimg.jpg"]];
    imgBar.frame=CGRectMake((kDeviceWidth-313)/2, 215, 313, 109);
    imgBar.userInteractionEnabled=YES;
    
    UIButton* btnFit=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnFit setImage:[UIImage imageNamed:@"tryit_txt"] forState:UIControlStateNormal];
    [btnFit setImage:[UIImage imageNamed:@"tryit_txt_hover"] forState:UIControlStateHighlighted];
    btnFit.frame=CGRectMake(200, 14, 91, 29);
    [btnFit addTarget:self action:@selector(clickFit) forControlEvents:UIControlEventTouchUpInside];
    [imgBar addSubview:btnFit];
    
    UIButton* btnSearch=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnSearch setImage:[UIImage imageNamed:@"find_txt"] forState:UIControlStateNormal];
    [btnSearch setImage:[UIImage imageNamed:@"find_txt_hover"] forState:UIControlStateHighlighted];
    btnSearch.frame=CGRectMake(200, 67, 91, 29);
    [btnSearch addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside];
    [imgBar addSubview:btnSearch]; 
    
    [scrollview addSubview:imgHeader];
    [scrollview addSubview:btnLogin];
    [scrollview addSubview:btnPay];
//    [scrollview addSubview:imgLogo];
    [scrollview addSubview:imgBar];
    
    [self initScrollShop];
    [self initGuidTable];
    
    [imgHeader release];
//    [imgLogo release];
    [imgBar release];
}

-(void)initGuidTable{
    UITableView *tbGuid=[[UITableView alloc] initWithFrame:CGRectMake(0, 367, kDeviceWidth, 208)];
    tbGuid.backgroundColor=[UIColor clearColor];
    tbGuid.dataSource=self;
    tbGuid.delegate=self;
    tbGuid.bounces=NO;
    tbGuid.separatorStyle=UITableViewCellSeparatorStyleNone;
    [scrollview addSubview:tbGuid];
    [tbGuid release];
    
    scrollview.contentSize=CGSizeMake(kDeviceWidth, 367+208);
}

-(void)initScrollShop{
    scrollShop=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 328, kDeviceWidth, 39)];
    scrollShop.backgroundColor=StoreScrollBgColor;
    scrollShop.showsVerticalScrollIndicator=NO;
    scrollShop.showsHorizontalScrollIndicator=NO;
    scrollShop.bounces=NO;
    for (int k=0; k<arrStore.count; k++) {
        UIButton* btnStore=[UIButton buttonWithType:UIButtonTypeCustom];
        btnStore.frame=CGRectMake(k*116+1, 1, 115, 37);
        btnStore.titleLabel.font=[UIFont boldSystemFontOfSize:18.0];
        btnStore.backgroundColor=(curStoreIndex==k)? StoreScrollBgColor:StoreBgColor;
        [btnStore setTitleColor:[UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnStore setTitle:[[arrStore objectAtIndex:k] objectForKey:@"name"] forState:UIControlStateNormal];
        [btnStore addTarget:self action:@selector(clickStore:) forControlEvents:UIControlEventTouchUpInside];
        btnStore.tag=k+kTagStoreOffset;
        [scrollShop addSubview:btnStore];
//        [tvStore release];
    }
    scrollShop.contentSize=CGSizeMake(arrStore.count*116, 39);
    [scrollview addSubview:scrollShop];
 
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController setToolbarHidden:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Events
-(void)clickStore:(UIView*)sender{
    int itag=sender.tag - kTagStoreOffset;
    if (curStoreIndex!=itag) {
        UIView* vw=[scrollShop viewWithTag:itag + kTagStoreOffset];
        vw.backgroundColor= StoreScrollBgColor;
        
        UIView* vw2=[scrollShop viewWithTag:curStoreIndex + kTagStoreOffset];
        vw2.backgroundColor= StoreBgColor;
        
        curStoreIndex=itag;
    }
}

-(void)clickSearch{

}

-(void)clickFit{
    ListViewController* controller=[[ListViewController alloc] init];
    [[self navigationController] pushViewController:controller animated:YES];
    [controller release];
}

-(void)clickLogin{
    RegistViewController* controller=[[RegistViewController alloc] init];
    [[self navigationController] pushViewController:controller animated:YES];
    [controller release];
}


-(void)clickPay{
    [AppHelper showAlertMessage:@"建设中，敬请期待。" title:@"" ];
}

#pragma mark - TableView
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"homeCell";
    HomeCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier] autorelease];
 
    } 
    int row=indexPath.row; 
    
    switch (row) {
        case 0:
            [cell loadData:@"营业时间" imgName:@"time_ico"];
            break;
        case 1:
            [cell loadData:@"门店地址" imgName:@"address_ico"];
            break;
        case 2:
            [cell loadData:@"附近交通" imgName:@"transfer_ico"];
            break;
        case 3:
            [cell loadData:@"选择我们的理由" imgName:@"whyus_ico"];
            break;
         
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int row=indexPath.row;
    NSDictionary* dict= (NSDictionary*)[arrStore objectAtIndex:curStoreIndex];
    switch (row) {
        case 0:
        {
            
            TimeViewController* controller=[[TimeViewController alloc] init];
            controller.storeName= [dict objectForKey:@"name"];
            controller.storeOpen= [dict objectForKey:@"open"];
            controller.storeClose= [dict objectForKey:@"close"];
            [[self navigationController] pushViewController:controller animated:YES];
            [controller loadData];
            [controller release];
        }
            break;
        case 1:
        {
            
            AddressViewController* controller=[[AddressViewController alloc] init];
            controller.storeName= [dict objectForKey:@"name"];
            controller.storeMap= [dict objectForKey:@"map"];
            [[self navigationController] pushViewController:controller animated:YES];
            [controller loadData];
            [controller release];
        }
            break;
        case 2:
        {
            
            TrafficViewController* controller=[[TrafficViewController alloc] init];
            controller.storeName= [dict objectForKey:@"name"];
            controller.storeMap= [dict objectForKey:@"map2"];
            controller.storeTraffic= [dict objectForKey:@"traffic"];
            [[self navigationController] pushViewController:controller animated:YES];
            [controller loadData];
            [controller release];
        }
            break;
        case 3:
        {
            
            ReasonViewController* controller=[[ReasonViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
            [controller release];
        }
            break;
    }
    
}

@end
