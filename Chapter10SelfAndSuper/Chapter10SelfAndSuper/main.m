//
//  main.m
//  Chapter10SelfAndSuper
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.276 〜 */

#import <Foundation/Foundation.h>
#import "main.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"do callClassMethod") ;
        [TestClass callClassMethod] ;
        NSLog(@"do callInstanceMethod") ;
        TestClass *testClass = [[TestClass alloc] init] ;
        [testClass callInstanceMethod] ;
        
        NSLog(@"===== CALL PARENT =====") ;
        NSLog(@"do callParentClassMethod") ;
        [TestClass callParentClassMethod] ;
        NSLog(@"do callParentInstanceMethod") ;
        [testClass callParentInstanceMethod] ;
    }
    return 0 ;
}
