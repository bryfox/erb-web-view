//
//  WebAppDelegate.m
//  Web
//
//  Created by Bryan Fox on 1/8/10.
//  Copyright Bryan Fox 2010. All rights reserved.
//

#import "WebAppDelegate.h"
#import "WebViewController.h"

@implementation WebAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
  
    /*
     * imageView - is an extension of the auto-loaded Default loading screen
     * Default.png will be shown automatically up until applicationDidFinishLaunching fires
     * Here, we'll continue to display the loading screen until the webview content has loaded.
     */
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"default" ofType:@"png"]];
    imageView = [[UIImageView alloc] initWithImage:image];
    [image release];
    
    imageView.tag = 1;
    [window addSubview:imageView];
    [window makeKeyAndVisible];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  //  Fires when UIWebView begins loading content
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  //  NSLog(@"webViewDidFinishLoad");
  [window addSubview:viewController.view];
  [imageView removeFromSuperview];
  [imageView release];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  NSLog (@"webView:didFailLoadWithError");
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
