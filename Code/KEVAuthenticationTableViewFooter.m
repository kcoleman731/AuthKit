//
//  LSTAuthenticationTableViewFooter.m
//  
//
//  Created by Kevin Coleman on 1/19/15.
//
//

#import "KEVAuthenticationTableViewFooter.h"
#import "LSTUtilities.h"
#import "KEVButton.h"

@implementation KEVAuthenticationTableViewFooter

CGFloat const LSTHorizontalPadding = 12.0f;
CGFloat const LSTVerticalPadding = 24.0f;

+ (instancetype)authenticationTableViewFooterWithButtonTitle:(NSString *)buttonTitle
{
    return [[self alloc] initWithButtonTitle:buttonTitle];
}

- (id)initWithButtonTitle:(NSString *)buttonTitle
{
    self = [super init];
    if (self) {
        _authenticationButton = [KEVButton buttonWithTitle:buttonTitle backgroundColor:LABlueColor()];
        [_authenticationButton addTarget:self action:@selector(handleAuthenticationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_authenticationButton];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_authenticationButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:LSTHorizontalPadding]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_authenticationButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0f constant:-LSTHorizontalPadding]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_authenticationButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:LSTVerticalPadding]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_authenticationButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:48]];
    }
    return self;
}

- (void)handleAuthenticationButtonTap:(UIButton *)sender
{
    [self.delegate authenticationTableViewFooter:self didTapAuthenticatoonButton:self.authenticationButton];
}

@end
