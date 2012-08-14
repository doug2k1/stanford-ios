//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Douglas Matoso on 8/7/12.
//  Copyright (c) 2012 Douglas Matoso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (void)clearStack;
@end
