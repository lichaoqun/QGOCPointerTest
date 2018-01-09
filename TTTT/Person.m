//
//  Person.m
//  TTTT
//
//  Created by QG on 2018/1/9.
//  Copyright © 2018年 xinxianzhizao. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    return [NSString stringWithFormat:@"name : %@, age : %d, height : %d, weight : %d", self.name, self.age, self.height, self.weight];
}

@end
