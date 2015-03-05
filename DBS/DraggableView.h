#import <UIKit/UIKit.h>
#import "OverlayView.h"
#import "ProfileViewController.h"

@protocol DraggableViewDelegate <NSObject>

-(void)cardSwipedLeft:(UIView *)card;
-(void)cardSwipedRight:(UIView *)card;

@end

@interface DraggableView : UIView

@property (weak) id <DraggableViewDelegate> delegate;

@property (nonatomic, strong)UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic)CGPoint originalPoint;
@property (nonatomic,strong)OverlayView* overlayView;
@property (nonatomic, strong) NSDictionary *passingData;
//@property (nonatomic,strong)UILabel* information; //%%% a placeholder for any card-specific information
@property (nonatomic, strong) ProfileViewController *profileVC;

-(void)leftClickAction;
-(void)rightClickAction;


@end
