//
//  RootViewController.m
//  QQSmile_
//
//  Created by qianfeng on 14-9-1.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

#define SM_XY 40
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *arr=@[@"2列",@"3列",@"4列",@"5列"];
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:arr];
    seg.frame=CGRectMake(60, 30, 200, 20);
    seg.backgroundColor=[UIColor magentaColor];
    
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
    int colmuns=2;
    int margin=(self.view.frame.size.width-colmuns*40)/(colmuns+1);
    
    CGFloat oneX=margin;
    CGFloat oneY=60;
    
    for(int i=0;i<9;i++)
    {
        NSString *imgName=[NSString stringWithFormat:@"01%d",i];
        
        int col=i%colmuns;
        
        int row=i/colmuns;
        
        CGFloat x=oneX+(margin + SM_XY)*col;
        CGFloat y=oneY+(margin+SM_XY)*row;
        [self addImage:imgName x:x y:y];
    
    }
}
-(void)segClick:(UISegmentedControl *)s
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];
    
    int colmuns=s.selectedSegmentIndex+2;
    int margin=(self.view.frame.size.width-colmuns*SM_XY)/(colmuns+1);
    
    CGFloat oneX=margin;
    CGFloat oneY=60;
    
    for(int i=0;i<9;i++)
    {
    
        int col=i%colmuns;
        
        int row=i/colmuns;
        
        CGFloat x=oneX+(margin + SM_XY)*col;
        CGFloat y=oneY+(margin + SM_XY)*row;
        //跳过segment
        UIView *chlid=self.view.subviews[i+1];
        
        CGRect  tempF=chlid.frame;
        
        tempF.origin=CGPointMake(x, y);
        
        chlid.frame=tempF;
        
    }
    
    [UIView commitAnimations];
}
-(void)addImage:(NSString *)icol x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *vi=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, SM_XY, SM_XY)];
    vi.image=[UIImage imageNamed:icol];
    [self.view addSubview:vi];
    
}


@end
