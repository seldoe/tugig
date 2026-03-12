<template>
  <view class="container">
    <view class="header">
      <text class="title">🚛 途吉天下</text>
      <text class="subtitle">卡车管理系统</text>
    </view>

    <view class="menu">
      <view class="menu-item" @click="goTo('/pages/vehicles/index')">
        <text class="icon">🚚</text>
        <text class="label">车辆管理</text>
      </view>
      <view class="menu-item" @click="goTo('/pages/location/index')">
        <text class="icon">📍</text>
        <text class="label">实时定位</text>
      </view>
      <view class="menu-item" @click="goTo('/pages/track/index')">
        <text class="icon">🗺️</text>
        <text class="label">轨迹回放</text>
      </view>
      <view class="menu-item" @click="goTo('/pages/fuel/index')">
        <text class="icon">⛽</text>
        <text class="label">油耗统计</text>
      </view>
      <view class="menu-item" @click="goTo('/pages/fence/index')">
        <text class="icon">🔲</text>
        <text class="label">电子围栏</text>
      </view>
      <view class="menu-item" @click="goTo('/pages/profile/index')">
        <text class="icon">👤</text>
        <text class="label">我的</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
const goTo = (url: string) => {
  uni.navigateTo({ url })
}
</script>

<style scoped>
.container {
  padding: 20px;
}
.header {
  text-align: center;
  padding: 40px 0;
}
.title {
  font-size: 28px;
  font-weight: bold;
  display: block;
}
.subtitle {
  font-size: 14px;
  color: #666;
  margin-top: 8px;
  display: block;
}
.menu {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.menu-item {
  width: 30%;
  background: #fff;
  border-radius: 12px;
  padding: 20px 10px;
  margin-bottom: 15px;
  text-align: center;
  box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}
.icon {
  font-size: 32px;
  display: block;
}
.label {
  font-size: 14px;
  color: #333;
  margin-top: 8px;
  display: block;
}
</style>
