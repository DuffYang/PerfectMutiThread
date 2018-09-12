//
//  NSThreadLoadViewController.m
//  MutipleThread
//
//  Created by minggo on 16/1/26.
//  Copyright © 2016年 minggo. All rights reserved.
//

#import "NSThreadLoadViewController.h"

@interface NSThreadLoadViewController ()
- (IBAction)load:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *loadingLb;
@property (strong, nonatomic) NSString *imgUrl;

@end

@implementation NSThreadLoadViewController{
    
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    
    _imgUrl = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*zF0J7XHubBjojgJdYRS0FA.jpeg";
    
    [self implicitCreateThread];
}

//动态创建线程
-(void)dynamicCreateThread{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImageSource:) object:_imgUrl];
    thread.threadPriority = 1;// 设置线程的优先级(0.0 - 1.0，1.0最高级)
    [thread start];
}

//静态创建线程
-(void)staticCreateThread{
    [NSThread detachNewThreadSelector:@selector(loadImageSource:) toTarget:self withObject:_imgUrl];
}

//隐式创建线程
-(void)implicitCreateThread{
    [self performSelectorInBackground:@selector(loadImageSource:) withObject:_imgUrl];
}

-(void)loadImageSource:(NSString *)url{
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (imgData!=nil) {
        [self performSelectorOnMainThread:@selector(refreshImageView:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"there no image data");
    }
    
}

-(void)refreshImageView:(UIImage *)image{
    [self.loadingLb setHidden:YES];
    [self.imageView setImage:image];
}

- (IBAction)load:(id)sender {
    [self.loadingLb setHidden:NO];
    [self.imageView setImage:nil];
    int index = (int)((UIButton *)sender).tag;
    
    switch (index) {
        case 1:
            [self dynamicCreateThread];
            break;
        case 2:
            [self staticCreateThread];
            break;
        case 3:
            [self implicitCreateThread];
            break;
        default:
            break;
    }
    
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [UIImageView new];
        _imageView.frame = CGRectMake(0, 100, 100, 100);
    }
    return _imageView;
}

@end
