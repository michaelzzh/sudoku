//
//  ZZYGViewController.m
//  Sudoku
//
//  Created by Yaxi Gao on 9/12/14.
//  Copyright (c) 2014 Zehao Zhang Yaxi Gao. All rights reserved.
//

#import "ZZYGViewController.h"
#import "ZZYGGrid.h"

int initialGrid[9][9] = {
    {8,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

UIButton* myButtons[9][9];

@interface ZZYGViewController () {
    UIView* _gridView;
    UIButton* _button;
}

@end

@implementation ZZYGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // create grid frame
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    // create grid view
    _gridView = [[ZZYGGrid alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    CGFloat buttonSize = size / 10.0;
    
    [self addButtons:buttonSize];
    
}

- (void)addButtons:(CGFloat) buttonSize
{
    // create button
    
    int row = 14;
    int column;
    int tag = 0;
    
    for (int i = 0; i < 9; i++) {
        column = 14;
        for (int j = 0; j < 9; j++) {
            
            CGRect buttonFrame = CGRectMake(row, column, buttonSize, buttonSize);
            myButtons[i][j] = [[UIButton alloc] initWithFrame:buttonFrame];
            myButtons[i][j].backgroundColor = [UIColor whiteColor];
            myButtons[i][j].tag = tag;
            tag++;
            if (initialGrid[i][j]){
                [myButtons[i][j] setTitle:[NSString stringWithFormat: @"%d", initialGrid[i][j]] forState:UIControlStateNormal];
            }
            [myButtons[i][j] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [_gridView addSubview:myButtons[i][j]];
            
            // create target for button
            [myButtons[i][j] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            column += (buttonSize + 3);
            if ((j + 1) % 3 == 0) {
                column += 5;
            }
        }
        row += (buttonSize + 3);
        if ((i + 1) % 3 == 0) {
            row += 5;
        }
    }
    
    
}

-(int)getButtonRow:(UIButton*)button{
    return button.tag%9;
}

-(int)getButtonCol:(UIButton*)button{
    return button.tag/9;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(UIButton*)sender
{
    NSLog([@"You Pressed the button!" stringByAppendingString: sender.currentTitle]);
    NSLog([NSString stringWithFormat:@"Button row:%d" ,[self getButtonRow:sender]]);
    NSLog([NSString stringWithFormat:@"Button col:%d" ,[self getButtonCol:sender]]);
}

@end