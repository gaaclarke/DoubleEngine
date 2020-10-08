//
//  ViewController.m
//  DoubleEngine
//
//  Created by Aaron Clarke on 10/5/20.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  const int count = 3;
  const CGFloat height = UIScreen.mainScreen.bounds.size.height / count;
  for (int i = 0; i < count; ++i) {
    FlutterViewController* vc = [[FlutterViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = CGRectMake(0, i * height, UIScreen.mainScreen.bounds.size.width, height);
    [vc didMoveToParentViewController:self];
  }
}


@end
