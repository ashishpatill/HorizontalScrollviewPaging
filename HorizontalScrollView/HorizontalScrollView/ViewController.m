//
//  ViewController.m
//  HorizontalScrollView
//
//  Created by Ashish Pisey on 11/21/14.
//  Copyright (c) 2014 Ashish Pisey. All rights reserved.
//

// Thanks to cwalcott
// http://www.iosdevnotes.com/2011/03/uiscrollview-paging/

#import "ViewController.h"

@interface ViewController ()
{
    int currentPage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*5, self.scrollView.frame.size.height)];
    int xOffset = 0;
    for (int i = 0 ; i<5; i++)
    {
        NSLog(@"xOrigin of container :- %f",(self.ContainerView.frame.size.width * i) + xOffset);
        self.ContainerView = [[UIView alloc]initWithFrame:CGRectMake((self.ContainerView.frame.size.width * i) + xOffset, 0, self.ContainerView.frame.size.width, self.ContainerView.frame.size.height)];
        
        self.textView.text = [NSString stringWithFormat:@"This Text view %d",i+1];
        
        xOffset = 8;
    }
}

//scrolling ends
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //find the page number you are on
    CGFloat pageWidth = scrollView.frame.size.width;
    currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"Scrolling - You are now on page %i",currentPage);
    
    pageControlBeingUsed = NO;
}

- (IBAction)changePage {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * (currentPage + 1);
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

- (IBAction)previousPage {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * (currentPage - 1);
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
