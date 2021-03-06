//
//  KeysBuyingOptionsView.m
//  Codeconomy
//
//  Created by Gary on 03/15/17.
//  Copyright © 2017 Stanford. All rights reserved.
//

#import "KeysBuyingOptionsView.h"
#import "Util.h"
#import "User.h"

@interface KeysBuyingOptionsView () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *tenKeysQuantity;
@property (nonatomic, strong) UILabel *fiftyKeysQuantity;
@property (nonatomic, strong) UILabel *hundredKeysQuantity;
@property (nonatomic, strong) UIButton *buyTenKeys;
@property (nonatomic, strong) UIButton *buyFiftyKeys;
@property (nonatomic, strong) UIButton *buyHundredKeys;
@property (nonatomic, strong) UIButton *selectedKeys;

@property (nonatomic, strong) UILabel *cardNumberLabel;
@property (nonatomic, strong) UILabel *expirationDateLabel;
@property (nonatomic, strong) UILabel *securityCodeLabel;
@property (nonatomic, strong) UILabel *zipCodeLabel;
@property (nonatomic, strong) UITextField *cardNumberField;
@property (nonatomic, strong) UITextField *expirationDateField;
@property (nonatomic, strong) UITextField *securityCodeField;
@property (nonatomic, strong) UITextField *zipCodeField;

@end

