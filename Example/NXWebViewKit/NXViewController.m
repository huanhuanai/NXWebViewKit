//
//  NXViewController.m
//  NXWebViewKit
//
//  Created by kepuna on 10/23/2017.
//  Copyright (c) 2017 kepuna. All rights reserved.
//

#import "NXViewController.h"
#import "NXWebViewController.h"

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(UIButton *)sender {
    
    NXWebViewController *webView = [[NXWebViewController alloc]init];
    [self.navigationController pushViewController:webView animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
