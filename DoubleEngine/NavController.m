//
//  NavController.m
//  DoubleEngine
//
//  Created by Aaron Clarke on 10/5/20.
//

#import "NavController.h"
#import <Flutter/Flutter.h>

@interface NavController ()

@end

@implementation NavController

- (void)viewDidLoad {
  [super viewDidLoad];
  UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height - 100, 100, 100)];
  [button setTitle:@"push" forState:UIControlStateNormal];
  button.backgroundColor = UIColor.greenColor;
  [self.view addSubview:button];
  [button addTarget:self action:@selector(pushFlutter) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushFlutter {
  FlutterViewController* vc = [[FlutterViewController alloc] init];
  [self pushViewController:vc animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
