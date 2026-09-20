<template>
  <div class="login-page" :class="[`style-${currentStyle}`]">
    <!-- 样式切换按钮 -->
    <div class="style-switcher">
      <n-tooltip v-for="style in styles" :key="style.key" trigger="hover">
        <template #trigger>
          <div
            class="style-option"
            :class="{ active: currentStyle === style.key }"
            @click="switchStyle(style.key)"
          >
            <n-icon size="18"><component :is="style.icon" /></n-icon>
          </div>
        </template>
        {{ style.name }}
      </n-tooltip>
    </div>

    <!-- 样式一：左右分栏式 -->
    <template v-if="currentStyle === 2">
      <div class="login-container style1-container style2-container">
        <div class="login-banner" :style="{ background: `linear-gradient(135deg, ${themeStore.primaryColor} 0%, ${adjustColor(themeStore.primaryColor, -30)} 100%)` }">
          <div class="banner-content">
            <div class="banner-logo">
              <img v-if="siteLogo" :src="siteLogo" class="logo-img" alt="Logo" />
              <div v-else class="logo-icon">{{ siteName.charAt(0) }}</div>
              <span class="logo-text">{{ siteName }}</span>
            </div>
            <h1 class="banner-title">{{ siteDescription || '后台管理系统' }}</h1>
            <p class="banner-desc">打造一款现代化后台管理平台</p>
            <div class="banner-features">
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>⚡ 逆向代码生成 · 研发提效 70%</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🛡️ Sa-Token 5级细粒度权限控制</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🔄 Warm-Flow 轻量国产工作流</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🚀 512MB 容器极度调优与保活</span>
              </div>
            </div>
            <div class="banner-project-action">
              <n-button round size="small" strong secondary type="info" @click="showProjectModal = true">
                <template #icon><n-icon :component="InformationCircleOutline" /></template>
                💡 项目定位与解决痛点深度解析
              </n-button>
            </div>
          </div>
          <div class="banner-decoration">
            <div class="decoration-circle circle-1"></div>
            <div class="decoration-circle circle-2"></div>
            <div class="decoration-circle circle-3"></div>
          </div>
        </div>
        <div class="login-form-wrapper">
          <div class="login-form">
            <!-- 移动端专属品牌顶部栏与项目解析入口 -->
            <div class="mobile-login-header">
              <div class="mobile-brand-box">
                <img v-if="siteLogo" :src="siteLogo" class="mobile-brand-logo" alt="Logo" />
                <div v-else class="mobile-brand-icon" :style="{ background: themeStore.primaryColor }">{{ siteName.charAt(0) }}</div>
                <div class="mobile-brand-info">
                  <div class="mobile-brand-name">{{ siteName }}</div>
                  <div class="mobile-brand-desc">{{ siteDescription || '企业级敏捷开发管理平台' }}</div>
                </div>
              </div>
              <div class="mobile-project-pill" @click="showProjectModal = true">
                <span class="pill-dot">⚡</span>
                <span class="pill-text">🎯 查看系统架构与核心痛点解析</span>
                <span class="pill-arrow">›</span>
              </div>
            </div>

            <h2 class="form-title">欢迎回来</h2>
            <p class="form-subtitle">请输入您的账号信息登录系统</p>
            <n-form ref="formRef" :model="formData" :rules="rules" size="large" autocomplete="off">
              <n-form-item path="username" label="用户名">
                <n-input v-model:value="formData.username" placeholder="请输入用户名" :maxlength="50" :input-props="usernameInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="PersonOutline" /></template>
                </n-input>
              </n-form-item>
              <n-form-item path="password" label="密码">
                <n-input v-model:value="formData.password" type="password" placeholder="请输入密码" show-password-on="click" :maxlength="50" :input-props="passwordInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="LockClosedOutline" /></template>
                </n-input>
              </n-form-item>
              <!-- 图片验证码 -->
              <n-form-item v-if="captchaEnabled && captchaType === 'image'" path="code" label="验证码">
                <div class="captcha-row">
                  <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                  <img v-if="captchaImg" :src="captchaImg" class="captcha-img" @click="loadCaptcha" title="点击刷新" />
                  <n-spin v-else :size="20" />
                </div>
              </n-form-item>
              <!-- 短信验证码 -->
              <template v-if="captchaEnabled && captchaType === 'sms'">
                <n-form-item label="手机号">
                  <n-input v-model:value="smsPhone" placeholder="请输入手机号" :maxlength="11" />
                </n-form-item>
                <n-form-item path="code" label="验证码">
                  <div class="sms-row">
                    <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                    <n-button :disabled="smsCountdown > 0" :loading="smsSending" @click="sendSmsCode">
                      {{ smsCountdown > 0 ? `${smsCountdown}s` : '获取验证码' }}
                    </n-button>
                  </div>
                </n-form-item>
              </template>
              <n-form-item v-if="rememberMeEnabled" :show-label="false">
                <div class="login-options">
                  <n-checkbox v-model:checked="formData.rememberMe">记住我</n-checkbox>
                  <a v-if="registerEnabled" class="register-link" :style="{ color: themeStore.primaryColor }" @click="goRegister">没有账号？立即注册</a>
                </div>
              </n-form-item>
              <n-form-item>
                <n-button type="primary" block :loading="loading" @click="handleLogin">登 录</n-button>
              </n-form-item>
            </n-form>

            <!-- 演示账号快捷填入卡片 -->
            <div class="demo-accounts-box">
              <div class="demo-box-header">
                <div class="demo-tag">DEMO</div>
                <span class="demo-box-title">演示账号（点击一键填入）</span>
                <n-button text type="primary" size="tiny" class="demo-header-intro-btn" @click="showProjectModal = true">
                  <template #icon><n-icon :component="InformationCircleOutline" /></template>
                  <span>项目解析</span>
                </n-button>
              </div>
              <div class="demo-accounts-grid">
                <div
                  v-for="acc in demoAccounts"
                  :key="acc.username"
                  class="demo-account-card"
                  @click="fillDemoAccount(acc.username, acc.password)"
                  :title="acc.desc"
                >
                  <div class="demo-account-left">
                    <span class="demo-role-badge" :style="{ color: acc.color }">{{ acc.role }}</span>
                    <span class="demo-account-info">
                      <span class="demo-user">{{ acc.username }}</span>
                      <span class="demo-pwd">/ {{ acc.password }}</span>
                    </span>
                  </div>
                  <span class="demo-fill-action">一键填入</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="style1-footer">
        <span>{{ copyright }}</span>
      </div>
    </template>

    <!-- 样式二：全屏背景（与样式一相同布局，加背景） -->
    <template v-else-if="currentStyle === 1">
      <div class="style2-bg"></div>
      <div class="login-container style1-container">
        <div class="login-banner" :style="{ background: `linear-gradient(135deg, ${themeStore.primaryColor} 0%, ${adjustColor(themeStore.primaryColor, -30)} 100%)` }">
          <div class="banner-content">
            <div class="banner-logo">
              <img v-if="siteLogo" :src="siteLogo" class="logo-img" alt="Logo" />
              <div v-else class="logo-icon">{{ siteName.charAt(0) }}</div>
              <span class="logo-text">{{ siteName }}</span>
            </div>
            <h1 class="banner-title">{{ siteDescription || '后台管理系统' }}</h1>
            <p class="banner-desc">打造一款现代化后台管理平台</p>
            <div class="banner-features">
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>⚡ 逆向代码生成 · 研发提效 70%</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🛡️ Sa-Token 5级细粒度权限控制</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🔄 Warm-Flow 轻量国产工作流</span>
              </div>
              <div class="feature-item" @click="showProjectModal = true" style="cursor: pointer;" title="点击查看项目解析与解法">
                <div class="feature-dot"></div>
                <span>🚀 512MB 容器极度调优与保活</span>
              </div>
            </div>
            <div class="banner-project-action">
              <n-button round size="small" strong secondary type="info" @click="showProjectModal = true">
                <template #icon><n-icon :component="InformationCircleOutline" /></template>
                💡 项目定位与解决痛点深度解析
              </n-button>
            </div>
          </div>
          <div class="banner-decoration">
            <div class="decoration-circle circle-1"></div>
            <div class="decoration-circle circle-2"></div>
            <div class="decoration-circle circle-3"></div>
          </div>
        </div>
        <div class="login-form-wrapper">
          <div class="login-form">
            <!-- 移动端专属品牌顶部栏与项目解析入口 -->
            <div class="mobile-login-header">
              <div class="mobile-brand-box">
                <img v-if="siteLogo" :src="siteLogo" class="mobile-brand-logo" alt="Logo" />
                <div v-else class="mobile-brand-icon" :style="{ background: themeStore.primaryColor }">{{ siteName.charAt(0) }}</div>
                <div class="mobile-brand-info">
                  <div class="mobile-brand-name">{{ siteName }}</div>
                  <div class="mobile-brand-desc">{{ siteDescription || '企业级敏捷开发管理平台' }}</div>
                </div>
              </div>
              <div class="mobile-project-pill" @click="showProjectModal = true">
                <span class="pill-dot">⚡</span>
                <span class="pill-text">🎯 查看系统架构与核心痛点解析</span>
                <span class="pill-arrow">›</span>
              </div>
            </div>

            <h2 class="form-title">欢迎回来</h2>
            <p class="form-subtitle">请输入您的账号信息登录系统</p>
            <n-form ref="formRef" :model="formData" :rules="rules" size="large" autocomplete="off">
              <n-form-item path="username" label="用户名">
                <n-input v-model:value="formData.username" placeholder="请输入用户名" :maxlength="50" :input-props="usernameInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="PersonOutline" /></template>
                </n-input>
              </n-form-item>
              <n-form-item path="password" label="密码">
                <n-input v-model:value="formData.password" type="password" placeholder="请输入密码" show-password-on="click" :maxlength="50" :input-props="passwordInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="LockClosedOutline" /></template>
                </n-input>
              </n-form-item>
              <!-- 图片验证码 -->
              <n-form-item v-if="captchaEnabled && captchaType === 'image'" path="code" label="验证码">
                <div class="captcha-row">
                  <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                  <img v-if="captchaImg" :src="captchaImg" class="captcha-img" @click="loadCaptcha" title="点击刷新" />
                  <n-spin v-else :size="20" />
                </div>
              </n-form-item>
              <!-- 短信验证码 -->
              <template v-if="captchaEnabled && captchaType === 'sms'">
                <n-form-item label="手机号">
                  <n-input v-model:value="smsPhone" placeholder="请输入手机号" :maxlength="11" />
                </n-form-item>
                <n-form-item path="code" label="验证码">
                  <div class="sms-row">
                    <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                    <n-button :disabled="smsCountdown > 0" :loading="smsSending" @click="sendSmsCode">
                      {{ smsCountdown > 0 ? `${smsCountdown}s` : '获取验证码' }}
                    </n-button>
                  </div>
                </n-form-item>
              </template>
              <n-form-item v-if="rememberMeEnabled" :show-label="false">
                <div class="login-options">
                  <n-checkbox v-model:checked="formData.rememberMe">记住我</n-checkbox>
                  <a v-if="registerEnabled" class="register-link" :style="{ color: themeStore.primaryColor }" @click="goRegister">没有账号？立即注册</a>
                </div>
              </n-form-item>
              <n-form-item>
                <n-button type="primary" block :loading="loading" @click="handleLogin">登 录</n-button>
              </n-form-item>
            </n-form>

            <!-- 演示账号快捷填入卡片 -->
            <div class="demo-accounts-box">
              <div class="demo-box-header">
                <div class="demo-tag">DEMO</div>
                <span class="demo-box-title">演示账号（点击一键填入）</span>
                <n-button text type="primary" size="tiny" class="demo-header-intro-btn" @click="showProjectModal = true">
                  <template #icon><n-icon :component="InformationCircleOutline" /></template>
                  <span>项目解析</span>
                </n-button>
              </div>
              <div class="demo-accounts-grid">
                <div
                  v-for="acc in demoAccounts"
                  :key="acc.username"
                  class="demo-account-card"
                  @click="fillDemoAccount(acc.username, acc.password)"
                  :title="acc.desc"
                >
                  <div class="demo-account-left">
                    <span class="demo-role-badge" :style="{ color: acc.color }">{{ acc.role }}</span>
                    <span class="demo-account-info">
                      <span class="demo-user">{{ acc.username }}</span>
                      <span class="demo-pwd">/ {{ acc.password }}</span>
                    </span>
                  </div>
                  <span class="demo-fill-action">一键填入</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="style2-footer">
        <span>{{ copyright }}</span>
      </div>
    </template>

    <!-- 样式三：毛玻璃（与样式一相同布局，加毛玻璃效果） -->
    <template v-else-if="currentStyle === 3">
      <div class="style3-bg" :style="{ background: `linear-gradient(135deg, ${themeStore.primaryColor} 0%, ${adjustColor(themeStore.primaryColor, -30)} 50%, ${themeStore.primaryColor} 100%)` }"></div>
      <div class="login-container style1-container style3-glass">
        <div class="login-banner" style="background: transparent;">
          <div class="banner-content">
            <div class="banner-logo">
              <img v-if="siteLogo" :src="siteLogo" class="logo-img" alt="Logo" />
              <div v-else class="logo-icon" style="background: rgba(255, 255, 255, 0.15); color: #fff; border: 1px solid rgba(255, 255, 255, 0.2);">{{ siteName.charAt(0) }}</div>
              <span class="logo-text">{{ siteName }}</span>
            </div>
            <h1 class="banner-title" style="color: #fff;">{{ siteDescription || '后台管理系统' }}</h1>
            <p class="banner-desc">打造一款现代化后台管理平台</p>
            <div class="banner-features">
              <div class="feature-item">
                <div class="feature-dot" style="background: rgba(255, 255, 255, 0.6);"></div>
                <span>RBAC权限管理</span>
              </div>
              <div class="feature-item">
                <div class="feature-dot" style="background: rgba(255, 255, 255, 0.6);"></div>
                <span>高效开发体验</span>
              </div>
              <div class="feature-item">
                <div class="feature-dot" style="background: rgba(255, 255, 255, 0.6);"></div>
                <span>精美界面设计</span>
              </div>
            </div>
          </div>
          <div class="banner-decoration">
            <div class="decoration-circle circle-1"></div>
            <div class="decoration-circle circle-2"></div>
            <div class="decoration-circle circle-3"></div>
          </div>
        </div>
        <div class="login-form-wrapper style3-form-glass">
          <div class="login-form">
            <!-- 移动端专属品牌顶部栏与项目解析入口 -->
            <div class="mobile-login-header">
              <div class="mobile-brand-box">
                <img v-if="siteLogo" :src="siteLogo" class="mobile-brand-logo" alt="Logo" />
                <div v-else class="mobile-brand-icon" :style="{ background: themeStore.primaryColor }">{{ siteName.charAt(0) }}</div>
                <div class="mobile-brand-info">
                  <div class="mobile-brand-name">{{ siteName }}</div>
                  <div class="mobile-brand-desc">{{ siteDescription || '企业级敏捷开发管理平台' }}</div>
                </div>
              </div>
              <div class="mobile-project-pill" @click="showProjectModal = true">
                <span class="pill-dot">⚡</span>
                <span class="pill-text">🎯 查看系统架构与核心痛点解析</span>
                <span class="pill-arrow">›</span>
              </div>
            </div>

            <h2 class="form-title">欢迎回来</h2>
            <p class="form-subtitle">请输入您的账号信息登录系统</p>
            <n-form ref="formRef" :model="formData" :rules="rules" size="large" autocomplete="off">
              <n-form-item path="username" label="用户名">
                <n-input v-model:value="formData.username" placeholder="请输入用户名" :maxlength="50" :input-props="usernameInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="PersonOutline" /></template>
                </n-input>
              </n-form-item>
              <n-form-item path="password" label="密码">
                <n-input v-model:value="formData.password" type="password" placeholder="请输入密码" show-password-on="click" :maxlength="50" :input-props="passwordInputProps" @keyup.enter="handleLogin">
                  <template #prefix><n-icon :component="LockClosedOutline" /></template>
                </n-input>
              </n-form-item>
              <!-- 图片验证码 -->
              <n-form-item v-if="captchaEnabled && captchaType === 'image'" path="code" label="验证码">
                <div class="captcha-row">
                  <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                  <img v-if="captchaImg" :src="captchaImg" class="captcha-img" @click="loadCaptcha" title="点击刷新" />
                  <n-spin v-else :size="20" />
                </div>
              </n-form-item>
              <!-- 短信验证码 -->
              <template v-if="captchaEnabled && captchaType === 'sms'">
                <n-form-item label="手机号">
                  <n-input v-model:value="smsPhone" placeholder="请输入手机号" :maxlength="11" />
                </n-form-item>
                <n-form-item path="code" label="验证码">
                  <div class="sms-row">
                    <n-input v-model:value="formData.code" placeholder="请输入验证码" :maxlength="6" @keyup.enter="handleLogin" />
                    <n-button :disabled="smsCountdown > 0" :loading="smsSending" @click="sendSmsCode">
                      {{ smsCountdown > 0 ? `${smsCountdown}s` : '获取验证码' }}
                    </n-button>
                  </div>
                </n-form-item>
              </template>
              <n-form-item v-if="rememberMeEnabled" :show-label="false">
                <div class="login-options">
                  <n-checkbox v-model:checked="formData.rememberMe">记住我</n-checkbox>
                  <a v-if="registerEnabled" class="register-link" style="color: rgba(255, 255, 255, 0.6);" @click="goRegister">没有账号？立即注册</a>
                </div>
              </n-form-item>
              <n-form-item>
                <n-button type="primary" block :loading="loading" @click="handleLogin">登 录</n-button>
              </n-form-item>
            </n-form>

            <!-- 演示账号快捷填入卡片 -->
            <div class="demo-accounts-box">
              <div class="demo-box-header">
                <div class="demo-tag">DEMO</div>
                <span class="demo-box-title">演示账号（点击一键填入）</span>
                <n-button text type="primary" size="tiny" class="demo-header-intro-btn" @click="showProjectModal = true">
                  <template #icon><n-icon :component="InformationCircleOutline" /></template>
                  <span>项目解析</span>
                </n-button>
              </div>
              <div class="demo-accounts-grid">
                <div
                  v-for="acc in demoAccounts"
                  :key="acc.username"
                  class="demo-account-card"
                  @click="fillDemoAccount(acc.username, acc.password)"
                  :title="acc.desc"
                >
                  <div class="demo-account-left">
                    <span class="demo-role-badge" :style="{ color: acc.color }">{{ acc.role }}</span>
                    <span class="demo-account-info">
                      <span class="demo-user">{{ acc.username }}</span>
                      <span class="demo-pwd">/ {{ acc.password }}</span>
                    </span>
                  </div>
                  <span class="demo-fill-action">一键填入</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="style3-footer">
        <span>{{ copyright }}</span>
      </div>
    </template>


    <!-- 滑块验证弹窗 -->
    <n-modal v-model:show="showSliderModal" :mask-closable="false" class="slider-modal">
      <div class="slider-puzzle-container">
        <div class="slider-puzzle-header">
          <span>请完成下列验证后继续:</span>
          <n-button text @click="closeSliderModal">
            <n-icon size="20"><CloseOutline /></n-icon>
          </n-button>
        </div>
        <div
          class="slider-puzzle-image"
          @mousemove="onSliderDragMove"
          @mouseup="onSliderDragEnd"
          @mouseleave="onSliderDragEnd"
          @touchmove="onSliderDragMove"
          @touchend="onSliderDragEnd"
        >
          <!-- 背景图片 -->
          <div class="puzzle-bg" :class="`puzzle-bg-${puzzleImageIndex}`"></div>
          <!-- 缺口位置 -->
          <div class="puzzle-slot" :style="{ left: sliderTargetX + 'px' }"></div>
          <!-- 拼图块 -->
          <div
            class="puzzle-piece"
            :class="{ verified: sliderVerified }"
            :style="{ left: sliderPuzzleX + 'px' }"
          >
            <div class="puzzle-piece-bg" :class="`puzzle-bg-${puzzleImageIndex}`" :style="{ backgroundPositionX: -sliderTargetX + 'px' }"></div>
          </div>
        </div>
        <div class="slider-puzzle-track">
          <div class="slider-track-bg">
            <div class="slider-track-progress" :style="{ width: sliderPuzzleX + 'px' }"></div>
          </div>
          <div
            class="slider-handle"
            :class="{ dragging: sliderDragging, verified: sliderVerified }"
            :style="{ left: sliderPuzzleX + 'px' }"
            @mousedown="onSliderDragStart"
            @touchstart="onSliderDragStart"
          >
            <n-icon v-if="!sliderVerified" size="18"><ArrowForwardOutline /></n-icon>
            <n-icon v-else size="18"><CheckmarkOutline /></n-icon>
          </div>
          <span class="slider-track-tip" v-if="sliderPuzzleX === 0">按住左边按钮拖动完成上方拼图</span>
        </div>
        <div class="slider-puzzle-footer">
          <n-button text size="small" @click="initSliderPuzzle">
            <n-icon><RefreshOutline /></n-icon>
            <span>换一张</span>
          </n-button>
        </div>
      </div>
    </n-modal>

    <!-- 项目定位与解决痛点解析弹窗 (供HR / 面试官参考) -->
    <n-modal
      v-model:show="showProjectModal"
      preset="card"
      title="🎯 Jiejie Admin 项目架构与解决痛点深度解析"
      class="project-intro-modal"
      style="width: 880px; max-width: 95vw; max-height: 90vh; overflow-y: auto; border-radius: 12px;"
      :segmented="{ content: 'soft', footer: 'soft' }"
    >
      <template #header-extra>
        <n-tag type="info" size="small" round :bordered="false">Demo 演示指引</n-tag>
      </template>

      <div class="project-modal-body">
        <!-- 概览标语 -->
        <div class="project-overview-hero">
          <div class="hero-badge">项目核心价值</div>
          <p class="hero-desc">
            本项目是一套面向企业级敏捷交付的全栈中后台管理平台。针对中小型研发团队在系统建设中面临的
            <strong>“研发周期长、权限控制粗放、审批流硬编码、低配云资源极易 OOM”</strong> 四大典型工程痛点，
            提供开箱即用、安全完备、轻量高可用的全链路解决方案。
          </p>
        </div>

        <!-- 四大核心痛点与解法 -->
        <div class="painpoints-grid">
          <!-- 痛点 1 -->
          <div class="painpoint-card">
            <div class="card-header">
              <div class="card-icon-wrap icon-flash">⚡</div>
              <div class="card-title-wrap">
                <span class="card-badge">痛点一 · 研发效能</span>
                <h4>CRUD 重复造轮子，业务开发耗时耗力</h4>
              </div>
            </div>
            <div class="card-content">
              <div class="pain-problem">
                <span class="label">传统痛点：</span>
                手写基础增删改查、实体模型与前后端契约接口耗费大量人力，规范不一且容易产生低级缺陷。
              </div>
              <div class="pain-solution">
                <span class="label">本工程解法：</span>
                集成基于 Velocity 模板引擎的代码逆向生成中心，一键生成 Controller/Service/Mapper/Entity 及 Vue3+Naive UI 前端视图；内置 12+ 常用系统管理模块，业务脚手架开箱即用，研发提效 70% 以上。
              </div>
              <div class="card-tags">
                <span class="tech-pill">Velocity 引擎</span>
                <span class="tech-pill">一键逆向工程</span>
                <span class="tech-pill">12+ 内置模块</span>
              </div>
            </div>
          </div>

          <!-- 痛点 2 -->
          <div class="painpoint-card">
            <div class="card-header">
              <div class="card-icon-wrap icon-shield">🛡️</div>
              <div class="card-title-wrap">
                <span class="card-badge">痛点二 · 安全架构</span>
                <h4>权限粗放割裂、越权漏洞与鉴权性能瓶颈</h4>
              </div>
            </div>
            <div class="card-content">
              <div class="pain-problem">
                <span class="label">传统痛点：</span>
                传统 Spring Security / Shiro 配置繁杂臃肿；按钮级与多维度数据范围隔离实现复杂；明文传输存在安全隐患。
              </div>
              <div class="pain-solution">
                <span class="label">本工程解法：</span>
                基于 Sa-Token 构建 5 级细粒度权限模型（认证、角色、按钮、数据权限、防重复提交）；前端结合动态路由与自定义指令；登录采用 RSA 非对称加密，支持多账号单点/踢人下线，毫秒级权限校验。
              </div>
              <div class="card-tags">
                <span class="tech-pill">Sa-Token RBAC</span>
                <span class="tech-pill">RSA 传输加密</span>
                <span class="tech-pill">动态路由树</span>
                <span class="tech-pill">防重放攻击</span>
              </div>
            </div>
          </div>

          <!-- 痛点 3 -->
          <div class="painpoint-card">
            <div class="card-header">
              <div class="card-icon-wrap icon-flow">🔄</div>
              <div class="card-title-wrap">
                <span class="card-badge">痛点三 · 流程编排</span>
                <h4>业务审批流代码硬编码，维护变更成本高</h4>
              </div>
            </div>
            <div class="card-content">
              <div class="pain-problem">
                <span class="label">传统痛点：</span>
                业务流转需求频繁变动（请假、报销、工单等），代码硬编码状态机极难扩展；Activiti/Flowable 等引擎过重（几百张表、内存膨胀）。
              </div>
              <div class="pain-solution">
                <span class="label">本工程解法：</span>
                无缝集成国产轻量级 Warm-Flow 工作流引擎，仅十余张核心表，轻量极速；支持无代码可视化流程定义、多级审批、会签驳回与状态监听，大幅降低企业协同流转复杂度。
              </div>
              <div class="card-tags">
                <span class="tech-pill">Warm-Flow 引擎</span>
                <span class="tech-pill">轻量化表设计</span>
                <span class="tech-pill">可视化流程编排</span>
              </div>
            </div>
          </div>

          <!-- 痛点 4 -->
          <div class="painpoint-card">
            <div class="card-header">
              <div class="card-icon-wrap icon-server">🚀</div>
              <div class="card-title-wrap">
                <span class="card-badge">痛点四 · 生产成本</span>
                <h4>512MB 容器极度受限下的高可用云部署</h4>
              </div>
            </div>
            <div class="card-content">
              <div class="pain-problem">
                <span class="label">传统痛点：</span>
                Spring Boot 单体或微服务打包镜像大、默认启动内存即超 1GB，在低配免费云容器（512MB RAM）中频繁 OOM 退出，免费实例冷启动休眠。
              </div>
              <div class="pain-solution">
                <span class="label">本工程解法：</span>
                深度 JVM 容器调优（-Xms128m -Xmx300m -XX:+UseSerialGC），配合 TiDB Serverless 弹性数据库与 Upstash 远程 Redis，再由 Cron-Job 定时心跳保活，实现公网零服务器成本 7×24h 稳定秒开。
              </div>
              <div class="card-tags">
                <span class="tech-pill">JVM 堆内存调优</span>
                <span class="tech-pill">TiDB Serverless</span>
                <span class="tech-pill">Upstash Redis</span>
                <span class="tech-pill">7×24h 保活</span>
              </div>
            </div>
          </div>
        </div>

        <!-- 技术栈全景矩阵 -->
        <div class="tech-matrix-box">
          <div class="matrix-title">💻 技术栈全景矩阵</div>
          <div class="matrix-grid">
            <div class="matrix-col">
              <div class="matrix-label">后端核心架构</div>
              <div class="matrix-text">Spring Boot 3.4 + Java 17 + MyBatis-Plus + Sa-Token + Warm-Flow + Dynamic Datasource</div>
            </div>
            <div class="matrix-col">
              <div class="matrix-label">前端现代化交互</div>
              <div class="matrix-text">Vue 3.4 + Vite 5 + TypeScript + Naive UI + Pinia + Vue Router + ECharts 5</div>
            </div>
            <div class="matrix-col">
              <div class="matrix-label">云原生与基础设施</div>
              <div class="matrix-text">Docker Multi-Stage + TiDB Serverless (MySQL 8.0) + Upstash Redis + Render Cloud</div>
            </div>
          </div>
        </div>

        <!-- 演示账号速查 -->
        <div class="modal-demo-accounts">
          <div class="modal-demo-title">🔑 预设演示账号（点击直接选用并登录）：</div>
          <div class="modal-accounts-flex">
            <div class="account-item" v-for="acc in demoAccounts" :key="acc.username" @click="fillDemoAccount(acc.username, acc.password, true); showProjectModal = false">
              <span class="acc-badge" :style="{ color: acc.color }">{{ acc.role }}</span>
              <span class="acc-text">账号: {{ acc.username }} / 密码: {{ acc.password }}</span>
              <span class="acc-desc">{{ acc.desc }}</span>
              <n-button size="tiny" type="primary" secondary>选用并登录</n-button>
            </div>
          </div>
        </div>
      </div>

      <template #footer>
        <div class="project-modal-footer">
          <span class="footer-tip">💡 面试官建议：推荐使用【超级管理员】登录体验完整功能与配置</span>
          <div class="footer-btns">
            <n-button @click="showProjectModal = false">关闭</n-button>
            <n-button type="primary" @click="fillDemoAccount('admin', '123456', true); showProjectModal = false">
              以管理员一键登录体验
            </n-button>
          </div>
        </div>
      </template>
    </n-modal>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useMessage, type FormInst, type FormRules } from 'naive-ui'
