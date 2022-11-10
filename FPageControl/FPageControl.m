//
//  FPageControl.m
//  FPageControl
//
//  Created by Berdikhan on 08/01/2019.
//

#import "FPageControl.h"

@implementation FPageControl

-(instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customInit];
    }
    return self;
}

-(void)customInit {
    self.dotSize = 5;
    self.dotSpacing = 3;
    [self layoutSubviews];
}

-(void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutSubviews];
    }];
}

-(void)setNumberOfPages:(NSInteger)numberOfPages {
    [super setNumberOfPages:numberOfPages];
    [self layoutSubviews];
}

-(void)prepareForInterfaceBuilder {
    [self layoutSubviews];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSArray<UIView*> *subViews = self.subviews;
    CGFloat mainWidth = self.frame.size.width;
    CGFloat mainHeight = self.frame.size.height;
    if (@available(iOS 14.0, *)) {
        subViews = self.subviews.firstObject.subviews.firstObject.subviews;
        mainWidth = self.subviews.firstObject.subviews.firstObject.frame.size.width;
        mainHeight = self.subviews.firstObject.subviews.firstObject.frame.size.height;
    }
    NSInteger i = 0;
    CGFloat width = self.dotSize * (CGFloat)(subViews.count + 3) + self.dotSpacing * (CGFloat)(subViews.count - 1);
    CGFloat x = mainWidth / 2 - (width / 2);
    CGFloat y = mainHeight / 2 - self.dotSize / 2;
    for (UIView *view in subViews) {
        CGRect frame = view.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        if (self.currentPage == i) {
            frame.size = CGSizeMake(self.dotSize * 4, self.dotSize);
            x += self.dotSize * 4 + self.dotSpacing;
        } else {
            frame.size = CGSizeMake(self.dotSize, self.dotSize);
            x += self.dotSize + self.dotSpacing;
        }
        if (@available(iOS 14.0, *)) {
            if ([view isKindOfClass: [UIImageView class]]) {
                ((UIImageView*)view).image = nil;
            }
            if (self.currentPage == i) {
                view.backgroundColor = self.currentPageIndicatorTintColor;
            } else {
                view.backgroundColor = self.pageIndicatorTintColor;
            }
        }
        view.layer.cornerRadius = self.dotSize / 2;
        view.frame = frame;
        i += 1;
    }
    
}

@end
