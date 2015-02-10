//
//  LSTInputTableViewCell.h
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCInputTableViewCell : UITableViewCell

@property (nonatomic) UITextField *textField;

@property (nonatomic) NSDictionary *buttonAttributes UI_APPEARANCE_SELECTOR;

@property (nonatomic) NSDictionary *placeHolderAttributes UI_APPEARANCE_SELECTOR;

@property (nonatomic) NSDictionary *textFieldAttributes UI_APPEARANCE_SELECTOR;

+ (NSString *)reuseIdentifier;

@end
