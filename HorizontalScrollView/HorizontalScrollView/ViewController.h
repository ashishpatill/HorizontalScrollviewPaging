//
//  ViewController.h
//  HorizontalScrollView
//
//  Created by Ashish Pisey on 11/21/14.
//  Copyright (c) 2014 Ashish Pisey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
      BOOL pageControlBeingUsed;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (retain, nonatomic) IBOutlet UIView *ContainerView;

@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@property (retain, nonatomic) IBOutlet UITextView *textView;

@end

