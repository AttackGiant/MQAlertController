//
//  ViewController.m
//  MQAlertController
//
//  Created by mqluo on 2018/7/13.
//  Copyright © 2018年 mqluo. All rights reserved.
//

#import "ViewController.h"
#import "MQAlertController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

#pragma mark - SetupUI
-(void)setupUI{
    
    int margin = 90;
    for (int i = 1; i < 4; i++) {
        int random = arc4random() % 255;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[NSString stringWithFormat:@"按钮%d",i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:random / 255.0 green:random / 255.0 blue:random / 255.0 alpha:1.0]];
        
        SEL sel = NSSelectorFromString([NSString stringWithFormat:@"clickBtn%d",i]);
        [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(100, i * margin, 60, 44);
        [self.view addSubview:button];
    }
    
}
#pragma mark - ACTION
-(void)clickBtn1{
    
     [MQAlertController presentAlertViewWithTitle:@"提示" message:@"一个按钮的提示框" buttonTitle:@"确定" handler:nil];
    
}
-(void)clickBtn2{
    
      [MQAlertController presentAlertViewWithTitle:@"提示" message:@"两个按钮的提示框" cancelTitle:@"取消" confirmTitle:@"确定" cancelBlock:nil confirmBlock:nil];
}
-(void)clickBtn3{
    
      [MQAlertController presentAlertWithTitle:@"提示" message:@"三个按钮的提示框" actionTitles:@[@"按钮一",@"按钮二",@"按钮三"] preferredStyle:UIAlertControllerStyleActionSheet handler:^(NSUInteger buttonIndex, NSString *buttonTitle) {
        if (buttonIndex == 1) {
            NSLog(@"按钮一");
        }else if (buttonIndex == 2) {
            NSLog(@"按钮二");
        }else if (buttonIndex == 3) {
            NSLog(@"按钮三");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
