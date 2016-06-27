//
//  FISViewController.m
//  horizontal-profile
//
//  Created by Ryan Cohen on 6/27/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISViewController.h"

#define HORIZONTAL self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact
#define IPHONE_6_PLUS self.traitCollection.displayScale == 3.f

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *factLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) NSLayoutConstraint *profileImageTopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *nameLabelTopConstraint;

@property (nonatomic, strong) NSLayoutConstraint *textViewTopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *textViewLeftConstraint;

@end

@implementation FISViewController

#pragma mark - Lorem Ipsum

- (void)loremIpsum {
    self.coverImageView.image = [UIImage imageNamed:@"yosemite"];
    self.profileImageView.image = [UIImage imageNamed:@"pipe"];
    
    self.nameLabel.text = @"Lorem Ipsum";
    self.classLabel.text = @"iOS 06/16";
    self.factLabel.text = @"Having fun!";
}

- (void)setupView {
    [self.view removeConstraints:self.view.constraints];
    
    [self.coverImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.coverImageView.bottomAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.f].active = YES;
    [self.coverImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.coverImageView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    
    self.profileImageTopConstraint = [self.profileImageView.topAnchor constraintEqualToAnchor:self.coverImageView.bottomAnchor constant:20.f];
    [self.profileImageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20.f].active = YES;
    self.profileImageTopConstraint.active = YES;

    self.nameLabelTopConstraint = [self.nameLabel.topAnchor constraintEqualToAnchor:self.coverImageView.bottomAnchor constant:20.f];
    [self.nameLabel.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:15.f].active = YES;
    self.nameLabelTopConstraint.active = YES;
    
    [self.classLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor constant:10.f].active = YES;
    [self.classLabel.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:15.f].active = YES;
    
    [self.factLabel.topAnchor constraintEqualToAnchor:self.classLabel.bottomAnchor constant:10.f].active = YES;
    [self.factLabel.leftAnchor constraintEqualToAnchor:self.profileImageView.rightAnchor constant:15.f].active = YES;
    
    self.textViewTopConstraint = [self.textView.topAnchor constraintEqualToAnchor:self.profileImageView.bottomAnchor constant:20.f];
    self.textViewTopConstraint.active = YES;
    
    self.textViewLeftConstraint = [self.textView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20.f];
    self.textViewLeftConstraint.active = YES;
    
    [self.textView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20.f].active = YES;
    [self.textView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20.f].active = YES;
}

#pragma mark - View

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (HORIZONTAL) {
        if (IPHONE_6_PLUS) {
            self.coverImageView.hidden = NO;
            self.textViewTopConstraint.constant = -100.f;
            self.textViewLeftConstraint.constant = 290.f;
        } else {
            self.coverImageView.hidden = YES;
            self.profileImageTopConstraint.constant = -120.f;
            self.nameLabelTopConstraint.constant = -120.f;
        }
    
    } else {
        self.profileImageTopConstraint.constant = 20.f;
        self.nameLabelTopConstraint.constant = 20.f;
        self.textViewTopConstraint.constant = 20.f;
        self.coverImageView.hidden = NO;
        
        if (IPHONE_6_PLUS) {
            self.textViewTopConstraint.constant = 30.f;
            self.textViewLeftConstraint.constant = 20.f;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loremIpsum];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
