# Marshall 音频设备蓝牙连接与控制 App（marshall\_demo）

  鸿蒙滑组查询
![项目演示](marshall_demo_record.gif)


## 项目简介

本项目是一个基于鸿蒙（HarmonyOS NEXT）开发的 Marshall（马歇尔）风格音频设备伴侣 App，核心用途是**通过蓝牙连接并控制 Marshall 系列蓝牙音箱与耳机**，完成设备添加、蓝牙配对连接、播放与设备控制等功能。

App 界面参照 Marshall 官方配套应用设计，覆盖 ACTON / STANMORE / WOBURN / EMBERTON / KILBURN / MIDDLETON / STOCKWELL / BROMLEY 等音箱，以及 MAJOR / MINOR / MODE / MOTIF / MONITOR 等耳机产品。

当前版本已完成整体界面与交互框架（底部三 Tab 导航、添加设备流程、产品浏览、蓝牙配对帮助、设置中心等），蓝牙连接与控制能力在该界面框架上持续接入。

## 功能特点



* **三 Tab 底部导航**：家用、探索、更多，页面切换由状态驱动。

* **添加设备流程**：以覆盖层方式进入添加设备页，内置兼容产品分类清单（家庭音箱、便携音箱、耳塞和耳机、派对音箱）。

* **蓝牙配对引导**：「更多 → 帮助 → 蓝牙配对」页面给出完整配对步骤（按音源键、进入配对模式、在手机蓝牙列表中选择设备等）。

* **产品浏览（探索）**：按分类展示 Marshall 产品，并提供 BROMLEY 750 活动横幅；点击产品可跳转 Marshall 官网。

* **设置中心（更多）**：帮助、资讯订阅、改进计划、应用语言、用户协议与隐私政策、开源软件、关于我们、版本号等。

* **深色品牌风格 UI**：黑 / 白 / 深灰配色，还原 Marshall 应用视觉风格。

* **组件化 / 模块化**：页面拆分为独立可复用组件，并提供一套按页面（Home / Explore / More）组织的模块化工程结构。

## 技术栈



* **操作系统**：HarmonyOS NEXT（`runtimeOS: HarmonyOS`）

* **开发语言**：ArkTS

* **UI 框架**：ArkUI（声明式开发范式）

* **通信能力**：蓝牙（Bluetooth，连接与控制的核心，接入中）

* **目标设备**：phone（手机）

* **SDK 版本**：`targetSdkVersion` / `compatibleSdkVersion` 为 `6.0.0(20)`

* **开发工具**：DevEco Studio

* **第三方依赖**：无（`oh-package.json5` 的 `dependencies` 为空）

## 项目结构

应用入口 `EntryAbility` 加载的首页为 `pages/Index`。工程内同时存在两套页面组织方式：`pages/` 为当前实际使用的手写页面；`marshallPageHome / marshallPageExplore / marshallPageMore` 为按页面拆分的模块化（pages /view/viewmodel /detail）结构，均已在 `main_pages.json` 中注册。



```
marshall_demo/
├── AppScope/
│   └── app.json5                         // 应用配置（bundleName: com.example.marshall_demo）
├── entry/
│   └── src/main/
│       ├── module.json5                  // 模块配置（能力、权限声明）
│       ├── ets/
│       │   ├── entryability/
│       │   │   └── EntryAbility.ets       // 应用入口，加载 pages/Index
│       │   ├── entrybackupability/
│       │   │   └── EntryBackupAbility.ets // 备份能力
│       │   ├── pages/                     // ★ 当前实际入口页面
│       │   │   ├── Index.ets              // 主框架：底部三 Tab + 页面切换
│       │   │   ├── AddDevice.ets          // 添加设备流程 + 兼容产品清单
│       │   │   ├── Explore.ets            // 探索页：产品分类、活动横幅
│       │   │   ├── More.ets               // 更多页：设置菜单与子页面分发
│       │   │   └── MoreSubPages.ets       // 蓝牙配对帮助 / 资讯订阅 / 改进计划
│       │   ├── marshallPageHome/          // 家用页模块化结构
│       │   │   ├── Index.ets              // Navigation + Tabs 容器
│       │   │   ├── pages/PageHome.ets
│       │   │   ├── view/                  // AddNewDeviceModule、AddNewGroupModule
│       │   │   └── detail/                // 二级页面路由（SecondPageBuilder）
│       │   ├── marshallPageExplore/       // 探索页模块化结构
│       │   │   ├── pages/PageExplore.ets
│       │   │   ├── view/                  // Bromley750、ProductList、OverEar 模块
│       │   │   └── viewmodel/             // 列表数据接口定义
│       │   └── marshallPageMore/          // 更多页模块化结构
│       │       ├── pages/PageMore.ets
│       │       └── view/                  // 菜单、深色模式、版本号等模块
│       └── resources/
│           └── base/profile/main_pages.json // 路由配置
└── build-profile.json5                    // 构建与 SDK 版本配置
```

