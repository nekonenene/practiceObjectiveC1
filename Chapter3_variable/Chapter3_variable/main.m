//
//  main.m
//  Chapter3_variable
//
//  Created by Yokoe on 10/13/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

/* _target_value の _pow 乗を求める */
long int pow_num(int _target_value, int _pow)
{
    int target_value = _target_value ;
    int i = 0 ;
    for(i = 1; i < _pow; ++i)
    {
        target_value *= _target_value ;
    }
    return target_value ;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i = 30 ;
        i *= i ;
        NSLog(@"i : 30 ^ 2 = %d\n", i ) ;
        
        long int ff = pow_num(12, 3) ;
        NSLog(@"%ld", ff) ;
        
        BOOL t = YES ;  // objective-c では、bool 型は YES or NO
        NSLog(@"YES = %d", t) ;

    }
    return 0;
}

