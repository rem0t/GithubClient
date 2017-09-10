//
//  ParentViewController.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetworkManager.h"
#import "KeyChainManager.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIViewController+Additions.h"

#import "UserModel.h"
#import "RepositoryModel.h"

@interface ParentViewController : UIViewController

- (void) startNetworkActivity;
- (void) stopNetworkActivity;

@end
