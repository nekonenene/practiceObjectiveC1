//
//  main.m
//  Chapter10Inherit1
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* Chapter 10-1 ( P.260~ ) : クラスの継承 */

#import <Foundation/Foundation.h>

typedef enum Color{RED, GREEN, BLUE} Color ;

/* 親クラス Figure */
@interface Figure : NSObject
@property Color color ;
@end

@implementation Figure
@synthesize color ;

+ (void) computeAreaSize // 左端を + とすると、インスタンスを生成せずとも呼び出せるメソッドに
{
    NSLog(@"*Error* この図形の面積は求められません") ;
    return ;
}
@end

/* 子クラス : Triangle -> Figure */
@interface Triangle : Figure
@property int width, height ;
@end

@implementation Triangle
@synthesize width, height ;

- (float) computeAreaSize  // computeAreaSize をオーバーライド
{
    return ( (float)width * (float)height / 2 ) ;
}
@end

/* 子クラス : Pentagon -> Figure */
@interface Pentagon : Figure ;
@end

@implementation Pentagon
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Triangle *sankaku_A = [[Triangle alloc] init] ;
        sankaku_A.color = GREEN ;
        sankaku_A.width = 4 ;
        sankaku_A.height = 8 ;
        
        NSLog(@"三角形Aの面積は %.1f で、色は ", sankaku_A.computeAreaSize) ;
        
        switch (sankaku_A.color) {
            case RED:
                NSLog(@"赤") ;
                break;
            case GREEN:
                NSLog(@"緑") ;
                break;
            case BLUE:
                NSLog(@"青") ;
                break;
        }
        
        NSLog(@" です。\n") ;
        
        [sankaku_A setWidth : 8] ;  // コロンを使うので、書き方に注意！！

        NSLog(@"変更後の三角形Aの面積は %.1f\n", sankaku_A.computeAreaSize) ;
        
        [Pentagon computeAreaSize] ;
        
    }
    return 0;
}
