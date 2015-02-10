//
//  LSTAuthenticationTableViewFooter.h
//  
//
//  Created by Kevin Coleman on 1/19/15.
//
//

#import <UIKit/UIKit.h>

@class KCAuthenticationTableViewFooter;

@protocol LSTAuthenticationTableViewFooterDelegate <NSObject>

- (void)authenticationTableViewFooter:(KCAuthenticationTableViewFooter *)authenticationTableViewFooter
           didTapAuthenticatoonButton:(UIButton *)authenticationbutton;

@end

@interface KCAuthenticationTableViewFooter : UIView

+ (instancetype)authenticationTableViewFooterWithButtonTitle:(NSString *)buttonTitle;

@property (nonatomic) UIButton *authenticationButton;

@property (nonatomic, weak) id<LSTAuthenticationTableViewFooterDelegate> delegate;

@property (nonatomic) UIColor *buttonBackgroundColor;

@property (nonatomic) UIFont *buttonLabelFont;
@property (nonatomic) UIColor *buttonTextColor;

@end
