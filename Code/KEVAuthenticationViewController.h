//
//  LSTLoginViewController.h
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTListService.h"
#import "LSTInputTableViewCell.h"
#import "LSTAuthenticationTableViewHeader.h"
#import "KEVAuthenticationTableViewFooter.h"

typedef NS_ENUM(NSInteger, LSTAuthenticationType) {
    LSTAuthenticationTypeRegister,
    LSTAuthenticationTypeLogin
};

extern NSString *const LSTEmailCredential;
extern NSString *const LSTPasswordCredential;
extern NSString *const LSTConfirmationCredential;

@class KEVAuthenticationViewController;

@protocol LSTAuthenticationViewControllerDelegate <NSObject>

- (void)authenticationViewContoller:(KEVAuthenticationViewController *)authenticationViewController loginButtonTappedWithCredentials:(NSDictionary *)credentials;

- (void)authenticationViewContoller:(KEVAuthenticationViewController *)authenticationViewController registrationButtonTappedWithCredentials:(NSDictionary *)credentials;

@end

@interface KEVAuthenticationViewController : UITableViewController

+ (instancetype)controllerWithAuthenticationType:(LSTAuthenticationType)authenticationType;

@property (nonatomic) LSTListService *listService;

@property (nonatomic, readonly) LSTAuthenticationType authenticationType;

@property (nonatomic, weak) id<LSTAuthenticationViewControllerDelegate>authenticationDelegate;

@end
