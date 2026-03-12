# 🚛 途吉天下卡车管理系统

> 面向物流公司、个体卡车司机的 GPS 定位 + 轨迹回放 + 油耗统计 + 电子围栏系统

## 产品定位

让司机和物流公司能随时看到车在哪、怎么跑的、油耗多少。

## 核心功能

| 功能 | 说明 |
|------|------|
| 📍 **实时定位** | 打开手机/车载设备就能看到车在哪 |
| 🗺️ **轨迹回放** | 查看车昨天/以前走过的路线 |
| ⛽ **油耗统计** | 记录每次加油，自动算平均油耗 |
| 🔲 **电子围栏** | 设置一个区域，车进出时自动提醒 |
| 🚚 **车辆管理** | 添加/管理车牌、车型、车主信息 |
| 👤 **账号体系** | 登录、注册、权限管理（管理员/司机） |

## 用户群体

- **物流公司** - 管多辆车，查看所有车的位置
- **个体司机** - 记录油耗、查看自己车的轨迹

## 技术栈

- **前端**: UniApp (Vue3 + TypeScript) → 微信/支付宝小程序 + App
- **后端**: NestJS (Node.js + TypeScript)
- **数据库**: MySQL

## 使用方式

- **微信小程序** - 打开就能用，不用下载
- **手机 App** - iOS/Android 都能用

## 项目结构

```
tugig/
├── frontend/      # UniApp 前端
│   └── src/
│       ├── pages/        # 页面
│       ├── components/   # 组件
│       ├── api/          # API 调用
│       └── utils/        # 工具函数
│
└── backend/       # NestJS 后端
    └── src/
        ├── modules/      # 业务模块
        │   ├── users/    # 用户模块
        │   ├── vehicles/ # 车辆模块
        │   ├── locations/# 定位模块
        │   ├── tracks/   # 轨迹模块
        │   ├── fuel/     # 油耗模块
        │   └── fences/   # 围栏模块
        └── config/       # 配置
```

## 开发指南

### 前端开发

```bash
cd frontend
npm install
npm run dev          # 开发 H5
npm run dev:mp-weixin # 开发微信小程序
```

### 后端开发

```bash
cd backend
npm install
npm run start:dev   # 开发模式
```

## 部署

See [deploy/README.md](deploy/README.md)

---

**途吉天下** - 让卡车管理更简单 🚚
