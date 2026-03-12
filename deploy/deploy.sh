#!/bin/bash
# 途吉天下部署脚本

set -e

echo "=== 🚛 途吉天下卡车管理系统部署 ==="

# 配置
APP_DIR="/www/wwwroot/tugig"
GIT_REPO="https://github.com/seldoe/tugig.git"
BRANCH="main"

# 1. 克隆或更新代码
if [ -d "$APP_DIR/.git" ]; then
    echo "📥 更新代码..."
    cd $APP_DIR
    git pull origin $BRANCH
else
    echo "📥 克隆代码..."
    mkdir -p $(dirname $APP_DIR)
    git clone -b $BRANCH $GIT_REPO $APP_DIR
fi

# 2. 安装后端依赖
echo "📦 安装后端依赖..."
cd $APP_DIR/backend
npm install --production

# 3. 安装前端依赖
echo "📦 安装前端依赖..."
cd $APP_DIR/frontend
npm install

# 4. 构建前端 (H5)
echo "🏗️ 构建前端..."
npm run build:h5

# 5. 重启后端服务
echo "🔄 重启后端服务..."
cd $APP_DIR/backend
pm2 restart tugig-backend || pm2 start dist/main.js --name tugig-backend

# 6. 保存 PM2 状态
pm2 save

echo "=== ✅ 部署完成 ==="
echo "后端 API: http://your-domain.com/api"
echo "前端 H5: http://your-domain.com/"
