//
//  main.m
//  Chapter8Structure
//
//  Created by Yokoe on 10/13/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

struct BirthDate
{
    int birthYear ;
    int birthMonth ;
    int birthDay ;
} ;
typedef struct BirthDate BirthDate ;  // 最後に書いた名前は、typedef と同じ効果が得られる

struct Person
{
    float height ;
    float weight ;
    BirthDate birthDate ;
} ;
typedef struct Person APerson ;  // APerson 型 が作られた

void printPersonData(APerson person) ;



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        APerson yamadaKun =
        {
            170.5 ,
            55.0 ,
            {
                1980 ,
                3 ,
                9
            }
        } ;  // 初期化のときのみ、このように値のまとめた代入ができる
        
        NSLog(@"山田くんの身長は %.2f cm です。", yamadaKun.height ) ;
        printPersonData(yamadaKun) ;
        
    }
    return 0;
}

void printPersonData(APerson person){
    NSLog(@"山田くんの身長は %.2f cm です。", person.height ) ;
    NSLog(@"山田くんの体重は %.2f kg です。", person.height ) ;
    NSLog(@"山田くんの生年月日は %d 年 %d 月 %d 日 です。", person.birthDate.birthYear, person.birthDate.birthMonth, person.birthDate.birthDay ) ;
    
    return ;
}