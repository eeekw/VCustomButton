# VCustomButton
自定义Button图文排列
# 如何使用
    let button = VNormalButton()
    //设置图文排列方式
    button.imagePosition = .top
    //同样可设置edgeInsets
    button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    button.titleEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    self.view.addSubview(button)
    //可使用autolayout布局
    button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    //autolayout布局省略
    button.sizeToFit()
    
# 截图
<img width=50% height=50% src="https://github.com/silencervic/VCustomButton/blob/master/screenshots/screenshot1.png"/>
<img width=50% height=50% src="https://github.com/silencervic/VCustomButton/blob/master/screenshots/screenshot2.png"/>
<img width=50% height=50% src="https://github.com/silencervic/VCustomButton/blob/master/screenshots/screenshot3.png"/>