import { PersonOutline, LockClosedOutline, GridOutline, AppsOutline, ImageOutline, RefreshOutline, CloseOutline, ArrowForwardOutline, CheckmarkOutline, InformationCircleOutline, SparklesOutline } from '@vicons/ionicons5'
import { useUserStore } from '@/stores/user'
import { useSiteStore } from '@/stores/site'
import { useThemeStore } from '@/stores/theme'
import { authApi } from '@/api/auth'
import { configGroupApi } from '@/api/org'

const router = useRouter()
const route = useRoute()
const message = useMessage()
const userStore = useUserStore()
const siteStore = useSiteStore()
const themeStore = useThemeStore()

// 站点配置（带默认值）
const siteName = computed(() => siteStore.siteName || 'Jiejie Admin')
const siteDescription = computed(() => siteStore.siteDescription || '现代化后台管理系统')
const siteLogo = computed(() => siteStore.siteLogo)
const copyright = computed(() => siteStore.copyright || '版权所有 © Jiejie Admin 2026')

// 项目定位与痛点解析弹窗
const showProjectModal = ref(false)

// 登录配置
const captchaEnabled = ref(false)
const captchaType = ref('image') // image, slider, sms
const rememberMeEnabled = ref(true)
const registerEnabled = ref(true)

// 验证码
const captchaImg = ref('')
const captchaUuid = ref('')
const captchaLoading = ref(false)

