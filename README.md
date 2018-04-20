Hello everyone, 

This morning we spoke of several different areas

    Text View
    Text Fields
    Web Content 
    Custom graphics drawing

Our word cloud is here:
![alt text](https://github.com/AmirJahan/LHL---W02-D05/blob/master/LHL%20W2%20D5.png)


I should mention that a lot of today’s class content was from the previous source code done by Roland. 

######  Text Input 
The responder chain dictates where events are sent. This includes text events. 
When a control that can accept text input becomes the first responder, the system will present the keyboard and allow the user to edit the text. 
UITextField is designed for a single "field" of text... think login forms, contact forms, etc. 
UITextView is the heavy weight text editing view. It inherits from UIScrollView and can handle long text. 
Both of these classes provide delegates for you to be notified of text/editing state changes. 
Both of these classes conform to the UITextInputTraits protocol which allows you to customize various aspects of the text input (keyboard return key, keyboard type, autocorrect/autocapitalization, etc.)

######  Web Views
we looked at the various ways of displaying web content: 
    
    UIWebView (oldest, deprecated, use only when support for iOS 7 is required)
    WKWebView (newer, more control)
    SFSafariViewController (least control, best UX)
    
######  Drawing
You perform drawing in a graphics context. 
Create your own UIView subclass and override drawRect: to do the custom drawing. 
Custom drawing typically requires some math.
Drawing can be done with the C-based CoreGraphics directly. 
Drawing can also be done with the friendlier UIBezierPath (which is built on top of the CG function calls.)



