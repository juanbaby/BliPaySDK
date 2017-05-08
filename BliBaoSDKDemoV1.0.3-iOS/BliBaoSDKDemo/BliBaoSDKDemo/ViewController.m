//
//  ViewController.m
//  BliBaoSDKDemo
//
//  Created by wanglulu on 2017/4/13.
//  Copyright © 2017年 wanglulu. All rights reserved.
//

#import "ViewController.h"
#import <BliBaoPaySDK/BliBaoPaySDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testBliBaoPay:(UIButton *)sender {

    [[BliBaoPaySDK defaultPay] startPay:@{
                                          @"app_auth_token":@"8f08a7cc4e05417b07466610f6a71517",
                                          @"app_id":@"200027115526",
                                          @"key":@"QJ96RC7YH081kB2b3Asa24l2YWecmWi5",
                                          @"method":@"blibao.alipay.app.pay",
                                          @"out_order_no":[self generateTradeNO],
                                          @"passback_params":@"orderNum:123456",
                                          @"subject":@"真好吃",
                                          @"timestamp":@"2017-04-12 18:25:02",
                                          @"total_amount":@"0.01",
                                          @"notify_url":@"http://blibao.oicp.net:9990/demo/alipayWapPayNotify.htm",
                                          } :^(NSDictionary *resultDic) {
                                              //处理支付回调信息
                                              NSLog(@"resultDic=%@",resultDic);
                                          }];
    
    
    
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

- (IBAction)testWeixin:(UIButton *)sender {
    [[BliBaoPaySDK defaultPay] startPay:@{
                                       @"app_auth_token":@"8f08a7cc4e05417b07466610f6a71517",
                                       @"app_id":@"200027115526",
                                       @"key":@"QJ96RC7YH081kB2b3Asa24l2YWecmWi5",
                                       @"method":@"blibao.weixin.app.pay",
                                       @"out_order_no":[self generateTradeNO],
                                       @"passback_params":@"orderNum:123456",
                                       @"subject":@"真好吃",
                                       @"timestamp":@"2017-04-12 18:25:02",
                                       @"total_amount":@"0.01",
                                       @"notify_url":@"http://blibao.oicp.net:9990/demo/alipayWapPayNotify.htm",
                                       @"pay_id":@"wx559b65e20ca79434"
                                       
                                       } :^(NSDictionary *resultDic) {
                                           
                                           NSLog(@"successResult=%@",resultDic);
                                       }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