// 滑块验证码弹窗
const showSliderModal = ref(false)
const sliderPuzzleX = ref(0) // 拼图块当前位置
const sliderTargetX = ref(0) // 目标位置
const sliderDragging = ref(false)
const sliderVerified = ref(false)
const sliderStartX = ref(0)
const puzzleImageIndex = ref(0) // 使用的背景图片索引

// 短信验证码
const smsPhone = ref('')
const smsSending = ref(false)
const smsCountdown = ref(0)

// 加载配置
async function loadPublicConfig() {
  try {
    const config = await configGroupApi.getPublicConfig()
    captchaEnabled.value = config.login?.captchaEnabled || false
    captchaType.value = config.login?.captchaType || 'image'
    rememberMeEnabled.value = config.login?.rememberMe !== false
    registerEnabled.value = config.register?.enabled !== false

    // 如果启用图片验证码，加载验证码
    if (captchaEnabled.value && captchaType.value === 'image') {
      await loadCaptcha()
    }
  } catch (error) {
    console.error('加载配置失败', error)
  }
}

// 加载图片验证码
async function loadCaptcha() {
  captchaLoading.value = true
  try {
    const result = await authApi.getCaptcha()
    captchaImg.value = result.img
    captchaUuid.value = result.uuid
  } catch (error) {
    console.error('获取验证码失败', error)
  } finally {
    captchaLoading.value = false
  }
}

