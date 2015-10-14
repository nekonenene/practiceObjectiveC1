//
//  main.m
//  Chapter9Class1
//
//  Created by Yokoe on 10/13/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sankaku : NSObject
{
    @public
    int width ;
    int height ;
}
@end

@implementation Sankaku
	// ここにメソッドを書く
/* 三角形の面積を求める */
- (float) computeAreaSize  // - (型) メソッド名 の順
{
    float areaSize ;
    areaSize = (float) width * (float) height / 2 ;  // 型変換大事
    return areaSize ;
}

/* 底辺・高さの長さをそれぞれ２倍に */
- (void) resizeDouble
{
    width  *= 2 ;
    height *= 2 ;
}

/* 底辺・高さの長さをそれぞれ x 倍に */
- (void) resizeXTimes : (int) x  // 引数をとりたいときはコロンを使い書き足していく
{
    width  *= x ;
    height *= x ;
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Sankaku /* アスタリスク大事!! */ *sankaku_A = [[Sankaku alloc] init] ;
        // インスタンスは「参照型」を用いる点に、要！ 要！ 要注意！
        // メモリを確保する alloc と、インスタンスを初期化する init （初期化メソッド）の必要があることを覚えよう
        
        sankaku_A -> width  = 6 ;  // アロー演算子を用いる
        sankaku_A -> height = 4 ;
        
        NSLog(@"三角形Aの面積は %d である。", sankaku_A -> width * sankaku_A -> height / 2 ) ;
        
        Sankaku *sankaku_B = [[Sankaku alloc] init] ;
        sankaku_B -> width  = 18 ;
        sankaku_B -> height = 50 ;
        
        NSLog(@"三角形Bの面積は %.1f である。", [sankaku_B computeAreaSize]) ;
        // インスタンス sankaku_B に対して、 computeAreaSize をおこなえと指示出し
        
        [sankaku_B resizeDouble] ;
        NSLog(@"底辺高さをそれぞれ２倍にした三角形Bの面積は\n\t%.1f である。", [sankaku_B computeAreaSize]) ;
        
        [sankaku_B resizeXTimes: 5 ] ;
        NSLog(@"底辺高さをさらに５倍にした三角形Bの面積は\n\t%.1f である。", [sankaku_B computeAreaSize]) ;
        
        
    }
    return 0;
}
