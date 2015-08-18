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
    return 10;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
