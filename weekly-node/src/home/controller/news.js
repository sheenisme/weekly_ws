'use strict';
const Base = require('./base');
module.exports = class extends Base {
  async addNewsAction () {
    const { content, date, title, type, publisher } = this.post();
    try {
      const addRow = await this.model('news').add({ title,content,date, type, publisher});
      return this.success(addRow);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取当前周的周报 */
  async getNewsAction () {
    try {
      const news = await this.model('news').where({}).order('date DESC').page(1, 10).countSelect();
      return this.success(news);
    } catch (e) {
      return this.fail('服务器开小差1111s');
    }
  }
};
