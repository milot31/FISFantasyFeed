//
//  FeedStyleKit.m
//  fantasyFeed
//
//  Created by Phil on 3/8/16.
//  Copyright (c) 2016 Phil. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "FeedStyleKit.h"


@implementation FeedStyleKit

#pragma mark Cache

static UIColor* _gradientColor2 = nil;
static UIColor* _gradientColor3 = nil;

static PCGradient* _gradient = nil;

static UIImage* _imageOfCanvas1 = nil;
static UIImage* _imageOfCanvas2 = nil;
static UIImage* _imageOfCanvas3 = nil;
static UIImage* _imageOfLoading = nil;
static UIImage* _imageOfCanvas4 = nil;

#pragma mark Initialization

+ (void)initialize
{
    // Colors Initialization
    _gradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    _gradientColor3 = [UIColor colorWithRed: 0.927 green: 0.917 blue: 0.917 alpha: .9];

    // Gradients Initialization
    CGFloat gradientLocations[] = {0, 0.49, 1};
    _gradient = [PCGradient gradientWithColors: @[FeedStyleKit.gradientColor3, [FeedStyleKit.gradientColor3 blendedColorWithFraction: 0.5 ofColor: FeedStyleKit.gradientColor2], FeedStyleKit.gradientColor2] locations: gradientLocations];

}

#pragma mark Colors

+ (UIColor*)gradientColor2 { return _gradientColor2; }
+ (UIColor*)gradientColor3 { return _gradientColor3; }

#pragma mark Gradients

+ (PCGradient*)gradient { return _gradient; }

#pragma mark Drawing Methods

+ (void)drawCanvas1
{

    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(37.24, 13.06)];
    [bezier2Path addCurveToPoint: CGPointMake(31.5, 20.12) controlPoint1: CGPointMake(37.24, 16.96) controlPoint2: CGPointMake(34.67, 20.12)];
    [bezier2Path addCurveToPoint: CGPointMake(25.76, 13.06) controlPoint1: CGPointMake(28.33, 20.12) controlPoint2: CGPointMake(25.76, 16.96)];
    [bezier2Path addCurveToPoint: CGPointMake(31.5, 6) controlPoint1: CGPointMake(25.76, 9.16) controlPoint2: CGPointMake(28.33, 6)];
    [bezier2Path addCurveToPoint: CGPointMake(37.24, 13.06) controlPoint1: CGPointMake(34.67, 6) controlPoint2: CGPointMake(37.24, 9.16)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(48.19, 17.09)];
    [bezier2Path addCurveToPoint: CGPointMake(43.48, 22.79) controlPoint1: CGPointMake(48.19, 20.22) controlPoint2: CGPointMake(46.1, 22.79)];
    [bezier2Path addCurveToPoint: CGPointMake(38.76, 17.09) controlPoint1: CGPointMake(40.85, 22.79) controlPoint2: CGPointMake(38.76, 20.22)];
    [bezier2Path addCurveToPoint: CGPointMake(43.48, 11.39) controlPoint1: CGPointMake(38.76, 13.96) controlPoint2: CGPointMake(40.85, 11.39)];
    [bezier2Path addCurveToPoint: CGPointMake(48.19, 17.09) controlPoint1: CGPointMake(46.1, 11.39) controlPoint2: CGPointMake(48.19, 13.96)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(14.81, 17.09)];
    [bezier2Path addCurveToPoint: CGPointMake(19.52, 22.79) controlPoint1: CGPointMake(14.81, 20.22) controlPoint2: CGPointMake(16.9, 22.79)];
    [bezier2Path addCurveToPoint: CGPointMake(24.24, 17.09) controlPoint1: CGPointMake(22.15, 22.79) controlPoint2: CGPointMake(24.24, 20.22)];
    [bezier2Path addCurveToPoint: CGPointMake(19.52, 11.39) controlPoint1: CGPointMake(24.24, 13.96) controlPoint2: CGPointMake(22.15, 11.39)];
    [bezier2Path addCurveToPoint: CGPointMake(14.81, 17.09) controlPoint1: CGPointMake(16.9, 11.39) controlPoint2: CGPointMake(14.81, 13.96)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(29.21, 19.99)];
    [bezier2Path addCurveToPoint: CGPointMake(26.15, 23.33) controlPoint1: CGPointMake(29.21, 23.84) controlPoint2: CGPointMake(26.15, 23.33)];
    [bezier2Path addCurveToPoint: CGPointMake(22.32, 23.33) controlPoint1: CGPointMake(26.15, 23.33) controlPoint2: CGPointMake(22.32, 21.27)];
    [bezier2Path addCurveToPoint: CGPointMake(22.32, 30) controlPoint1: CGPointMake(22.32, 25.38) controlPoint2: CGPointMake(22.32, 30)];
    [bezier2Path moveToPoint: CGPointMake(33.79, 19.99)];
    [bezier2Path addCurveToPoint: CGPointMake(36.85, 23.33) controlPoint1: CGPointMake(33.79, 23.84) controlPoint2: CGPointMake(36.85, 23.33)];
    [bezier2Path addCurveToPoint: CGPointMake(40.68, 23.33) controlPoint1: CGPointMake(36.85, 23.33) controlPoint2: CGPointMake(40.68, 21.27)];
    [bezier2Path addCurveToPoint: CGPointMake(40.68, 30) controlPoint1: CGPointMake(40.68, 25.38) controlPoint2: CGPointMake(40.68, 30)];
    [bezier2Path moveToPoint: CGPointMake(45.9, 22.17)];
    [bezier2Path addCurveToPoint: CGPointMake(47.43, 24.74) controlPoint1: CGPointMake(46.92, 24.74) controlPoint2: CGPointMake(47.43, 24.74)];
    [bezier2Path addCurveToPoint: CGPointMake(51, 24.74) controlPoint1: CGPointMake(47.43, 24.74) controlPoint2: CGPointMake(51, 23.45)];
    [bezier2Path addCurveToPoint: CGPointMake(51, 29.87) controlPoint1: CGPointMake(51, 26.02) controlPoint2: CGPointMake(51, 29.87)];
    [bezier2Path moveToPoint: CGPointMake(17.1, 22.17)];
    [bezier2Path addCurveToPoint: CGPointMake(15.57, 24.74) controlPoint1: CGPointMake(16.08, 24.74) controlPoint2: CGPointMake(15.57, 24.74)];
    [bezier2Path addCurveToPoint: CGPointMake(12, 24.74) controlPoint1: CGPointMake(15.57, 24.74) controlPoint2: CGPointMake(12, 23.45)];
    [bezier2Path addCurveToPoint: CGPointMake(12, 29.87) controlPoint1: CGPointMake(12, 26.02) controlPoint2: CGPointMake(12, 29.87)];
    [UIColor.blackColor setStroke];
    bezier2Path.lineWidth = 2;
    [bezier2Path stroke];
}

