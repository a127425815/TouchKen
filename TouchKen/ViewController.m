//
//  ViewController.m
//  TouchKen
//
//  Created by Mac User on 2015/1/30.
//  Copyright (c) 2015年 Mac User. All rights reserved.
//

#import "ViewController.h"
#import "Ken.h"

@interface ViewController ()<KenDelegate>
{
    NSInteger nTag;
}
@property (weak, nonatomic) IBOutlet UIView *gray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    nTag = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    Ken *ken = [[Ken alloc] initWithPoint:point atDirection:nTag%2];
    ken.tag = nTag;
    ken.delegate = self;
    nTag++;
    [self.view addSubview:ken];
}

- (IBAction)leftAction:(id)sender {
    Ken *now = [self.view.subviews lastObject];
    [now GoLeft];
//    NSLog(@"%@",self.view.subviews);
    
}

- (IBAction)rightAction:(id)sender {
    Ken *now = [self.view.subviews lastObject];
    [now GoRight];
}

-(void)Ken:(Ken *)ken didFinishedMovedWithStatus:(NSDictionary *)status
{
    NSLog(@"%@",status);
    if (CGRectIntersectsRect(ken.frame, self.gray.frame)) {
        [ken removeFromSuperview];
    }
}

-(void)didTouchedKenTag:(long)tag
{
    NSLog(@"You touch Ken id: %ld",tag);
}
-(void)didDropInGray:(long)tag
{
    NSLog(@"Tag %ld Drop in gray",tag);
}
@end
