//
//  WebAppDelegate.h
//  Web
//
//  Created by Bryan Fox on 1/8/10.
//  Copyright Bryan Fox 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@interface WebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIImageView *imageView;
    WebViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewController *viewController;

@end

