//
//  MQAlertController.m
//  mqtt_demo
//
//  Created by mqluo on 2018/7/13.
//  Copyright © 2018年 mqluo. All rights reserved.
//

#import "MQAlertController.h"

#define   RootViewController [UIApplication sharedApplication].keyWindow.rootViewController


@implementation MQAlertController

//------------------单个按钮的弹窗------------------//
+(void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle handler:(void (^)(void))handler{
    
    UIAlertController *alert_vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // 按钮调用action
    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler();
        }
    }];
    
    [alert_vc addAction:action];
    [RootViewController presentViewController:alert_vc animated:YES completion:nil];
}

//=================两个按钮的弹窗=================//
+(void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancelBlock:(void (^)(void))cancel confirmBlock:(void (^)(void))confirm{
    
    UIAlertController *alert_vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancel) {
            cancel();
        }
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirm) {
            confirm();
        };
    }];
    [alert_vc addAction:cancelAction];
    [alert_vc addAction:confirmAction];
    [RootViewController presentViewController:alert_vc animated:YES completion:nil];
}

//=================多个按钮的弹窗=================//

+(void)presentAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void (^)(NSUInteger, NSString *))handler{
    
    UIAlertController *alert_vc = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        handler(0, @"取消");
    }];
    
    for (int i = 0; i < actionTitles.count; i ++) {
        
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler((i + 1), actionTitles[i]);
        }];
        [alert_vc addAction:confimAction];
    }
    [alert_vc addAction:cancelAction];
    
    [RootViewController presentViewController:alert_vc animated:YES completion:nil];
}


@end