## 蓝牙连接与控制（核心能力）

App 的核心定位是音频设备的蓝牙连接与控制，典型流程为：



1. 在「家用」页点击 **添加新设备**，进入添加设备流程；

2. 引导用户让音箱 / 耳机进入蓝牙配对模式（配对步骤见「更多 → 帮助 → 蓝牙配对」）；

3. 打开手机蓝牙并扫描，发现附近的 Marshall 设备；

4. 选择目标设备完成配对与连接；

5. 连接成功后进行播放控制与设备状态管理（播放 / 暂停、音量、音源切换、电量与设备信息等）。

鸿蒙侧蓝牙能力通过 `@kit.ConnectivityKit` 提供，主要涉及：



* `@ohos.bluetooth.access`：蓝牙开关与状态管理；

* `@ohos.bluetooth.connection`：设备扫描、配对、连接管理；

* `@ohos.bluetooth.ble`（如走 BLE / GATT 通道）：扫描、连接与数据收发；

* A2DP / GATT 等协议用于音频控制与设备指令交互。

### 需要声明的权限

在 `entry/src/main/module.json5` 的 `module` 中声明蓝牙权限（当前工程尚未声明，接入时需补充）：



```
{
  "module": {
    "requestPermissions": [
      {
        "name": "ohos.permission.ACCESS_BLUETOOTH",
        "reason": "$string:bluetooth_permission_reason",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "inuse"
        }
      }
    ]
  }
}
```

> 说明：
>
> `ohos.permission.ACCESS_BLUETOOTH`
>
>  为蓝牙扫描 / 配对 / 连接的核心权限（user_grant，需运行时向用户申请）；部分 SDK 版本在 BLE 扫描时还会要求位置相关权限，具体以目标 SDK 的权限清单为准，并在 
>
> `resources`
>
>  中补充对应的 
>
> `reason`
>
>  字符串。

## 快速开始（本地运行）

### 环境要求



* 安装 DevEco Studio（推荐 5.0 及以上版本）。

* 已配置 HarmonyOS SDK（本工程使用 `6.0.0(20)`）。

### 运行步骤



1. **导入项目**：将 `marshall_demo` 目录导入 DevEco Studio。

2. **同步依赖**：等待 Hvigor / Gradle 同步完成。

3. **预览界面**：打开 `entry/src/main/ets/pages/Index.ets`，点击顶部 **Previewer** 即可预览 UI（Previewer 不支持真实蓝牙能力）。

4. **真机运行（蓝牙功能必需）**：

* 连接鸿蒙真机并开启开发者模式；

* 点击 **Run** 将应用安装到真机；

* 蓝牙扫描、配对与连接、音频控制均需在真机 + 真实 Marshall（或其他蓝牙音频）设备上验证。

## 使用说明



1. **家用页**：首次进入显示「你的音乐，你的方式」引导，点击「添加新设备」进入添加设备流程。

2. **探索页**：浏览顶部 BROMLEY 750 活动横幅与各分类产品，点击产品项跳转 Marshall 官网。

3. **更多页**：

* **帮助 → 蓝牙配对**：查看设备配对操作步骤；

* **资讯**：查看 / 取消订阅产品资讯；

* **改进计划**：开关匿名使用数据共享；

* 其余为语言、协议、开源软件、关于与版本号等信息。

## 当前进度说明



* 已完成：三 Tab 导航、添加设备界面与兼容产品清单、产品浏览、蓝牙配对帮助、设置中心等 UI 与交互框架。

* 待接入：基于 `@kit.ConnectivityKit` 的蓝牙扫描、配对、连接与音频控制逻辑。

* 待补充：`module.json5` 中的蓝牙权限声明及运行时权限申请。