//
//  LSTAuthenticationTableViewFooter.h
//  
//
//  Created by Kevin Coleman on 1/19/15.
//
//

#import <UIKit/UIKit.h>

@class KEVAuthenticationTableViewFooter;

@protocol LSTAuthenticationTableViewFooterDelegate <NSObject>

- (void)authenticationTableViewFooter:(KEVAuthenticationTableViewFooter *)authenticationTableViewFooter
           didTapAuthenticatoonButton:(UIButton *)authenticationbutton;

@end

@interface KEVAuthenticationTableViewFooter : UIView

+ (instancetype)authenticationTableViewFooterWithButtonTitle:(NSString *)buttonTitle;

@property (nonatomic) UIButton *authenticationButton;

@property (nonatomic, weak) id<LSTAuthenticationTableViewFooterDelegate> delegate;

@end