@implementation KeysBuyingOptionsView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [[Util sharedManager] colorWithHexString:[Util getWhiteColorHex]];
        
        _title = [[UILabel alloc] init];
        _title.text = @"Buy More Keys";
        _title.font = [Util getRegularFont:20.0];
        [self addSubview:_title];
        
        _tenKeysQuantity = [[UILabel alloc] init];
        _tenKeysQuantity.text = @"10🔑";
        _tenKeysQuantity.font = [Util getRegularFont:24.0];
        [self addSubview:_tenKeysQuantity];

        _fiftyKeysQuantity = [[UILabel alloc] init];
        _fiftyKeysQuantity.text = @"50🔑";
        _fiftyKeysQuantity.font = [Util getRegularFont:24.0];
        [self addSubview:_fiftyKeysQuantity];
        
        _hundredKeysQuantity = [[UILabel alloc] init];
        _hundredKeysQuantity.text = @"100🔑";
        _hundredKeysQuantity.font = [Util getRegularFont:24.0];
        [self addSubview:_hundredKeysQuantity];
        
        _buyTenKeys = [[UIButton alloc] init];
        [_buyTenKeys setTitle:@"$5" forState:UIControlStateNormal];
        [_buyTenKeys setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buyTenKeys addTarget:self action:@selector(tapKeyQuantity:) forControlEvents:UIControlEventTouchUpInside];
        _buyTenKeys.titleLabel.textAlignment = NSTextAlignmentCenter;
        _buyTenKeys.titleLabel.font = [Util getRegularFont:24.0];
        _buyTenKeys.layer.borderWidth = 2.0f;
        _buyTenKeys.layer.borderColor = [[UIColor blackColor] CGColor];
        _buyTenKeys.layer.cornerRadius = 10;
        _buyTenKeys.layer.masksToBounds = YES;
        _buyTenKeys.layer.opacity = 0.33;
        [self addSubview:_buyTenKeys];
        
        _buyFiftyKeys = [[UIButton alloc] init];
        [_buyFiftyKeys setTitle:@"$22" forState:UIControlStateNormal];
        [_buyFiftyKeys setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buyFiftyKeys addTarget:self action:@selector(tapKeyQuantity:) forControlEvents:UIControlEventTouchUpInside];
        _buyFiftyKeys.titleLabel.textAlignment = NSTextAlignmentCenter;
        _buyFiftyKeys.titleLabel.font = [Util getRegularFont:24.0];
        _buyFiftyKeys.layer.borderWidth = 2.0f;
        _buyFiftyKeys.layer.borderColor = [[UIColor blackColor] CGColor];
        _buyFiftyKeys.layer.cornerRadius = 10;
        _buyFiftyKeys.layer.masksToBounds = YES;
        _buyFiftyKeys.layer.opacity = 0.33;
        [self addSubview:_buyFiftyKeys];
        
        _buyHundredKeys = [[UIButton alloc] init];
        [_buyHundredKeys setTitle:@"$40" forState:UIControlStateNormal];
        [_buyHundredKeys setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buyHundredKeys addTarget:self action:@selector(tapKeyQuantity:) forControlEvents:UIControlEventTouchUpInside];
        _buyHundredKeys.titleLabel.textAlignment = NSTextAlignmentCenter;
        _buyHundredKeys.titleLabel.font = [Util getRegularFont:24.0];
        _buyHundredKeys.layer.borderWidth = 2.0f;
        _buyHundredKeys.layer.borderColor = [[UIColor blackColor] CGColor];
        _buyHundredKeys.layer.cornerRadius = 10;
        _buyHundredKeys.layer.masksToBounds = YES;
        _buyHundredKeys.layer.opacity = 0.33;
        [self addSubview:_buyHundredKeys];
        
        _cardNumberLabel = [[UILabel alloc] init];
        _cardNumberLabel.text = @"Card Number";
        _cardNumberLabel.font = [Util getRegularFont:16.0];
        [self addSubview:_cardNumberLabel];
        
        _expirationDateLabel = [[UILabel alloc] init];
        _expirationDateLabel.text = @"Expiration Date";
        _expirationDateLabel.font = [Util getRegularFont:16.0];
        [self addSubview:_expirationDateLabel];
        
        _securityCodeLabel = [[UILabel alloc] init];
        _securityCodeLabel.text = @"Security Code";
        _securityCodeLabel.font = [Util getRegularFont:16.0];
        [self addSubview:_securityCodeLabel];
        
        _zipCodeLabel = [[UILabel alloc] init];
        _zipCodeLabel.text = @"Zip Code";
        _zipCodeLabel.font = [Util getRegularFont:16.0];
        [self addSubview:_zipCodeLabel];
        
        _cardNumberField = [[UITextField alloc] init];
        _cardNumberField.delegate = self;
        _cardNumberField.placeholder = @"Add Card Number";
        _cardNumberField.textAlignment = NSTextAlignmentLeft;
        _cardNumberField.font = [Util getRegularFont:17.0];
        _cardNumberField.layer.cornerRadius = 10;
        _cardNumberField.layer.masksToBounds = YES;
        _cardNumberField.layer.borderWidth = 1.0f;
        _cardNumberField.layer.borderColor = [[UIColor blackColor] CGColor];
        _cardNumberField.backgroundColor = [UIColor clearColor];
        _cardNumberField.layer.sublayerTransform = CATransform3DMakeTranslation(12.0, 0, 0);
        [self addSubview:_cardNumberField];
        
        _expirationDateField = [[UITextField alloc] init];
        _expirationDateField.delegate = self;
        _expirationDateField.placeholder = @"MMYY";
        _expirationDateField.textAlignment = NSTextAlignmentLeft;
        _expirationDateField.font = [Util getRegularFont:17.0];
        _expirationDateField.layer.cornerRadius = 10;
        _expirationDateField.layer.masksToBounds = YES;
        _expirationDateField.layer.borderWidth = 1.0f;
        _expirationDateField.layer.borderColor = [[UIColor blackColor] CGColor];
        _expirationDateField.backgroundColor = [UIColor clearColor];
        _expirationDateField.layer.sublayerTransform = CATransform3DMakeTranslation(12.0, 0, 0);
        [self addSubview:_expirationDateField];
        
        _securityCodeField = [[UITextField alloc] init];
        _securityCodeField.delegate = self;
        _securityCodeField.placeholder = @"CVV";
        _securityCodeField.textAlignment = NSTextAlignmentLeft;
        _securityCodeField.font = [Util getRegularFont:17.0];
        _securityCodeField.layer.cornerRadius = 10;
        _securityCodeField.layer.masksToBounds = YES;
        _securityCodeField.layer.borderWidth = 1.0f;
        _securityCodeField.layer.borderColor = [[UIColor blackColor] CGColor];
        _securityCodeField.backgroundColor = [UIColor clearColor];
        _securityCodeField.layer.sublayerTransform = CATransform3DMakeTranslation(12.0, 0, 0);
        [self addSubview:_securityCodeField];
        
        _zipCodeField = [[UITextField alloc] init];
        _zipCodeField.delegate = self;
        _zipCodeField.placeholder = @"Zip Code";
        _zipCodeField.textAlignment = NSTextAlignmentLeft;
        _zipCodeField.font = [Util getRegularFont:17.0];
        _zipCodeField.layer.cornerRadius = 10;
        _zipCodeField.layer.masksToBounds = YES;
        _zipCodeField.layer.borderWidth = 1.0f;
        _zipCodeField.layer.borderColor = [[UIColor blackColor] CGColor];
        _zipCodeField.backgroundColor = [UIColor clearColor];
        _zipCodeField.layer.sublayerTransform = CATransform3DMakeTranslation(12.0, 0, 0);
        [self addSubview:_zipCodeField];
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [self.title sizeToFit];
    [self.tenKeysQuantity sizeToFit];
    [self.fiftyKeysQuantity sizeToFit];
    [self.hundredKeysQuantity sizeToFit];
    [self.buyTenKeys sizeToFit];
    [self.buyFiftyKeys sizeToFit];
    [self.buyHundredKeys sizeToFit];
    
    [self.cardNumberField sizeToFit];
    [self.expirationDateField sizeToFit];
    [self.securityCodeField sizeToFit];
    [self.zipCodeField sizeToFit];
    [self.cardNumberLabel sizeToFit];
    [self.expirationDateLabel sizeToFit];
    [self.securityCodeLabel sizeToFit];
    [self.zipCodeLabel sizeToFit];
    
    self.title.frame = CGRectMake((self.frame.size.width - self.title.frame.size.width) / 2.0,
                                 12.0,
                                 self.title.frame.size.width,
                                 self.title.frame.size.height);
    
    CGSize textSize = [self.tenKeysQuantity.text boundingRectWithSize:CGSizeMake(self.tenKeysQuantity.frame.size.width, MAXFLOAT)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:self.tenKeysQuantity.font}
                                                          context:nil].size;
    self.buyTenKeys.frame = CGRectMake(self.frame.size.width - 20.0 - 70.0,
                                      self.title.frame.origin.y + self.title.frame.size.height + 12.0,
                                      70.0,
                                      40.0);
    self.tenKeysQuantity.frame = CGRectMake(20.0,
                                       self.buyTenKeys.frame.origin.y + (self.buyTenKeys.frame.size.height - self.tenKeysQuantity.frame.size.height) / 2,
                                       self.tenKeysQuantity.frame.size.width,
                                       textSize.height);
    
    textSize = [self.fiftyKeysQuantity.text boundingRectWithSize:CGSizeMake(self.fiftyKeysQuantity.frame.size.width, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.fiftyKeysQuantity.font}
                                                       context:nil].size;
    self.buyFiftyKeys.frame = CGRectMake(self.buyTenKeys.frame.origin.x,
                                       self.buyTenKeys.frame.origin.y + self.buyTenKeys.frame.size.height + 10.0,
                                       self.buyTenKeys.frame.size.width,
                                       self.buyTenKeys.frame.size.height);
    self.fiftyKeysQuantity.frame = CGRectMake(20.0,
                                            self.buyFiftyKeys.frame.origin.y + (self.buyFiftyKeys.frame.size.height - self.fiftyKeysQuantity.frame.size.height) / 2,
                                            self.fiftyKeysQuantity.frame.size.width,
                                            textSize.height);
    
    textSize = [self.hundredKeysQuantity.text boundingRectWithSize:CGSizeMake(self.hundredKeysQuantity.frame.size.width, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.hundredKeysQuantity.font}
                                                       context:nil].size;
    self.buyHundredKeys.frame = CGRectMake(self.buyFiftyKeys.frame.origin.x,
                                           self.buyFiftyKeys.frame.origin.y + self.buyFiftyKeys.frame.size.height + 10.0,
                                       self.buyTenKeys.frame.size.width,
                                       self.buyTenKeys.frame.size.height);
    self.hundredKeysQuantity.frame = CGRectMake(20.0,
                                            self.buyHundredKeys.frame.origin.y + (self.buyHundredKeys.frame.size.height - self.hundredKeysQuantity.frame.size.height) / 2,
                                            self.hundredKeysQuantity.frame.size.width,
                                            textSize.height);
    
    textSize = [self.cardNumberLabel.text boundingRectWithSize:CGSizeMake(self.cardNumberLabel.frame.size.width, MAXFLOAT)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName:self.cardNumberLabel.font}
                                                           context:nil].size;
    self.cardNumberField.frame = CGRectMake(self.frame.size.width - 20.0 - 183.0,
                                            self.hundredKeysQuantity.frame.origin.y + self.hundredKeysQuantity.frame.size.height + 20.0,
                                           183.0,
                                           35.0);
    self.cardNumberLabel.frame = CGRectMake(20.0,
                                                self.cardNumberField.frame.origin.y + (self.cardNumberField.frame.size.height - self.cardNumberLabel.frame.size.height) / 2,
                                                self.cardNumberLabel.frame.size.width,
                                                textSize.height);
    
    textSize = [self.expirationDateLabel.text boundingRectWithSize:CGSizeMake(self.expirationDateLabel.frame.size.width, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.expirationDateLabel.font}
                                                       context:nil].size;
    self.expirationDateField.frame = CGRectMake(self.frame.size.width - 20.0 - 83.0,
                                            self.cardNumberField.frame.origin.y + self.cardNumberField.frame.size.height + 8.0,
                                            83.0,
                                            35.0);
    self.expirationDateLabel.frame = CGRectMake(20.0,
                                            self.expirationDateField.frame.origin.y + (self.expirationDateField.frame.size.height - self.expirationDateLabel.frame.size.height) / 2,
                                            self.expirationDateLabel.frame.size.width,
                                            textSize.height);
    
    textSize = [self.securityCodeLabel.text boundingRectWithSize:CGSizeMake(self.securityCodeLabel.frame.size.width, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.securityCodeLabel.font}
                                                       context:nil].size;
    self.securityCodeField.frame = CGRectMake(self.frame.size.width - 20.0 - 64.0,
                                            self.expirationDateField.frame.origin.y + self.expirationDateField.frame.size.height + 8.0,
                                            64.0,
                                            35.0);
    self.securityCodeLabel.frame = CGRectMake(20.0,
                                            self.securityCodeField.frame.origin.y + (self.securityCodeField.frame.size.height - self.securityCodeLabel.frame.size.height) / 2,
                                            self.securityCodeLabel.frame.size.width,
                                            textSize.height);
    
    textSize = [self.zipCodeLabel.text boundingRectWithSize:CGSizeMake(self.zipCodeLabel.frame.size.width, MAXFLOAT)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:self.zipCodeLabel.font}
                                                       context:nil].size;
    self.zipCodeField.frame = CGRectMake(self.frame.size.width - 20.0 - 102.0,
                                            self.securityCodeField.frame.origin.y + self.securityCodeField.frame.size.height + 8.0,
                                            102.0,
                                            35.0);
    self.zipCodeLabel.frame = CGRectMake(20.0,
                                            self.zipCodeField.frame.origin.y + (self.zipCodeField.frame.size.height - self.zipCodeLabel.frame.size.height) / 2,
                                            self.zipCodeLabel.frame.size.width,
                                            textSize.height);
}

