//
//  STColorPicker.h
//  STColorPickerExample
//
//  Created by Sebastien Thiebaud on 12/7/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

@interface STColorPicker : UIView

@property (nonatomic, copy) void (^colorHasChanged)(UIColor *color, CGPoint location);
@property (nonatomic, copy) void (^colorPicked)(UIColor *color, CGPoint location);

- (void)setColor:(UIColor *)color;

@end
