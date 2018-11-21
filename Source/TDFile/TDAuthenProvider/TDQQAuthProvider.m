//
//  TDQQAuthProvider.m
//  edX
//
//  Created by Elite Edu on 2018/11/20.
//  Copyright © 2018年 edX. All rights reserved.
//

#import "TDQQAuthProvider.h"
#import "edX-Swift.h"
#import "OEXExternalAuthProviderButton.h"
#import "OEXRegisteringUserDetails.h"
#import "TDQQManager.h"

@implementation TDQQAuthProvider

- (UIColor*)QQAuthColor {
    return [UIColor colorWithRed:49./255. green:80./255. blue:178./255. alpha:1];
}

- (NSString*)displayName {
    return @"QQ";
}

- (NSString*)backendName {
    return @"qq";
}

- (OEXExternalAuthProviderButton*)freshAuthButton {
    OEXExternalAuthProviderButton* button = [[OEXExternalAuthProviderButton alloc] initWithFrame:CGRectZero];
    button.provider = self;
    [button setImage:[UIImage imageNamed:@"qq_logo_white"] forState:UIControlStateNormal];
    [button useBackgroundImageOfColor:[self QQAuthColor]];
    return button;
}

- (void)authorizeServiceFromController:(UIViewController *)controller requestingUserDetails:(BOOL)loadUserDetails withCompletion:(void (^)(NSString *, OEXRegisteringUserDetails *, NSError *))completion {
    
    [[TDQQManager shareManager] qqAuthenLogin:^(NSString *token, NSString *openid, NSError *error) {
        
        if (error) {
            completion(nil,nil,error);
            return;
        }
        
        if (loadUserDetails) {
            [[TDQQManager shareManager] getQQUserinfo:^(NSDictionary *userProfile, NSError *error) {
                OEXRegisteringUserDetails *profile = [[OEXRegisteringUserDetails alloc] init];
                profile.name = userProfile[@"nickname"];
                completion(token, profile, error);
            }];
        }
        else {
            completion(token,nil,error);
        }
    }];
}

@end
