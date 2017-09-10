//
//  DateConverter.m
//  GithubClient
//
//  Created by Vladislav Kalaev on 10.09.17.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "DateConverter.h"

@implementation DateConverter

- (NSString *)convertToDateWithDayMonthYear {
    NSDate *date = [self getDateFromString:self.date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy 'в' HH:mm"];
    return [dateFormatter stringFromDate:date];
}

- (NSDate*) getDateFromString:(NSString*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    NSDate *newDate = [dateFormatter dateFromString: date];
    return newDate;
}

@end
