'use strict';
const Base = require('./base');
module.exports = class extends Base {

  //添加下周工作计划 
  async addNextContentAction () {
    const { content } = this.post();
    const usernum = this.user.usernum;
    const userid = this.user.id;
    let eid
    // /* 计算一周时间戳 */
    // const currentYear = new Date().getFullYear();
    // const currentMonth = new Date().getMonth();
    // const currentDay = new Date().getDate();
    // const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    try {
      eid = await this.getNextContentByUID(userid)
      eid = JSON.parse(JSON.stringify(eid))
      // console.log("id:::::::::::",eid)
      if (eid.length) {
        const updateRow = await this.model('nextcontent').where({ id: eid }).update({ userid, usernum, content });
        return this.success(updateRow);
      } else {
        const addRow = await this.model('nextcontent').add({ userid, usernum, content });
        return this.success(addRow);
      }
    } catch (e) {
      console.log(e)
      return this.fail('服务器开小差--addNextContentAction');
    }
  }

  async getNextContentByUID (userid) {
    try {
      const List = await this.model('nextcontent').where({ userid }).getField('id',1);
      // console.log(List)
      return List;
    } catch (e) {
      console.log(e)
      return this.fail('服务器getkeyTree()开小差-后台');
    }
  }

  async getNextContentAction(){
    const usernum = this.user.usernum;
    try {
      const List = await this.model('nextcontent').where({ usernum }).select();
      return this.success(List);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }
};

