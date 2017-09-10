//
//  UserModel.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (assign, nonatomic) NSUInteger ID;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *avatarURLString;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