// 初始化滑块验证码
function initSliderPuzzle() {
  sliderPuzzleX.value = 0
  sliderVerified.value = false
  // 目标位置在 150-250 之间随机
  sliderTargetX.value = 150 + Math.floor(Math.random() * 100)
  // 随机选择一张背景图
  puzzleImageIndex.value = Math.floor(Math.random() * 3)
}

// 打开滑块验证弹窗
function openSliderModal() {
  initSliderPuzzle()
  showSliderModal.value = true
}

// 关闭滑块验证弹窗
function closeSliderModal() {
  showSliderModal.value = false
  sliderPuzzleX.value = 0
}

// 滑块拖动开始
function onSliderDragStart(e: MouseEvent | TouchEvent) {
  if (sliderVerified.value) return
  sliderDragging.value = true
  const clientX = 'touches' in e ? e.touches[0].clientX : e.clientX
  sliderStartX.value = clientX - sliderPuzzleX.value
}

// 滑块拖动中
function onSliderDragMove(e: MouseEvent | TouchEvent) {
  if (!sliderDragging.value || sliderVerified.value) return
  const clientX = 'touches' in e ? e.touches[0].clientX : e.clientX
  let newX = clientX - sliderStartX.value
  // 限制范围 0-280
  newX = Math.max(0, Math.min(280, newX))
  sliderPuzzleX.value = newX
}

