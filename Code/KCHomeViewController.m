//
//  LSTHomeViewController.m
//  List
//
//  Created by Kevin Coleman on 1/17/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCHomeViewController.h"
#import "KCAuthenticationViewController.h"
#import "KCUtilities.h"
#import "Canvas.h"
#import "KCAuthenticationItem.h"
#import "KCCodeInputView.h"

@interface KCHomeViewController () <KCAuthenticationViewControllerDelegate>

@property (nonatomic) UIImageView *backgroundImageView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UILabel *secondaryTitleLabel;
@property (nonatomic) UIButton *loginButton;
@property (nonatomic) UIButton *registerButton;

@end

@implementation KCHomeViewController

CGFloat const LSTButtonHeight = 48;
CGFloat const LSTButtonVeriticalPadding = 32;
CGFloat const LSTButtonHorizontalPadding = 12;

- (id)init
{
    self = [super init];
    if (self) {
        _titleLabelFont = LAMediumFont(64);
        _titleLabelColor = [UIColor whiteColor];
        
        _secondaryTitleLabelFont = LALightObliqueFont(18);
        _secondaryTitleLabelColor = [UIColor whiteColor];
        
        _buttonLabelFont = LAMediumFont(14);
        _loginButtonTextColor = [UIColor whiteColor];
        _loginButtonColor = LABlueColor();
        _registerButtonTextColor = [UIColor whiteColor];
        _registerButtonColor = [UIColor clearColor];
        
        _buttonHeight = LSTButtonHeight;
        [self configureUserInterfaceAttributes];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.alpha = 0.5;
    [self.view addSubview:self.backgroundImageView];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"LIST";
    self.titleLabel.font = self.titleLabelFont;
    self.titleLabel.textColor = self.titleLabelColor;
    [self.view addSubview:self.titleLabel];
    
    Canvas *canvas = [Canvas canvasWithSuperView:self.view];
    [canvas constrainView:self.titleLabel toCanvas:^(Canvas *canvas) {
        [canvas constrainCenter:CanvasCenterX constant:0.0];
        [canvas constrainEdge:CanvasEdgeTop constant:100];
    }];
    
    self.secondaryTitleLabel = [UILabel new];
    self.secondaryTitleLabel.numberOfLines = 2;
    self.secondaryTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.secondaryTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondaryTitleLabel.text = @"Helping you get things \ndone, faster";
    self.secondaryTitleLabel.font = self.secondaryTitleLabelFont;
    self.secondaryTitleLabel.textColor = self.secondaryTitleLabelColor;
    [self.view addSubview:self.secondaryTitleLabel];
    
    [canvas constrainView:self.secondaryTitleLabel toCanvas:^(Canvas *canvas) {
        [canvas constrainCenter:CanvasCenterX constant:0.0f];
        [canvas subcanvasWithView:self.titleLabel canvas:^(Canvas *subcanvas) {
            [subcanvas constrainView:self.secondaryTitleLabel toCanvas:^(Canvas *canvas) {
                [canvas constrainEdge:CanvasEdgeTop constant:100.0f];
            }];
        }];
    }];
    
    self.loginButton = [UIButton new];
    self.loginButton.backgroundColor = self.loginButtonColor;
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginButton.layer.cornerRadius = LSTButtonCornerRadius;
    NSAttributedString *loginString = [[NSAttributedString alloc] initWithString:@"LOGIN" attributes:@{NSForegroundColorAttributeName : self.loginButtonTextColor,
                                                                                                       NSFontAttributeName : self.buttonLabelFont}];
    [self.loginButton setAttributedTitle:loginString forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(handleLoginButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    [canvas constrainView:self.loginButton toCanvas:^(Canvas *canvas) {
        [canvas constrainEdge:CanvasEdgeLeft constant:LSTButtonHorizontalPadding];
        [canvas constrainEdge:CanvasEdgeBottom constant:-(LSTButtonHeight * 2)];
        [canvas constrainEdge:CanvasEdgeRight constant:-LSTButtonHorizontalPadding];
        [canvas constrainDimension:CanvasDimensionHeight constant:LSTButtonHeight];
    }];
    
    self.registerButton = [UIButton new];
    self.registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerButton.layer.borderWidth = 1.0f;
    self.registerButton.backgroundColor = self.registerButtonColor;
    self.registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.registerButton.layer.cornerRadius = LSTButtonCornerRadius;
    NSAttributedString *registerString = [[NSAttributedString alloc] initWithString:@"REGISTER" attributes:@{NSForegroundColorAttributeName : self.registerButtonTextColor,
                                                                                                       NSFontAttributeName : self.buttonLabelFont}];
    [self.registerButton setAttributedTitle:registerString forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(handleRegisterButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
    [canvas constrainView:self.registerButton toCanvas:^(Canvas *canvas) {
        [canvas constrainEdge:CanvasEdgeLeft constant:LSTButtonHorizontalPadding];
        [canvas constrainEdge:CanvasEdgeBottom constant:-LSTButtonVeriticalPadding];
        [canvas constrainEdge:CanvasEdgeRight constant:-LSTButtonHorizontalPadding];
        [canvas constrainDimension:CanvasDimensionHeight constant:LSTButtonHeight];
    }];
    
    KCCodeInputView *view = [KCCodeInputView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    [canvas constrainView:view toCanvas:^(Canvas *canvas) {
        [canvas constrainEdge:CanvasEdgeLeft constant:0];
        [canvas constrainEdge:CanvasEdgeRight constant:0];
        [canvas constrainEdge:CanvasEdgeTop constant:0];
        [canvas constrainDimension:CanvasDimensionHeight constant:200];
    }];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)handleLoginButtonTap:(UIButton *)sender
{
    KCAuthenticationItem *emailItem = [KCAuthenticationItem new];
    emailItem.placeholder = @"Email";
    emailItem.iconImage = nil;
    
    KCAuthenticationItem *passwordItem = [KCAuthenticationItem new];
    passwordItem.placeholder = @"Password";
    passwordItem.iconImage = nil;
    
    [self presentAuthenticationViewControllerWithItems:@[emailItem, passwordItem] title:@"Login"];
}

- (void)handleRegisterButtonTap:(UIButton *)sender
{
    KCAuthenticationItem *emailItem = [KCAuthenticationItem new];
    emailItem.placeholder = @"Email";
    emailItem.iconImage = nil;
    
    KCAuthenticationItem *passwordItem = [KCAuthenticationItem new];
    passwordItem.placeholder = @"Password";
    passwordItem.iconImage = nil;
    
    KCAuthenticationItem *confirmationItem = [KCAuthenticationItem new];
    confirmationItem.placeholder = @"Password";
    confirmationItem.iconImage = nil;
    
    [self presentAuthenticationViewControllerWithItems:@[emailItem, passwordItem, confirmationItem] title:@"Register"];
}

- (void)presentAuthenticationViewControllerWithItems:(NSArray *)items title:(NSString *)title
{
    KCAuthenticationViewController *controller = [KCAuthenticationViewController controllerWithAuthenticationItems:items title:title];
    controller.authenticationDelegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Authentication View Controller Delegate Methods

- (void)authenticationViewContoller:(KCAuthenticationViewController *)authenticationViewController loginButtonTappedWithCredentials:(NSDictionary *)credentials
{

}

- (void)authenticationViewContoller:(KCAuthenticationViewController *)authenticationViewController registrationButtonTappedWithCredentials:(NSDictionary *)credentials
{

}

- (void)configureUserInterfaceAttributes
{
    NSDictionary *testAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor],
                                     NSFontAttributeName : LALightFont(15)};
    [[KCInputTableViewCell appearance] setTextFieldAttributes:testAttributes];
    
    NSDictionary *placeholderAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor],
                                            NSFontAttributeName : LALightFont(15)};
    [[KCInputTableViewCell appearance] setPlaceHolderAttributes:placeholderAttributes];
    
    [[UIButton appearance] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: LAMediumFont(16),
                                                           NSForegroundColorAttributeName: LABlueColor()}];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                       forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:@{NSFontAttributeName : LALightFont(16),
                                                                                                       NSForegroundColorAttributeName : LABlueColor()}
                                                                                            forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor whiteColor]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end
