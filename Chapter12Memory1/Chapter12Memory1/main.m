//
//  main.m
//  Chapter12Memory1
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"A cat" ] ;

        /******  重要なポイント  ******
         *** retainCount, retain, release などの機能は、
         *** ARC ( Automatic Reference Counting ) という自動メモリ管理機能を OFF にしないと
         *** コンパイルエラーが起こるので注意。
         *** Chapter12Memory1 > Build Settings > Apple LLVM 7.0 - Language - Objective-C > Objective-C Automatic Reference Counting の項を OFF に。
         *** また、その機能があるので、以前よりはメモリ管理について開発者が神経質にならず済む、通常は ON にしよう ***/

        NSLog(@"string の参照カウンタ値は %ld \n" , [string retainCount]) ;
    }
    return 0 ;
}
