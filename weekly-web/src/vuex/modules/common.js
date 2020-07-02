import {
  USER_INFO
} from '../mutation-types.js'

const state = {
  systemName: '炜盛科技OKR工作管理系统',
  userInfo: {

  }
}

const mutations = {
  [USER_INFO] (state, newData) {
    state.userInfo = newData
  }
}

export default {
  state,
  mutations
}
