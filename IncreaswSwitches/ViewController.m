//
//  ViewController.m
//  IncreaswSwitches
//
//  Created by Alivelu Ravula on 1/29/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createSwitches];
    
}

-(void)createSwitches{

    self.view.backgroundColor=[UIColor orangeColor];
    self.verSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(10, 50, 30, 30)];
    [self.view addSubview:self.verSwitch];
    [self.verSwitch addTarget:self action:@selector(changingSwitch:) forControlEvents:UIControlEventValueChanged];
    
    
    self.horzSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(190, 50, 30, 30)];
    [self.view addSubview:self.horzSwitch];
    [self.horzSwitch addTarget:self action:@selector(changingSwitch:) forControlEvents:UIControlEventValueChanged];
    
    self.slider=[[UISlider alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.slider.minimumValue=0;
    self.slider.maximumValue=30;
    self.slider.minimumTrackTintColor=[UIColor blueColor];
    self.slider.maximumTrackTintColor=[UIColor greenColor];
    [self.view addSubview:self.slider];
    
    
 
    self.sliderLbl=[[UILabel alloc]initWithFrame:CGRectMake(290, 90,70 , 30)];
    self.sliderLbl.backgroundColor=[UIColor whiteColor];
    self.sliderLbl.textColor=[UIColor blueColor];
    [self.view addSubview:self.sliderLbl];
   
    
    
    self.stepper=[[UIStepper alloc]initWithFrame:CGRectMake(300, 700, 30, 30)];
    self.stepper.minimumValue=0;
    self.stepper.maximumValue=30;
    self.stepper.continuous=YES;
    self.stepper.wraps=NO;
    [self.view addSubview:self.stepper];
    
    
    self.steperLbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 700,70 , 30)];
    self.steperLbl.backgroundColor=[UIColor whiteColor];
    self.steperLbl.textColor=[UIColor blueColor];
    [self.view addSubview:self.steperLbl];
    

    
    
    [self.stepper addTarget:self action:@selector(changeStepper:) forControlEvents:UIControlEventValueChanged];
    [self.slider addTarget:self  action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    
    
    
}

-(void)changingSwitch:(id)sender
{
    
    UISwitch *selectedSwitch=sender;
    
if(selectedSwitch==self.verSwitch)
{
if(selectedSwitch.on==YES)
{
    [self.verSwitch setOn:YES animated:YES];
    [self.horzSwitch setOn:NO animated:YES];
}
else
{
    
    [self.verSwitch setOn:NO animated:YES];
    [self.horzSwitch setOn:YES animated:YES];
}}
else
{
    if(selectedSwitch.on==YES)
    {
   [self.horzSwitch setOn:YES animated:YES];
    [self.verSwitch setOn:NO animated:YES];
        }
    else{
        [self.horzSwitch setOn:NO animated:YES];
        [self.verSwitch setOn:YES animated:YES];
        }
          }
    NSLog(@"%d,%d",self.verSwitch.on,self.horzSwitch.on);
    [self changeSlider:self.slider];
}

-(void)changeSlider:(id)sender
{
    UISlider *selectedSlider=sender;
    
    [self.sliderLbl setText:[NSString stringWithFormat:@"%d",(int)selectedSlider.value]];
    
        self.stepper.value=self.slider.value;
    self.myView1=[[UIView alloc]initWithFrame:CGRectMake(10, 130,400,540)];
    self.myView1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.myView1];

    self.myView2=[[UIView alloc]initWithFrame:CGRectMake(10, 130,400,540)];
    [self.view addSubview:self.myView2];
   self.myView2.backgroundColor=[UIColor whiteColor];
    
    
    int x=20,y=40;
    int a=20,b=40;
    
    for(int i=1;i<selectedSlider.value;i++)
    {
    if(self.verSwitch.on==YES)
    {
        
        self.switches=[[UISwitch alloc]initWithFrame:CGRectMake(x,y, 30, 30)];
        self.switches.thumbTintColor=[UIColor orangeColor];
        [self.myView1 addSubview:self.switches];
        
    if(y<=450)
    {
        y=y+50;
    
    }
    else
    {
        x=x+60;
        y=40;
    }}
    else if(self.horzSwitch.on==YES)
    {
        self.switches=[[UISwitch alloc]initWithFrame:CGRectMake(a,b, 30, 30)];
        self.switches.thumbTintColor=[UIColor orangeColor];
       [self.myView2 addSubview:self.switches];
if(a<=300)
{
    a=a+50;
}
else{
    b=b+50;
    a=20;

}
    }
    }
    
    if(self.horzSwitch.on!=YES)
    {
        NSLog(@"Horizantal switch is off");
        [self.myView2 removeFromSuperview];
        }
    else if(self.verSwitch.on!=YES)
    {
        NSLog(@"vertical switch is off");
        [self.myView1 removeFromSuperview];
        }
    }
    
-(void)changeStepper:(id)sender
{
    UIStepper *selectedStepper=sender;
    
    [self.steperLbl setText:[NSString stringWithFormat:@"%d",(int)selectedStepper.value]];
    if(sender==self.stepper)
    {
        NSLog(@"stepper value %f",selectedStepper.value);
        self.slider.value++;
        [self.slider setValue:selectedStepper.value animated:YES];
        [self.slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
        [self changeSlider:self.slider];
    }
    else{
        self.slider.value--;
        [self.slider setValue:selectedStepper.value animated:YES];
        [self.slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
