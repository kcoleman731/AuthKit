//
//  LSTButton.m
//  List
//
//  Created by Kevin Coleman on 1/20/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//

#import "KEVButton.h"
#import "LSTUtilities.h"

CGFloat const LSTButtonCornerRadius = 4.0f;

@implementation KEVButton

+ (instancetype)buttonWithTitle:(NSString *)title backgroundColor:(UIColor *)color
{
    return [[self alloc] initWithTitle:title backgroundColor:color];
}

- (id)initWithTitle:(NSString *)title backgroundColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        NSDictionary *registerAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                             NSFontAttributeName :LAMediumFont(14)};
        NSAttributedString *registerString = [[NSAttributedString alloc] initWithString:title attributes:registerAttributes];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = color;
        self.layer.cornerRadius = LSTButtonCornerRadius;
        [self setAttributedTitle:registerString forState:UIControlStateNormal];
    }
    return self;
}
@end