+ (void)drawCanvas2
{

    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(4, 6, 24, 29)];
    [UIColor.blackColor setStroke];
    rectanglePath.lineWidth = 2.2;
    [rectanglePath stroke];


    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(9, 11, 6, 9)];
    [UIColor.blackColor setStroke];
    rectangle2Path.lineWidth = 1.5;
    [rectangle2Path stroke];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 2.5;
    [bezierPath stroke];


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(18, 14)];
    [bezier2Path addLineToPoint: CGPointMake(23, 14)];
    [UIColor.blackColor setStroke];
    bezier2Path.lineWidth = 1.5;
    [bezier2Path stroke];


    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(8, 25)];
    [bezier5Path addLineToPoint: CGPointMake(23, 25)];
    [UIColor.blackColor setStroke];
    bezier5Path.lineWidth = 1.5;
    [bezier5Path stroke];


    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(18, 19)];
    [bezier3Path addLineToPoint: CGPointMake(23, 19)];
    [UIColor.blackColor setStroke];
    bezier3Path.lineWidth = 1.5;
    [bezier3Path stroke];


    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(8, 30)];
    [bezier4Path addLineToPoint: CGPointMake(23, 30)];
    [UIColor.blackColor setStroke];
    bezier4Path.lineWidth = 1.5;
    [bezier4Path stroke];
}

+ (void)drawCanvas3
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color4 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];

    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(52, 53)];
    [bezierPath addCurveToPoint: CGPointMake(24, 76) controlPoint1: CGPointMake(24, 53) controlPoint2: CGPointMake(24, 76)];
    bezierPath.lineCapStyle = kCGLineCapRound;

    [UIColor.lightGrayColor setStroke];
    bezierPath.lineWidth = 4;
    [bezierPath stroke];


    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(89, 76.5)];
    [bezier3Path addCurveToPoint: CGPointMake(49.5, 116) controlPoint1: CGPointMake(89, 98.32) controlPoint2: CGPointMake(71.32, 116)];
    [bezier3Path addCurveToPoint: CGPointMake(10, 76.5) controlPoint1: CGPointMake(27.68, 116) controlPoint2: CGPointMake(10, 98.32)];
    [bezier3Path addCurveToPoint: CGPointMake(49.5, 37) controlPoint1: CGPointMake(10, 54.68) controlPoint2: CGPointMake(27.68, 37)];
    [bezier3Path addCurveToPoint: CGPointMake(89, 76.5) controlPoint1: CGPointMake(71.32, 37) controlPoint2: CGPointMake(89, 54.68)];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(78, 107)];
    [bezier3Path addLineToPoint: CGPointMake(130, 161)];
    bezier3Path.lineCapStyle = kCGLineCapRound;

    [color4 setStroke];
    bezier3Path.lineWidth = 10;
    [bezier3Path stroke];


    //// Text Drawing
    CGRect textRect = CGRectMake(12, 177, 116, 28);
    {
        NSString* textContent = @"no tweets found";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"GillSans" size: UIFont.labelFontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
}

+ (void)drawLoading
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Text Drawing
    CGRect textRect = CGRectMake(0, -1, 36, 11);
    {
        NSString* textContent = @"loading…";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"GillSans" size: 9], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
}

