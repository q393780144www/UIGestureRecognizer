//
//  YGHRootViewController.m
//  UIGestureRecognizer
//
//  Created by mac on 14-9-27.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHRootViewController.h"

@interface YGHRootViewController ()<UIGestureRecognizerDelegate>

@end
UIView *ve;
@implementation YGHRootViewController

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
   ve=[[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 120)];
    ve.backgroundColor=[UIColor redColor];
    UIRotationGestureRecognizer *rota=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(go:)];

    [ve addGestureRecognizer:rota];
    UIPinchGestureRecognizer *pin=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(go:)];
      UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(go:)];
    [ve addGestureRecognizer:pan];
    [ve addGestureRecognizer:rota];
    [ve addGestureRecognizer:pin];
    pan.delegate=self;
    rota.delegate=self;
    pin.delegate=self;
    ve.userInteractionEnabled=YES;
    [self.view addSubview:ve];
    // Do any additional setup after loading the view.
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return  YES;
}
-(void)go:(UIGestureRecognizer *)tap
{
    if([tap isMemberOfClass:[UIRotationGestureRecognizer class]])
    {     UIRotationGestureRecognizer *tap1=(UIRotationGestureRecognizer *)tap;
          ve.transform=CGAffineTransformRotate(ve.transform, tap1.rotation);
        tap1.rotation=0.0f;}
    else if([tap isMemberOfClass:[UIPinchGestureRecognizer class]])
    {     UIPinchGestureRecognizer *tap1=(UIPinchGestureRecognizer *)tap;
        ve.transform=CGAffineTransformScale(ve.transform, tap1.scale, tap1.scale);
        tap1.scale=1.0f;}
    else if([tap isMemberOfClass:[UIPanGestureRecognizer class]])
        {
            UIPanGestureRecognizer *tap1=(UIPanGestureRecognizer *)tap;
            CGPoint tranlate=[tap1 translationInView:tap.view];
             NSLog(@"%@",NSStringFromCGPoint( tranlate));
            ve.transform=CGAffineTransformTranslate(ve.transform,tranlate.x , tranlate.y);
            [tap1 setTranslation:CGPointZero inView:tap.view];
           
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
