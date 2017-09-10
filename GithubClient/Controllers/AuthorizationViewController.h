//
//  AuthorizationViewController.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@protocol AuthorizationViewControllerDelegate;

@interface AuthorizationViewController : ParentViewController

@property (weak, nonatomic) id < AuthorizationViewControllerDelegate > delegate;

@end

@protocol AuthorizationViewControllerDelegate

@required

- (void) authorizationViewController: (AuthorizationViewController *) authorizationViewController userToken: (NSString *) token;

@end
