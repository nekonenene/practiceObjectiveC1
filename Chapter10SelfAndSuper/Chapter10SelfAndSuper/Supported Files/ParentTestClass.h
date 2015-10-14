//
//  ParentTestClass.h
//  Chapter10SelfAndSuper
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParentTestClass : NSObject
{
    @protected
    int _number ;
}
+ (void) classMethod ;
- (void) instanceMethod ;
@end

