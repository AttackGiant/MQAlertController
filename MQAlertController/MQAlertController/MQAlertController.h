//
//  MQAlertController.h
//  mqtt_demo
//
//  Created by mqluo on 2018/7/13.
//  Copyright © 2018年 mqluo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MQAlertController : NSObject



/**
 单个按钮的弹窗
 
 @param title        标题
 @param message      提示语
 @param buttonTitle  按钮名称
 @param handler      按钮执行内容
 */
+ (void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle handler:(void(^)(void))handler;



/**
 两个按钮的弹窗
 
 @param title          标题
 @param message        提示语
 @param cancelTitle    左按钮标题
 @param confirmTitle   右按钮标题
 @param cancel         左按钮block
 @param confirm        右按钮block
 */
+ (void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle  cancelBlock:(void(^)(void))cancel confirmBlock:(void(^)(void))confirm;



/**
 多个按钮弹窗
 
 @param title          标题
 @param message        提示语
 @param actionTitles   按钮标题数组
 @param preferredStyle 弹窗类型
 @param handler        按钮回调   默认 “取消”按钮的index = 0
 */
+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler;



@end
