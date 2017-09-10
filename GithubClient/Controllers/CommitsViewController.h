//
//  CommitsViewController.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"
#import "RequestActivityIndicatorView.h"

@interface CommitsViewController : ParentViewController

@property (weak, nonatomic) IBOutlet UILabel *repoDescription;
@property (weak, nonatomic) IBOutlet UIImageView *repoAuthorImage;
@property (weak, nonatomic) IBOutlet UILabel *repoAuthorName;
@property (weak, nonatomic) IBOutlet UITableView *repoCommitsTableView;
@property (weak, nonatomic) IBOutlet UIView *userView;

@property (nonatomic) NSString *repoName;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *stringDescription;
@property (nonatomic) NSString *stringUrlImage;

@end
