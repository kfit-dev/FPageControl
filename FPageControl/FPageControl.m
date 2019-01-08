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

- (void)awakeFromNib {
    [super awakeFromNib];
    [self customInit];
}

-(void)customInit {
    self.dotSize = 5;
    self.dotSpacing = 3;
    [self layoutSubviews];
}

-(void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    [self layoutSubviews];
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
    NSInteger i = 0;
    CGFloat width = self.dotSize * (CGFloat)(self.subviews.count + 1) + self.dotSpacing * (CGFloat)(self.subviews.count - 1);
    CGFloat x = self.frame.size.width / 2 - (width / 2);
    CGFloat y = self.frame.size.height / 2 - self.dotSize / 2;
    for (UIView *view in self.subviews) {
        CGRect frame = view.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        if (self.currentPage == i) {
            frame.size = CGSizeMake(self.dotSize * 2, self.dotSize);
            x += self.dotSize * 2 + self.dotSpacing;
        } else {
            frame.size = CGSizeMake(self.dotSize, self.dotSize);
            x += self.dotSize + self.dotSpacing;
        }
        view.layer.cornerRadius = self.dotSize / 2;
        view.frame = frame;
        i += 1;
    }
}

@end
