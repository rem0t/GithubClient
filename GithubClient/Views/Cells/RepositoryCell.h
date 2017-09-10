//
//  RepositoryCell.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepositoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *autorLabel;
@property (weak, nonatomic) IBOutlet UILabel *forkLabel;
@property (weak, nonatomic) IBOutlet UILabel *watchLabel;


@end
