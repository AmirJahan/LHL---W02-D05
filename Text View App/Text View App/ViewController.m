#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property NSString *curText;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = @"";
    [[self textView] setDelegate: self];
    
    _textView.editable = false;
    
    _curText = @"";
}


- (IBAction)save:(id)sender
{
    [self.textView resignFirstResponder];
    _textView.text = @"Entre your value in here";
    _curText = @"";
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.textView.text = @"";
}





-           (BOOL)textView:(UITextView *)textView
   shouldChangeTextInRange:(NSRange)range
           replacementText:(NSString *)text
{
    
    
    // amir.jahan@gmailcom
    // j
    NSCharacterSet *numbersOnlySet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    NSCharacterSet *inTextViewSet = [NSCharacterSet characterSetWithCharactersInString:text];
    
    BOOL stringIsValid = [numbersOnlySet isSupersetOfSet:inTextViewSet];

        
    return stringIsValid;
}






- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"In textViewDidChange: %@", textView.text);
}

@end
