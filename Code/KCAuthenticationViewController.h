//
//  LSTLoginViewController.h
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KCInputTableViewCell.h"
#import "KCAuthenticationTableViewFooter.h"

@class KCAuthenticationViewController;

@protocol KCAuthenticationViewControllerDelegate <NSObject>

- (void)authenticationViewContoller:(KCAuthenticationViewController *)authenticationViewController buttonTappedWithItems:(NSArray *)items;

@end

@interface KCAuthenticationViewController : UITableViewController

+ (instancetype)controllerWithAuthenticationItems:(NSArray *)items title:(NSString *)title;

@property (nonatomic, weak) id<KCAuthenticationViewControllerDelegate>authenticationDelegate;

@end
