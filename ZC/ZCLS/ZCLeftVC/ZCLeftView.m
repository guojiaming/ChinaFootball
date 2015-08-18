//
//  ZCLeftView.m
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import "ZCLeftView.h"

@interface ZCLeftView()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_leftTableView;
    int folder[100];
}
@end

@implementation ZCLeftView

-(void)dealloc{
    _leftTableView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews{
    UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,20,200-20,50)];
    logoImageView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:logoImageView];
    
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20+logoImageView.frame.size.height,260,SCRREN_HEIGHT-20-logoImageView.frame.size.height) style:UITableViewStylePlain];
    _leftTableView.dataSource =self;
    _leftTableView.delegate =self;
    [self addSubview:_leftTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (folder[section]==1) {
        return 5;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer = @"cellIdentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *headID = @"headID";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableCellWithIdentifier:headID];
    if (!headerView) {
        headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:headID];
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,0,SCRREN_WIDTH,50)];
    [headerView.contentView addSubview:view];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSection:)];
    [view addGestureRecognizer:tap];
    NSInteger i = arc4random()%256;
    NSInteger j = arc4random()%256;
    NSInteger k = arc4random()%256;
    view.tag = 500+section;
    view.backgroundColor = [UIColor colorWithRed:i/255.0 green:j/255.0 blue:k/255.0 alpha:1.0];
    return headerView;
}

- (void)tapSection:(UIGestureRecognizer*)tap{
    NSInteger section = tap.view.tag - 500;
    folder[section] = folder[section]^1;
    [_leftTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}
                                                                                                         
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
