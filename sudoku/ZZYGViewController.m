//
//  ZZYGViewController.m
//  sudoku
//
//  Created by Zehao Zhang on 14-9-11.
//  Copyright (c) 2014年 Zehao Zhang Yaxi Gao. All rights reserved.
//

#import "ZZYGViewController.h"
#import "ZZYGGrid.h"

int initialGrid[9][9]={
    {7,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

@interface ZZYGViewController ()
@property UIView* gridView;
@property UIButton* button;


@end

@implementation ZZYGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)* .1;
    CGFloat y = CGRectGetHeight(frame)* .1;
    CGFloat size = MIN(CGRectGetWidth(frame),CGRectGetHeight(frame))* .80;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    _gridView = [[ZZYGGrid alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    CGFloat buttonSize = size/5.0;
    CGRect buttonFrame = CGRectMake(0, 0, buttonSize, buttonSize);
    _button = [[UIButton alloc]initWithFrame:buttonFrame];
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:[NSString stringWithFormat:@"%d", initialGrid[0][0]] forState:UIControlStateNormal];
    [_gridView addSubview:_button];
    
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    


	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(id)sender
{
    NSLog(@"You've pressed the button");
}


@end
