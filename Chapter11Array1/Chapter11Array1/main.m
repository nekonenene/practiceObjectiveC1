//
//  main.m
//  Chapter11Array1
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* 二次元配列の復習 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        static const int X_COORDINATE = 4 ;
        static const int Y_COORDINATE = 2 ;
        int arrayDouble[Y_COORDINATE][X_COORDINATE] = { { 3, 5, 6, 8 }, { 12, 39, 91, 40 } } ;
        
        NSMutableString *output = [[NSMutableString alloc] initWithFormat:@""] ;
        int i, j ;
        for( i = 0; i < Y_COORDINATE; ++i ){
            for( j = 0; j < X_COORDINATE - 1 ; ++j ){  // 最後の数値の後のコンマはいらないので、ひとつ前まで
                [output appendFormat:@"%d, ", arrayDouble[i][j] ] ;
            }
            [output appendFormat:@"%d", arrayDouble[i][j] ] ;
            [output appendString:@"\n"] ;
        }
        
        NSLog(@"%@\n", output) ;
    }
    return 0;
}
