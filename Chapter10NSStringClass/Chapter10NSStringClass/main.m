//
//  main.m
//  Chapter10NSStringClass
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSString *string1 = @"Hello! New String!" ;
        // NSLog(string1) ;  // この書き方は推奨されていない
        NSLog(@"I said \"%@\"\n", string1) ; // %@ を用いる
        
        NSInteger num1 = 30 ;  // ここの値は、32bit 環境か 64bit 環境かで、int だったり long int だったり
        
        // 変数を String 内に入れたいときは、 initWithFormat を使う
        NSString *string2 = [[NSString alloc] initWithFormat: @"num1 に格納されている値は、 %d", (int)num1] ;
        NSLog(@"%@ だよ！\n", string2) ;
        
        NSString *numberString = @"3.14" ;
        // NSString *numberString = [[NSString alloc] initWithString:@"3.14"] ; // ダメ、これは冗長な書き方
        NSLog(@"%@ の文字数は %u", numberString, (unsigned int)numberString.length) ;
        // length の戻り値は、NSUInteger ( NSInteger の unsigned 版 )
        
        // この文字列を数値にパースする
        // ※ float は int と違い、32bit, 64bit に影響されないので、NSFloat みたいなものは無い
        float num2 = numberString.floatValue ;
        NSLog(@"%f", num2) ;
        
        // [numberString appendString:@"15926" ] ; // これはできない
        // Mutable の方を使う。Mutable の宣言では initWithString が必要な点に注意
        NSMutableString *numberMutableString = [[NSMutableString alloc] initWithString:@"3.14" ] ;
        NSLog(@"%@", numberMutableString) ;
        [numberMutableString appendString:@"1592" ] ;
        NSLog(@"%@", numberMutableString) ;

        float num3 = numberMutableString.floatValue ;
        NSLog(@"%f", num3) ; // 3.141592
        NSLog(@"%d", (int)num3) ; // 3
    }
    return 0;
}