+ (void)drawCanvas4
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color6 = [UIColor colorWithRed: 0.445 green: 0.938 blue: 1 alpha: 1];

    //// Text Drawing
    CGRect textRect = CGRectMake(-31, 0, 171, 26);
    {
        NSString* textContent = @"To assemble your\nteam, tap the + button";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;

        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: 10], NSForegroundColorAttributeName: color6, NSParagraphStyleAttributeName: textStyle};

        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
}

#pragma mark Generated Images

+ (UIImage*)imageOfCanvas1
{
    if (_imageOfCanvas1)
        return _imageOfCanvas1;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(62, 30), NO, 0.0f);
    [FeedStyleKit drawCanvas1];

    _imageOfCanvas1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCanvas1;
}

+ (UIImage*)imageOfCanvas2
{
    if (_imageOfCanvas2)
        return _imageOfCanvas2;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(32, 38), NO, 0.0f);
    [FeedStyleKit drawCanvas2];

    _imageOfCanvas2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCanvas2;
}

+ (UIImage*)imageOfCanvas3
{
    if (_imageOfCanvas3)
        return _imageOfCanvas3;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(142, 205), NO, 0.0f);
    [FeedStyleKit drawCanvas3];

    _imageOfCanvas3 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCanvas3;
}

+ (UIImage*)imageOfLoading
{
    if (_imageOfLoading)
        return _imageOfLoading;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 10), NO, 0.0f);
    [FeedStyleKit drawLoading];

    _imageOfLoading = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfLoading;
}

+ (UIImage*)imageOfCanvas4
{
    if (_imageOfCanvas4)
        return _imageOfCanvas4;

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(111, 26), NO, 0.0f);
    [FeedStyleKit drawCanvas4];

    _imageOfCanvas4 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return _imageOfCanvas4;
}

#pragma mark Customization Infrastructure

- (void)setCanvas1Targets: (NSArray*)canvas1Targets
{
    _canvas1Targets = canvas1Targets;

    for (id target in self.canvas1Targets)
        [target performSelector: @selector(setImage:) withObject: FeedStyleKit.imageOfCanvas1];
}

- (void)setCanvas2Targets: (NSArray*)canvas2Targets
{
    _canvas2Targets = canvas2Targets;

    for (id target in self.canvas2Targets)
        [target performSelector: @selector(setImage:) withObject: FeedStyleKit.imageOfCanvas2];
}

- (void)setCanvas3Targets: (NSArray*)canvas3Targets
{
    _canvas3Targets = canvas3Targets;

    for (id target in self.canvas3Targets)
        [target performSelector: @selector(setImage:) withObject: FeedStyleKit.imageOfCanvas3];
}

- (void)setLoadingTargets: (NSArray*)loadingTargets
{
    _loadingTargets = loadingTargets;

    for (id target in self.loadingTargets)
        [target performSelector: @selector(setImage:) withObject: FeedStyleKit.imageOfLoading];
}

- (void)setCanvas4Targets: (NSArray*)canvas4Targets
{
    _canvas4Targets = canvas4Targets;

    for (id target in self.canvas4Targets)
        [target performSelector: @selector(setImage:) withObject: FeedStyleKit.imageOfCanvas4];
}


@end



@interface PCGradient ()
{
    CGGradientRef _CGGradient;
}
@end

@implementation PCGradient

- (instancetype)initWithColors: (NSArray*)colors locations: (const CGFloat*)locations
{
    self = [self init];
    if (self)
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        NSMutableArray* cgColors = [NSMutableArray array];
        for (UIColor* color in colors)
            [cgColors addObject: (id)color.CGColor];

        _CGGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)cgColors, locations);
        CGColorSpaceRelease(colorSpace);
    }
    return self;
}

+ (instancetype)gradientWithColors: (NSArray*)colors locations: (const CGFloat*)locations
{
    return [[self alloc] initWithColors: colors locations: locations];
}

+ (instancetype)gradientWithStartingColor: (UIColor*)startingColor endingColor: (UIColor*)endingColor
{
    CGFloat locations[] = {0, 1};
    return [[self alloc] initWithColors: @[startingColor, endingColor] locations: locations];
}

- (void)dealloc
{
    CGGradientRelease(_CGGradient);
}

@end



@implementation UIColor (PaintCodeAdditions)

- (UIColor*)blendedColorWithFraction: (CGFloat)fraction ofColor: (UIColor*)color2
{
    UIColor* color1 = self;

    CGFloat r1 = 0, g1 = 0, b1 = 0, a1 = 0;
    CGFloat r2 = 0, g2 = 0, b2 = 0, a2 = 0;


    [color1 getRed: &r1 green: &g1 blue: &b1 alpha: &a1];
    [color2 getRed: &r2 green: &g2 blue: &b2 alpha: &a2];

    CGFloat r = r1 * (1 - fraction) + r2 * fraction;
    CGFloat g = g1 * (1 - fraction) + g2 * fraction;
    CGFloat b = b1 * (1 - fraction) + b2 * fraction;
    CGFloat a = a1 * (1 - fraction) + a2 * fraction;

    return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

@end
