'use strict';
const Base = require('./base');
module.exports = class extends Base {

  //添加重点督办事项 
  async addKeySupervisionAction () {
    const { content, date } = this.post();
    let addContent = content.map(item => {
      return {
        item_name: item.重点项目名称,
        item_requires: item.完成要求,
        item_time: item.时间节点,
        item_leadings: JSON.stringify(item.负责人),
        item_execution: item.完成情况,
        item_sources: item.任务来源,
        item_period: item.期数,
        item_date: date
      }
    })
    //console.log(addContent)
    try {
      const addRow = await this.model('keysupervision').addMany(addContent);
      // console.log("已添加", addRow)
      return this.success(addRow);
    } catch (e) {
      console.log(e)
      return this.fail('服务器addKeySupervisionAction()开小差-后台', e);
    }
  }

  /* 获取重点督办事项 */
  async getAllKeySupervisionAction () {
    let page = this.post('pageNum');
    let pagesize = this.post('pageSize');
    // console.log("查询重点督办事项")
    // if (!page) { page = '1' }
    // if (!pagesize) { pagesize = '10' }
    console.log("当前页面是:", page, "页面大小是:", pagesize)
    try {
      const keysList = await this.model('keysupervision').order('item_period desc,id asc,item_date asc').page(page, pagesize).countSelect();
      //  console.log("已查询全部重点督办事项", keysList)
      return this.success(keysList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getAllKeySupervisionAction()开小差-后台');
    }
  }
  // 修改
  async updateKeySupervisionAction () {
    const { id,item_name,item_requires,item_time,item_leadings,item_execution,item_sources,item_period,item_date } = this.post();
    try {
      const updateRow = await this.model('keysupervision').where({ id }).update({ item_name,item_requires,item_time,item_leadings,item_execution,item_sources,item_period,item_date });
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
    console.log("当前页面是:", page, "页面大小是:", pagesize)
    try {
      var keys = await this.model('keysupervision').order('id desc').getField('item_period',1);
      // console.log("已查询现在的重点督办事项", keysList)
      keys=JSON.stringify(keys).replace(/"/g,'').replace(/,/g,'').replace('[','').replace(']','');
      console.log("查询的最近一期的期数为：",keys);
      const nowKeysList=await this.model('keysupervision').where({item_period:keys}).order('item_period desc, id asc').page(page, pagesize).countSelect();
      // console.log(nowKeysList);
      return this.success(nowKeysList);
    } catch (e) {
      console.log(e)
      return this.fail('服务器getNowKeySupervisionAction()开小差-后台');
    }
  }
};
