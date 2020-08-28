import Api from '../api/api'
import * as types from './mutation-types'

// example
export const getUserInfo = ({ commit }, params) => {
  return Api.getUserInfo(params).then(response => {
    commit(types.USER_INFO, response.data)
    return response
  })
}
// login
export const login = ({ commit }, params) => {
  return Api.login(params).then(response => {
    return response
  })
}
// change password
export const changePassword = ({ commit }, params) => {
  return Api.changePassword(params).then(response => {
    return response
  })
}
// logout
export const logout = ({ commit }, params) => {
  return Api.logout(params).then(response => {
    return response
  })
}
// add weekly
export const addWeekly = ({ commit }, params) => {
  return Api.addWeekly(params).then(response => {
    return response
  })
}
// get current weekly
export const getCurrentWeekly = ({ commit }, params) => {
  return Api.getCurrentWeekly(params).then(response => {
    commit(types.CURRENT_WEEKLY, response.data)
    return response
  })
}

// get eeklylist
export const getWeeklyList = ({ commit }, params) => {
  return Api.getWeeklyList(params).then(response => {
    commit(types.WEEKLY_LIST, response.data)
    return response
  })
}

// 获取部门本周周报数据
export const getDepartmentWeeklyList = ({ commit }, params) => {
  return Api.getDepartmentWeeklyList(params).then(response => {
    commit(types.DEPARTMENT_WEEKLY_LIST, response.data)
    return response
  })
}

// 获取部门历史周报数据
export const getDepartmentHistoryWeeklyList = ({ commit }, params) => {
  return Api.getDepartmentHistoryWeeklyList(params).then(response => {
    commit(types.DEPARTMENT_HISTORY_WEEKLY_LIST, response.data)
    return response
  })
}

// 获取部门人员列表-分页-搜索
export const getDepartmentMemberList = ({ commit }, params) => {
  return Api.getDepartmentMemberList(params).then(response => {
    return response
  })
}
// 获取部门人员列表-无分页-无搜索
export const getDepartmentMemberListNoPage = ({ commit }, params) => {
  return Api.getDepartmentMemberListNoPage(params).then(response => {
    return response
  })
}

// 获取未写周报人员列表
export const getUnDepartmentMemberList = ({ commit }, params) => {
  return Api.getUnDepartmentMemberList(params).then(response => {
    return response
  })
}
// 新增人员
export const addUser = ({ commit }, params) => {
  return Api.addUser(params).then(response => {
    return response
  })
}
// 删除人员
export const deleteUser = ({ commit }, params) => {
  return Api.deleteUser(params).then(response => {
    return response
  })
}
// 获取公司下所有部门
export const getAllDepartmentList = ({ commit }, params) => {
  return Api.getAllDepartmentList(params).then(response => {
    return response
  })
}
// 获取角色
export const getRole = ({ commit }, params) => {
  return Api.getRole(params).then(response => {
    return response
  })
}

// 新增部门
export const addDepartment = ({ commit }, params) => {
  return Api.addDepartment(params).then(response => {
    return response
  })
}
// 删除部门
export const deleteDepartment = ({ commit }, params) => {
  return Api.deleteDepartment(params).then(response => {
    return response
  })
}

// dashboard
export const getBoard = ({ commit }, params) => {
  return Api.getBoard(params).then(response => {
    return response
  })
}
// 获取所有公司
export const getAllCompanyList = ({ commit }, params) => {
  return Api.getAllCompanyList(params).then(response => {
    return response
  })
}
// 获取所有人
export const getAllMemberList = ({ commit }, params) => {
  return Api.getAllMemberList(params).then(response => {
    return response
  })
}
// 新增公司
export const addUpdateCompany = ({ commit }, params) => {
  return Api.addUpdateCompany(params).then(response => {
    return response
  })
}
// 删除公司
export const deleteCompany = ({ commit }, params) => {
  return Api.deleteCompany(params).then(response => {
    return response
  })
}
// 登入和登出日志
export const getLoginLog = ({ commit }, params) => {
  return Api.getLoginLog(params).then(response => {
    return response
  })
}

// 新增关于新闻的函数
// 获取新闻
export const getNews = ({ commit }, params) => {
  return Api.getNews(params).then(response => {
    return response
  })
}
// 添加新闻
export const addNews = ({ commit }, params) => {
  return Api.addNews(params).then(response => {
    return response
  })
}
export const updateNews = ({ commit }, params) => {
  return Api.updateNews(params).then(response => {
    return response
  })
}
// 新增关于重点督办的函数
export const getKeySupervision = ({ commit }, params) => {
  return Api.getKeySupervision(params).then(response => {
    return response
  })
}
export const getAllKeySupervision = ({ commit }, params) => {
  return Api.getAllKeySupervision(params).then(response => {
    return response
  })
}
export const getKeysById = ({ commit }, params) => {
  return Api.getKeysById(params).then(response => {
    return response
  })
}
export const getKeyTree = ({ commit }, params) => {
  return Api.getKeyTree(params).then(response => {
    return response
  })
}
export const addKeySupervision = ({ commit }, params) => {
  return Api.addKeySupervision(params).then(response => {
    return response
  })
}
export const updateKeySupervision = ({ commit }, params) => {
  return Api.updateKeySupervision(params).then(response => {
    return response
  })
}
export const getNowKeySupervision = ({ commit }, params) => {
  return Api.getNowKeySupervision(params).then(response => {
    return response
  })
}
// 提交下周周报计划
export const addNextContent = ({ commit }, params) => {
  return Api.addNextContent(params).then(response => {
    return response
  })
}
// 获取计划
export const getNextContent = ({ commit }, params) => {
  return Api.getNextContent(params).then(response => {
    return response
  })
}
