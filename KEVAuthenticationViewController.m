//
//  LSTLoginViewController.m
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Layer. All rights reserved.
//

#import "KEVAuthenticationViewController.h"
#import "LSTInputTableViewCell.h"

@interface KEVAuthenticationViewController () <LSTAuthenticationTableViewFooterDelegate>

@property (nonatomic, readwrite) LSTAuthenticationType authenticationType;
@property (nonatomic) UITextField *emailTextField;
@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) UITextField *confirmationTextField;

@end

@implementation KEVAuthenticationViewController

NSString *const LSTEmailCredential = @"LSTEmailCredential";
NSString *const LSTPasswordCredential = @"LSTPasswordCredential";
NSString *const LSTConfirmationCredential = @"LSTConfirmationCredential";

+ (instancetype)controllerWithAuthenticationType:(LSTAuthenticationType)authenticationType
{
    return [[self alloc] initWithAuthenticationType:authenticationType];
}

- (id)initWithAuthenticationType:(LSTAuthenticationType)authenticationType
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _authenticationType = authenticationType;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[LSTInputTableViewCell class] forCellReuseIdentifier:[LSTInputTableViewCell reuseIdentifier]];
    switch (self.authenticationType) {
        case LSTAuthenticationTypeRegister:
            self.title = @"REGISTER";
            break;
        case LSTAuthenticationTypeLogin:
            self.title = @"LOGIN";
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

# pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [LSTAuthenticationTableViewHeader new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.authenticationType) {
        case LSTAuthenticationTypeRegister:
            return 3;

        case LSTAuthenticationTypeLogin:
            return 2;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    KEVAuthenticationTableViewFooter *footer;
    switch (self.authenticationType) {
        case LSTAuthenticationTypeRegister:
            footer = [KEVAuthenticationTableViewFooter authenticationTableViewFooterWithButtonTitle:@"REGISTER"];
            break;
            
        case LSTAuthenticationTypeLogin:
            footer = [KEVAuthenticationTableViewFooter authenticationTableViewFooterWithButtonTitle:@"LOGIN"];
            break;
    }
    footer.delegate = self;
    return footer;
}

# pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSTInputTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[LSTInputTableViewCell reuseIdentifier]];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(LSTInputTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            cell.textField.placeholder = @"Email";
            self.emailTextField = cell.textField;
            cell.accessoryView = [self imageViewWithImageNamed:@"mail"];
            break;
        case 1:
            cell.textField.placeholder = @"Password";
            self.passwordTextField = cell.textField;
            cell.accessoryView = [self imageViewWithImageNamed:@"unlock"];
            break;
        case 2:
            cell.textField.placeholder = @"Confirmation";
            self.confirmationTextField = cell.textField;
            cell.accessoryView = [self imageViewWithImageNamed:@"tick"];
            break;
        default:
            break;
    }
}

- (UIImageView *)imageViewWithImageNamed:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIView *view = [[UIView alloc] initWithFrame:imageView.frame];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.9f;
    [imageView addSubview:view];
    
    return imageView;
}

- (void)authenticationTableViewFooter:(KEVAuthenticationTableViewFooter *)authenticationTableViewFooter
           didTapAuthenticatoonButton:(UIButton *)authenticationbutton
{
    switch (self.authenticationType) {
        case LSTAuthenticationTypeRegister:
            [self attemptRegistration];
            break;
            
        case LSTAuthenticationTypeLogin:
            [self attemptLogin];
            break;
    }
}

- (void)attemptRegistration
{
    NSDictionary *credentials = @{LSTEmailCredential : self.emailTextField.text,
                                  LSTPasswordCredential : self.passwordTextField.text,
                                  LSTConfirmationCredential : self.confirmationTextField.text};
    [self.authenticationDelegate authenticationViewContoller:self registrationButtonTappedWithCredentials:credentials];
}

- (void)attemptLogin
{
    NSDictionary *credentials = @{LSTEmailCredential : self.emailTextField.text,
                                  LSTPasswordCredential : self.passwordTextField.text};
    [self.authenticationDelegate authenticationViewContoller:self loginButtonTappedWithCredentials:credentials];
}
@end
