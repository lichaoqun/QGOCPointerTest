//
//  main.m
//  TTTT
//
//  Created by QG on 2018/1/9.
//  Copyright © 2018年 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "Person.h"

void test1(){
    
    NSError *error = [NSError errorWithDomain:NSOSStatusErrorDomain code:1 userInfo:@{NSLocalizedFailureErrorKey : @"ddd"}];
    
    void *ve = (__bridge void *)error;
    void *vd = (__bridge void *)error.domain;
    Ivar iv = class_getInstanceVariable(error.class, "_domain");
    ptrdiff_t offset = ivar_getOffset(iv);
    
    
    NSLog(@"%@", (__bridge NSError *)ve);
    NSLog(@"%p -- &%p -- domain%p", ve, &ve, &vd);
    NSLog(@"%td", offset);
    
}

void test2(){

    Person *s = [[Person alloc]init];
    s.name = @"Son";
    s.age = 20;
    s.height = 180;
    s.weight = 65;

    
    Person *p = [[Person alloc]init];
    p.name = @"LCQ";
    p.age = 27;
    p.height = 180;
    p.weight = 65;
    p.son = s;
    
     /** OC 对象类型转 C 语言的 void * 类型 */
    void *vp = (__bridge void *)p;
    
     /** 对象的 size */
    size_t classSize = class_getInstanceSize(p.class);
    NSLog(@"类的大小 : %zu", classSize);
    
     /** 使用 ivar_getOffset 获取非指针类型的数据 */
    ptrdiff_t ageOffset = ivar_getOffset(class_getInstanceVariable(p.class, "_age"));
    int *ageP = (int *)(vp + ageOffset);
    *ageP = 10;
    
    /** 使用 ivar_getOffset 获取指针类型的数据 */
    ptrdiff_t sonOffset = ivar_getOffset(class_getInstanceVariable(p.class, "_son"));
    void **sonPP = (void **)(vp + sonOffset);
    Person *son = (__bridge Person *)(*(sonPP));
    NSLog(@"\n  %@    \n  %@", p, son);
    
    /** 使用 ivar_getOffset 修改指针类型的数据 */
    ptrdiff_t nameOffset = ivar_getOffset(class_getInstanceVariable(p.class, "_name"));
    void **namePP = (void **)(vp + nameOffset);
    NSLog(@"%p", *namePP);
    *namePP = @"WXC";

    NSLog(@"\n  %@    \n  %@", p, son);
}

void test3(){    
    /** 使用 C 语言的方法 修改OC 的 NSString 的值 */
    NSString *str1 = @"str1__text";
    void *strP = &str1;
    void **strP1 = (void **)strP;
    *strP1 = @"呵呵";
    NSLog(@"%@", str1);

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test2();
    }
    return 0;
}
