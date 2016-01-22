//
//  OEXVideoPlayerInterface.h
//  edX_videoStreaming
//
//  Created by Nirbhay Agarwal on 13/05/14.
//  Copyright (c) 2014-2016 edX, Inc. All rights reserved.
//

@import MediaPlayer;

#import "CLVideoPlayer.h"
#import "OEXHelperVideoDownload.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OEXVideoPlayerInterfaceDelegate <NSObject>

- (void)movieTimedOut;

@end

@interface OEXVideoPlayerInterface : UIViewController <CLVideoPlayerControllerDelegate>

@property(nonatomic, weak) id <OEXVideoPlayerInterfaceDelegate>  delegate;
// Allows setting the controller's view. This is deprecated, the controller should be responsible for its own view
@property (nonatomic, weak, nullable) UIView* videoPlayerVideoView;
@property (nonatomic, strong, nullable) CLVideoPlayer* moviePlayerController;
@property(nonatomic) BOOL shouldRotate;

// This is deprecated. Once old uses of this class are removed, remove it
// The owner should be responsible for this, in case it needs to fade in *with* other UI
// Defaults to true for backward compatibility reasons
@property (assign, nonatomic) BOOL fadeInOnLoad;

- (void)orientationChanged:(NSNotification*)notification;
- (void)playVideoFor:(OEXHelperVideoDownload*)video;
- (void)resetPlayer;
- (void)videoPlayerShouldRotate;
- (void)setAutoPlaying:(BOOL)playing;

// Disable moving directly from one video to the next
@property (assign, nonatomic) BOOL hidesNextPrev;

@end

NS_ASSUME_NONNULL_END
