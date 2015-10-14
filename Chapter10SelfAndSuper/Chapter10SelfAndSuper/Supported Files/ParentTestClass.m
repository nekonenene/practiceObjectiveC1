//
//  ParentTestClass.m
//  Chapter10SelfAndSuper
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import "ParentTestClass.h"

@implementation ParentTestClass
+ (void) classMethod
{
    NSLog(@"親です。クラスメソッドが呼び出されました") ;
    return ;
}

- (void) instanceMethod
{
    NSLog(@"親です。インスタンスメソッドが呼び出されました %d", _number) ;
    return ;
}
@end
