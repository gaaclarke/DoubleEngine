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
}

- (instancetype)initWithNumber:(int)numberOfFlutters {
  self = [super initWithNibName:nil bundle:nil];
  _numberOfFlutters = numberOfFlutters;
  return self;
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  const CGFloat height = UIScreen.mainScreen.bounds.size.height / _numberOfFlutters;
  for (int i = 0; i < _numberOfFlutters; ++i) {
    FlutterViewController* vc = [[FlutterViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(0, i * height, UIScreen.mainScreen.bounds.size.width, height);
    [vc didMoveToParentViewController:self];
  }
}


@end
