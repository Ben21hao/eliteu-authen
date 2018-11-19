//
//  TDSinaWBAuthProvider.m
//  edX
//
//  Created by Elite Edu on 2018/11/19.
//  Copyright © 2018年 edX. All rights reserved.
//

#import "TDSinaWBAuthProvider.h"
#import "edX-Swift.h"
#import "OEXExternalAuthProviderButton.h"
#import "TDWeiboManeger.h"

@implementation TDSinaWBAuthProvider

- (UIColor*)sinaWbColor {
    return [UIColor orangeColor];
}

- (NSString*)displayName {
    return @"微博";
}

- (NSString*)backendName {
    return @"weibo";
}

- (OEXExternalAuthProviderButton*)freshAuthButton {
    OEXExternalAuthProviderButton* button = [[OEXExternalAuthProviderButton alloc] initWithFrame:CGRectZero];
    button.provider = self;
    [button setImage:[UIImage imageNamed:@"icon_facebook_white"] forState:UIControlStateNormal];
    [button useBackgroundImageOfColor:[self sinaWbColor]];
    return button;
}

- (void)authorizeServiceFromController:(UIViewController *)controller requestingUserDetails:(BOOL)loadUserDetails withCompletion:(void (^)(NSString *, OEXRegisteringUserDetails *, NSError *))completion {
    
    [[TDWeiboManeger shareManager] weiboAuthLogin:^(NSString *token, NSString *userid, NSError *error) {
        
    }];
    
//    OEXFBSocial* facebookManager = [[OEXFBSocial alloc] init]; //could be named facebookHelper.
//    [facebookManager loginFromController:controller completion:^(NSString *accessToken, NSError *error) {
//        if(error) {
//            if([error.domain isEqual:FBSDKErrorDomain] && error.code == FBSDKNetworkErrorCode) {
//                // Hide FB specific errors inside this abstraction barrier
//                error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorNetworkConnectionLost userInfo:error.userInfo];
//            }
//            completion(accessToken, nil, error);
//            return;
//        }
//        if(loadUserDetails) {
//            [facebookManager requestUserProfileInfoWithCompletion:^(NSDictionary *userInfo, NSError *error) {
//                // userInfo is a facebook user object
//                OEXRegisteringUserDetails* profile = [[OEXRegisteringUserDetails alloc] init];
//                profile.email = userInfo[@"email"];
//                profile.name = userInfo[@"name"];
//                completion(accessToken, profile, error);
//            }];
//        }
//        else {
//            completion(accessToken, nil, error);
//        }
//
//    }];
}

@end
