//
//  CommitsViewController.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "CommitsViewController.h"
#import "CommitCell.h"
#import "CommitModel.h"
#import "DateConverter.h"
#import "NetworkManager.h"
#import "UIImageView+AFNetworking.h"

@interface CommitsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)  NSArray *parseCommits;

@end

@implementation CommitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCommits];

}

- (void)configView {
    
    self.repoCommitsTableView.tableFooterView = [UIView new];
    self.repoAuthorImage.layer.cornerRadius = self.repoAuthorImage.frame.size.width / 2;
    self.repoAuthorImage.clipsToBounds = YES;
    self.userView.clipsToBounds = YES;
    self.userView.layer.cornerRadius = 3;
    self.title = _repoName;
    self.repoDescription.text = _stringDescription;
    self.repoAuthorName.text = _userName;
    [self.repoAuthorImage setImageWithURL:[NSURL URLWithString:_stringUrlImage]];
    self.repoCommitsTableView.rowHeight = UITableViewAutomaticDimension;
    self.repoCommitsTableView.estimatedRowHeight = 98;
    [self updateHeightHeaderView];
    
    [self stopNetworkActivity];

    
}

- (void) updateHeightHeaderView {
    UIView *header = self.repoCommitsTableView.tableHeaderView;
    
    [header setNeedsLayout];
    [header layoutIfNeeded];
    
    CGFloat height = [header systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = header.frame;
    
    frame.size.height = height;
    header.frame = frame;
    
    self.repoCommitsTableView.tableHeaderView = header;
}

- (void)loadCommits {
    [self startNetworkActivity];
    
        [[NetworkManager sharedManager] getUserRepositoriesCommitWithUser:_userName reponame:_repoName completionHandler:^(NSArray *responseArray) {
    
            [self parseCommits:responseArray];
            [self configView];
            
        } failureHandler:^(NSError *error) {
            [self openBadDataAlert];
            [self stopNetworkActivity];
        }];

}

- (void) parseCommits: (NSArray *) repositoriesArray {
    
    NSMutableArray *commits = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in repositoriesArray) {
        
        CommitModel *commit = [[CommitModel alloc] initWithDictionary:dictionary];
        
        [commits addObject:commit];
    }
    
    self.parseCommits = commits;
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _parseCommits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    CommitModel *commit = _parseCommits[indexPath.row];
    CommitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommitCell" forIndexPath:indexPath];
    
    cell.hashLabel.text = commit.sha;
    cell.commitLabel.text = commit.message;
    cell.authorLabel.text = commit.name;
    DateConverter *dateCon = [DateConverter new];
    dateCon.date = commit.date;
    cell.dateLabel.text = [dateCon convertToDateWithDayMonthYear];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

@end
