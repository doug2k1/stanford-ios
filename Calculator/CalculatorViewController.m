//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Douglas Matoso on 8/6/12.
//  Copyright (c) 2012 Douglas Matoso. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL isEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

- (CalculatorBrain *)brain {
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
}

- (void)appendStackDisplay:(NSString *)text {
    self.stackDisplay.text = [NSString stringWithFormat:@"%@ %@", self.stackDisplay.text, text];
}

- (void)clearDisplays {
    self.display.text = @"0";
    self.stackDisplay.text = @"";
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    
    if ([digit isEqualToString:@"."]
        && [self.display.text rangeOfString:@"."].location != NSNotFound) {
        digit = @"";
    }
    
    if (self.isEnteringNumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.isEnteringNumber = YES;
    }
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    [self appendStackDisplay:self.display.text];
    self.isEnteringNumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.isEnteringNumber) [self enterPressed];
    
    NSString *operation = sender.currentTitle;
    [self appendStackDisplay:operation];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    //[self appendStackDisplay:[NSString stringWithFormat:@"=%g", result]];
}

- (IBAction)clearPressed {
    [self clearDisplays];
    [self.brain clearStack];
    self.isEnteringNumber = NO;
}

@end
