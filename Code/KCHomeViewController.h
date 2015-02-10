//
//  LSTHomeViewController.h
//  List
//
//  Created by Kevin Coleman on 1/17/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCHomeViewController : UIViewController

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

@end
