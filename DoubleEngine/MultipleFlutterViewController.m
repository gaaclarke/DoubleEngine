//
//  ViewController.m
//  DoubleEngine
//
//  Created by Aaron Clarke on 10/5/20.
//

#import "MultipleFlutterViewController.h"
#import <Flutter/Flutter.h>

@interface FlutterEngine (Waiter)
- (void)waitForFirstFrame:(NSTimeInterval)timeout
                 callback:(void (^_Nonnull)(BOOL didTimeout))callback;
@end

#define USE_SPAWN

@interface MultipleFlutterViewController ()

@end

@implementation MultipleFlutterViewController {
  int _numberOfFlutters;
}

- (instancetype)initWithNumber:(int)numberOfFlutters {
  self = [super initWithNibName:nil bundle:nil];
  _numberOfFlutters = numberOfFlutters;
  return self;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  const double startTime = CFAbsoluteTimeGetCurrent();
  __block int count = 0;
  const CGFloat height = UIScreen.mainScreen.bounds.size.height / _numberOfFlutters;
  FlutterEngine* mainEngine = nil;
  for (int i = 0; i < _numberOfFlutters; ++i) {
    FlutterEngine* engine = nil;
    if (!mainEngine) {
      mainEngine = [[FlutterEngine alloc] initWithName:@"main"];
      [mainEngine run];
      engine = mainEngine;
    } else {
#ifdef USE_SPAWN
      engine = [mainEngine spawnWithEntrypoint:nil];
#else
      engine = [[FlutterEngine alloc] initWithName:@"secondary"];
      [engine run];
#endif
    }
    FlutterViewController* vc = [[FlutterViewController alloc] initWithEngine:engine nibName:nil bundle:nil];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(0, i * height, UIScreen.mainScreen.bounds.size.width, height);
    [vc didMoveToParentViewController:self];
    [engine waitForFirstFrame:10.0 callback:^(BOOL didTimeout) {
      assert(!didTimeout);
      count += 1;
      if (count == self->_numberOfFlutters) {
        NSLog(@"duration: %f", CFAbsoluteTimeGetCurrent() - startTime);
      }
    }];
  }
}


@end
