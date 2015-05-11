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
    NSMutableArray *_input;
    CalculatorBrain *_calBrain;
    NSString *_binarytitle;
}
@property (weak, nonatomic) IBOutlet UILabel *decimalLab;

@property (weak, nonatomic) IBOutlet UILabel *binaryLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _input = [NSMutableArray array];
    
    _calBrain = [[CalculatorBrain alloc] init];
    
    
}


- (IBAction)numberInput:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"C"]) {
        self.decimalLab.text = @"0";
        self.binaryLab.text = @"0";
        [_input removeAllObjects];
        [_calBrain clear];
        return;
    }
    [_input addObject:sender.titleLabel.text];
    if (_input.count > 18) return;
    
    NSString *title = @"";
    for (NSString *str in _input) {
        title = [title stringByAppendingString:str];
    }
   
    self.decimalLab.text = title;
    _binarytitle = title;
     //NSLog(@"_binarytitle :%@", _binarytitle);
    
}

- (IBAction)operationAction:(UIButton *)sender {
    [_input removeAllObjects];
    self.binaryLab.text  = [_calBrain number:_binarytitle operation:sender.titleLabel.text];
    
   // [_calBrain calculateResult];
    
}
@end
