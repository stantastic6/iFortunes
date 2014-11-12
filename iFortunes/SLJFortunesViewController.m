//
//  SLJViewController.m
//  iFortunes
//
//  Created by Stanley Jackson on 9/26/14.
//  Copyright (c) 2014 Stanley Jackson. All rights reserved.
//

#import "SLJFortunesViewController.h"

@interface SLJFortunesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fortuneLabel;

@end

@implementation SLJFortunesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.model = [[SLJFortunesModel alloc] init];
    
    UITapGestureRecognizer *singleTap = [[[UITapGestureRecognizer alloc] init] initWithTarget:self action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[[UITapGestureRecognizer alloc] init] initWithTarget:self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];

    
    //Single tap only recognized if it isn't proceeded by another tap
    [singleTap requireGestureRecognizerToFail:doubleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void) singleTapRecognized: (UITapGestureRecognizer *) recognizer {
    [self displayAnswer:self.model.randomAnswer];
}

- (void) doubleTapRecognized: (UITapGestureRecognizer *) recognizer {
    [self displayAnswer:self.model.secretAnswer];

}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self displayAnswer:self.model.randomAnswer];
    }
}

- (void) displayAnswer: (NSString *) answer {
    [UIView animateWithDuration:1.0 animations:^{
    
        self.fortuneLabel.alpha = 0;
    }
     
     completion:^(BOOL finished) {
         [self animateAnswer: answer];
        }
     ];
}


- (void) animateAnswer: (NSString *) answer {
    [UIView animateWithDuration:1.0 animations:^{
        self.fortuneLabel.text = answer;
        
        //If black, set to orange
        if (self.fortuneLabel.textColor == UIColor.blackColor) {
            self.fortuneLabel.textColor = [UIColor orangeColor];
        } else {
            self.fortuneLabel.textColor = UIColor.blackColor;
        }
        
        self.fortuneLabel.alpha = 1;
    }];
}



@end
