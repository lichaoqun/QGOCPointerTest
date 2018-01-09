//
//  Person.h
//  TTTT
//
//  Created by QG on 2018/1/9.
//  Copyright © 2018年 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, assign)int age;

@property(nonatomic, copy)NSString *name;

@property(nonatomic, strong)Person *son;

@property(nonatomic, assign)int height;

@property(nonatomic, assign)int weight;


@end
