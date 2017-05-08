//
//  BliBaoPaySDK.h
//  BliBaoPaySDK
//
//  Created by wanglulu on 2017/4/13.
//  Copyright © 2017年 wanglulu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BliBaoPaySDK : NSObject
/**
 *  初始化
 */
+ (instancetype)defaultPay;
/**
 *验证便利宝支付账户
 *params 注册参数
  @{
 @"app_auth_token":@"...",银盒子分配给调用商户授权,如:(Yeu63u362u373781ieyee)
 @"app_id":@"...",银盒子分配给调用商ID,如:(2014072300007148)
 @"key":@"...",MD5密钥银盒子提供
 @"method":@"...",支付宝支付:blibao.alipay.app.pay
 @"out_order_no":@"...",商户网站唯一订单号.如:(70501111111S001111119)
 @"passback_params":@"orderNum:123456",
 @"subject":@"...",商品的标题/交易标题/订单标题/订单关键字等,如:(大乐透)
 @"timestamp":@"2017-04-12 18:25:02",时间戳
 @"total_amount":@"0.02",订单价格
 @"notify_url":@"...",支付回调地址
 
 }
 *resultDic授权成功返回结果
 */
- (void)startPay:(NSDictionary*)params :(void(^)(NSDictionary*resultDic))result ;


/**
 *  根据url处理支付回调信息
 */
- (void)blibaoPayProcessOrderWithPaymentResult:(NSURL*)url;
@end
