//
//  LSTHomeViewController.h
//  List
//
//  Created by Kevin Coleman on 1/17/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KCAuthenticationAction) {
    KCAuthenticationActionLogin,
    KCAuthenticationActionRegister,
};

@class KCHomeViewController;

@protocol KCHomeViewControllerDelegate <NSObject>

- (void)homeViewController:(KCHomeViewController *)homeViewController didAttemptAction:(KCAuthenticationAction)action withItems:(NSArray *)items;

- (NSArray *)homeViewController:(KCHomeViewController *)homeViewController itemsForAuthenticationType:(KCAuthenticationAction)authenticationAction;

@end

@interface KCHomeViewController : UIViewController

@property (nonatomic) id<KCHomeViewControllerDelegate> delegate;

@property (nonatomic) UIButton *loginButton;
@property (nonatomic) UIButton *registerButton;
@property (nonatomic) UIImage *backgroundImage;

@property (nonatomic) UIFont *titleLabelFont UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *titleLabelColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIFont *secondaryTitleLabelFont UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *secondaryTitleLabelColor UI_APPEARANCE_SELECTOR;

@property (nonatomic) UIFont *buttonLabelFont UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *loginButtonTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *loginButtonColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *registerButtonTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIColor *registerButtonColor UI_APPEARANCE_SELECTOR;

@property (nonatomic) CGFloat buttonHeight UI_APPEARANCE_SELECTOR;

@property (nonatomic) NSString *appTitle;
@property (nonatomic) NSString *appDescrition;

@end
