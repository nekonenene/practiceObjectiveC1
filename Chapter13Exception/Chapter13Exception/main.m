//
//  main.m
//  Chapter13Exception
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.389~ : 例外処理について */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // 驚いたことに、以下のように書くと例外と認定されず出力されてしまう
        // int threeSizeArray[3] = {20, 50, 369} ;
        
        NSMutableArray *threeSizeArray = [[NSMutableArray alloc] init] ;
        [ threeSizeArray addObject:[[NSNumber alloc] initWithInt:20] ] ;
        [ threeSizeArray addObject:[[NSNumber alloc] initWithInt:50] ] ;
        [ threeSizeArray addObject:[[NSNumber alloc] initWithInt:369] ] ;
        
        int i ;
        for(i = 0; i < 5; ++i)
        {
            @try{
                NSLog(@"%d 番目の値は %d", i + 1, [[threeSizeArray objectAtIndex:i] intValue] ) ;
                NSLog(@"正常に処理できました") ;
            }@catch(NSException *e){
                NSLog(@"例外が発生しました。\n\
                      例外の名前は \"%@\" \n\
                      例外の理由は \"%@\" です。", e.name, e.reason) ;
                return -1 ;  // ここでこのプログラムを終了させます。でも、その前に finally 内を実行します。
            }@finally{
                NSLog(@"必ず実行される finally の処理部です") ;
            }
            NSLog(@"必ず実行されると見せかけて実はそうでもない、エラー処理の外です") ;
        }
    }
    return 1 ;
}
