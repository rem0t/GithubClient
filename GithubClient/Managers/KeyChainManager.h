//
//  KeyChainManager.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainManager : NSObject

+ (instancetype) sharedManager;
- (BOOL) saveToken: (NSString *) token;
- (NSString *) getToken;
- (BOOL) deleteToken;

@end
