//
//  main.m
//  Chapter12Memory1
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrangedString : NSObject
@end

@implementation ArrangedString
- (void)dealloc
{
    [super dealloc] ;
    NSLog(@"参照カウンタ値は 0 になり、メモリから解放されました") ;
}
@end

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
        NSLog(@"1 : %@\n", string) ;
        [string retain] ;
        NSLog(@"string の参照カウンタ値は %ld \n" , [string retainCount]) ;
        NSLog(@"2 : %@\n", string) ;
        [string release] ;
        NSLog(@"string の参照カウンタ値は %ld \n" , [string retainCount]) ;
        NSLog(@"3 : %@\n", string) ;
        [string release] ;
        
        // ここで参照カウンタ値は 0 になり、インスタンス string はメモリから解放され、値を取り出せなくなる
        // （以下 2行のようなコードは、危険なので書かないべきである）
        // NSLog(@"string の参照カウンタ値は %ld \n" , [string retainCount]) ;
        // NSLog(@"4 : %@\n", string) ;
        
        
        // dealloc をオーバーライドしてみた
        ArrangedString *arrangedString = [[ArrangedString alloc] init] ;
        NSLog(@"string の参照カウンタ値は %ld \n" , [arrangedString retainCount]) ;
        
        // 型名を取得できる関数。便利。
        NSLog(@"%@ \n", NSStringFromClass([arrangedString class]) ) ;
        [arrangedString release] ;
        
    }
    return 0 ;
}
