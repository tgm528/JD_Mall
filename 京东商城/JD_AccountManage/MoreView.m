//
//  MoreView.m
//  JD_MALL
//
//  Created by TY on 14-1-14.
//  Copyright (c) 2014年 张太松. All rights reserved.
//

#import "MoreView.h"

@interface MoreView ()

@end

@implementation MoreView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"self.png"]]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    TextArray = [[NSMutableArray alloc]init];
    ImageArray = [[NSMutableArray alloc]init];
    NSArray *lTextFirst = [[[NSArray alloc]initWithObjects:@"设置",@"帮助",@"意见反馈", nil]autorelease];
    NSArray *lTextSecond = [[[NSArray alloc]initWithObjects:@"检查更新",@"喜欢墨云？打分鼓励一下", nil]autorelease];
    NSArray *lTextThird = [[[NSArray alloc]initWithObjects:@"应用推荐",@"关于", nil]autorelease];
    NSArray *lImageFirst = [[[NSArray alloc]initWithObjects:@"more_setting@2x.png",@"more_help@2x.png",@"more_feed@2x.png", nil]autorelease];
    NSArray *lImageSecond = [[[NSArray alloc]initWithObjects:@"more_update@2x.png",@"more_like@2x.png", nil]autorelease];
    NSArray *lImageThird = [[[NSArray alloc]initWithObjects:@"more_commend@2x.png",@"more_about@2x.png", nil]autorelease];
    [TextArray addObject:lTextFirst];
    [TextArray addObject:lTextSecond];
    [TextArray addObject:lTextThird];
    [ImageArray addObject:lImageFirst];
    [ImageArray addObject:lImageSecond];
    [ImageArray addObject:lImageThird];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"更多";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"title_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(CancelButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    [leftBarButton release];
//    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(CancelButton:)]autorelease];
//    self.navigationItem.leftBarButtonItem.tintColor= [UIColor redColor];
    self.navigationItem.rightBarButtonItem = nil;
    TableView = [[[UITableView alloc]initWithFrame:CGRectMake(20, 0, 280, 416) style:UITableViewStyleGrouped]autorelease];
    TableView.backgroundView = nil;
    TableView.backgroundColor = [UIColor clearColor];
    TableView.delegate = self;
    TableView.dataSource = self;
    TableView.scrollEnabled = NO;
    [TableView reloadData];
    [self.view addSubview:TableView];
}

-(void)CancelButton:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[TextArray objectAtIndex:section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [TextArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell = @"cell";
    UITableViewCell *lcell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (lcell == nil) {
        lcell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell]autorelease];
        UIImageView *ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 30, 30)]autorelease];
        ImageView.tag = 10000;
        [lcell addSubview:ImageView];
        UILabel *lLable = [[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 150, 44)]autorelease];
        lLable.tag = 10001;
        [lcell addSubview:lLable];
    }
    lcell.backgroundView = nil;
    lcell.backgroundColor = [UIColor clearColor];
    UIImageView *ImageView = (UIImageView *)[lcell viewWithTag:10000];
    ImageView.image =[UIImage imageNamed:[[ImageArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]]];
    UILabel *Lable = (UILabel *)[lcell viewWithTag:10001];
    Lable.text = [[TextArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    [Lable setBackgroundColor:[UIColor clearColor]];
    Lable.font = [UIFont boldSystemFontOfSize:12];
    lcell.accessoryType = UITableViewCellAccessoryNone;
    lcell.selectionStyle = UITableViewCellEditingStyleNone;
    return lcell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.navigationController pushViewController:[[ViewArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
