//
//  main.m
//  Chapter14FileWriting
//
//  Created by Yokoe on 10/16/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* P.416~ : ファイル・フォルダの書き込みについて */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        static const int MAX_FILE_QUANTITY = 3 ; // 作っていいファイル数の最大を決める
        NSMutableString *writeString = [[NSMutableString alloc] initWithString:@"Hello!!\nI am Objective-C!!"] ;
        NSException *FileQuantityException = [[NSException alloc] initWithName:@"FileQuantityError" reason:[NSString stringWithFormat:@"%d個より多くoutputファイルは作れません", MAX_FILE_QUANTITY] userInfo:nil ] ;
        NSMutableString *writingPath = [[NSMutableString alloc] initWithString:@"" ] ;
        
        int i ;
        for(i = 1; i <= MAX_FILE_QUANTITY; )
        {  // ファイルが書き込めず、移動処理も行えない時のみ ++i する
            @try
            {
                if(i > MAX_FILE_QUANTITY){
                    @throw FileQuantityException ;
                }
                
                /* 書き込むパスを設定、すでにファイルがあれば書き込まない */
                [ [[NSFileManager alloc] init]
                 createDirectoryAtPath:[@"~/Documents/test_Folder" stringByExpandingTildeInPath]
                 withIntermediateDirectories:YES
                 attributes:nil
                 error:nil ] ;
                [writingPath setString:[ NSString stringWithFormat : @"~/Documents/test_Folder/output%d.txt", i ] ] ;

                /* stringByExpandingTildeInPath を忘れてしまうと、
                 * ~ (チルダ)などの特殊指定を用いたディレクトリと認識してくれなくなるので
                 * 正しく動かなくなる。忘れやすいので超注意！！！！！ */
                if( [ [[NSFileManager alloc] init]
                     fileExistsAtPath:[writingPath stringByExpandingTildeInPath] ] )
                {
                    NSLog(@"%d 番目のファイルはすでに存在します、書き込まずに移動します", i ) ;
                    /* test_Chapter14 ディレクトリを作り、そこにすでにあるファイルを移動する */
                    [ [[NSFileManager alloc] init]
                     createDirectoryAtPath:[NSString stringWithFormat:@"%@/test_Chapter14", [[writingPath stringByExpandingTildeInPath] stringByDeletingLastPathComponent]]
                     withIntermediateDirectories:YES
                     attributes:nil
                     error:nil ] ;
                    if( [[[NSFileManager alloc] init]
                     moveItemAtPath:[writingPath stringByExpandingTildeInPath]
                     toPath:[ [NSString stringWithFormat:@"%@/test_Chapter14/%@",
                               [ [writingPath stringByExpandingTildeInPath] stringByDeletingLastPathComponent], [writingPath lastPathComponent] ] stringByExpandingTildeInPath ]
                     // withInternalDirectories :YES // ここでは使えない
                     error:nil] )
                    {
                        NSLog(@"移動処理が完了しました") ;
                        [writeString appendString:@"\n＜あいつは俺が移動させた＞"] ;
                        /* i の値を変えずに for 文の最初に戻り、 output[i].txt を Documents 下に書き込む */
                    }
                    else
                    {
                        NSLog(@"移動処理は行えませんでした") ;
                        ++i ;
                    }
                }
                else
                {
                    [writeString
                     writeToFile:[writingPath stringByExpandingTildeInPath]
                     atomically:YES
                     // withIntermediateDirectories:YES // ここでは使えない
                     encoding:NSUTF8StringEncoding
                     error:nil] ;
                    NSLog(@"%@ ファイルを書き込みました", [writingPath lastPathComponent] ) ;
                    return 1 ;
                }
            }
            @catch (NSException *exception)
            {
                NSLog(@"Error! : %@\n", exception.reason) ;
                return -1 ;
            }
        }
        
        /* なんにも行えない時、ファイルの読み込み操作を行う */
        NSLog(@"%@ の読み込みを行います", writingPath) ;
        NSString *readString = [ [NSString alloc]
                                initWithContentsOfFile:[writingPath stringByExpandingTildeInPath]
                                encoding:NSUTF8StringEncoding
                                error:nil ] ;
        NSLog(@"%@ の中身は、\n%@", [writingPath lastPathComponent], readString ) ;
        
        /* readString を 行ごとに分割して配列に入れる */
        NSArray *oneStringArray = [readString componentsSeparatedByString:@"\n"] ;
        
        NSLog(@"2 行目に書かれているメッセージは \"%@\" です。\n", [oneStringArray objectAtIndex:1]) ;
   }
    return 0 ;
}
