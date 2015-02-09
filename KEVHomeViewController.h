//
//  LSTHomeViewController.h
//  List
//
//  Created by Kevin Coleman on 1/17/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTListService.h"

@interface KEVHomeViewController : UIViewController

@property (nonatomic) UIImageView *backgroundImageView;
@property (nonatomic) LSTListService *listService;
@property (nonatomic) UIImage *backgroundImage;

@end
