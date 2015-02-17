//
//  LSTLoginViewController.m
//  List
//
//  Created by Kevin Coleman on 1/19/15.
//  Copyright (c) 2015 Kevin Coleman. All rights reserved.
//

#import "KCAuthenticationViewController.h"
#import "KCInputTableViewCell.h"
#import "KCUtilities.h"
#import "KCAuthenticationItem.h"

@interface KCAuthenticationViewController () <LSTAuthenticationTableViewFooterDelegate>

@property (nonatomic) NSArray *items;
@property (nonatomic) NSString *authenticationTitle;
@property (nonatomic) UITextField *emailTextField;
@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) UITextField *confirmationTextField;

@end

@implementation KCAuthenticationViewController

+ (instancetype)controllerWithAuthenticationItems:(NSArray *)items title:(NSString *)title;
{
    return [[self alloc] initWithAuthenticationItems:items title:title];
}

- (id)initWithAuthenticationItems:(NSArray *)items title:(NSString *)title
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _items = items;
        _authenticationTitle = title;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[KCInputTableViewCell class] forCellReuseIdentifier:[KCInputTableViewCell reuseIdentifier]];
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
    return [KCAuthenticationTableViewFooter new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    KCAuthenticationTableViewFooter *footer;
    footer = [KCAuthenticationTableViewFooter authenticationTableViewFooterWithButtonTitle:self.authenticationTitle];
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
    KCInputTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[KCInputTableViewCell reuseIdentifier]];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(KCInputTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    KCAuthenticationItem *item = [self.items objectAtIndex:indexPath.row];
    cell.textField.placeholder = [item placeholder];
    cell.accessoryView = [self imageViewWithImage:[item iconImage]];
    item.cell = cell;
}

- (UIImageView *)imageViewWithImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIView *view = [[UIView alloc] initWithFrame:imageView.frame];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.9f;
    [imageView addSubview:view];
    
    return imageView;
}

- (void)authenticationTableViewFooter:(KCAuthenticationTableViewFooter *)authenticationTableViewFooter
           didTapAuthenticatoonButton:(UIButton *)authenticationbutton
{
    for (KCAuthenticationItem *item in self.items) {
        item.credential = item.cell.textField.text;
        item.cell = nil;
    }
    [self.authenticationDelegate authenticationViewContoller:self buttonTappedWithItems:self.items];
}


@end
