//
//  LSTInputTableViewCell.m
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCInputTableViewCell.h"
#import "KCUtilities.h"
#import "Canvas.h"

@interface KCInputTableViewCell () <UITextFieldDelegate>

@end

@implementation KCInputTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _textField = [[UITextField alloc] init];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
        _textField.delegate = self;
        [self.contentView addSubview:_textField];
        
        Canvas *canvas = [Canvas canvasWithSuperView:self.contentView];
        [canvas constrainView:_textField toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:20];
            [canvas constrainEdge:CanvasEdgeRight constant:-20];
            [canvas constrainCenter:CanvasCenterY constant:0];
        }];
    }
    return self;
}

- (void)setPlaceHolderAttributes:(NSDictionary *)placeHolderAttributes
{
    _placeHolderAttributes = placeHolderAttributes;
    NSAttributedString *placeholder = [[NSAttributedString alloc] initWithString:self.textField.placeholder attributes:placeHolderAttributes];
    [self.textField setAttributedPlaceholder:placeholder];
}

- (void)setTextFieldAttributes:(NSDictionary *)textFieldAttributes
{
    _textFieldAttributes = textFieldAttributes;
    self.textField.font = textFieldAttributes[NSFontAttributeName];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:NO];
    [self.textField setSelected:YES];
}

+ (NSString *)reuseIdentifier
{
    return @"LoginCell";
}

@end
