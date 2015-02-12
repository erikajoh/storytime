//
//  ViewController.h
//  Story
//
//  Created by Erika Johnson on 2/11/15.
//  Copyright (c) 2015 Erika Marie Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIView *settingsView;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *secondNameField;
@property (weak, nonatomic) IBOutlet UITextField *placeField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UITextField *animalField;
@property (weak, nonatomic) IBOutlet UITextField *activityField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *schoolPicker;
@property (weak, nonatomic) IBOutlet UISwitch *happySwitch;

@end

