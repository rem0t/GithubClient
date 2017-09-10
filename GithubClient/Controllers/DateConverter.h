//
//  DateConverter.h
//  GithubClient
//
//  Created by Vladislav Kalaev on 10.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateConverter : NSObject

@property (copy, nonatomic) NSString *date;

- (NSString*)convertToDateWithDayMonthYear;

@end
