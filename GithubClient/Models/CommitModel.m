//
//  CommitModel.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 07.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "CommitModel.h"

@implementation CommitModel

- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        
        self.sha = [dictionary objectForKey:@"sha"] ;
        
        NSDictionary *commitDictionary = [dictionary objectForKey:@"commit"];
        self.message = [commitDictionary objectForKey:@"message"];
        
        NSDictionary *autorDictionary = [commitDictionary objectForKey:@"author"];
        self.date = [autorDictionary objectForKey:@"date"];
        self.name = [autorDictionary objectForKey:@"name"];
        
    }
    return self;
}

@end

