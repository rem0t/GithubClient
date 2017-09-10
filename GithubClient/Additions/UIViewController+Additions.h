//
//  UIViewController+Additions.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

- (void) openNoConnectionAlert;
- (void) openBadDataAlert;
- (void) openNoAuthorizedAlert;
- (void) openAlertWithTitle: (NSString *) title andMessage: (NSString *) message;

@end
