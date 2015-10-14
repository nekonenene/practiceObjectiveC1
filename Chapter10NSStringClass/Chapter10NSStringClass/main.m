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
        
        NSString *numberString1 = @"3.14" ;
        NSLog(@"%@ の文字数は %u", numberString1, (unsigned int)[numberString1 length]) ;
        
        // この文字列を数値にパースする
        // ※ float は int と違い、32bit, 64bit に影響されないので、NSFloat みたいなものは無い
        float num2 = [numberString1 floatValue] ;
        NSLog(@"%f", num2) ;
    }
    return 0;
}
