//
//  main.m
//  Chapter11Array2
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* 11-2 : NSArray - 参照型を格納する配列 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSNumber *nsIntNumber = [[NSNumber alloc] initWithInteger:39] ;
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"初音ミクダヨー"] ;
        
        // NSArray で、参照型である nsIntNumber と string を格納する
        NSArray *nsArray = [[NSArray alloc] initWithObjects:nsIntNumber, string, nil] ;
        
        NSLog(@"数値は \"%ld\" \n", [[nsArray objectAtIndex:0] longValue]) ;
        NSLog(@"文字は \"%@\" \n" , [nsArray objectAtIndex:1]) ;
        
        [string setString:@"float型ダヨー"] ;

        NSLog(@"数値は \"%f\" \n", [[nsArray objectAtIndex:0] floatValue]) ;
        NSLog(@"文字は \"%@\" \n", [nsArray objectAtIndex:1]) ;
    }
    return 0;
}
