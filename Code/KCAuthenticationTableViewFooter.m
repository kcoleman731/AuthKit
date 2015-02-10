//
//  LSTAuthenticationTableViewFooter.m
//  
//
//  Created by Kevin Coleman on 1/19/15.
//
//

#import "KCAuthenticationTableViewFooter.h"
#import "KCUtilities.h"
#import "Canvas.h"

@implementation KCAuthenticationTableViewFooter

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
        _buttonBackgroundColor = LABlueColor();
        _buttonLabelFont = LALightFont(18);
        _buttonTextColor = [UIColor whiteColor];
        
        _authenticationButton = [UIButton new];
        _authenticationButton.translatesAutoresizingMaskIntoConstraints = NO;
        _authenticationButton.layer.cornerRadius = LSTButtonCornerRadius;
        _authenticationButton.backgroundColor = _buttonBackgroundColor;
        NSAttributedString *buttonString = [[NSAttributedString alloc] initWithString:buttonTitle attributes:@{NSForegroundColorAttributeName : _buttonTextColor,
                                                                                                               NSFontAttributeName : _buttonLabelFont}];
        [_authenticationButton setAttributedTitle:buttonString forState:UIControlStateNormal];
        [_authenticationButton addTarget:self action:@selector(handleAuthenticationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_authenticationButton];
        
        Canvas *canvas = [Canvas canvasWithSuperView:self];
        [canvas constrainView:_authenticationButton toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeTop constant:LSTVerticalPadding];
            [canvas constrainEdge:CanvasEdgeLeft constant:LSTHorizontalPadding];
            [canvas constrainEdge:CanvasEdgeRight constant:-LSTHorizontalPadding];
            [canvas constrainDimension:CanvasDimensionHeight constant:48];
        }];
    }
    return self;
}

- (void)handleAuthenticationButtonTap:(UIButton *)sender
{
    [self.delegate authenticationTableViewFooter:self didTapAuthenticatoonButton:self.authenticationButton];
}

@end
