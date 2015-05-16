//
//  ViewController.m
//  BinaryLogicCal
//
//  Created by jewelz on 15/5/11.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController () {
   // NSString *_binarytitle;
    BOOL _isEndOperand;
}
@property (weak, nonatomic) IBOutlet UILabel *decimalLab;
@property (weak, nonatomic) IBOutlet UILabel *binaryLab;
@property (weak, nonatomic) IBOutlet UILabel *resultLab;
@property (strong, nonatomic) CalculatorBrain *calBrain;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (CalculatorBrain *)calBrain {
    if (!_calBrain) {
        _calBrain = [[CalculatorBrain alloc] init];
    }
    return _calBrain;
}



- (IBAction)numberInput:(UIButton *)sender {
    if (self.decimalLab.text.length > 18) return;
    
    NSString *input = sender.currentTitle;
    if (_isEndOperand) {
        self.decimalLab.text = [self.decimalLab.text stringByAppendingString:input];
    } else {
        self.decimalLab.text = input;
        _isEndOperand = YES;
    }
    
    if ([sender.titleLabel.text isEqualToString:@"C"]) {
        self.decimalLab.text = @"0";
        self.binaryLab.text = nil;
        _resultLab.text = @"0";
        _isEndOperand = NO;
        [_calBrain clear];
        return;
    }
   
        
}

- (IBAction)operationAction:(UIButton *)sender {
    if ([self.decimalLab.text isEqualToString:@"0"] && self.binaryLab.text.length == 0) return;
    
    self.binaryLab.text  = [self.calBrain number:self.decimalLab.text operator:sender.currentTitle];
    _isEndOperand = NO;
    _resultLab.text = self.calBrain.result;
    
}

@end
