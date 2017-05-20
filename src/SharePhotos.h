//
//  SharePhotos
//
//  SharePhotos.h
//
//  Created by .{&Anony(&Virus&)Mous&}. on 02/05/17.
//  Copyright (c) 2017 All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>


@interface SharePhotos : UIViewController <MCBrowserViewControllerDelegate, MCSessionDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AppDelegate *appdelegate;

@property (nonatomic, strong) MCBrowserViewController *browser;

@property (nonatomic, strong) UIImageView *picture;

@property (nonatomic, strong) NSURL *imageURL;

@property (nonatomic, strong) UIToolbar *ToolBar;

@end


