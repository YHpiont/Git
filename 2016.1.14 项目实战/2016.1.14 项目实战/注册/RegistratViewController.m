//
//  RegistratViewController.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/17.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "RegistratViewController.h"
#import "RegistrationView.h"
#import "Masonry.h"
#import "NSString+Helper.h"
#import "ZJPBaseHttpTool.h"
#import "UIView+Toast.h"
@interface RegistratViewController ()<UIActionSheetDelegate,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(strong,nonatomic) RegistrationView * registrView;
@property(strong,nonatomic) UIButton * backBtn;
@property(strong,nonatomic) UIButton * imageBtn;
@property (copy, nonatomic) NSString * imageFiled;

@end

@implementation RegistratViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.registrView];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.imageBtn];
    [self setAutoLayout];
}

-(RegistrationView * )registrView{
    if (!_registrView) {
        _registrView = [[RegistrationView alloc]init];
        _registrView.nameField.delegate = self;
        _registrView.emailField.delegate = self;
        _registrView.passwordField.delegate = self;
        [_registrView.completeBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _registrView;
}

-(UIButton * ) backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
            [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UIButton * ) imageBtn{
    if (!_imageBtn) {
        _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_imageBtn setBackgroundImage:[UIImage imageNamed:@"注册头像"] forState:UIControlStateNormal];
            [_imageBtn addTarget:self action:@selector(imageBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageBtn;
}

//-(void)creatUI{
//    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
//    [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_backBtn];
//    
//    
//    _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_imageBtn setBackgroundImage:[UIImage imageNamed:@"注册头像"] forState:UIControlStateNormal];
//    [_imageBtn addTarget:self action:@selector(imageBtnMethod) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_imageBtn];
//}

-(void)setAutoLayout{
    WS(weakSelf);
    [_registrView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-35);
        make.height.equalTo(320);
    }];
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(20);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
        make.size.equalTo(CGSizeMake(40, 20));
    }];
    
    [_imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-200);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
}

-(void)backBtnAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loginHttpRequest{
    //点击完成的时候隐藏键盘

    //判断用户名是否为空，isEmptyString方法是NSString + helper中的
//    if ([_registrView.nameField.text isEmptyString]) {
//        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
//    }
//    //判断密码是否为空，isEmptyString方法是NSString + helper中的
//    else if ([_registrView.passwordField.text isEmptyString]){
//        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
//    }
//    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
//    else if ([_registrView.emailField.text isEmptyString]){
//        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
//    }
//    //判断头像是否为空，isEmptyString方法是NSString + helper中的
//    else if ([_imageBtn.currentImage isEqual:[UIImage imageNamed:@"上传头像"]]){
//        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
//    }
//    else{
        //开始进行网络请求，上传头像到服务器
        WS(weakSelf);
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeLoginRequestDic] image:_imageFiled success:^(id JSON) {
            NSDictionary *returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if ([returnDic[@"result"] integerValue] == 1) {
                //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三个
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
        }];
//    }
}


- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_registrView.emailField.text,
                          @"gender":@"1",
                          @"passwd":_registrView.passwordField.text,
                          @"uname":_registrView.nameField.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageBtn};
    return dic;
}

//判断是从相册还是相机获取图片
- (void)imageBtnMethod{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选择", nil];
    sheet.destructiveButtonIndex = -1; //设置那一个显示红色文字提示
    [sheet showInView:self.view];
}

//actionSheet的代理方法，每一个buttonindex的点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        //相机拍照
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if (buttonIndex == 1){
        //相册选择
        UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
        imagePicker.delegate=self;
        imagePicker.allowsEditing=YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

//UIImagePickerController的代理方法，选择好照片后会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //获得图片
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //获取沙盒目录
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSLog(@"------------%@",homePath);
    //将图片名字拼接到路径后面
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    //将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    //将图片路径保存下来，因为在上传图片的时候会用到
    self.imageFiled = imageViews;
    //更新imageBtn的图片
    [_imageBtn setImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//开始编辑的时候屏幕上移
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _registrView.nameField) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else if(textField == _registrView.emailField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 150;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}

//点击return隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}
//点击屏幕键盘隐藏
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_registrView.nameField resignFirstResponder];
    [_registrView.emailField resignFirstResponder];
    [_registrView.passwordField resignFirstResponder];
    WS(weakSelf);
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 0;
            weakSelf.view.bounds = rect;
        }];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y =0;
            weakSelf.view.bounds = rect;
        }];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y =0;
            weakSelf.view.bounds = rect;
        }];
    return;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