// 滑块拖动结束
function onSliderDragEnd() {
  if (!sliderDragging.value || sliderVerified.value) return
  sliderDragging.value = false

  // 检查是否在目标位置附近（误差 5px）
  if (Math.abs(sliderPuzzleX.value - sliderTargetX.value) < 8) {
    sliderVerified.value = true
    sliderPuzzleX.value = sliderTargetX.value // 对齐
    message.success('验证成功')

    // 延迟关闭弹窗并执行登录
    setTimeout(() => {
      closeSliderModal()
      doLogin()
    }, 500)
  } else {
    // 验证失败，重置
    message.warning('验证失败，请重试')
    setTimeout(() => {
      sliderPuzzleX.value = 0
    }, 300)
  }
}

// 发送短信验证码
async function sendSmsCode() {
  if (!smsPhone.value || !/^1[3-9]\d{9}$/.test(smsPhone.value)) {
    message.warning('请输入正确的手机号')
    return
  }

  smsSending.value = true
  try {
    await authApi.sendSmsCode(smsPhone.value)
    message.success('验证码已发送，请查看控制台')

    // 开始倒计时
    smsCountdown.value = 60
    const timer = setInterval(() => {
      smsCountdown.value--
      if (smsCountdown.value <= 0) {
        clearInterval(timer)
      }
    }, 1000)
  } catch (error: any) {
    message.error(error.message || '发送失败')
  } finally {
    smsSending.value = false
  }
}

// 加载站点配置
onMounted(() => {
  if (!siteStore.loaded) {
    siteStore.loadConfig()
  }
  loadPublicConfig()

  // 需求 1：将「项目解析」设置为快速弹出
  // 首次进入登录页时，延迟 300ms 快速自动弹出，让面试官/HR 第一眼即可直观了解系统架构与核心攻坚点
  // 采用 sessionStorage 记录，关闭后同一会话不再骚扰弹窗，用户也可随时点击「项目解析」手动打开
  try {
    const hasPopped = sessionStorage.getItem('jiejie_project_modal_popped')
    if (!hasPopped) {
      setTimeout(() => {
        showProjectModal.value = true
        sessionStorage.setItem('jiejie_project_modal_popped', 'true')
      }, 300)
    }
  } catch (e) {
    showProjectModal.value = true
  }
})

// 样式选项
const styles = [
  { key: 1, name: '经典分栏', icon: GridOutline },
  { key: 2, name: '左右分栏', icon: AppsOutline }
]

// 当前样式
const currentStyle = ref(parseInt(localStorage.getItem('login-style') || '1'))

function switchStyle(style: number) {
  currentStyle.value = style
  localStorage.setItem('login-style', style.toString())
}

const formRef = ref<FormInst | null>(null)
const loading = ref(false)

// 默认预填演示账号（方便面试官/HR 直接登录预览）
const formData = reactive({
  username: 'admin',
  password: '123456',
  code: '',
  rememberMe: true
})

// 演示账号列表（供公网测试与简历评审快速体验）
const demoAccounts = [
  { role: '超级管理员', username: 'admin', password: '123456', color: '#4F46E5', desc: '系统最高权限，具备全部模块访问与配置权限' },
  { role: '技术总监', username: 'zhangsan', password: '123456', color: '#2563EB', desc: '研发部门负责人，具备监控、代码生成与接口管理权限' },
  { role: '产品总监', username: 'lisi', password: '123456', color: '#059669', desc: '产品部门负责人，具备流程审批与业务管理权限' }
]

function fillDemoAccount(user: string, pwd: string, autoLogin = false) {
  formData.username = user
  formData.password = pwd
  if (captchaEnabled.value) {
    formData.code = 'demo' // 自动填入演示免除码
  }
  const target = demoAccounts.find(a => a.username === user)
  message.success(`已一键填入【${target?.role || user}】凭据（免验证码）`)
  if (autoLogin) {
    setTimeout(() => {
      handleLogin()
    }, 100)
  }
}

// 禁用浏览器自动填充账号密码
const usernameInputProps = { autocomplete: 'off', name: 'jiejie-login-account' }
const passwordInputProps = { autocomplete: 'new-password', name: 'jiejie-login-password' }

const rules: FormRules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
  code: [
    {
      validator(_rule, value) {
        if (!captchaEnabled.value) return true
        if (value && value.trim().length > 0) return true
        return new Error('请输入验证码')
      },
      trigger: 'blur'
    }
  ]
}

async function handleLogin() {
  try {
    // 短信验证码校验
    if (captchaEnabled.value && captchaType.value === 'sms' && !smsPhone.value) {
      message.warning('请输入手机号')
      return
    }

    await formRef.value?.validate()

    // 如果是滑块验证码，先弹出验证弹窗
    if (captchaEnabled.value && captchaType.value === 'slider') {
      openSliderModal()
      return
    }

    // 其他类型直接登录
    await doLogin()
  } catch (error: any) {
    // 表单验证失败
  }
}

// 执行实际登录
async function doLogin() {
  loading.value = true
  try {
    const loginData: any = {
      username: formData.username,
      password: formData.password
    }

    // 根据验证码类型传递不同参数
    if (captchaEnabled.value) {
      if (captchaType.value === 'image') {
        loginData.uuid = captchaUuid.value
        loginData.code = formData.code
      } else if (captchaType.value === 'slider') {
        loginData.code = 'slider_verified'
      } else if (captchaType.value === 'sms') {
        loginData.phone = smsPhone.value
        loginData.code = formData.code
      }
    }

    // 如果启用记住我
    if (rememberMeEnabled.value) {
      loginData.rememberMe = formData.rememberMe
    }

    await userStore.login(loginData)
    message.success('登录成功')
    const redirect = route.query.redirect as string
    router.push(redirect || '/')
  } catch (error: any) {
    // 刷新验证码
    if (captchaEnabled.value && captchaType.value === 'image') {
      loadCaptcha()
    } else if (captchaEnabled.value && captchaType.value === 'slider') {
      sliderVerified.value = false
    }
  } finally {
    loading.value = false
  }
}

// 跳转注册页面
function goRegister() {
  router.push('/register')
}

// 颜色调整函数（调深或调亮）
function adjustColor(hex: string, percent: number): string {
  const num = parseInt(hex.replace('#', ''), 16)
  const r = Math.min(255, Math.max(0, (num >> 16) + percent))
  const g = Math.min(255, Math.max(0, ((num >> 8) & 0x00FF) + percent))
  const b = Math.min(255, Math.max(0, (num & 0x0000FF) + percent))
  return `#${((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)}`
}
</script>

<style lang="scss" scoped>
/* ==================== 公共样式 ==================== */
.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;

  @media (max-width: 768px) {
    min-height: 100dvh;
    height: auto;
    align-items: center;
    justify-content: center;
    padding: 16px 12px;
  }
}

/* 移动端专属品牌顶部栏 */
.mobile-login-header {
  display: none;

  @media (max-width: 768px) {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 18px;
    width: 100%;

    .mobile-brand-box {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .mobile-brand-logo,
    .mobile-brand-icon {
      width: 40px;
      height: 40px;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      font-weight: 700;
      color: #fff;
      box-shadow: 0 4px 10px rgba(79, 70, 229, 0.25);
      object-fit: contain;
      flex-shrink: 0;
    }

    .mobile-brand-info {
      display: flex;
      flex-direction: column;
      gap: 2px;
    }

    .mobile-brand-name {
      font-size: 18px;
      font-weight: 700;
      color: #111827;
      line-height: 1.2;
    }

    .mobile-brand-desc {
      font-size: 11.5px;
      color: #6B7280;
    }

    .mobile-project-pill {
      display: flex;
      align-items: center;
      padding: 8px 12px;
      background: linear-gradient(135deg, rgba(79, 70, 229, 0.08) 0%, rgba(99, 102, 241, 0.12) 100%);
      border: 1px solid rgba(79, 70, 229, 0.2);
      border-radius: 20px;
      cursor: pointer;
      transition: all 0.2s ease;

      &:active {
        background: rgba(79, 70, 229, 0.18);
        transform: scale(0.99);
      }

      .pill-dot {
        font-size: 13px;
        margin-right: 6px;
      }

      .pill-text {
        font-size: 12px;
        font-weight: 600;
        color: #4F46E5;
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }

      .pill-arrow {
        font-size: 14px;
        color: #4F46E5;
        font-weight: 700;
        margin-left: 4px;
      }
    }
  }
}

.style-switcher {
  position: fixed;
  top: 20px;
  right: 20px;
  display: flex;
  gap: 8px;
  z-index: 100;
  background: rgba(255, 255, 255, 0.9);
  padding: 8px;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);

  @media (max-width: 768px) {
    display: none !important;
  }
}

.style-option {
  width: 36px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;
  color: #666;

  &:hover {
    background: #f0f0f0;
    color: #333;
  }

  &.active {
    background: #111827;
    color: #fff;
  }
}

