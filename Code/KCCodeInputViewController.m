//
//  KCCodeInputViewController.m
//  KEVAuthSample
//
//  Created by Kevin Coleman on 2/9/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCCodeInputViewController.h"
#import "KCCodeInputView.h"
#import "Canvas.h"

@interface KCCodeInputViewController () <UITextFieldDelegate>

@property (nonatomic) KCCodeInputView *inputView;

@end

@implementation KCCodeInputViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.inputView = [[KCCodeInputView alloc] init];
    self.inputView.translatesAutoresizingMaskIntoConstraints = NO;
    self.inputView.textField1.delegate = self;
    self.inputView.textField2.delegate = self;
    self.inputView.textField3.delegate = self;
    self.inputView.textField4.delegate = self;
    [self.view addSubview:self.inputView];
    
    Canvas *canvas = [Canvas canvasWithSuperView:self.view];
    [canvas constrainView:self.inputView toCanvas:^(Canvas *canvas) {
        [canvas constrainEdge:CanvasEdgeLeft constant:0];
        [canvas constrainEdge:CanvasEdgeRight constant:0];
        [canvas constrainEdge:CanvasEdgeTop constant:100];
        [canvas constrainDimension:CanvasDimensionHeight constant:100];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
}

- (void)textFieldDidChange:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    if (!textField.text.length) return;
    switch (textField.tag) {
        case 1:
            [self.inputView.textField2 becomeFirstResponder];
            break;
        case 2:
            [self.inputView.textField3 becomeFirstResponder];
            break;
        case 3:
            [self.inputView.textField4 becomeFirstResponder];
            break;
        case 4:
            [self.inputView.textField1 becomeFirstResponder];
            break;
        default:
            break;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    return YES;
}

@end
