//
//  RootViewController.h
//  Prototipo
//
//  Created by Rodrigo Maicá on 8/10/16.
//  Copyright © 2016 Rodrigo Maicá. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialViewController.h"

@interface RootViewController : UIViewController<UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *PageViewController;
@property (nonatomic,strong) NSArray *arrPageTitles;

@end