:deep(.n-form-item) {
  margin-bottom: 18px;
}

:deep(.n-form-item-label) {
  font-weight: 500;
}

:deep(.n-input) {
  --n-height: 40px;
  --n-border-radius: 8px;
}

:deep(.n-button) {
  --n-height: 40px;
  --n-border-radius: 8px;
  font-weight: 600;
  font-size: 14px;
}

/* ==================== 样式一：左右分栏式 ==================== */
.style-1 {
  background: linear-gradient(135deg, #F9FAFB 0%, #E5E7EB 100%);
  padding: 20px;
}

.style1-container {
  display: flex;
  width: 100%;
  max-width: 1000px;
  min-height: 600px;
  background: #FFFFFF;
  border-radius: 24px;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
  overflow: hidden;

  @media (max-width: 768px) {
    flex-direction: column;
    min-height: auto;
    border-radius: 20px;
    width: 100% !important;
    max-width: 400px !important;
    margin: 0 auto !important;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08) !important;
  }
}

.login-banner {
  flex: 1;
  background: linear-gradient(135deg, #111827 0%, #1F2937 100%);
  padding: 48px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
  overflow: hidden;

  @media (max-width: 768px) {
    display: none !important;
  }
}

.banner-content {
  position: relative;
  z-index: 1;
}

.banner-logo {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 32px;

  .logo-icon {
    width: 48px;
    height: 48px;
    background: #FFFFFF;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--primary-color, #111827);
    font-size: 24px;
    font-weight: 700;
  }

  .logo-img {
    width: 48px;
    height: 48px;
    object-fit: contain;
    border-radius: 12px;
  }

  .logo-img-small {
    width: 52px;
    height: 52px;
    object-fit: contain;
    border-radius: 14px;
  }

  .brand-logo-img {
    width: 56px;
    height: 56px;
    object-fit: contain;
    border-radius: 14px;
  }

  .logo-text {
    font-size: 24px;
    font-weight: 700;
    color: #FFFFFF;
  }
}

.banner-title {
  font-size: 36px;
  font-weight: 700;
  color: #FFFFFF;
  margin-bottom: 16px;
}

.banner-desc {
  font-size: 16px;
  color: #d9dbdd;
  margin-bottom: 40px;
}

.banner-features {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.feature-item {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 15px;
  color: #D1D5DB;

  .feature-icon {
    width: 36px;
    height: 36px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
  }

  .feature-dot {
    width: 6px;
    height: 6px;
    background: currentColor;
    border-radius: 50%;
    flex-shrink: 0;
    opacity: 0.6;
  }
}

.banner-decoration {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.decoration-circle {
  position: absolute;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.03);

  &.circle-1 { width: 400px; height: 400px; top: -100px; right: -100px; }
  &.circle-2 { width: 300px; height: 300px; bottom: -50px; left: -50px; }
  &.circle-3 { width: 200px; height: 200px; top: 50%; left: 50%; transform: translate(-50%, -50%); }
}

.login-form-wrapper {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 32px;

  @media (max-width: 768px) {
    padding: 24px 18px;
  }
}

.login-form {
  width: 100%;
  max-width: 320px;

  @media (max-width: 768px) {
    max-width: 100%;
  }
}

.form-title {
  font-size: 24px;
  font-weight: 700;
  color: #111827;
  margin-bottom: 6px;
}

.form-subtitle {
  font-size: 14px;
  color: #6B7280;
  margin-bottom: 24px;
}

/* 验证码 */
.captcha-row {
  display: flex;
  align-items: center;
  gap: 12px;
  width: 100%;

  .n-input {
    flex: 1;
  }

  &.dark .captcha-img {
    border-color: rgba(255, 255, 255, 0.2);
  }
}

.captcha-img {
  height: 40px;
  border-radius: 6px;
  cursor: pointer;
  border: 1px solid #E5E7EB;

  &:hover {
    opacity: 0.8;
  }
}

/* 登录选项 */
.login-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;

  &.dark {
    .register-link {
      color: rgba(255, 255, 255, 0.7);

      &:hover {
        color: #fff;
      }
    }
  }
}

.register-link {
  color: #111827;
  font-size: 14px;
  cursor: pointer;
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}

/* 滑块验证弹窗 */
.slider-puzzle-container {
  width: 380px;
  background: #fff;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.slider-puzzle-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 20px;
  font-size: 15px;
  color: #1f2937;
  border-bottom: 1px solid #f0f0f0;
}

.slider-puzzle-image {
  position: relative;
  width: 100%;
  height: 200px;
  overflow: hidden;
  user-select: none;
}

.puzzle-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;

  &.puzzle-bg-0 {
    background-image: url('https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400&h=200&fit=crop');
  }

  &.puzzle-bg-1 {
    background-image: url('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop');
  }

  &.puzzle-bg-2 {
    background-image: url('https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=400&h=200&fit=crop');
  }
}

.puzzle-slot {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 50px;
  height: 50px;
  background: rgba(0, 0, 0, 0.3);
  border-radius: 4px;
  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.3);

  &::before {
    content: '';
    position: absolute;
    top: 50%;
    left: -8px;
    transform: translateY(-50%);
    width: 16px;
    height: 16px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 50%;
  }
}

.puzzle-piece {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 50px;
  height: 50px;
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
  transition: box-shadow 0.2s;

  &::before {
    content: '';
    position: absolute;
    top: 50%;
    left: -8px;
    transform: translateY(-50%);
    width: 16px;
    height: 16px;
    background: inherit;
    border-radius: 50%;
    overflow: hidden;
  }

  &.verified {
    box-shadow: 0 0 0 3px #22c55e, 0 2px 10px rgba(0, 0, 0, 0.3);
  }
}

.puzzle-piece-bg {
  width: 380px;
  height: 200px;
  background-size: cover;
  background-position: center;
  position: absolute;
  top: -75px;
  left: 0;

  &.puzzle-bg-0 {
    background-image: url('https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400&h=200&fit=crop');
  }

  &.puzzle-bg-1 {
    background-image: url('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=200&fit=crop');
  }

  &.puzzle-bg-2 {
    background-image: url('https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=400&h=200&fit=crop');
  }
}

.slider-puzzle-track {
  position: relative;
  height: 50px;
  padding: 0 20px;
  display: flex;
  align-items: center;
  background: #f5f7fa;
}

.slider-track-bg {
  position: absolute;
  left: 20px;
  right: 20px;
  height: 36px;
  background: #e5e7eb;
  border-radius: 4px;
  overflow: hidden;
}

.slider-track-progress {
  height: 100%;
  background: linear-gradient(90deg, #22c55e 0%, #16a34a 100%);
  transition: width 0.05s linear;
}

.slider-handle {
  position: absolute;
  left: 20px;
  width: 50px;
  height: 36px;
  background: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: grab;
  z-index: 1;
  transition: background 0.2s, box-shadow 0.2s;
  color: #6b7280;

  &:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  }

  &.dragging {
    cursor: grabbing;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.25);
  }

  &.verified {
    background: #22c55e;
    color: #fff;
  }
}

.slider-track-tip {
  position: absolute;
  left: 80px;
  right: 20px;
  text-align: center;
  font-size: 13px;
  color: #9ca3af;
  pointer-events: none;
}

.slider-puzzle-footer {
  padding: 12px 20px;
  border-top: 1px solid #f0f0f0;
  display: flex;
  justify-content: flex-start;

  .n-button {
    display: flex;
    align-items: center;
    gap: 4px;
    color: #6b7280;

    &:hover {
      color: #111827;
    }
  }
}

/* 短信验证码 */
.sms-row {
  display: flex;
  gap: 12px;
  width: 100%;

  .n-input {
    flex: 1;
  }

  .n-button {
    flex-shrink: 0;
    width: 120px;
  }
}

/* ==================== 样式二：全屏背景 ==================== */
.style-2 {
  background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
}

.style2-bg {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.style2-container {
  max-width: 100vw !important;
  min-height: 100vh !important;
  border-radius: 0 !important;
  box-shadow: none !important;
  margin: 0 !important;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
}

/* 样式二全屏左右比例调整 */
.style2-container .login-banner {
  flex: 1.2;
  border-radius: 0;
}

.style2-container .login-form-wrapper {
  flex: 0.8;
  border-radius: 0;
  background: #ffffff;
}

@media (max-width: 768px) {
  .style2-container {
    flex-direction: column;
    width: 100% !important;
    max-width: 400px !important;
    min-height: auto !important;
    border-radius: 20px !important;
    position: relative !important;
    margin: 0 auto !important;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25) !important;
    overflow: hidden !important;
  }

  .style2-container .login-banner {
    display: none !important;
  }

  .style2-container .login-form-wrapper {
    flex: none !important;
    padding: 24px 20px !important;
    border-radius: 20px !important;
  }
}

