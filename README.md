# mask.js
创建遮罩的简单方式


## 用法

```
var Mask = require("mask");
var myMask = Mask({
  style: {
    zIndex: 1000
  },
  animate: false # 默认true,
  preventTouch: false # 默认true
});
myMask.show();
```
