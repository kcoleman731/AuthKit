//
//  KCAuthenticationItem.h
//  Pods
//
//  Created by Kevin Coleman on 2/16/15.
//
//

#import <Foundation/Foundation.h>
#import "KCInputTableViewCell.h"

@interface KCAuthenticationItem : NSObject

@property (nonatomic) NSString *placeholder;

@property (nonatomic) UIImage *iconImage;

@property (nonatomic) NSString *credential;

@property (nonatomic) KCInputTableViewCell *cell;

@end
