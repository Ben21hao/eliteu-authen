//
//  TDWeiboManeger.h
//  TDThirdLogin
//
//  Created by Elite Edu on 2018/11/12.
//  Copyright © 2018年 Elite Edu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TDSinaWbAuthCompleHandler)(NSString *token,NSString *userid,NSError *error);

@interface TDWeiboManeger : NSObject

+ (instancetype)shareManager;
//微博注册
+ (void)weiboRegister:(BOOL)enable;
//微博登录
- (void)weiboAuthLogin:(TDSinaWbAuthCompleHandler)compleHandler;
//是否已安装
- (BOOL)isWeiboInstalled;
//处理拉起应用
- (BOOL)handleOpenURL:(NSURL *)url;

@end
