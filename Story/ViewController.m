//
//  ViewController.m
//  Story
//
//  Created by Erika Johnson on 2/11/15.
//  Copyright (c) 2015 Erika Marie Johnson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.settingsView setHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // done button was pressed - dismiss keyboard
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)toggleShowHide:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSInteger segment = segmentedControl.selectedSegmentIndex;
    if (segment == 0) // less
        [self.settingsView setHidden:YES];
    else // more
        [self.settingsView setHidden:NO];
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int numberAsInt = (int) (slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", numberAsInt];
    self.sliderLabel.text = newText;
}

- (IBAction)stepperChanged:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    int stepperNum = (int)stepper.value;
    NSString *numDollars = [[NSString alloc] initWithFormat:@"%d", stepperNum];
    self.stepperLabel.text = numDollars;
}

- (IBAction)hideKeyboard:(id)sender {
    [self.nameField resignFirstResponder];
    [self.secondNameField resignFirstResponder];
    [self.placeField resignFirstResponder];
    [self.numberField resignFirstResponder];
    [self.animalField resignFirstResponder];
    [self.activityField resignFirstResponder];
}

- (IBAction)createStory:(id)sender {
    if ((((([self.nameField.text isEqual:@""] && [self.secondNameField.text isEqual:@""]) && [self.placeField.text isEqual:@""]) && [self.numberField.text isEqual:@""]) && [self.animalField.text isEqual:@""]) && [self.activityField.text isEqual:@""]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoopsie!" message:@"Why didn't you enter all the information in the text fields? :(" delegate:self cancelButtonTitle:nil otherButtonTitles:@"I'll do better this time", nil];
            [alertView show];
    } else {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Is it storytime?" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Yeah man!!!", nil];
        [actionSheet showFromRect: self.createButton.frame inView: self.createButton.superview animated: YES];
        [actionSheet showInView:self.view];
    }
}

- (void) actionSheet: (UIActionSheet *) actionSheet
clickedButtonAtIndex: (NSInteger) buttonIndex {
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        [self createStory];
    }
}

- (void) createStory {
    NSString *name = self.nameField.text;
    NSString *secondName = self.secondNameField.text;
    NSString *place = self.placeField.text;
    NSString *number = self.numberField.text;
    NSString *animal = self.animalField.text;
    NSString *activity = self.activityField.text;
    NSString *age = self.sliderLabel.text;
    NSInteger segment = self.schoolPicker.selectedSegmentIndex;
    NSString *school;
    if (segment == 0) // USC
        school = @"USC";
    else if (segment == 1) // UCLA
        school = @"UCLA";
    else if (segment == 2) // Stanford
        school = @"Stanford";
    else if (segment == 3) // Berkeley
        school = @"Berkeley";
    NSString *money = self.stepperLabel.text;
    NSString *title = [NSString stringWithFormat:@"%@ the %@", name, animal];
    NSString *story;
    if (self.happySwitch.isOn){
        story = [NSString stringWithFormat:@"%@ is a %@ who will be born in %@ years. And at the age of %@, %@ will graduate from %@ with a Bachelor's degree in %@. %@ will then meet a wonderful %@, %@, and go on to live happily ever after with %@ in %@, making $%@/second doing %@. The end :)", name, animal, age, number, name, school, activity, name, animal, secondName, secondName, place, money, activity];
    } else {
        story = [NSString stringWithFormat:@"%@ was a %@ who died %@ years ago. At the age of %@, %@ dropped out of %@ after studying %@. %@ then met a terrible %@, %@, and went on to live sadly ever after with %@ in %@, making $%@/decade doing %@. The end :(", name, animal, age, number, name, school, activity, name, animal, secondName, secondName, place, money, activity];
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:story delegate:self cancelButtonTitle:nil otherButtonTitles:@"Cool", nil];
    [alertView show];
}

@end