#pragma mark - UITextFieldDelegate

- (bool)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    int characterLimit = -1;
    if (textField == self.cardNumberField) {
        characterLimit = 16;
    } else if (textField == self.expirationDateField) {
        characterLimit = 4;
    } else if (textField == self.securityCodeField) {
        characterLimit = 3;
    } else if (textField == self.zipCodeField) {
        characterLimit = 5;
    }
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    NSCharacterSet *cs = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return (([string isEqualToString:filtered]) && (newLength <= characterLimit));
}

- (bool)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.cardNumberField) {
        [self.expirationDateField becomeFirstResponder];
    } else if (textField == self.expirationDateField) {
        [self.securityCodeField becomeFirstResponder];
    } else if (textField == self.securityCodeField) {
        [self.zipCodeField becomeFirstResponder];
    } else if (textField == self.zipCodeField) {
        [textField resignFirstResponder];
    }
    
    return false;
}

#pragma mark - Helpers

- (int)getKeyQuantity {
    if (self.selectedKeys == self.buyTenKeys) {
        return 10;
    } else if (self.selectedKeys == self.buyFiftyKeys) {
        return 50;
    } else if (self.selectedKeys == self.buyHundredKeys) {
        return 100;
    } else {
        return -1;
    }
}

- (NSString *)getCardNumber {
    return self.cardNumberField.text;
}

