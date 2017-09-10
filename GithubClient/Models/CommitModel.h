//
//  CommitModel.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 07.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommitModel : NSObject

@property (nonatomic) NSString *sha;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *date;
@property (nonatomic) NSString *message;
@property (nonatomic) NSString *committer;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
