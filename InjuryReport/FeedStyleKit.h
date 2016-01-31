//
//  FeedStyleKit.h
//  fantasyFeed
//
//  Created by Phil on 1/31/16.
//  Copyright (c) 2016 Phil. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class PCGradient;

@interface FeedStyleKit : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* canvas1Targets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* canvas2Targets;

// Colors
+ (UIColor*)gradientColor2;
+ (UIColor*)gradientColor3;

// Gradients
+ (PCGradient*)gradient;

// Generated Images
+ (UIImage*)imageOfCanvas1;
+ (UIImage*)imageOfCanvas2;

@end



@interface PCGradient : NSObject
@property(nonatomic, readonly) CGGradientRef CGGradient;
- (CGGradientRef)CGGradient NS_RETURNS_INNER_POINTER;

+ (instancetype)gradientWithColors: (NSArray*)colors locations: (const CGFloat*)locations;
+ (instancetype)gradientWithStartingColor: (UIColor*)startingColor endingColor: (UIColor*)endingColor;

@end



@interface UIColor (PaintCodeAdditions)

- (UIColor*)blendedColorWithFraction: (CGFloat)fraction ofColor: (UIColor*)color;

@end
