//
//  main.m
//  Chapter11Array3
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

/* Chapter 11-2 : P.345~
 * Array のソート機能、MutableArray を使った動的なメモリ確保、
 * 配列とクラスの関わり について学ぶ */

#import <Foundation/Foundation.h>

@interface Triangle : NSObject
@property int width, height ;
@end

@implementation Triangle
@synthesize width, height ;

- (id)initWithWidthAndHeight :(int)receiveWidth :(int)receiveHeight
{
    if([self init]){
        width  = receiveWidth ;
        height = receiveHeight ;
    }
    return self;
}

- (float) computeSize
{
    return ( (float)width * (float)height / 2 ) ;
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSMutableArray *triangleArray = [[NSMutableArray alloc] init] ;
        
        // 試しに、とんでもないわかりにくいコードにはなるが、
        // [ "三角形A", Object(Triangle) ] という形の配列を、
        // triangleArray に push してみる
        [ triangleArray addObjectsFromArray:
         [[NSArray alloc] initWithObjects:
          @"三角形A", [[Triangle alloc] init], nil] ] ;
        [[ triangleArray objectAtIndex:1] setWidth:32 ] ;
        [[ triangleArray objectAtIndex:1] setHeight:50 ] ;
        
        [ triangleArray addObjectsFromArray:
         [[NSArray alloc] initWithObjects:
          @"三角形B", [[Triangle alloc] initWithWidthAndHeight :12 :24], nil] ] ;
   
        // 多次元になるように入れたつもりだったが、結局は [0]~[1], [2]~[3] のような形で入ってしまった。
        NSLog(@"%@\n", [triangleArray objectAtIndex:0] ) ;
        NSLog(@"%@\n", [triangleArray objectAtIndex:1] ) ;
        NSLog(@"%@ の底辺は %d\n", [triangleArray objectAtIndex:0], [[triangleArray objectAtIndex:1] width] ) ;
        NSLog(@"高さは %d\n", [[triangleArray objectAtIndex:1] height] ) ;
        NSLog(@"面積は %.1f\n", [[triangleArray objectAtIndex:1] computeSize] ) ;

        NSLog(@"%@ の底辺は %d\n", [triangleArray objectAtIndex:2], [[triangleArray objectAtIndex:3] width] ) ;
        NSLog(@"高さは %d\n", [[triangleArray objectAtIndex:3] height] ) ;
        NSLog(@"面積は %.1f\n", [[triangleArray objectAtIndex:3] computeSize] ) ;
        
        // [三角形A, 三角形B, ObjectA, ObjectB] となるように並び替えてみる
        [triangleArray exchangeObjectAtIndex:1 withObjectAtIndex:2] ;
        
        [triangleArray addObject:@"Bad Boy"] ;
        NSLog(@"I'm %@ !! \n", [triangleArray objectAtIndex:( (int)[triangleArray count] - 1 ) ]) ;
        // ( (int)[triangleArray count] - 1 ) = 4 である。（新しく加えた、5番目に当たる要素）
        
        [triangleArray removeLastObject] ; // その5番目の要素を削除する
        NSLog(@"要素の数は %d \n", (int)[triangleArray count]) ;
        
        // 高さを低い順に並び替えたい
        NSMutableArray *trimmedArray = [NSMutableArray arrayWithArray:triangleArray] ;
        // 配列をコピーするには arrayWithArray を使えばいいのか。わりと簡単。
        [trimmedArray removeObjectsInRange :NSMakeRange(0, 2) ] ; // 0番目から 2つ削除
        NSLog(@"trimmedArray[0].height = %d\n", [[trimmedArray objectAtIndex :0] height] ) ;

        [trimmedArray addObject:@"Bad Boy"] ;  // trimmedArray にちゃんと要素を加えられるか確認
        NSLog(@"%@ came back !! \n", [trimmedArray objectAtIndex:( (int)[trimmedArray count] - 1 ) ]) ;
        [trimmedArray removeLastObject] ;
        // さよなら、Bad Boy...
    }
    return 0 ;
}
