//
//  CalculatorBrain.m
//  BinaryLogicCal
//
//  Created by jewelz on 15/5/11.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain() {
    NSMutableArray *_inputQueue;
    BOOL _isReturnOperation;
    NSMutableArray *_returnO;
}
@property (strong, nonatomic) NSMutableArray *operandStack;
@property (strong, nonatomic) NSMutableArray *operationQueue;
@end

@implementation CalculatorBrain

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inputQueue = [NSMutableArray array];
        _result = @"";
    }
    return self;
}

- (NSMutableArray *)operandStack{
    if (!_operandStack) {
        _operandStack = [NSMutableArray array];
    }
    return _operandStack;
}

- (NSMutableArray *)operationQueue{
    if (!_operationQueue) {
        _operationQueue = [NSMutableArray array];
    }
    return _operationQueue;
}


- (void)pushOperand:(NSInteger)operand {
    [self.operandStack addObject:@(operand)];
}

- (NSInteger)popOPerand {
    NSNumber *integerObj = [self.operandStack lastObject];
    if (integerObj) {
        [self.operandStack removeLastObject];
    }
    return [integerObj integerValue];
}

- (void)pushOperation:(NSString *)operation {
    [self.operationQueue addObject:operation];
}

- (NSString *)popOperation {
   NSString *opetation = [self.operationQueue firstObject];
    if (opetation) {
        [self.operationQueue removeObjectAtIndex:0];
    }
    return opetation;
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
    
    return result;
}

- (NSString *)number:(NSString *)number operator:(NSString *)operator {
    if (_isReturnOperation) {
        if (self.operationQueue.count == 0) {
            //operation after return;
            if ([self operationType:operator] != CBOperationTypeReturn) {
                number = _result;
                [_inputQueue removeAllObjects];
                [_inputQueue addObject:number];
                _isReturnOperation = NO;

            } else {
                return _result;
            }
        }
    } else {
        [self pushOperand:[number integerValue]];
        [_inputQueue addObject: [self turn10to2:number]];
    }
    
    //first operator is return
    if ([self operationType:operator] == CBOperationTypeReturn) {
        _isReturnOperation = YES;
        if (self.operandStack.count >= 1 && self.operationQueue.count==0) {
            _result = [self turn10to2:number];
            //[self.operandStack removeAllObjects];
            return [@" = " stringByAppendingString:_result];
        }
        
    } else {
        [self pushOperation:operator];
    }
    
    NSLog(@"输入栈中的数为： %@", self.operandStack);
    NSLog(@"符号队列中的数为： %@", self.operationQueue);
    
    if (self.operandStack.count > 1) {
        [self calculateResult];
    }
    
    NSString *op = [NSString stringWithFormat:@" %@ ", operator];
    [_inputQueue addObject:op];

    NSString *re = @"";
    for (NSString *str in _inputQueue) {
        re = [re stringByAppendingString:str];
    }
    
    // NSLog(@"result :%@ ", re);
    
    return re;
}


- (void)calculateResult {
    if (self.operationQueue.count > 0) {
        NSInteger result;
        
        CBOperationType operatorType = [self operationType:[self popOperation]];
        switch (operatorType) {
            case CBOperationTypeOr:
                result = [self popOPerand] | [self popOPerand];
                break;
            case CBOperationTypeAnd:
                result = [self popOPerand] & [self popOPerand];
                break;
            case CBOperationTypeXor:
                result = [self popOPerand] ^ [self popOPerand];
                break;
            default:
                break;
        }
        
        [self pushOperand:result];
        
        _result = [self turn10to2:[NSString stringWithFormat:@"%ld", result]];
    }
}


- (CBOperationType)operationType:(NSString *)operator {
    if ([operator isEqualToString:@"="]) {
        return CBOperationTypeReturn;
    } else if ([operator isEqualToString:@"|"]) {
        return CBOperationTypeOr;
    } else if ([operator isEqualToString:@"&"]) {
        return CBOperationTypeAnd;
    }else
        return CBOperationTypeXor;
}

- (void)clear {
    [_inputQueue removeAllObjects];
    [self.operandStack removeAllObjects];
    [self.operationQueue removeAllObjects];
    _result = nil;
    _isReturnOperation = NO;
}

@end
