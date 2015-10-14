//
//  TestClass.h
//  Chapter10SelfAndSuper
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentTestClass.h"

/* TestClass -> ParentTestClass */
@interface TestClass : ParentTestClass
- (id)init ;
+ (void) classMethod ;
- (void) instanceMethod ;
+ (void) callClassMethod ;
- (void) callInstanceMethod ;
+ (void) callParentClassMethod ;
- (void) callParentInstanceMethod ;
@end
