//
//  ViewController.m
//  HandWarmer
//
//  Created by 谭志强 on 16/9/20.
//  Copyright © 2016年 谭志强. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger,Mode){
    HighMode,
    VeryHighMode,
    CrazyHighMode,
    None,
};


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *highModeButton;
@property (weak, nonatomic) IBOutlet UIButton *veryHighModeButton;
@property (weak, nonatomic) IBOutlet UIButton *crazyHighModeButton;


@property (nonatomic)Mode status;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}


- (IBAction)highAction:(id)sender {
    
    self.highModeButton.selected = !self.highModeButton.selected;
    self.veryHighModeButton.selected = NO;
    self.crazyHighModeButton.selected = NO;
    if (self.highModeButton.selected) {
        self.status = HighMode;
        [self warm:HighMode];
    }else{
        self.status = None;
    }

}

- (IBAction)veryHighAction:(id)sender {
    
    self.veryHighModeButton.selected = !self.veryHighModeButton.selected;
    self.highModeButton.selected = NO;
    self.crazyHighModeButton.selected = NO;
    if (self.veryHighModeButton.selected) {
        self.status = VeryHighMode;
        [self warm:VeryHighMode];
    }else{
        self.status = None;
    }
}

- (IBAction)crazyHighAction:(id)sender {
    
    self.crazyHighModeButton.selected = !self.crazyHighModeButton.selected;
    self.highModeButton.selected = NO;
    self.veryHighModeButton.selected = NO;
    if (self.crazyHighModeButton.selected) {
        self.status = CrazyHighMode;
        [self warm:CrazyHighMode];
    }else{
        self.status = None;
    }
}

- (void)warm:(Mode)mode
{
    int runCount = 0;
    if (mode==HighMode) {
        runCount = 8;
        for (int i = 0; i<runCount; i++) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                while (_status==HighMode) {
                    int i = 3;
//                    printf("%d",i);
                }
            });
        }
    }else if (mode==VeryHighMode){
        runCount = 14;
        for (int i = 0; i<runCount; i++) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                while (_status==VeryHighMode) {
                    int i = 3;
//                    printf("%d",i);
                }
            });
        }
    }else if (mode==CrazyHighMode){
        runCount = 70;
        for (int i = 0; i<runCount; i++) {
            dispatch_queue_t queue = dispatch_queue_create("com.gcd-group.www", DISPATCH_QUEUE_CONCURRENT);
            dispatch_async(queue, ^{
                while (_status==CrazyHighMode) {
                    int i = 3;
                    int j = 4;
                    int z = 5;
                    int y = i+j+z;
//                    printf("%d%d%d",i,j,z);
                }
            });
        }
    }
//    dispatch_queue_t queue = dispatch_queue_create("com.gcd-group.www", DISPATCH_QUEUE_CONCURRENT);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
