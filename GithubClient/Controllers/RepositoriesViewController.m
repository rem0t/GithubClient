//
//  RepositoriesViewController.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "RapositoryTableView.h"
#import "UIImageView+AFNetworking.h"
#import "CommitsViewController.h"


@interface RepositoriesViewController () <UITableViewDelegate> {
    NSArray*models;
}

@property (weak, nonatomic) IBOutlet RapositoryTableView *tableView;

@property (strong, nonatomic) NSArray *userRepositories;
@property (strong, nonatomic) UserModel *user;

@end

@implementation RepositoriesViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView setAllowsSelection:YES];
    
    [[NetworkManager sharedManager] startMonitoringExistConnection:^{
        
        [self getUserRepositories];
        
    } notExistConnection:^{
        
        [self openNoConnectionAlert];
    }];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NetworkManager sharedManager] stopMonitoringConnection];
}

- (void) getUserRepositories {
    
    NSString *token = [[KeyChainManager sharedManager] getToken];
    
    if (token) {
        
        [self startNetworkActivity];
        
        [[NetworkManager sharedManager] getUserRepositoriesWithToken:token completionHandler:^(NSArray *responseArray) {
            
            [self stopNetworkActivity];
            [self parseAndDisplayUserRepositories:responseArray];
            
        } failureHandler:^(NSError *error) {
            
            [self stopNetworkActivity];
            [self openBadDataAlert];
        }];
        
    } else {
        
        [self openNoAuthorizedAlert];
    }
}

- (void) parseAndDisplayUserRepositories: (NSArray *) repositoriesArray {
    
    NSMutableArray *repositories = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in repositoriesArray) {
        
        RepositoryModel *repository = [[RepositoryModel alloc] initWithDictionary:dictionary];
        
        [repositories addObject:repository];
    }
    
    self.userRepositories = repositories;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.userRepositories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"repositoryCell";
    
    RepositoryCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[RepositoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    RepositoryModel *repository = [self.userRepositories objectAtIndex:indexPath.row];
    
    NSURL *imageURL = [NSURL URLWithString:repository.avatarURLString];

    cell.nameLabel.text = repository.name;
    cell.autorLabel.text = repository.login;
    cell.descriptionLabel.text = repository.textDescription;
    
    cell.forkLabel.text = [NSString stringWithFormat:@" %lu", (unsigned long)repository.forck];
    cell.watchLabel.text = [NSString stringWithFormat:@" %lu", (unsigned long)repository.watch ];
    
    [cell.avatarImageView setImageWithURL:imageURL placeholderImage:nil];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RepositoryModel *repository =  self.userRepositories[indexPath.row];
    CommitsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CommitsViewController"];
    vc.stringDescription = repository.textDescription;
    vc.stringUrlImage = repository.avatarURLString;
    vc.userName = repository.login;
    vc.repoName = repository.name;
    [self.navigationController pushViewController:vc animated:YES];

}






@end
