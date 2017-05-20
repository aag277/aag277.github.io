//
//  SharePhotos
//
//  SharePhotos.m
//
//  Created by .{&Anony(&Virus&)Mous&}. on 02/05/17.
// Copyright (c) 2017 All rights reserved.
//

#import "SharePhotos.h"

@interface SharePhotos ()

@end

@implementation SharePhotos

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appdelegate = [[UIApplication sharedApplication] delegate];
    self.appdelegate.session.delegate = self;
    
    
    // set Background Color.
    
    self.view.backgroundColor=[UIColor clearColor];
    self.view.multipleTouchEnabled=YES;
    
    
    // Add Startup Alert.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
	message:@"please Enable BlueTooth and/or WiFi Before Using This Application To Get Full Working"
	delegate:nil
	cancelButtonTitle:@"OK"
	otherButtonTitles: nil];
	
	[alert show];
    
    
    // set Background Image.
        
UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];

UIImage *img = [UIImage imageNamed:@"SharePhotos"];
[imgView setImage:img];
[self.view addSubview:imgView];


CATransition *animation = [CATransition animation];
[animation setDuration:3];
[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
[animation setType:kCATransitionReveal];

[imgView.layer addAnimation:animation forKey:@"Reveal"];
    
    
    // Add ImageView.
    
    _picture=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    _picture.highlighted=YES;
    _picture.contentMode=1;
    [_picture setUserInteractionEnabled:YES];
    [self.view addSubview:_picture];
    [_picture release];
    
    // Set ImageView Gestures.
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(sharePhoto:)];
    [_picture addGestureRecognizer:longPress];
    
    
    // Add ToolBar.

UIToolbar *ToolBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0,390,320,44)];
NSMutableArray *ToolBarItems=[[NSMutableArray alloc] init];

UIBarButtonItem *connect=[[[UIBarButtonItem alloc] initWithTitle:@"Connections" style:0 target:self action:@selector(connect:)] autorelease]; 
[ToolBarItems addObject:connect];

UIBarButtonItem *space=[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:self action:nil] autorelease]; 
[ToolBarItems addObject:space];

UIBarButtonItem *sendPhoto=[[[UIBarButtonItem alloc] initWithTitle:@"Send" style:0 target:self action:@selector(sendPhoto:)] autorelease];
[ToolBarItems addObject:sendPhoto];

[ToolBar setItems:ToolBarItems];
[ToolBarItems release];
ToolBar.tag=0;
ToolBar.backgroundColor=[UIColor whiteColor];
ToolBar.multipleTouchEnabled=YES;
[self.view addSubview:ToolBar];
[ToolBar release];

}

// Set NavigationBar.

- (void)viewWillAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
self.navigationController.navigationBarHidden=NO;
self.navigationController.navigationBar.translucent=YES;
self.title=@"Share Photos";
self.navigationItem.hidesBackButton=NO;

UIBarButtonItem *Photos = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:4 target:self action:@selector(choosePhoto:)] autorelease];

UIBarButtonItem *Clear = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:16 target:self action:@selector(clearPhoto:)] autorelease];

NSArray *leftButtonItems = @[Photos, Clear];
    self.navigationItem.leftBarButtonItems = leftButtonItems;

UIBarButtonItem *Camera = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:15 target:self action:@selector(takePhoto:)] autorelease];

NSArray *rightButtonItems = @[Camera];
    self.navigationItem.rightBarButtonItems = rightButtonItems;
}

// ImageView LongPress Action.
// SharePhoto Action.

-(IBAction)sharePhoto:(id)sender
{
    Class avcClass = NSClassFromString(@"UIActivityViewController");
    if (avcClass)
    {
    UIImage *imageItem = _picture.image;
    NSArray *items = [NSArray arrayWithObjects: imageItem, nil];
    
    UIActivityViewController *ActivityView = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    [self presentViewController:ActivityView animated:YES completion:nil];
    [ActivityView setCompletionHandler:^(NSString *act, BOOL done)
    {
      if (done)
    	{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successfully"
	message:@"Successfully"
	delegate:nil
	cancelButtonTitle:@"OK"
	otherButtonTitles: nil];
	
	[alert show];
	}
    }];
   }
   else
   {
	UIAlertView *failed = [[UIAlertView alloc] initWithTitle:@"unsuccessful"
	message:@"Failed"
	delegate:nil
	cancelButtonTitle:@"OK"
	otherButtonTitles: nil];
	
	[failed show];
   }
}

