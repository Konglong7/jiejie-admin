import type { GlobalThemeOverrides } from 'naive-ui'

// 生成主题色衍生配置
export function generateColorVariants(baseColor: string) {
  const hex = baseColor.replace('#', '')
  const num = parseInt(hex, 16)
  const r0 = (num >> 16) & 255
  const g0 = (num >> 8) & 255
  const b0 = num & 255

  const toHex = (r: number, g: number, b: number) =>
    `#${Math.min(255, Math.max(0, Math.round(r))).toString(16).padStart(2, '0')}${Math.min(255, Math.max(0, Math.round(g))).toString(16).padStart(2, '0')}${Math.min(255, Math.max(0, Math.round(b))).toString(16).padStart(2, '0')}`

  return {
    primary: baseColor,
    hover: toHex(r0 + 20, g0 + 20, b0 + 20),
    pressed: toHex(r0 - 20, g0 - 20, b0 - 20),
    suppl: toHex(r0 - 10, g0 - 10, b0 - 10),
    light: toHex(r0 + 50, g0 + 50, b0 + 30),
    lighter: toHex(r0 + 75, g0 + 75, b0 + 40)
  }
}

// 亮色主题配置
export function getLightThemeOverrides(primaryColor: string): GlobalThemeOverrides {
  const colors = generateColorVariants(primaryColor)
  return {
    common: {
      primaryColor: colors.primary,
      primaryColorHover: colors.hover,
      primaryColorPressed: colors.pressed,
      primaryColorSuppl: colors.suppl,
      warningColor: colors.primary,
      warningColorHover: colors.hover,
      warningColorPressed: colors.pressed,
      warningColorSuppl: colors.suppl,
      textColorBase: '#1F2937',
      textColor1: '#1F2937',
      textColor2: '#6B7280',
      textColor3: '#9CA3AF',
      borderColor: '#E5E7EB',
      dividerColor: '#E5E7EB',
      inputColor: '#F9FAFB',
      tableColor: '#FFFFFF',
      cardColor: '#FFFFFF',
      modalColor: '#FFFFFF',
      bodyColor: '#F3F4F6',
      hoverColor: '#F3F4F6',
      borderRadius: '8px',
      borderRadiusSmall: '6px'
    },
    Button: {
      borderRadiusMedium: '8px',
      borderRadiusSmall: '6px',
      heightMedium: '36px',
      colorWarning: colors.primary,
      colorWarningHover: colors.hover,
      colorWarningPressed: colors.pressed,
      colorWarningFocus: colors.hover,
      borderWarning: `1px solid ${colors.primary}`,
      borderWarningHover: `1px solid ${colors.hover}`,
      borderWarningPressed: `1px solid ${colors.pressed}`,
      borderWarningFocus: `1px solid ${colors.hover}`,
      textColorWarning: '#ffffff',
      textColorWarningHover: '#ffffff',
      textColorWarningPressed: '#ffffff',
      textColorWarningFocus: '#ffffff',
      rippleColorWarning: colors.primary,
      colorGhostWarning: 'transparent',
      colorGhostWarningHover: `${colors.primary}15`,
      colorGhostWarningPressed: `${colors.primary}25`,
      colorGhostWarningFocus: `${colors.primary}15`,
      textColorGhostWarning: colors.primary,
      textColorGhostWarningHover: colors.hover,
      textColorGhostWarningPressed: colors.pressed,
      textColorGhostWarningFocus: colors.hover,
      borderGhostWarning: `1px solid ${colors.primary}`,
      borderGhostWarningHover: `1px solid ${colors.hover}`,
      borderGhostWarningPressed: `1px solid ${colors.pressed}`,
      borderGhostWarningFocus: `1px solid ${colors.hover}`,
      rippleColorGhostWarning: colors.primary
    },
    Card: {
      borderRadius: '12px',
      paddingMedium: '20px',
      titleFontSizeMedium: '16px'
    },
    DataTable: {
      borderRadius: '12px',
      thColor: '#F9FAFB',
      thTextColor: '#6B7280',
      thFontWeight: '600',
      tdColor: '#FFFFFF'
    },
    Input: {
      borderRadius: '8px',
      heightMedium: '36px'
    },
    Form: {
      labelFontSizeTopMedium: '14px',
      labelTextColor: '#374151'
    },
    Menu: {
      itemHeight: '44px',
      borderRadius: '8px',
      itemColorActive: `${colors.primary}15`,
      itemColorActiveHover: `${colors.primary}22`,
      itemTextColorActive: colors.primary,
      itemTextColorActiveHover: colors.primary,
      itemIconColorActive: colors.primary,
      itemIconColorActiveHover: colors.primary
    },
    Tag: {
      borderRadius: '6px',
      colorInfo: `${colors.primary}15`,
      colorInfoHover: `${colors.primary}25`,
      colorInfoPressed: `${colors.primary}35`,
      textColorInfo: colors.primary,
      borderInfo: `1px solid ${colors.primary}40`
    },
    Dialog: {
      borderRadius: '12px'
    }
  }
}

