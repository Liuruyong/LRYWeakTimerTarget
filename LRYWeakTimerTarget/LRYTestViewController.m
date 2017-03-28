//
//  LRYTestViewController.m
//  LRYWeakTimerTarget
//
//  Created by mac on 28/03/2017.
//  Copyright © 2017 liuruyong. All rights reserved.
//

#import "LRYTestViewController.h"
#import "LRYWeakTimerTarget.h"

@interface LRYTestViewController ()

@property (nonatomic,assign) BOOL grayColor;

@end

@implementation LRYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.grayColor = YES;
    self.view.backgroundColor = [UIColor grayColor];
    
    [LRYWeakTimerTarget scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(testTimer)];
}

- (void)testTimer {
    self.grayColor = !self.grayColor;
    self.grayColor?(self.view.backgroundColor = [UIColor grayColor]):(self.view.backgroundColor = [UIColor redColor]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    
}
@end
