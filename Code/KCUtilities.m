//
//  LSTUtilities.m
//  List
//
//  Created by Kevin Coleman on 11/21/14.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCUtilities.h"

NSString *const LSTListTitleKey = @"LSTListTitleKey";
NSString *const LSTListDescriptionKey = @"LSTListDescriptionKey";
NSString *const LSTListCreationDateKey = @"LSTListCreationDateKey";

CGFloat const LSTButtonCornerRadius = 4.0f;

CGSize LSTTextPlainSize(NSString *text, UIFont *font, CGFloat maxWidth)
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: font}
                                     context:nil];
    return rect.size;
}


UIFont *LALightObliqueFont(CGFloat size)
{
    return [UIFont fontWithName:@"Avenir-LightOblique" size:size];
}

UIFont *LALightFont(CGFloat size)
{
    return [UIFont fontWithName:@"Avenir-Light" size:size];
}

UIFont *LAMediumFont(CGFloat size)
{
    return [UIFont fontWithName:@"Avenir" size:size];
}

UIColor *LADarkGreenColor()
{
    return [UIColor colorWithRed:0/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:1.0];
}

UIColor *LANavyBlueColor()
{
    return [UIColor colorWithRed:6/255.0f green:21/255.0f blue:37.0f/255.0f alpha:1.0];
}

UIColor *LALightBlueColor()
{
    return [UIColor colorWithRed:220/255.0f green:236/255.0f blue:254.0f/255.0f alpha:1.0];
}

UIColor *LABlueColor()
{
    return [UIColor colorWithRed:53/255.0f green:123/255.0f blue:198.0f/255.0f alpha:1.0];
}

void LSTAlertView(NSError *error)
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}