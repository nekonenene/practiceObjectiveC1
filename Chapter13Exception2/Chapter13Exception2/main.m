//
//  main.m
//  Chapter13Exception2
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.396~ : 例外を throw する、プログラミング側で新規に例外を作成する */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSException *ValueException = [[NSException alloc] initWithName:@"ValueException" reason:@"Sum is over 100" userInfo:nil] ;
        
        int i, sum = 0 ;
        const int END_NUMBER = 50 ;
        for(i = 0; i < END_NUMBER; ++i){
            sum += i ;
            @try
            {
                if( sum > 100 ){
                    @throw ValueException ; // @throw は、@try の中で使い、「例外発生の信号を与える」！

                    // 以下のように raise メソッドを使って書くと、簡易的に例外を作れる。一度だけしか使わないような例外なら有効。
                    // ……しかし、「確実にこれは一度しか使わない」という保証をあなたはできるだろうか・・・
                    [NSException raise:@"ValueException" format:@"SUM is over 100"] ;
                }
                NSLog(@"i = %d, sum = %d", i, sum ) ;
            }
            @catch(NSException *e)
            {
                NSLog(@"例外発生！ 例外の名前は \"%@\" , 理由は \"%@\"\n", e.name, e.reason) ;
                return -1 ;
            }
        }
        NSLog(@"1 から %d までの値の合計は、 %d\n", END_NUMBER, sum ) ;
    }
    return 0;
}
