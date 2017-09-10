//
//  NetworkManager.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetworkManager : NSObject

+ (instancetype) sharedManager;

- (void) startMonitoringExistConnection: (void (^)()) existConnection notExistConnection: (void (^)()) notExistConnection;
- (void) stopMonitoringConnection;

- (NSURLRequest *) accessRequest;
- (NSString *) codeFromRequest: (NSURLRequest *) request;

- (void) getUserTokenWithCode: (NSString *) code completionHandler: (void (^)(NSString *token)) completionHandler failureHandler: (void (^)(NSError *error)) failureHandler;

- (void) getUserInfoWithToken: (NSString *) token completionHandler: (void (^)(NSDictionary *responseDictionary)) completionHandler  failureHandler: (void (^)(NSError *error)) failureHandler;

- (void) getUserRepositoriesWithToken: (NSString *) token completionHandler: (void (^)(NSArray *responseArray)) completionHandler  failureHandler: (void (^)(NSError *error)) failureHandler;

- (void) getUserRepositoriesCommitWithUser: (NSString*) user reponame:(NSString*)repo completionHandler: (void (^)(NSArray *responseArray)) completionHandler  failureHandler: (void (^)(NSError *error)) failureHandler;

@end
