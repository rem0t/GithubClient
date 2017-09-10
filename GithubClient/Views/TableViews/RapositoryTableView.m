//
//  RapositoryTableView.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 06.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "RapositoryTableView.h"

@implementation RapositoryTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 60.f;
        
        UINib *nib = [UINib nibWithNibName:@"RepositoryCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:@"repositoryCell"];
    }
    return self;
}


@end