.style2-footer {
  position: absolute;
  bottom: 24px;
  left: 0;
  right: 0;
  text-align: center;
  color: #9CA3AF;
  font-size: 13px;
  z-index: 1;
}

.style1-footer {
  position: absolute;
  bottom: 24px;
  left: 0;
  right: 0;
  text-align: center;
  color: #6B7280;
  font-size: 13px;
}

.style3-footer {
  position: absolute;
  bottom: 24px;
  left: 0;
  right: 0;
  text-align: center;
  color: rgba(255, 255, 255, 0.6);
  font-size: 13px;
  z-index: 1;
}

@media (max-width: 768px) {
  .style1-footer,
  .style2-footer,
  .style3-footer {
    position: static;
    margin-top: 16px;
    padding-bottom: 20px;
  }
}

/* ==================== 样式三：毛玻璃 ==================== */
.style-3 {
  background: linear-gradient(135deg, #111827 0%, #1F2937 50%, #111827 100%);
}

.style3-bg {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background:
    radial-gradient(ellipse at 20% 30%, rgba(255, 255, 255, 0.05) 0%, transparent 50%),
    radial-gradient(ellipse at 80% 70%, rgba(255, 255, 255, 0.03) 0%, transparent 50%);
}

/* 样式三的毛玻璃效果 */
.style3-glass {
  background: rgba(255, 255, 255, 0.08) !important;
  backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 25px 80px -20px rgba(0, 0, 0, 0.5);

  .login-banner {
    background: transparent;

    .banner-logo .logo-icon {
      background: rgba(255, 255, 255, 0.15);
      color: #fff;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .banner-logo .logo-text,
    .banner-title {
      color: #fff;
    }

    .banner-desc {
      color: rgba(255, 255, 255, 0.7);
    }

    .banner-features .feature-item {
      color: rgba(255, 255, 255, 0.8);
    }

    .banner-features .feature-dot {
      width: 6px;
      height: 6px;
      background: rgba(255, 255, 255, 0.6);
      border-radius: 50%;
      flex-shrink: 0;
    }

    .decoration-circle {
      border-color: rgba(255, 255, 255, 0.08);
    }
  }

  .login-form-wrapper {
    background: transparent;
  }
}

/* 样式三表单毛玻璃效果 */
.style3-form-glass {
  background: rgba(255, 255, 255, 0.1) !important;
  backdrop-filter: blur(16px);
  border-left: 1px solid rgba(255, 255, 255, 0.1);

  .login-form {
    .form-title {
      color: #fff;
    }

    .form-subtitle {
      color: rgba(255, 255, 255, 0.6);
    }
  }

  :deep(.n-form-item-label) {
    color: rgba(255, 255, 255, 0.8) !important;
  }

  :deep(.n-input) {
    --n-color: rgba(255, 255, 255, 0.08);
    --n-color-focus: rgba(255, 255, 255, 0.12);
    --n-border: 1px solid rgba(255, 255, 255, 0.15);
    --n-border-hover: 1px solid rgba(255, 255, 255, 0.25);
    --n-border-focus: 1px solid rgba(255, 255, 255, 0.3);
    --n-text-color: #fff;
    --n-placeholder-color: rgba(255, 255, 255, 0.4);
    --n-caret-color: #fff;

    .n-input__prefix {
      color: rgba(255, 255, 255, 0.5);
    }

    .n-input__eye {
      color: rgba(255, 255, 255, 0.5);

      &:hover {
        color: rgba(255, 255, 255, 0.8);
      }
    }
  }

  :deep(.n-checkbox) {
    --n-text-color: rgba(255, 255, 255, 0.8);
  }

  .login-options .register-link {
    color: rgba(255, 255, 255, 0.6);

    &:hover {
      color: #fff;
    }
  }

  .captcha-img {
    border: 1px solid rgba(255, 255, 255, 0.15);
  }
}

/* ==================== 响应式 ==================== */
@media (max-width: 768px) {
  .login-page {
    padding: 6px 10px !important;
    flex-direction: column !important;
    min-height: 100dvh !important;
    justify-content: center !important;
    background: radial-gradient(circle at 50% 0%, rgba(99, 102, 241, 0.12) 0%, #f8fafc 60%, #e2e8f0 100%) !important;
  }

  .login-container, .style1-container, .style2-container {
    width: 100% !important;
    max-width: 100% !important;
    flex-shrink: 0 !important;
    border-radius: 16px !important;
    min-height: auto !important;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.08), 0 0 0 1px rgba(0, 0, 0, 0.04) !important;
  }

  .login-banner {
    display: none !important;
  }

  .login-form-wrapper {
    width: 100% !important;
    padding: 14px 14px 10px !important;
  }

  .login-form {
    width: 100% !important;
    max-width: 100% !important;
  }

  .mobile-login-header {
    margin-bottom: 8px !important;
  }

  .mobile-brand-box {
    margin-bottom: 4px !important;
  }

  .mobile-project-pill {
    padding: 4px 10px !important;
    font-size: 11px !important;
    margin-bottom: 6px !important;
    border-radius: 20px !important;
    background: linear-gradient(135deg, rgba(79, 70, 229, 0.08) 0%, rgba(124, 58, 237, 0.08) 100%) !important;
    border: 1px solid rgba(79, 70, 229, 0.2) !important;
  }

  .form-title {
    font-size: 18px !important;
    margin-bottom: 2px !important;
  }

  .form-subtitle {
    font-size: 11px !important;
    margin-bottom: 6px !important;
  }

  .n-form-item {
    margin-bottom: 6px !important;
    --n-feedback-height: 0px !important;
  }

  :deep(.n-input) {
    --n-height: 38px !important;
    border-radius: 8px !important;
  }

  :deep(.n-button) {
    --n-height: 40px !important;
    border-radius: 8px !important;
  }

  .captcha-row {
    .captcha-img {
      height: 38px !important;
    }
  }

  .login-options {
    margin-bottom: 2px !important;
    font-size: 12px !important;
  }

  .demo-accounts-box {
    margin-top: 8px !important;
    padding: 6px 8px !important;
    background: #f8fafc !important;
    border: 1px dashed #cbd5e1 !important;
    border-radius: 10px !important;
  }

  .demo-box-header {
    margin-bottom: 5px !important;
    justify-content: space-between !important;

    .demo-tag {
      font-size: 9px !important;
      padding: 1px 4px !important;
    }

    .demo-box-title {
      font-size: 11px !important;
    }
  }

  .demo-accounts-grid {
    display: grid !important;
    grid-template-columns: repeat(3, 1fr) !important;
    gap: 5px !important;
  }

  .demo-account-card {
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    padding: 5px 3px !important;
    border-radius: 6px !important;
    background: #ffffff !important;
    border: 1px solid #e2e8f0 !important;
    cursor: pointer !important;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1) !important;

    &:active {
      transform: scale(0.96) !important;
      background: #f1f5f9 !important;
    }

    .demo-account-left {
      flex-direction: column !important;
      align-items: center !important;
      gap: 1px !important;
    }

    .demo-role-badge {
      font-size: 10.5px !important;
      font-weight: 700 !important;
      padding: 0 !important;
      line-height: 1.2 !important;
    }

    .demo-account-info {
      font-size: 9.5px !important;
      color: #64748b !important;
    }

    .demo-pwd {
      display: none !important;
    }

    .demo-fill-action {
      font-size: 9.5px !important;
      margin-top: 2px !important;
      padding: 1px 4px !important;
      border-radius: 3px !important;
      background: #eef2ff !important;
      color: #4f46e5 !important;
      font-weight: 600 !important;
      line-height: 1.2 !important;
    }
  }
}

/* ==================== 演示账号快捷体验区域 ==================== */
.demo-accounts-box {
  margin-top: 20px;
  padding: 12px 14px;
  background: #F9FAFB;
  border-radius: 12px;
  border: 1px dashed #D1D5DB;
  transition: all 0.2s;

  &:hover {
    border-color: var(--primary-color, #4F46E5);
    background: #F4F5F7;
  }
}

.demo-box-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 10px;

  .demo-tag {
    font-size: 10px;
    font-weight: 700;
    padding: 2px 6px;
    border-radius: 4px;
    background: var(--primary-color, #4F46E5);
    color: #fff;
    letter-spacing: 0.5px;
  }

  .demo-box-title {
    font-size: 12px;
    font-weight: 600;
    color: #4B5563;
  }
}

.demo-accounts-grid {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.demo-account-card {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 7px 10px;
  background: #FFFFFF;
  border: 1px solid #E5E7EB;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;

  &:hover {
    border-color: var(--primary-color, #4F46E5);
    background: rgba(79, 70, 229, 0.04);
    transform: translateX(2px);

    .demo-fill-action {
      background: var(--primary-color, #4F46E5);
      color: #fff;
    }
  }

  .demo-account-left {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .demo-role-badge {
    font-size: 12px;
    font-weight: 600;
    min-width: 68px;
  }

  .demo-account-info {
    font-size: 12px;
    color: #6B7280;
    font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;

    .demo-user {
      font-weight: 600;
      color: #111827;
    }

    .demo-pwd {
      color: #9CA3AF;
      margin-left: 2px;
    }
  }

  .demo-fill-action {
    font-size: 11px;
    font-weight: 500;
    padding: 2px 8px;
    border-radius: 4px;
    background: #F3F4F6;
    color: #4B5563;
    transition: all 0.2s;
  }
}

.style3-form-glass {
  .demo-accounts-box {
    background: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.25);
  }
  .demo-box-title {
    color: #fff;
  }
  .demo-account-card {
    background: rgba(255, 255, 255, 0.15);
    border-color: rgba(255, 255, 255, 0.2);

    &:hover {
      background: rgba(255, 255, 255, 0.25);
    }

    .demo-user {
      color: #fff;
    }
    .demo-pwd {
      color: rgba(255, 255, 255, 0.7);
    }
  }
}

.banner-project-action {
  margin-top: 18px;
}

.demo-box-header {
  .demo-header-intro-btn {
    margin-left: auto;
    font-size: 12px;
    display: inline-flex;
    align-items: center;
    gap: 2px;
    cursor: pointer;
  }
}
</style>

<style lang="scss">
/* 项目定位与解决痛点弹窗 (全局挂载适配) */
.project-intro-modal {
  transition: transform 0.15s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.15s cubic-bezier(0.4, 0, 0.2, 1) !important;

  @media (max-width: 768px) {
    width: 94vw !important;
    max-width: 94vw !important;
    max-height: 86vh !important;
    margin: 8px auto !important;
    border-radius: 16px !important;

    .n-card__content {
      padding: 10px 12px !important;
      max-height: 58vh !important;
      overflow-y: auto !important;
      -webkit-overflow-scrolling: touch !important;
    }

    .n-card-header {
      padding: 12px 14px !important;
      .n-card-header__main {
        font-size: 13px !important;
      }
    }

    .project-modal-body {
      padding: 0;
    }

    .project-overview-hero {
      padding: 10px 12px;
      margin-bottom: 10px;
      .hero-desc {
        font-size: 11.5px;
        line-height: 1.5;
      }
    }

    .painpoints-grid {
      grid-template-columns: 1fr !important;
      gap: 8px !important;
      margin-bottom: 10px !important;
    }

    .painpoint-card {
      padding: 10px 12px;
      gap: 6px;

      .card-title-wrap h4 {
        font-size: 12.5px;
      }

      .card-content {
        font-size: 11.5px;
        gap: 6px;
      }
    }

    .tech-matrix-box {
      padding: 10px 12px;
      margin-bottom: 10px;
      .matrix-grid {
        grid-template-columns: 1fr !important;
        gap: 6px;
      }
    }

    .modal-accounts-flex .account-item {
      flex-wrap: wrap;
      gap: 6px;
      padding: 6px 10px;
      font-size: 11px;
    }

    .project-modal-footer {
      flex-direction: column !important;
      gap: 8px !important;
      align-items: stretch !important;

      .footer-tip {
        display: none !important;
      }

      .footer-btns {
        display: flex !important;
        flex-direction: column-reverse !important;
        width: 100% !important;
        gap: 8px !important;

        .n-button {
          width: 100% !important;
          height: 38px !important;
          font-size: 13px !important;
        }
      }
    }
  }

  .n-card-header__main {
    font-size: 16px;
    font-weight: 700;
  }

  .project-overview-hero {
    background: linear-gradient(135deg, rgba(99, 102, 241, 0.08) 0%, rgba(59, 130, 246, 0.05) 100%);
    border: 1px solid rgba(99, 102, 241, 0.2);
    border-radius: 8px;
    padding: 14px 18px;
    margin-bottom: 18px;

    .hero-badge {
      display: inline-block;
      font-size: 11px;
      font-weight: 700;
      color: #4F46E5;
      background: rgba(79, 70, 229, 0.12);
      padding: 2px 8px;
      border-radius: 4px;
      margin-bottom: 6px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .hero-desc {
      font-size: 13.5px;
      color: #374151;
      line-height: 1.6;
      margin: 0;

      strong {
        color: #1F2937;
      }
    }
  }

  .painpoints-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 14px;
    margin-bottom: 18px;

    @media (max-width: 768px) {
      grid-template-columns: 1fr;
    }
  }

  .painpoint-card {
    background: #F9FAFB;
    border: 1px solid #E5E7EB;
    border-radius: 8px;
    padding: 14px;
    display: flex;
    flex-direction: column;
    gap: 10px;
    transition: all 0.25s ease;

    &:hover {
      border-color: #6366F1;
      box-shadow: 0 4px 14px rgba(99, 102, 241, 0.09);
      transform: translateY(-2px);
    }

    .card-header {
      display: flex;
      align-items: flex-start;
      gap: 10px;

      .card-icon-wrap {
        width: 34px;
        height: 34px;
        border-radius: 6px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        flex-shrink: 0;
        background: #EEF2FF;
      }

      .card-title-wrap {
        display: flex;
        flex-direction: column;
        gap: 2px;

        .card-badge {
          font-size: 11px;
          font-weight: 600;
          color: #6366F1;
        }

        h4 {
          margin: 0;
          font-size: 13.5px;
          font-weight: 600;
          color: #111827;
          line-height: 1.4;
        }
      }
    }

    .card-content {
      display: flex;
      flex-direction: column;
      gap: 8px;
      font-size: 12.5px;
      line-height: 1.5;

      .pain-problem {
        color: #6B7280;
        background: #F3F4F6;
        padding: 6px 10px;
        border-radius: 4px;

        .label {
          font-weight: 600;
          color: #DC2626;
        }
      }

      .pain-solution {
        color: #374151;

        .label {
          font-weight: 600;
          color: #059669;
        }
      }

      .card-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 6px;
        margin-top: 4px;

        .tech-pill {
          font-size: 11px;
          color: #4338CA;
          background: #EEF2FF;
          padding: 2px 6px;
          border-radius: 4px;
        }
      }
    }
  }

  .tech-matrix-box {
    background: #F9FAFB;
    border: 1px dashed #D1D5DB;
    border-radius: 8px;
    padding: 12px 16px;
    margin-bottom: 16px;

    .matrix-title {
      font-size: 13px;
      font-weight: 600;
      color: #374151;
      margin-bottom: 8px;
    }

    .matrix-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 12px;

      @media (max-width: 768px) {
        grid-template-columns: 1fr;
      }

      .matrix-col {
        .matrix-label {
          font-size: 11px;
          font-weight: 600;
          color: #6B7280;
          margin-bottom: 3px;
        }

        .matrix-text {
          font-size: 12px;
          color: #1F2937;
          line-height: 1.4;
          font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
        }
      }
    }
  }

  .modal-demo-accounts {
    margin-top: 4px;

    .modal-demo-title {
      font-size: 12.5px;
      font-weight: 600;
      color: #4B5563;
      margin-bottom: 8px;
    }

    .modal-accounts-flex {
      display: flex;
      flex-direction: column;
      gap: 6px;

      .account-item {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 6px 12px;
        background: #F3F4F6;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.2s;

        &:hover {
          background: #E5E7EB;
        }

        .acc-badge {
          font-size: 11px;
          font-weight: 600;
          padding: 1px 6px;
          border-radius: 3px;
          border: 1px solid currentColor;
          min-width: 60px;
          text-align: center;
        }

        .acc-text {
          font-size: 12px;
          color: #374151;
          font-family: ui-monospace, monospace;
        }

        .acc-desc {
          font-size: 11px;
          color: #6B7280;
        }
      }
    }
  }

  .project-modal-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;

    @media (max-width: 640px) {
      flex-direction: column;
      gap: 10px;
      align-items: stretch;
    }

    .footer-tip {
      font-size: 12px;
      color: #6B7280;
    }

    .footer-btns {
      display: flex;
      gap: 10px;
      justify-content: flex-end;
    }
  }
}
</style>
