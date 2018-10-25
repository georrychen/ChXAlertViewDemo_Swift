//
//  ViewController.m
//  ChXPopViewDemo
//
//  Created by Xu Chen on 2018/10/25.
//  Copyright © 2018 xu.yzl. All rights reserved.
//

#import "ViewController.h"
#import "ChXPopViewDemo-Swift.h"

@interface ViewController ()<PrivacyViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)pop1Clicked:(UIButton *)sender {
//    ChXBaseAlertView *alertView = [[ChXBaseAlertView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//    alertView.center = self.view.center;
//    [self.view addSubview:alertView];
    
    ChXPrivacyAlertView *alertView = [[ChXPrivacyAlertView alloc] initWithFrame:CGRectMake(0, 0, 350, 500)];
    alertView.center = self.view.center;
    [self.view addSubview:alertView];
}


- (IBAction)pop2Clicked:(id)sender {
//    ChXBaseAlertView *alertView = [ChXBaseAlertView getAlertView];
//    [alertView popToViewWithParentView:self.view];
    
    ChXPrivacyAlertView *alertView = [ChXPrivacyAlertView getPrivacyView];
    alertView.delegate = self;
    [alertView popToViewWithParentView:self.view];
}


// MARK: - PrivacyViewDelegate
- (void)privacyViewButtonDidClicked {
    NSLog(@"ChXPrivacyAlertView - 代理方法" );
}




@end
