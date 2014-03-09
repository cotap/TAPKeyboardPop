#import "UIViewController+TAPKeyboardPop.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, strong) UIResponder *tap_previousResponder;

@end

@implementation UIViewController (TAPKeyboardPop)

+ (void)load
{
    if ([self instancesRespondToSelector:@selector(transitionCoordinator)]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self tap_swizzleSelector:@selector(viewWillAppear:) withSelector:@selector(tap_viewWillAppear:)];
            [self tap_swizzleSelector:@selector(viewWillDisappear:) withSelector:@selector(tap_viewWillDisappear:)];
            [self tap_swizzleSelector:@selector(beginAppearanceTransition:animated:) withSelector:@selector(tap_beginAppearanceTransition:animated:)];
        });
    }
}

+ (void)tap_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];

    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)tap_beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated
{
    [self tap_beginAppearanceTransition:isAppearing animated:animated];

    if (isAppearing || !animated) {
        return;
    }

    UIView *keyboardView = self.tap_previousResponder.inputAccessoryView.superview;
    if (!keyboardView) {
        return;
    }

    [self.tap_previousResponder becomeFirstResponder];
    [self.transitionCoordinator animateAlongsideTransitionInView:keyboardView animation:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        CGRect endFrame = CGRectOffset(keyboardView.frame, CGRectGetWidth(keyboardView.frame), 0);
        keyboardView.frame = endFrame;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        if ([context isCancelled]) {
            return;
        }
        [self.tap_previousResponder resignFirstResponder];
        self.tap_previousResponder = nil;
    }];
}

- (void)tap_viewWillAppear:(BOOL)animated
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(tap_didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [center addObserver:self selector:@selector(tap_didBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];

    [self tap_viewWillAppear:animated];
}

- (void)tap_viewWillDisappear:(BOOL)animated
{
    [self tap_viewWillDisappear:animated];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [center removeObserver:self name:UITextViewTextDidBeginEditingNotification object:nil];
}

- (void)tap_didBeginEditing:(NSNotification *)note
{
    UIResponder *firstResponder = note.object;
    self.tap_previousResponder = firstResponder;
    if (!firstResponder.inputAccessoryView) {
        [firstResponder performSelector:@selector(setInputAccessoryView:) withObject:[UIView new]];
    }
}

- (UIResponder *)tap_previousResponder
{
    return objc_getAssociatedObject(self, @selector(tap_previousResponder));
}

- (void)setTap_previousResponder:(UIResponder *)responder
{
    objc_setAssociatedObject(self, @selector(tap_previousResponder), responder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
