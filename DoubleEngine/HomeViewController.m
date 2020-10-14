//
//  HomeViewController.m
//  DoubleEngine
//
//  Created by Xiao Yu on 10/9/20.
//

#import "HomeViewController.h"
#import "MultipleFlutterViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *enginesLabel;
@property (weak, nonatomic) IBOutlet UIStepper *enginesStepper;
@end

@implementation HomeViewController

- (void) updateLabel {
  _enginesLabel.text = [[NSNumber numberWithDouble:_enginesStepper.value] stringValue];
}

- (void)viewDidLoad {
  [self updateLabel];
}

- (IBAction)stepperChanged:(id)sender {
  [self updateLabel];
}

- (IBAction)openFlutter:(id)sender {
  MultipleFlutterViewController* multipleFlutterViewController = [[MultipleFlutterViewController alloc] initWithNumber:_enginesStepper.value];
  [[self navigationController] pushViewController:multipleFlutterViewController animated:YES];
}

@end
