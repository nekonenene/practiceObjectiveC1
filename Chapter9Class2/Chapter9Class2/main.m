//
//  main.m
//  Chapter9Class2
//
//  Created by Yokoe on 10/13/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

/* カプセル化について考えてみる */

@interface Sankaku : NSObject
{
@private
    int _width ;
    int _height ;
}

/* @property : このように簡略化して private なインスタンス変数を作れる */
@property(readonly) int secretValue, nonSynthesizeSecretValue ;
@property int writableValue ;

@end


@implementation Sankaku
/* @synthesize : こう書くことで、アクセッサメソッドが自動的に作られる */
@synthesize writableValue, secretValue ;
// synthesize を書かない場合、property で作られた _nonSynthesizeSecretValue が作られたまま残る

- (void) setTriangle : (int) width : (int) height
{
    if(width > 0 && height > 0){
        _width = width ;
        _height = height ;
    }
    writableValue = 50 ;
    secretValue = 30 ;  // _secretValue の初期化
    _nonSynthesizeSecretValue = 300 ; // _nonSynthesizeSecretValue の初期化
    return ;
}

- (int) getWidth  { return _width  ; }
- (int) getHeight { return _height ; }

- (int) getNonSynthesizeSecretValue { return _nonSynthesizeSecretValue ; }

- (float) computeTriangleSize
{
    return ( (float)_width * (float)_height / 2 ) ;
}

@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Sankaku *sankaku_A = [[Sankaku alloc] init] ;
        [sankaku_A setTriangle: 5 : 8 ] ;
        
        NSLog(@"底辺 %d 、高さ %d の三角形の面積は、 %.1f\n", [sankaku_A getWidth], [sankaku_A getHeight],
              [sankaku_A computeTriangleSize]) ;
        
        NSLog(@"秘密の値は %d, %d\n", sankaku_A.secretValue, sankaku_A.getNonSynthesizeSecretValue) ;
        NSLog(@"書き込み可能な値は、今は %d\n", sankaku_A.writableValue) ;
        
        // ここから言えることは、set ができるような値は
        [sankaku_A setWritableValue : 500] ;
        NSLog(@"書き込み可能な値は、今は %d\n", sankaku_A.writableValue) ;
    }
    return 0;
}
