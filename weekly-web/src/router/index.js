import Vue from 'vue'
import Router from 'vue-router'

// 登陆
const login = () => import('@/views/login/index')

// 布局
const home = () => import('@/views/home')
// 首页
const dashBoard = () => import('@/views/dashBoard/dashBoard')

// 周报管理
const weeklyView = () => import('@/views/departmentManage/weeklyView')
const memberList = () => import('@/views/departmentManage/memberList')

// 写当前周
const writeWeekly = () => import('@/views/writeWeekly/index')
// 历史周报
const weeklyList = () => import('@/views/weeklyList/index')
const departmentWeeklyList = () => import(('@/views/departmentManage/departmentHistoryWeekly'))
// 历史纪要
const historicalSummary = () => import(('@/views/historicalSummary/historicalSummary'))

// 公司管理-管理部门
const companyManage = () => import('@/views/companyManagement/index')
// 管理员-管理公司
const adminCompany = () => import('@/views/admin/adminCompany')
const adminLog = () => import('@/views/admin/adminLog')

const adminNews = () => import(('@/views/admin/adminNews'))
const editNews = () => import(('@/views//historicalSummary/historicalSummary_enableEdit'))

const adminkeySupervision = () => import(('@/views/admin/adminkeySupervision'))
const keySupervision = () => import(('@/views/keySupervision/index'))

Vue.use(Router)

