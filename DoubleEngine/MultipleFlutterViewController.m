//
//  ViewController.m
//  DoubleEngine
//
//  Created by Aaron Clarke on 10/5/20.
//

#import "MultipleFlutterViewController.h"
#import <Flutter/Flutter.h>

@interface MultipleFlutterViewController ()

@end

@implementation MultipleFlutterViewController {
  int _numberOfFlutters;
  FlutterEngineGroup* _engineGroup;
}

- (instancetype)initWithNumber:(int)numberOfFlutters {
  self = [super initWithNibName:nil bundle:nil];
  _numberOfFlutters = numberOfFlutters;
  _engineGroup = [[FlutterEngineGroup alloc] initWithName:@"memory test group" project:nil];
  return self;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  const CGFloat height = UIScreen.mainScreen.bounds.size.height / _numberOfFlutters;
  for (int i = 0; i < _numberOfFlutters; ++i) {
    FlutterEngine* engine = [_engineGroup makeEngineWithEntrypoint:nil libraryURI:nil];
    FlutterViewController* vc = [[FlutterViewController alloc] initWithEngine:engine nibName:nil bundle:nil];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(0, i * height, UIScreen.mainScreen.bounds.size.width, height);
    [vc didMoveToParentViewController:self];
  }
}


@end
