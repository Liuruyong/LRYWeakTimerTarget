//
//  ViewController.m
//  LRYWeakTimerTarget
//
//  Created by mac on 28/03/2017.
//  Copyright © 2017 liuruyong. All rights reserved.
//

#import "ViewController.h"
#import "LRYTestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LRYTestViewController * vc = [[LRYTestViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