export default new Router({
  // base: '/weekly/',
  mode: 'history',
  routes: [
    {
      path: '/weekly/login',
      name: 'login',
      meta: {
        zhName: '登陆',
        key: '0',
        exp: false
      },
      component: login
    }, {
      path: '/login',
      name: 'login',
      redirect: '/weekly/login',
      meta: {
        zhName: '登陆',
        key: '0',
        exp: false
      },
      component: login
    }, {
      path: '/',
      name: 'home',
      redirect: '/weekly/writeWeekly',
      meta: {
        zhName: '主页',
        key: '1',
        exp: false
      },
      component: home
    }, {
      path: '/dashBoard',
      name: 'index',
      component: home,
      isNest: false,
      redirect: '/weekly/dashBoard',
      meta: {
        zhName: '概览',
        key: '0',
        role: 4,
        exp: false
      },
      children: [{
        path: '/weekly/dashBoard',
        name: 'dashBoard',
        icon: 'el-icon-view',
        meta: {
          //  zhName: '概览',
          zhName: '首页',
          key: '0-1',
          role: 4,
          exp: false
        },
        component: dashBoard
      }]
    }, {
      path: '/weekly/admin',
      name: 'admin',
      isNest: true,
      icon: 'el-icon-s-tools',
      component: home,
      meta: {
        zhName: '管理员管理',
        key: '5',
        role: 1,
        exp: false
      },
      children: [{
        path: '/weekly/adminCompany',
        name: 'adminCompany',
        component: adminCompany,
        meta: {
          zhName: '管理公司',
          key: '5-1',
          role: 1,
          exp: false
        }
      }, {
        path: '/admin/adminLog',
        name: 'adminLog',
        component: adminLog,
        meta: {
          zhName: '管理日志',
          key: '5-2',
          role: 1,
          exp: false
        }
      },
      // {
      //   path: '/admin/adminNews',
      //   name: 'adminNews',
      //   component: adminNews,
      //   meta: {
      //     zhName: '新增督办1',
      //     key: '5-3',
      //     role: 1,
      //     exp: false
      //   }
      // },
      // {
      //   path: '/admin/editNews',
      //   name: 'editNews',
      //   component: editNews,
      //   meta: {
      //     zhName: '修改督办1',
      //     key: '5-4',
      //     role: 1,
      //     exp: false
      //   }
      // },
      {
        path: '/admin/adminkeySupervision',
        name: 'adminkeySupervision',
        component: adminkeySupervision,
        meta: {
          zhName: '管理督办',
          key: '5-5',
          role: 1,
          exp: false
        }
      }
      ]
    }, {
      path: '/weekly/setting',
      name: 'setting',
      isNest: true,
      icon: 'el-icon-setting',
      component: home,
      meta: {
        zhName: '公司管理',
        key: '4',
        role: 1,
        exp: false
      },
      children: [{
        path: '/weekly/companyManage',
        name: 'companyManage',
        component: companyManage,
        meta: {
          zhName: '管理部门',
          key: '4-1',
          role: 1,
          exp: false
        }
      }, {
        path: '/weekly/memberList',
        name: 'memberList',
        component: memberList,
        meta: {
          zhName: '成员管理',
          key: '4-3',
          role: 1,
          exp: true
        }
      }]
    }, {
      path: '/writeWeekly',
      name: 'write',
      component: home,
      isNest: false,
      redirect: '/weekly/writeWeekly',
      meta: {
        zhName: '写周报',
        key: '2',
        role: 4,
        exp: true
      },
      children: [{
        path: '/weekly/writeWeekly',
        name: 'writeWeekly',
        icon: 'el-icon-edit',
        meta: {
          zhName: '填写周报',
          key: '2-1',
          role: 4,
          exp: true
        },
        component: writeWeekly
      }]
    }, {
      path: '/weeklyList',
      name: 'list',
      component: home,
      isNest: false,
      redirect: '/weekly/weeklyList',
      meta: {
        zhName: '周报列表',
        key: '3',
        role: 4,
        exp: true
      },
      children: [{
        path: '/weekly/weeklyList',
        name: 'weeklyList',
        icon: 'el-icon-search',
        meta: {
          zhName: '查看周报',
          key: '3-1',
          role: 4,
          exp: true
        },
        component: weeklyList
      }
      ]
    }, {
      path: '/weekly/departmentWeekly',
      name: 'departmentWeekly',
      isNest: false,
      component: home,
      meta: {
        zhName: '部门周报',
        key: '1',
        role: 3,
        exp: false
      },
      children: [{
        path: '/weekly/weeklyView',
        name: 'weeklyView',
        icon: 'el-icon-menu',
        component: weeklyView,
        meta: {
          zhName: '本周周报',
          key: '1-1',
          role: 3,
          exp: true
        }
      }]
    }, {
      path: '/weekly/HistoryWeekly',
      name: 'history',
      component: home,
      isNest: false,
      redirect: '/weekly/HistoryWeekly',
      meta: {
        zhName: '历史周报列表',
        key: '4',
        role: 4,
        exp: false
      },
      children: [{
        path: '/weekly/HistoryWeekly',
        name: 'departmentWeeklyList',
        icon: 'el-icon-notebook-2',
        component: departmentWeeklyList,
        meta: {
          zhName: '历史周报',
          key: '4-1',
          role: 4,
          exp: false
        }
      }]
    },
    // {
    //   path: '/historicalSummary',
    //   name: 'historicalSummary',
    //   component: home,
    //   isNest: false,
    //   redirect: '/weekly/historicalSummary',
    //   meta: {
    //     zhName: '历史督办列表',
    //     key: '10',
    //     role: 4
    //   },
    //   children: [{
    //     path: '/weekly/historicalSummary',
    //     name: 'historicalSummar',
    //     icon: 'el-icon-notebook-1',
    //     component: historicalSummary,
    //     meta: {
    //       zhName: '历史督办',
    //       key: '10-1',
    //       role: 4
    //     }
    //   }]
    // },
    {
      path: '/keySupervision',
      name: 'keySupervision',
      component: home,
      isNest: false,
      redirect: '/weekly/keySupervision',
      meta: {
        zhName: '重点督办',
        key: '11',
        role: 4,
        exp: false
      },
      children: [{
        path: '/weekly/keySupervision',
        name: 'keySupervision',
        icon: 'el-icon-message-solid',
        component: keySupervision,
        meta: {
          zhName: '重点督办',
          key: '11-1',
          role: 4,
          exp: false
        }
      }]
    }
  ]
})
