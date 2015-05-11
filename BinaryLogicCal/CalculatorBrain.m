//
//  CalculatorBrain.m
//  BinaryLogicCal
//
//  Created by jewelz on 15/5/11.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain() {
    //NSMutableArray *_result;
    NSMutableArray *_inputQueue;
    //NSString *_finalAnswer;
   // NSString *_showAnswer;
    NSMutableArray *_inputNumber;
}
@end

@implementation CalculatorBrain

- (instancetype)init
{
    self = [super init];
    if (self) {
        //_result = [NSMutableArray array];
        _inputQueue = [NSMutableArray array];
        //_inputNumber = [NSMutableArray array];
        //_finalAnswer = @"";
        //_showAnswer = @"";
    }
    return self;
}

- (NSString *) turn10to2:(NSString *)str{
    int num = [str intValue];
    
    NSMutableString * result = [[NSMutableString alloc]init];
    while (num > 0) {
        NSString * reminder = [NSString stringWithFormat:@"%d",num % 2];
        [result insertString:reminder atIndex:0];
        num = num / 2;
    }
    if (num == 0) {
        [result insertString:[NSString stringWithFormat:@"%d",num] atIndex:0];
    }
    [_inputQueue addObject:result];
    NSLog(@"input: %@", result);
    return result;
}

//- (void)binaryCal:(NSString *)input {
//    NSInteger aInterger = [input integerValue];
//    NSInteger quotient = aInterger / 2;
//    NSInteger remainder = aInterger % 2;
//
//    [_result addObject:@(remainder)];
//    
//   // NSLog(@"result: %@", _result);
//    
//    
//    if (quotient != 0) {
//        [self binaryCal:[NSString stringWithFormat:@"%d", quotient]];
//    }
//    //[_result removeAllObjects];
//}
//
//- (void)finalAnswer:(NSString *)input {
//    [self binaryCal:input];
//    
//    __block NSString *title = @"";
//    [_result enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        title = [NSString stringWithFormat:@"%@", obj];
//        //NSLog(@"string :%@ ", title);
//        _finalAnswer = [_finalAnswer stringByAppendingString:title];
//    }];
//    [_inputQueue addObject:_finalAnswer];
//    //NSLog(@"_finalAnswer: %@", _finalAnswer);
//    [_result removeAllObjects];
//    
//}

- (NSString *)number:(NSString *)number operation:(NSString *)operation {
    
    [_inputNumber addObject:@([number integerValue])];
    NSLog(@"输入的数： %@", _inputNumber);
    
//    if ([operation integerValue] == 0) {
//        [_result removeAllObjects];
//        //[_inputQueue removeAllObjects];
//        _finalAnswer = @"";
//    }
    //[self binaryCal:number];
    //[self finalAnswer:number];
    [self turn10to2:number];
    [_inputQueue addObject:@" "];
    [_inputQueue addObject:operation];
     [_inputQueue addObject:@" "];

    NSString *re = @"";
    for (NSString *str in _inputQueue) {
        //NSLog(@"---%@", str);
        re = [re stringByAppendingString:str];
    }
     NSLog(@"结果 :%@ ", re);
    return re;
}

//- (void)calculateResult {
//    if (_inputNumber.count < 2) return;
//    
//    [_result removeAllObjects];
//        //[_inputQueue removeAllObjects];
//    _finalAnswer = @"";
//    
//    int a = 8;
//    int b = 1;
//    int r = a | b;
//    
//    //[self finalAnswer:[NSString stringWithFormat:@"%d", r]];
//    NSLog(@"finalAnswer: %@",[self turn10to2:[NSString stringWithFormat:@"%d", r]]);
//}

- (void)clear {
    [_inputQueue removeAllObjects];
}

@end
