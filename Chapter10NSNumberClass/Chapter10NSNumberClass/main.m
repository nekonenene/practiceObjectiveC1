//
//  main.m
//  NSNumberClass
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        /* Foundation の NSNumber を使ってみる */
        NSNumber *number1 = [[NSNumber alloc] initWithInt:50 ] ; // NSNumber 型のインスタンス number1 を作成
        NSLog(@"number1 の値は %d \n", [number1 intValue] ) ; // number1 に入れた値を取り出すには intValue メソッド
        NSLog(@"(float)number1 = %f \n", [number1 floatValue]) ;
        
        NSNumber *number2 = [[NSNumber alloc] initWithInt:20 ] ;
        NSLog(@"%d (1: 同値, 0: 異なる値)\n", [number1 isEqualToNumber:number2 ] ) ;
        NSLog(@"%d (1: 左が大きい, 0: 同値, -1: 右が大きい)", (int)[number1 compare:number2]) ; // なぜか long 値で返されるらしい
    }
    return 0;
}
