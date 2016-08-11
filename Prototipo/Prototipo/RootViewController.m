//
//  RootViewController.m
//  Prototipo
//
//  Created by Rodrigo Maicá on 8/10/16.
//  Copyright © 2016 Rodrigo Maicá. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize PageViewController,arrPageTitles;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrPageTitles = @[@"Página 1",@"Página 2",@"Página 3"];
    
    // Create page view controller
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.PageViewController.dataSource = self;
    
    TutorialViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.PageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:PageViewController];
    [self.view addSubview:PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Datasource Methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((TutorialViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;

    if (index == [self.arrPageTitles count])
    {
        return [self viewControllerAtIndex:0];
    }
    return [self viewControllerAtIndex:index];
}

#pragma mark - Other Methods
- (TutorialViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.arrPageTitles count] == 0) || (index >= [self.arrPageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    TutorialViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialContentViewController"];
    pageContentViewController.txtTitle = self.arrPageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - No of Pages Methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.arrPageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
