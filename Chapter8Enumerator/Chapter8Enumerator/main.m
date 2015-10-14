//
//  main.m
//  Chapter8Enumerator
//
//  Created by Yokoe on 10/13/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 列挙体を使うと、switch 文がなにを行っているのかわかりやすくなるのがよい！ */
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        enum Season { SPRING, SUMMER, AUTUMN, WINTER } ;  // これが列挙体
        NSLog(@"WINTER の値は %d ！", WINTER) ; // 3 が出力される
        
        enum Week { MON = 1, TUE, WED, THU, FRI, SAT, SUN = 0 } ;
        // このように、０から始めない列挙体というものも作れる。
        
        enum Week today ;
        
        today = TUE ;
        
        if(today == 0 || today == 6){
            NSLog(@"今日はお休みです。") ;
        }else{
            NSLog(@"会社だよ！") ;
        }
    }
    return 0;
}
