//
//  main.m
//  Chapter10DateAndCalendar
//
//  Created by Yokoe on 10/15/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        unsigned int unitNumber[10] ;
        unitNumber[0] = NSCalendarUnitEra ;  // 2 : 10
        unitNumber[1] = NSCalendarUnitEra | NSCalendarUnitYear ;  // 6 : 110
        unitNumber[2] = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth ;  // 14 : 1110
        unitNumber[3] = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;  // 30 : 11110
        unitNumber[4] = NSCalendarUnitDay ; // 16 : 10000
        
        /* ここから想像するに、unitNumbers には、どの値が格納されたかのスイッチが、2 進数として入れられる */
        
        int i ;
        for(i = 0; i < 5; ++i)
        {
            NSLog(@"%u\n", unitNumber[i]) ;
        }
        
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierJapanese] ;
        unsigned int calenderFlags =
        	NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday ;
        NSDate *date = [[NSDate alloc] init] ;
        
        NSDateComponents *dateComponents = [ calendar components:calenderFlags fromDate:date ] ;
        
        switch (dateComponents.era)
        {
            case 233:
                NSLog(@"大正 ") ;
                break;
            case 234:
                NSLog(@"昭和") ;
                break;
            case 235:
                NSLog(@"平成") ;
                break;
                
            default:
                NSLog(@"指定された年の年号は、データにありません") ;
                break;
        }
        
        NSLog(@"%ld 年の %ld 月 %ld 日 が今日です。", dateComponents.year, dateComponents.month, dateComponents.day ) ;
        
    }
    return 0;
}
