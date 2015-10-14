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

/* @property : このように簡略化して private 変数を作れる */
@property(readonly) int _secretValue ;
@property int _writableValue ;

@end


@implementation Sankaku
/* @synthesize : こう書くことで、アクセッサメソッドが自動的に作られる */
@synthesize _secretValue, _writableValue ;


- (void) setTriangle : (int) width : (int) height
{
    if(width > 0 && height > 0){
        _width = width ;
        _height = height ;
    }
    _secretValue = 500 ;
    _writableValue = 1200 ;
    return ;
}

- (int) getWidth  { return _width  ; }
- (int) getHeight { return _height ; }

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
        
        NSLog(@"秘密の値は %d\n", sankaku_A._secretValue) ;
        NSLog(@"書き込み可能な値は、今は %d\n", sankaku_A._writableValue) ;
        
        // ここから言えることは、set ができるような値は
        [sankaku_A set_writableValue : 50] ;
        NSLog(@"書き込み可能な値は、今は %d\n", sankaku_A._writableValue) ;
    }
    return 0;
}
