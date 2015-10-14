//
//  main.m
//  Chapter10Initializer
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.290 : 指定イニシャライザ - init 時に値を代入する仕組み */

#import <Foundation/Foundation.h>

/* Triangle */
@interface Triangle : NSObject
@property int width, height ;
@end

@implementation Triangle
@synthesize width, height ;

- (id) initWithWidthHeight : (int)_width : (int)_height
{
    if(self = [super init])
    {
        width  = _width ;
        height = _height ;
    }
    return self ;
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Triangle *sankaku_A = [[Triangle alloc] initWithWidthHeight: 10 : 12 ] ;
        Triangle *sankaku_B = [[Triangle alloc] initWithWidthHeight:  5 :  4 ] ;
        NSLog(@"三角形Aの底辺は %d , 高さは %d \n", sankaku_A.width, sankaku_A.height) ;
        NSLog(@"三角形Bの底辺は %d , 高さは %d \n", sankaku_B.width, sankaku_B.height) ;
    }
    return 0;
}
