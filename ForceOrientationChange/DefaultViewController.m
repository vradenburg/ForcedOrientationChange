//
//  DefaultViewController.m
//  ForceOrientationChange
//
//  Created by David Vradenburg on 2014-01-13.
//  Copyright (c) 2014 rhender. All rights reserved.
//

#import "DefaultViewController.h"

@interface DefaultViewController ()
{
    UIInterfaceOrientation _preferredOrientation;
}

@end

@implementation DefaultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _preferredOrientation = UIInterfaceOrientationPortrait;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)forceOrientationChange
{
    UIViewController *vc = [[UIViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
    
    [UIView animateWithDuration:.3 animations:^{
        [vc dismissViewControllerAnimated:NO completion:nil];
    } completion:nil];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return _preferredOrientation;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
}

- (IBAction)toggleButtonPressed:(id)sender {
    _preferredOrientation = UIInterfaceOrientationIsPortrait(_preferredOrientation)
        ? UIInterfaceOrientationLandscapeRight
        : UIInterfaceOrientationPortrait;
    
    [self forceOrientationChange];
}


@end
