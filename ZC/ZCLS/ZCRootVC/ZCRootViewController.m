//
//  ZCRootViewController.m
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import "ZCRootViewController.h"
#import <IIViewDeckController.h>
#import "ZCRequestHelper.h"
@interface ZCRootViewController ()<ZCRequestDelegate>

@end

@implementation ZCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    
    ZCRequestHelper *request = [[ZCRequestHelper alloc] initWithKey:1 delegate:self];
    [request getJSONDataWithUrl:@"" parameters:nil];
}

- (void)requestSuccess:(NSInteger)requestKey result:(NSObject *)request{
    
}

- (void)requestFail:(NSInteger)requestKey error:(NSError *)error{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
