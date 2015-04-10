//
//  STViewController.m
//  STColorPickerExample
//
//  Created by Sebastien Thiebaud on 12/7/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"

#import "STColorPicker.h"

@interface STViewController ()

@property (strong) UIPopoverController *pickerPopoverController;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewPressed:)];
    gestureRecognizer.numberOfTapsRequired = 1;
    gestureRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewPressed:(UITapGestureRecognizer *)gestureRecognizer
{
    if ([_pickerPopoverController isPopoverVisible])
        return;

    CGPoint position = [gestureRecognizer locationInView:self.view];
    
    STColorPicker *colorPicker = [[STColorPicker alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 180.0)];
    
    [colorPicker setColorHasChanged:^(UIColor *color, CGPoint location) {
        [self.view setBackgroundColor:color];
    }];
        UIViewController *colorPickerViewController = [[UIViewController alloc] init];
    colorPickerViewController.view = colorPicker;
        
    _pickerPopoverController = [[UIPopoverController alloc] initWithContentViewController:colorPickerViewController];
    _pickerPopoverController.popoverContentSize = CGSizeMake(200.0, 180.0);
    _pickerPopoverController.backgroundColor = [UIColor blackColor];
    [_pickerPopoverController presentPopoverFromRect:CGRectMake(position.x, position.y, 10.0, 10.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

    [colorPicker setColorPicked:^(UIColor *color, CGPoint location) {
        [self.view setBackgroundColor:color];
        [_pickerPopoverController dismissPopoverAnimated:YES];
    }];
    
}

@end