- (NSString *)getExpirationDate {
    return self.expirationDateField.text;
}

- (NSString *)getSecurityCode {
    return self.securityCodeField.text;
}

- (NSString *)getZipCode {
    return self.zipCodeField.text;
}

- (bool)hasValidCardEntry {
    return (self.cardNumberField.text.length == 16 &&
            self.expirationDateField.text.length == 4 &&
            self.securityCodeField.text.length == 3 &&
            self.zipCodeField.text.length == 5);
}

#pragma mark - Listeners

- (void)tapKeyQuantity:(UIButton *)sender {
    if (sender == self.buyTenKeys) {
        self.selectedKeys = self.buyTenKeys;
        self.buyTenKeys.layer.opacity = 1.0;
        self.buyTenKeys.backgroundColor = [[Util sharedManager] colorWithHexString:[Util getBlueColorHex]];
        self.buyFiftyKeys.layer.opacity = 0.33;
        self.buyFiftyKeys.backgroundColor = [UIColor clearColor];
        self.buyHundredKeys.layer.opacity = 0.33;
        self.buyHundredKeys.backgroundColor = [UIColor clearColor];
    } else if (sender == self.buyFiftyKeys) {
        self.selectedKeys = self.buyFiftyKeys;
        self.buyTenKeys.layer.opacity = 0.33;
        self.buyTenKeys.backgroundColor = [UIColor clearColor];
        self.buyFiftyKeys.layer.opacity = 1.0;
        self.buyFiftyKeys.backgroundColor = [[Util sharedManager] colorWithHexString:[Util getBlueColorHex]];
        self.buyHundredKeys.layer.opacity = 0.33;
        self.buyHundredKeys.backgroundColor = [UIColor clearColor];
    } else if (sender == self.buyHundredKeys) {
        self.selectedKeys = self.buyHundredKeys;
        self.buyTenKeys.layer.opacity = 0.33;
        self.buyTenKeys.backgroundColor = [UIColor clearColor];
        self.buyFiftyKeys.layer.opacity = 0.33;
        self.buyFiftyKeys.backgroundColor = [UIColor clearColor];
        self.buyHundredKeys.layer.opacity = 1.0;
        self.buyHundredKeys.backgroundColor = [[Util sharedManager] colorWithHexString:[Util getBlueColorHex]];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
