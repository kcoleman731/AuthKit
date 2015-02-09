//
//  LSTHomeViewController.m
//  List
//
//  Created by Kevin Coleman on 1/17/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//

#import "KEVHomeViewController.h"
#import "KEVAuthenticationViewController.h"
#import "LSTUtilities.h"
#import "KEVButton.h"
#import "Canvas.h"

@interface KEVHomeViewController () <LSTAuthenticationViewControllerDelegate>

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *secondaryTitleLabel;
@property (nonatomic) UIButton *loginButton;
@property (nonatomic) UIButton *registerButton;

@end

@implementation KEVHomeViewController

CGFloat const LSTButtonHeight = 48;
CGFloat const LSTButtonVeriticalPadding = 32;
CGFloat const LSTButtonHorizontalPadding = 12;

- (id)init
{
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [UIColor darkGrayColor];
        
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImageView.alpha = 0.5;
        [self.view addSubview:self.backgroundImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.text = @"LIST";
        _titleLabel.font = LAMediumFont(64);
        _titleLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_titleLabel];
        
        Canvas *canvas = [Canvas canvasWithSuperView:self.view];
        [canvas constrainView:_titleLabel toCanvas:^(Canvas *canvas) {
            [canvas constrainCenter:CanvasCenterX constant:0.0];
            [canvas constrainEdge:CanvasEdgeTop constant:50.0f];
        }];
        
        _secondaryTitleLabel = [UILabel new];
        _secondaryTitleLabel.numberOfLines = 2;
        _secondaryTitleLabel.textAlignment = NSTextAlignmentCenter;
        _secondaryTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _secondaryTitleLabel.text = @"Helping you get things \ndone, faster";
        _secondaryTitleLabel.font = LALightObliqueFont(18);
        _secondaryTitleLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_secondaryTitleLabel];
        
        [canvas constrainView:_secondaryTitleLabel toCanvas:^(Canvas *canvas) {
            [canvas constrainCenter:CanvasCenterX constant:0.0f];
            [canvas subcanvasWithView:_titleLabel canvas:^(Canvas *subcanvas) {
                [subcanvas constrainView:_secondaryTitleLabel toCanvas:^(Canvas *canvas) {
                    [canvas constrainEdge:CanvasEdgeTop constant:100.0f];
                }];
            }];
        }];

        _loginButton = [KEVButton buttonWithTitle:@"LOGIN" backgroundColor:LABlueColor()];
        [_loginButton addTarget:self action:@selector(handleLoginButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        
        [canvas constrainView:_loginButton toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:LSTButtonHorizontalPadding];
            [canvas constrainEdge:CanvasEdgeBottom constant:-(LSTButtonHeight * 2)];
            [canvas constrainEdge:CanvasEdgeRight constant:-LSTButtonHorizontalPadding];
            [canvas constrainDimension:CanvasDimensionHeight constant:LSTButtonHeight];
        }];

        _registerButton = [KEVButton buttonWithTitle:@"REGISTER" backgroundColor:[UIColor clearColor]];
        _registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _registerButton.layer.borderWidth = 1.0f;
        [_registerButton addTarget:self action:@selector(handleRegisterButtonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registerButton];
        
        [canvas constrainView:_registerButton toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:LSTButtonHorizontalPadding];
            [canvas constrainEdge:CanvasEdgeBottom constant:-LSTButtonVeriticalPadding];
            [canvas constrainEdge:CanvasEdgeRight constant:-LSTButtonHorizontalPadding];
            [canvas constrainDimension:CanvasDimensionHeight constant:LSTButtonHeight];
        }];
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)handleLoginButtonTap:(UIButton *)sender
{
    [self presentAuthenticationViewControllerWithType:LSTAuthenticationTypeLogin];
}

- (void)handleRegisterButtonTap:(UIButton *)sender
{
    [self presentAuthenticationViewControllerWithType:LSTAuthenticationTypeRegister];
}

- (void)presentAuthenticationViewControllerWithType:(LSTAuthenticationType)type
{
    KEVAuthenticationViewController *controller = [KEVAuthenticationViewController controllerWithAuthenticationType:type];
    controller.authenticationDelegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Authentication View Controller Delegate Methods

- (void)authenticationViewContoller:(KEVAuthenticationViewController *)authenticationViewController loginButtonTappedWithCredentials:(NSDictionary *)credentials
{
    [self.listService loginUserWithEmail:credentials[LSTEmailCredential]
                                password:credentials[LSTPasswordCredential]
                              completion:^(BOOL success, NSError *error) {
                                  
                              }];
}

- (void)authenticationViewContoller:(KEVAuthenticationViewController *)authenticationViewController registrationButtonTappedWithCredentials:(NSDictionary *)credentials
{
    [self.listService registerUserWithEmail:credentials[LSTEmailCredential]
                                   password:credentials[LSTPasswordCredential]
                               confirmation:credentials[LSTPasswordCredential]
                                 completion:^(BOOL success, NSError *error) {
                                     ///
                                 }];
}

@end
