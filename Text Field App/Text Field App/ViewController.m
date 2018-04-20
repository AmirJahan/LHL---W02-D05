#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;


@property UITextField* passwordTxtFld;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    

    
    
    
    
    
    
    [[self myTextField] setDelegate: self];
    _myTextField.delegate = self;
    
    [self setupTextField];
    [self displayTopLabelText:@""];
    self.bottomLabel.text = @"";
    
    
    
    
    
    _passwordTxtFld = [[UITextField alloc] init];
    _passwordTxtFld.frame = CGRectMake(20,
                                 40,
                                 self.view.frame.size.width - 40,
                                 30);
    _passwordTxtFld.backgroundColor = [UIColor colorWithRed:.9
                                                green:.9
                                                 blue:.9
                                                alpha:1];
    
    _passwordTxtFld.delegate = self;
    _passwordTxtFld.secureTextEntry = true;
    _passwordTxtFld.placeholder = @"Password*";
    [self.view addSubview: _passwordTxtFld];
    
}

- (void)setupTextField
{
    // set the keyboard type
    _myTextField.keyboardType = UIKeyboardTypeDefault;
    
    // Either below or in the IB
    //    self.myTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    NSLog(@"In setupTextField: %@", self.myTextField.typingAttributes);
}

// this is called by the button
- (IBAction)dismissKeyboard:(id)sender
{
    [self.myTextField resignFirstResponder];
    NSLog(@"In dismissKeyboard:");
}


- (void)displayTopLabelText:(NSString *)text
{
    self.topLabel.text = text;
}

#pragma mark - TextFieldDelegates

// fires when we tap on the textfield and knows which TEXT FIELD
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( textField == _passwordTxtFld)
        textField.keyboardType = UIKeyboardTypeNumberPad;
    else
        textField.keyboardType = UIKeyboardTypeDefault;

    
    
    [self displayTopLabelText:@""];
    self.bottomLabel.text = @"";
    
    // clears text when we begin editing (we could have set the property clearsOnBeginEditing on textfield to do this too)
    
    self.myTextField.text = @"";
    NSLog(@"In textFieldDidBeginEditing:");
}

// fires when we end editing
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self displayTopLabelText: textField.text];
    _myTextField.text = @"";
    _myTextField.placeholder = @"Enter Value Here";
    NSLog(@"In textFieldDidEndEditing:");
}

// fires when the clear button is about to fire
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"In textFieldShouldClear:");
    [self displayTopLabelText:@""];
    return YES;
}

// fires when the return key is tapped which allows us to respond accordingly
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"In textFieldShouldReturn:");
    return YES;
}

// used to handle populating the label while we type
-              (BOOL)textField:(UITextField *)textField
 shouldChangeCharactersInRange:(NSRange)range
             replacementString:(NSString *)string
{
    
    NSLog(@"In textField:shouldChangeCharactersInRange: range: %@", NSStringFromRange(range));
    NSLog(@"In textField:shouldChangeCharactersInRange: replacement string: %@", string);
    
    NSString *bottomLabelText = self.bottomLabel.text;
    
    // The following logic is simplified and does not account for deleting/replacing
    // more than one character at a time
    BOOL isDeleting = (range.length == 1);
    if (isDeleting)
    {
        // removing characters
        bottomLabelText = [bottomLabelText substringToIndex:range.location];
    }
    self.bottomLabel.text = [bottomLabelText stringByAppendingString:string];
    
    return YES;
}

@end
