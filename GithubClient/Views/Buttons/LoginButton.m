//
//  LoginButton.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "LoginButton.h"

@implementation LoginButton

- (void) setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        
        self.backgroundColor = [UIColor orangeColor];
        
    } else {
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

@end
