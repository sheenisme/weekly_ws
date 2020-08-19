'use strict'
// 引入vue和axios
import Vue from 'vue'
import axios from 'axios'
import router from '../router'

import {
  serveUrl,
  getConfig,
  postConfig
} from './config'

// 继承vue的原型方法
Vue.prototype.axios = axios
const service = axios.create({
  baseURL: '/weekly_node',
  // baseURL: '/',
  timeout: 10000
})

// 开发环境调试用户信息
service.interceptors.request.use(config => {
  if (process.env.NODE_ENV === 'development') {
    config.headers['username'] = 'test'
  }
  return config
})

service.interceptors.response.use(
  response => {
    let data = response.data
    if (!data.data) {
      //   登陆成功的回调地址
      return data
    } else {
      return data
    }
  },
  // eslint-disable-next-line handle-callback-err
  error => ({
    code: -1,
    msg: '网络异常'
  })
)
export default {
  // API请求example
  getUserInfo: params => {
    return service.post('/home/user/queryuser', params)
  },
  login: params => {
    return service.post('/home/user/login', params)
  },
  logout: params => {
    return service.post('/home/user/logout', params)
  },
  changePassword: params => {
    return service.post('/home/user/changepass', params)
  },
  addWeekly: params => {
    return service.post('/home/weekly/addWeekly', params)
  },
  getCurrentWeekly: params => {
    return service.post('/home/weekly/getCurrentWeekly', params)
  },
  getWeeklyList: params => {
    return service.get('/home/weekly/getWeeklyList', params)
  },

  getDepartmentWeeklyList: params => {
    return service.post('/home/weekly/getDepartmentWeeklyList', params)
  },
  getDepartmentHistoryWeeklyList: params => {
    return service.post('/home/weekly/getDepartmentHistoryWeeklyList', params)
  },

  getDepartmentMemberList: params => {
    return service.post('/home/department/getDepartmentMemberList', params)
  },
  getDepartmentMemberListNoPage: params => {
    return service.post('/home/department/getDepartmentMemberListNoPage', params)
  },
  getUnDepartmentMemberList: params => {
    return service.post('/home/department/getUnDepartmentMemberList', params)
  },
  addUser: params => {
    return service.post('/home/user/register', params)
  },
  deleteUser: params => {
    return service.post('/home/user/deleteUser', params)
  },
  getAllDepartmentList: params => {
    return service.post('/home/department/getAllDepartmentList', params)
  },
  getRole: params => {
    return service.post('/home/role/getRole', params)
  },
  /* 设置 */
  addDepartment: params => {
    return service.post('/home/company/addDepartment', params)
  },
  deleteDepartment: params => {
    return service.post('/home/company/deleteDepartment', params)
  },
  /* daashboard */
  getBoard: params => {
    return service.post('/home/department/getBoard', params)
  },
  /* 获取所有公司 */
  getAllCompanyList: params => {
    return service.post('/home/company/getAllCompanyList', params)
  },
  /* 获取所有的人 */
  getAllMemberList: params => {
    return service.post('/home/company/getAllMemberList', params)
  },
  /* 新增公司 */
  addUpdateCompany: params => {
    return service.post('/home/company/addUpdateCompany', params)
  },
  /* 删除公司 */
  deleteCompany: params => {
    return service.post('/home/company/deleteCompany', params)
  },
  /* 登入和登出日志 */
  getLoginLog: params => {
    return service.post('/home/log/getLoginLog', params)
  },

  // 新增关于新闻的函数
  /* 增加新闻 */
  addNews: params => {
    return service.post('/home/news/addNews', params)
  },
  /* 获得新闻 */
  getNews: params => {
    return service.post('/home/news/getNews', params)
  },
  updateNews: params => {
    return service.post('/home/news/updateNews', params)
  },

  // 新增关于重点督办的函数
  addKeySupervision: params => {
    return service.post('/home/keysupervison/addKeySupervision', params)
  },
  getKeySupervision: params => {
    return service.post('/home/keysupervison/getKeySupervision', params)
  },
  getKeyTree: params => {
    return service.post('/home/keysupervison/getKeyTree', params)
  },
  getKeysById: params => {
    return service.post('/home/keysupervison/getKeysById', params)
  },
  updateKeySupervision: params => {
    return service.post('/home/keysupervison/updateKeySupervision', params)
  },
  getNowKeySupervision: params => {
    return service.post('/home/keysupervison/getNowKeySupervision', params)
  },
  // 提交下周工作计划
  addNextContent: params => {
    return service.post('/home/nextcontent/addNextContent', params)
  },
  getNextContent: params => {
    return service.post('/home/nextcontent/getNextContent', params)
  }
  /**
   * API demo
   *
   * getAPI: (params) => {
   *    getConfig.params = params.params
   *    return axios.get('xxxx.do', getConfig)
   * }
   *
   * postAPI: (params) => {
   *     return axios.post('xxxx.do', params, postConfig)
   * }
   */

}