// 暗色主题配置
export function getDarkThemeOverrides(primaryColor: string): GlobalThemeOverrides {
  const colors = generateColorVariants(primaryColor)
  return {
    common: {
      primaryColor: colors.light,
      primaryColorHover: colors.lighter,
      primaryColorPressed: colors.primary,
      primaryColorSuppl: colors.hover,
      warningColor: colors.light,
      warningColorHover: colors.lighter,
      warningColorPressed: colors.primary,
      warningColorSuppl: colors.hover,
      bodyColor: '#101014',
      cardColor: '#18181c',
      modalColor: '#18181c',
      popoverColor: '#27272a',
      tableColor: '#18181c',
      inputColor: '#27272a',
      borderColor: '#3f3f46',
      dividerColor: '#3f3f46',
      hoverColor: '#27272a',
      borderRadius: '8px',
      borderRadiusSmall: '6px'
    },
    Button: {
      borderRadiusMedium: '8px',
      borderRadiusSmall: '6px',
      heightMedium: '36px',
      colorSecondary: '#27272a',
      colorSecondaryHover: '#3f3f46',
      colorSecondaryPressed: '#52525b',
      textColorPrimary: '#ffffff',
      textColorHoverPrimary: '#ffffff',
      textColorPressedPrimary: '#ffffff',
      textColorFocusPrimary: '#ffffff',
      textColorText: colors.light,
      textColorTextHover: colors.lighter,
      textColorTextPressed: colors.primary,
      textColorTextFocus: colors.light,
      textColor: '#ffffffd1',
      textColorHover: '#ffffff',
      textColorPressed: '#ffffffa6',
      colorWarning: colors.light,
      colorWarningHover: colors.lighter,
      colorWarningPressed: colors.primary,
      colorWarningFocus: colors.lighter,
      borderWarning: `1px solid ${colors.light}`,
      borderWarningHover: `1px solid ${colors.lighter}`,
      borderWarningPressed: `1px solid ${colors.primary}`,
      borderWarningFocus: `1px solid ${colors.lighter}`,
      textColorWarning: '#ffffff',
      textColorWarningHover: '#ffffff',
      textColorWarningPressed: '#ffffff',
      textColorWarningFocus: '#ffffff',
      rippleColorWarning: colors.light,
      colorGhostWarning: 'transparent',
      colorGhostWarningHover: `${colors.light}15`,
      colorGhostWarningPressed: `${colors.light}25`,
      colorGhostWarningFocus: `${colors.light}15`,
      textColorGhostWarning: colors.light,
      textColorGhostWarningHover: colors.lighter,
      textColorGhostWarningPressed: colors.primary,
      textColorGhostWarningFocus: colors.lighter,
      borderGhostWarning: `1px solid ${colors.light}`,
      borderGhostWarningHover: `1px solid ${colors.lighter}`,
      borderGhostWarningPressed: `1px solid ${colors.primary}`,
      borderGhostWarningFocus: `1px solid ${colors.lighter}`,
      rippleColorGhostWarning: colors.light
    },
    Card: {
      borderRadius: '12px',
      paddingMedium: '20px',
      titleFontSizeMedium: '16px',
      color: '#18181c',
      borderColor: '#3f3f46'
    },
    DataTable: {
      borderRadius: '12px',
      thFontWeight: '600',
      thColor: '#262629',
      tdColor: '#18181c',
      tdColorHover: '#262629',
      borderColor: '#3f3f46'
    },
    Input: {
      borderRadius: '8px',
      heightMedium: '36px',
      color: '#27272a',
      colorFocus: '#27272a',
      border: '1px solid #3f3f46',
      borderHover: '1px solid #52525b',
      borderFocus: `1px solid ${colors.light}`
    },
    Form: {
      labelFontSizeTopMedium: '14px'
    },
    Menu: {
      itemHeight: '44px',
      borderRadius: '8px',
      color: '#18181c',
      itemColorActive: `${colors.primary}25`,
      itemColorActiveHover: `${colors.primary}35`,
      itemTextColor: '#ffffffa6',
      itemTextColorHover: '#ffffff',
      itemTextColorActive: colors.light,
      itemTextColorActiveHover: colors.lighter,
      itemIconColor: '#ffffffa6',
      itemIconColorHover: '#ffffff',
      itemIconColorActive: colors.light,
      itemIconColorActiveHover: colors.lighter,
      itemTextColorChildActive: colors.light,
      itemTextColorChildActiveHover: colors.lighter,
      itemIconColorChildActive: colors.light,
      itemIconColorChildActiveHover: colors.lighter
    },
    Tag: {
      borderRadius: '6px',
      colorInfo: `${colors.light}20`,
      colorInfoHover: `${colors.light}30`,
      colorInfoPressed: `${colors.light}40`,
      textColorInfo: colors.light,
      borderInfo: `1px solid ${colors.light}50`
    },
    Dialog: {
      borderRadius: '12px',
      color: '#18181c'
    },
    Popover: {
      color: '#27272a'
    },
    Dropdown: {
      color: '#27272a'
    },
    InternalSelection: {
      color: '#27272a',
      colorActive: '#27272a',
      border: '1px solid #3f3f46',
      borderHover: '1px solid #52525b',
      borderActive: `1px solid ${colors.light}`,
      borderFocus: `1px solid ${colors.light}`
    },
    Tabs: {
      tabTextColorActiveLine: colors.light,
      tabTextColorHoverLine: colors.lighter,
      tabTextColorActiveBar: colors.light,
      tabTextColorHoverBar: colors.lighter,
      barColor: colors.light
    }
  }
}
