//
//  main.h
//  Chapter10SelfAndSuper
//
//  Created by Yokoe on 10/14/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#ifndef main_h
#define main_h

/* parentTestClass */
@interface ParentTestClass : NSObject
{
    @protected
    int _number ;
}
@end

@implementation ParentTestClass
+ (void) classMethod
{
    NSLog(@"親です。クラスメソッドが呼び出されました") ;
    return ;
}

- (void) instanceMethod
{
    NSLog(@"親です。インスタンスメソッドが呼び出されました %d", _number) ;
    return ;
}
@end

/* TestClass -> ParentTestClass */
@interface TestClass : ParentTestClass
@end

@implementation TestClass

// TestClass に関して、 デフォルトの init をオーバーライドする
- (id) init  // id は 動的な型付けを行う宣言（var みたいなもの） P.238
{
    // self = [super init] ; // ParentTestClass について、通常の initialize
    if(self = [super init])  // super init が正常に行われた時のみ、という推奨されている書き方☆
    {
        _number = 50 ;
    }
    
    return self ;
}

+ (void) classMethod
{
    NSLog(@"クラスメソッドが呼び出されました") ;
    return ;
}

- (void) instanceMethod
{
    NSLog(@"インスタンスメソッドが呼び出されました %d", _number) ;
    return ;
}

+ (void) callClassMethod
{
    [self classMethod] ;
    return ;
}

- (void) callInstanceMethod
{
    // [self classMethod] ;   // これはコンパイルエラーになる
    [TestClass classMethod] ; // これはOK
    [self instanceMethod] ;
    return ;
}

+ (void) callParentClassMethod
{
    [super classMethod] ;
    return ;
}

- (void) callParentInstanceMethod
{
    [ParentTestClass classMethod] ;
    [super instanceMethod] ;
    return ;
}

@end


#endif /* main_h */
