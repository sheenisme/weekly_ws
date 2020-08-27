'use strict';
const Base = require('./base');
module.exports = class extends Base {

  //添加重点督办事项 
  async addKeySupervisionAction () {
    const { content, date, type, period, publisher } = this.post();
    try {
      let addContent = content.map(item => {
        return {
          item_name: item.重点项目名称,
          item_requires: item.完成要求,
          item_time: item.时间节点,
          item_leadings: JSON.stringify(item.负责人),
          item_execution: item.完成情况,
          item_date: date
        }
      })
      let ids = await this.addKeys(addContent)
      let lids = JSON.stringify(JSON.parse(JSON.stringify(ids)))
      // console.log(type, period, publisher, lids, date)
      const addRow = await this.model('keytree').add({ type, period, publisher, lids, date });
      // console.log("已添加", addRow)
      return this.success(addRow);
    } catch (e) {
      console.log(e)
      return this.fail('服务器addKeyTree()开小差-后台', e);
    }
  }

  // 添加重点督办树表
  // async addKeyTree( type, period, publisher, lids, date){
  //   try {
  //     const addRow = await this.model('keytree').addMany({ type, period, publisher, lids, date });
  //     // console.log("已添加", addRow)
  //     return addRow;
  //   } catch (e) {
  //     console.log(e)
  //     return this.fail('服务器addKeyTree()开小差-后台', e);
  //   }
  // }

  // 添加重点督办内容表
  async addKeys (addContent) {
    // console.log(addContent)
    try {
      const addRow = await this.model('keysupervision').addMany(addContent);
      // console.log("已添加重点督办事项为：", addRow)
      return addRow;
    } catch (e) {
      console.log(e)
      return this.fail('服务器addKeys()开小差-后台', e);
    }
  }

  // 获取督办类型和期数树
  async getKeyTreeAction(){
    try {
      const keyTreeList = await this.model('keytree').where().group('type, period').select();
      //  console.log("已查询全部重点督办事项", keysList)
      return this.success(keyTreeList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getkeyTree()开小差-后台');
    }
  }

  /* 获取重点督办事项 */
  async getKeySupervisionAction () {
    let page = this.post('pageNum');
    let pagesize = this.post('pageSize');
    let ids =this.post("ids")
    // console.log("查询重点督办事项")
    // if (!page) { page = '1' }
    // if (!pagesize) { pagesize = '10' }
    // console.log("当前页面是:", page, "页面大小是:", pagesize)
    try {
      const keysList = await this.model('keysupervision').order('id asc').page(page, pagesize).countSelect();
      //  console.log("已查询全部重点督办事项", keysList)
      return this.success(keysList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getKeySupervisionAction()开小差-后台');
    }
  }

  async getKeysByIdAction(){
    let page = this.post('pageNum');
    let pagesize = this.post('pageSize');
    let ids =this.post("ids")
    // console.log("查询重点督办事项")
    if (!page) { page = '1' }
    if (!pagesize) { pagesize = '10' }
    // console.log("当前页面是:", page, "页面大小是:", pagesize)
    try {
      const keysList = await this.model('keysupervision').where({id: ['IN', JSON.parse(ids)]}).order('id asc').page(page, pagesize).countSelect();
      // console.log("已查询全部重点督办事项", keysList)
      return this.success(keysList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getKeysByIdAction()开小差-后台');
    }
  }

  // /* 获取重点督办事项 */
  // async getAllKeySupervisionAction () {
  //   let page = this.post('pageNum');
  //   let pagesize = this.post('pageSize');
  //   let ids =this.post("ids")
  //   // console.log("查询重点督办事项")
  //   // if (!page) { page = '1' }
  //   // if (!pagesize) { pagesize = '10' }
  //   console.log("当前页面是:", page, "页面大小是:", pagesize)
  //   try {
  //     const keysList = await this.model('keysupervision').order('id asc').page(page, pagesize).countSelect();
  //     //  console.log("已查询全部重点督办事项", keysList)
  //     return this.success(keysList);
  //   } catch (e) {
  //     console.log(e)
  //     return this.fail('服务器getKeySupervisionAction()开小差-后台');
  //   }
  // }

  // 修改
  async updateKeySupervisionAction () {
    const { id, item_name, item_requires, item_time, item_leadings, item_execution, item_date } = this.post();
    try {
      const updateRow = await this.model('keysupervision').where({ id }).update({ item_name, item_requires, item_time, item_leadings, item_execution, item_date });
      // console.log("更新的重点督办事项为：", updateRow)
      return this.success(updateRow);
    } catch (e) {
      console.log(e)
      return this.fail('服务器开小差');
    }
  }
  //只获取最新一期的重点督办事项
  async getNowKeySupervisionAction () {
    let page = this.post('pageNum');
    let pagesize = this.post('pageSize');
    // console.log("查询重点督办事项")
    if (!page) { page = '1' }
    if (!pagesize) { pagesize = '10' }
    // console.log("当前页面是:", page, "页面大小是:", pagesize)
    try {
      var keys = await this.model('keytree').order('id desc').getField('lids', 1);
      // console.log("已查询现在的重点督办事项", keysList)
      // keys = JSON.stringify(keys).replace(/"/g, '').replace(/,/g, '').replace('[', '').replace(']', '');
      keys=JSON.parse(keys)
      console.log("查询的最近一期的重点督办事项的IDS为：", keys);
      //await this.model('keysupervision').where({id: ['IN', ids]}).order('id desc').page(page, pagesize).countSelect();
      const nowKeysList = await this.model('keysupervision').where({ id: ['IN', keys] }).order('id asc').page(page, pagesize).countSelect();
      // console.log(nowKeysList);
      return this.success(nowKeysList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getNowKeySupervisionAction()开小差-后台');
    }
  }
};
