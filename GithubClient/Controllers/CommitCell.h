//
//  CommitCell.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 10.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *hashLabel;
@property (weak, nonatomic) IBOutlet UILabel *commitLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