// NavigationBar Actions.
// Clear Button Action.

-(IBAction)clearPhoto:(id)sender
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];

UIImage *img = [UIImage imageNamed:@"background"];
[imgView setImage:img];
[self.view addSubview:imgView];


CATransition *animation = [CATransition animation];
[animation setDuration:3];
[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
[animation setType:kCATransitionReveal];

[imgView.layer addAnimation:animation forKey:@"Reveal"];

// Add ToolBar.

UIToolbar *ToolBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0,436,320,44)];
NSMutableArray *ToolBarItems=[[NSMutableArray alloc] init];

UIBarButtonItem *connect=[[[UIBarButtonItem alloc] initWithTitle:@"Connections" style:0 target:self action:@selector(connect:)] autorelease]; 
[ToolBarItems addObject:connect];

UIBarButtonItem *space=[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:5 target:self action:nil] autorelease]; 
[ToolBarItems addObject:space];

UIBarButtonItem *sendPhoto=[[[UIBarButtonItem alloc] initWithTitle:@"Send" style:0 target:self action:@selector(sendPhoto:)] autorelease];
[ToolBarItems addObject:sendPhoto];

[ToolBar setItems:ToolBarItems];
[ToolBarItems release];
ToolBar.tag=0;
ToolBar.backgroundColor=[UIColor whiteColor];
ToolBar.multipleTouchEnabled=YES;
[self.view addSubview:ToolBar];
[ToolBar release];

}

// TakePhoto Button Action.

-(IBAction)takePhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.mediaTypes = @[(NSString *)kUTTypeImage];
    
    [self presentViewController:picker animated:YES completion:nil];
}

// SelectPhoto Button Action.

- (IBAction)choosePhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.mediaTypes = @[(NSString *)kUTTypeImage];
    
    [self presentViewController:picker animated:YES completion:nil];
}

// ToolBar Actions.
// Connect Button Action.

- (IBAction)connect:(id)sender
{
    if (self.appdelegate.session.connectedPeers.count == 0) 
    {
        [self requireDeviceConnected];
        return;
    }
}

// SendPhoto Button Action.

- (IBAction)sendPhoto:(id)sender
{
    if (self.appdelegate.session.connectedPeers.count == 0) {
        [self requireDeviceConnected];
        return;
    }

    if (self.imageURL == nil) return;
    
    MCSession *session = self.appdelegate.session;
    MCPeerID *peer = session.connectedPeers[0];
    
    [session sendResourceAtURL:self.imageURL withName:@"pic"
                        toPeer:peer withCompletionHandler:^(NSError *error) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                self.picture.image = nil;
                                self.picture.backgroundColor = error ?
                                                                [UIColor redColor] :
                                                                [UIColor greenColor];
                            });
                        }];
}


#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    NSData *jpegImg = UIImageJPEGRepresentation(selectedImage, 0.5);
    
    NSString *tmpPath = [NSTemporaryDirectory() stringByAppendingString:@"pic.jpg"];
    self.imageURL = [NSURL fileURLWithPath:tmpPath];
    
    [jpegImg writeToURL:self.imageURL atomically:NO];
    
    self.picture.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Convenience methods
- (void)requireDeviceConnected
{
    if (self.appdelegate.session.connectedPeers.count == 0) {
        self.browser = [[MCBrowserViewController alloc] initWithServiceType:sharePicsService session:self.appdelegate.session];
        self.browser.delegate = self;
        [self presentViewController:self.browser animated:YES completion:nil];
    }
}

#pragma mark - MCBrowserViewControllerDelegate
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:^{ [self requireDeviceConnected]; }];
}

#pragma mark - MCSessionDelegate
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName
       fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.picture.image = nil;
        self.picture.backgroundColor = [UIColor yellowColor];
    });
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName
       fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:localURL]];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.picture.image = image;
    });
}


- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID{}
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {}
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID{}
@end