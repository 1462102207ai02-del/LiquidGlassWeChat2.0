#import <UIKit/UIKit.h>

%hook UITabBar

- (void)layoutSubviews {
    %orig;

    self.translucent = YES;
    self.backgroundImage = [UIImage new];
    self.shadowImage = [UIImage new];

    UIColor *color;

    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            color = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        } else {
            color = [[UIColor whiteColor] colorWithAlphaComponent:0.25];
        }
    } else {
        color = [[UIColor whiteColor] colorWithAlphaComponent:0.25];
    }

    self.backgroundColor = color;
}

%end
