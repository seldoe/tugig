# 途吉天下卡车管理系统

> 面向物流公司、个体卡车司机的 GPS 定位 + 轨迹回放 + 油耗统计 + 电子围栏系统

## 技术栈

- **前端**: UniApp (Vue3 + TypeScript)
- **后端**: NestJS (Node.js + TypeScript)
- **数据库**: MySQL

## 功能模块

| 优先级 | 模块 | 说明 |
|--------|------|------|
| P0 | 账号体系 | 登录、注册、权限管理 |
| P0 | 车辆管理 | 车辆信息 CRUD |
| P0 | 实时定位 | GPS 位置实时上报 |
| P1 | 轨迹回放 | 历史轨迹查询与展示 |
| P2 | 油耗统计 | 油耗记录与分析 |
| P2 | 电子围栏 | 区域告警 |

## 开发指南

### 前端开发

```bash
cd frontend
npm install
npm run dev # H5
npm run build:mp-weixin # 微信小程序
```

### 后端开发

```bash
cd backend
npm install
npm run start:dev
```

## 部署

See [deploy/README.md](deploy/README.md)
