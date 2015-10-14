//
//  main.m
//  Chapter10Override1
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.273 のプログラムを実際に動かしてみる */

#import <Foundation/Foundation.h>

/* Father クラス */
@interface Father : NSObject
@end
@implementation Father
- (void) displayInstanceMethod
{
    NSLog(@"お父さんだよ！") ;
}

+ (void) displayClassMethod
{
    NSLog(@"I'm Father!") ;
}
@end

/* Son -> Father */
@interface Son : Father
@end
@implementation Son
- (void) displayInstanceMethod
{
    NSLog(@"息子ですよ！") ;
}

+ (void) displayClassMethod
{
    NSLog(@"I'm Son!") ;
}
@end

/* GrandSon -> Son */
@interface GrandSon : Son
@end
@implementation GrandSon
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Son *son = [[Son alloc] init] ;
        GrandSon *grandSon = [[GrandSon alloc] init] ;
        
        // インスタンス・メソッドについて
        [grandSon displayInstanceMethod] ;
        [son displayInstanceMethod] ;
        [grandSon displayInstanceMethod] ;
        NSLog(@"----------") ;
        // クラス・メソッドについて
        [ GrandSon displayClassMethod ] ;
        [ Son displayClassMethod ] ;
        [ Father displayClassMethod ] ;
    }
    return 0;
}
