# DevEcoStudioProjects
For HarmonyOS program

# 鸿蒙MQTT协议校验App

## 项目简介

本项目是一个基于鸿蒙（HarmonyOS）开发的MQTT消息接入与协议校验App。它实现了设备通过MQTT协议连接物联网平台，订阅相关主题，实时接收消息，并根据中移凌云平台协议规范对消息结构进行严格校验。同时支持属性上报、命令响应等核心功能，可作为鸿蒙设备接入物联网平台的标准参考实现。

## 功能特点

- **MQTT连接管理**：支持用户名/密码认证，支持遗嘱消息（Will Message），自动处理连接、断开及错误回调。
- **自动订阅主题**：连接成功后自动订阅属性设置、命令下发、下行消息等平台Topic。
- **实时消息接收与解析**：监听MQTT消息，将负载解析为JSON对象。
- **协议结构校验**：内置消息校验器，对Topic格式、JSON合法性、必填字段、字段类型进行严格校验。
- **属性上报**：支持设备属性数据一键上报至平台。
- **命令响应**：自动提取命令请求ID，并支持向平台返回命令执行结果。
- **日志与状态监控**：界面实时显示连接状态和接收到的消息内容。

## 技术栈

- **操作系统**：HarmonyOS NEXT
- **开发语言**：ArkTS
- **UI框架**：ArkUI（声明式开发范式）
- **通信协议**：MQTT
- **开发工具**：DevEco Studio

## 项目结构

```
entry/src/main/ets/
├── entryability/
│   └── EntryAbility.ets          // 应用入口Ability
├── pages/
│   ├── Index.ets                 // 主页面（UI与交互逻辑）
│   └── mqtt/
│       ├── MQTTProtocol.ts       // MQTT协议常量、Topic定义与ClientID构建
│       ├── MessageValidator.ts    // 消息协议校验器（JSON解析、必填字段校验）
│       └── MQTTClient.ts         // MQTT客户端封装（连接、订阅、发布、消息分发）
└── resources/
    └── base/
        └── profile/
            └── main_pages.json   // 路由配置文件
```

## 快速开始（本地运行）

### 环境要求

- 安装 DevEco Studio（推荐 5.0及以上版本）。
- 确保开发环境已配置好 HarmonyOS SDK<rsup>1</rsup>。

### 运行步骤

1. **获取项目**：将本项目导入到 DevEco Studio 中。
2. **同步依赖**：等待项目 Gradle/Hvigor 同步完成，确保所有依赖下载成功。
3. **修改配置**：打开 `entry/src/main/ets/pages/Index.ets` 文件，根据你的实际环境修改以下参数：
    - `serverUrl`：MQTT服务器地址，格式示例：`tcp://127.0.0.1:1883`
    - `deviceId`：设备ID（用于ClientID、Username及Topic构建）
    - `deviceSecret`：设备密钥（用于Password验证）
4. **启动 Previewer**：
    - 在 DevEco Studio 中，打开目标文件：`entry/src/main/ets/pages/Index.ets`<rsup>2</rsup><rsup>3</rsup>。
    - 点击顶部工具栏中的 **Previewer** 按钮，即可在本地预览器中运行该应用，无需连接真机。
5. **真机调试（可选）**：
    - 连接鸿蒙真机并开启开发者模式。
    - 点击 DevEco Studio 中的 **Run** 按钮，将应用安装并运行到真机。

## 配置说明

所有关键配置均位于 `entry/src/main/ets/pages/Index.ets` 文件中：

| 配置项 | 说明 | 示例值 |
| :--- | :--- | :--- |
| `serverUrl` | MQTT服务器地址 | `tcp://127.0.0.1:1883` |
| `deviceId` | 设备唯一标识 | `your_device_id` |
| `deviceSecret` | 设备接入密钥 | `your_device_secret` |

## 协议校验规则

本App内置了以下核心协议校验逻辑：

- **Topic格式校验**：所有Topic必须以 `$oc/devices/{deviceId}/sys/` 开头。
- **JSON合法性**：消息负载必须是合法JSON对象。
- **属性设置消息**：必填字段为 `object_device_id`、`service_id`、`properties`，且 `service_id` 必须为字符串，`properties` 必须为对象。
- **命令下发消息**：必填字段为 `command_name`、`paras`，且 `command_name` 必须为字符串，`paras` 必须为对象。
- **下行消息**：必填字段为 `content`。

## 使用说明

1.  **启动应用**：App启动后会自动连接配置的MQTT服务器。
2.  **查看状态**：界面顶部显示当前连接状态（已连接/断开/异常）。
3.  **上报属性**：在输入框中填入温度值，点击“上报温度”按钮，即可向平台上报该属性数据。
4.  **接收消息**：当平台下发属性设置、命令或下行消息时，App会实时接收、校验并显示在消息展示区域。
5.  **断开连接**：点击“断开连接”按钮，手动断开MQTT连接。

## 依赖要求

- 鸿蒙OS NEXT及以上版本。
- 需要在 `oh-package.json5` 中添加 MQTT依赖：
  ```json
  {
    "dependencies": {
      "@ohos/mqtt": "^1.0.0"
    }
  }
  ```
- 需要在 `module.json5` 中声明网络权限：
  ```json
  {
    "module": {
      "requestPermissions": [
        {
          "name": "ohos.permission.INTERNET"
        }
      ]
    }
  }
  ```
  鸿蒙滑组查询
![项目演示](./sc_demo.gif)
