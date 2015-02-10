//
//  LSTUtilities.h
//  List
//
//  Created by Kevin Coleman on 11/21/14.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NSString *const LSTListTitleKey;
NSString *const LSTListDescriptionKey;
NSString *const LSTListCreationDateKey;

extern CGFloat const LSTButtonCornerRadius;

CGSize LSTTextPlainSize(NSString *text, UIFont *font, CGFloat maxWidth);

UIFont *LALightObliqueFont(CGFloat size);

UIFont *LALightFont(CGFloat size);

UIFont *LAMediumFont(CGFloat size);

UIColor *LADarkGreenColor();

UIColor *LANavyBlueColor();

UIColor *LALightBlueColor();

UIColor *LABlueColor();

void LSTAlertView(NSError *error);