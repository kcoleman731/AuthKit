//
//  KCCodeInputView.m
//  KEVAuthSample
//
//  Created by Kevin Coleman on 2/9/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCCodeInputView.h"
#import "Canvas.h"

@interface KCCodeInputView ()

@end

@implementation KCCodeInputView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        Canvas *canvas = [Canvas canvasWithSuperView:self];
        
        _textField1 = [self newTextFeild];
        _textField1.tag = 1;
        [canvas constrainView:_textField1 toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:50];
            [canvas constrainEdge:CanvasEdgeTop constant:0];
            [canvas constrainDimension:CanvasDimensionHeight constant:75];
            [canvas constrainDimension:CanvasDimensionWidth constant:50];
        }];
        
        _textField2 = [self newTextFeild];
        _textField2.tag = 2;
        [canvas constrainView:_textField2 toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:125];
            [canvas constrainEdge:CanvasEdgeTop constant:0];
            [canvas constrainDimension:CanvasDimensionHeight constant:75];
            [canvas constrainDimension:CanvasDimensionWidth constant:50];
        }];
        
        _textField3 = [self newTextFeild];
        _textField3.tag = 3;
        [canvas constrainView:_textField3 toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:200];
            [canvas constrainEdge:CanvasEdgeTop constant:0];
            [canvas constrainDimension:CanvasDimensionHeight constant:75];
            [canvas constrainDimension:CanvasDimensionWidth constant:50];
        }];
        
        _textField4 = [self newTextFeild];
        _textField4.tag = 4;
        [canvas constrainView:_textField4 toCanvas:^(Canvas *canvas) {
            [canvas constrainEdge:CanvasEdgeLeft constant:275];
            [canvas constrainEdge:CanvasEdgeTop constant:0];
            [canvas constrainDimension:CanvasDimensionHeight constant:75];
            [canvas constrainDimension:CanvasDimensionWidth constant:50];
        }];
    }
    return self;
}

- (UITextField *)newTextFeild
{
    UITextField *textFeild = [UITextField new];
    textFeild.translatesAutoresizingMaskIntoConstraints = NO;
    textFeild.layer.cornerRadius = 4;
    textFeild.layer.borderWidth = 1;
    textFeild.layer.borderColor = [UIColor blackColor].CGColor;
    textFeild.textAlignment = NSTextAlignmentCenter;
    textFeild.font = [UIFont systemFontOfSize:40];
    textFeild.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:textFeild];
    return textFeild;
}


@end
