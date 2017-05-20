
#import <UIKit/UIKit.h>

#import <MultipeerConnectivity/MultipeerConnectivity.h>

extern NSString * const sharePicsService;

@interface AppDelegate : NSObject <UIApplicationDelegate>
{
	UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) UIWindow *window;

@property (nonatomic, retain) UINavigationController *navigationController;

@property (strong, nonatomic) MCSession *session;

@property (strong, nonatomic) MCPeerID *peerId;


@end

