'use strict';
const Base = require('./base');
module.exports = class extends Base {

  //添加重点督办事项 news即为重点督办事项
  async addNewsAction () {
    const { content, date, title, type, periods,publisher } = this.post();
    try {
      const addRow = await this.model('news').add({ title,content,date, type, periods, publisher});
      return this.success(addRow);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取重点督办事项 */
  async getNewsAction () {
    try {
      const news = await this.model('news').where({}).order('date DESC').countSelect();
      return this.success(news);
    } catch (e) {
      return this.fail('服务器开小差1111s');
    }
  }
  // 修改
  async updateNewsAction(){
    const { id,content, date } = this.post();
    try {
      const updateRow = await this.model('news').where({id}).update({content,date});
      // where({id}).update({usernum, username, telephone, role, role_name,email, company_id, company_name, department_id, department_name});
      return this.success(updateRow);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }
};
