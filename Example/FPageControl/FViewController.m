//
//  FViewController.m
//  FPageControl
//
//  Created by Berdikhan on 01/08/2019.
//  Copyright (c) 2019 Berdikhan. All rights reserved.
//

#import "FViewController.h"
#import "FPageControl.h"

@interface FViewController ()
@property (strong, nonatomic) IBOutlet FPageControl *pageControl;

@end

@implementation FViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)minus:(id)sender {
    NSInteger currentPage = _pageControl.currentPage;
    if (currentPage > 0) {
        currentPage -= 1;
    }
    [_pageControl setCurrentPage:currentPage];
}
- (IBAction)plus:(id)sender {
    NSInteger currentPage = _pageControl.currentPage;
    currentPage += 1;
    [_pageControl setCurrentPage:currentPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
