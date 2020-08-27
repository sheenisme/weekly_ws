'use strict';
const Base = require('./base');
module.exports = class extends Base {
  async addWeeklyAction () {
    const { content, date, id, theTable, nextTable } = this.post();
    const usernum = this.user.usernum;
    const role = this.user.role;
    const username = this.user.username;
    const time = new Date().getTime();
    const department_id = this.user.department_id;
    const company_id = this.user.company_id;
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      if (id) {
        const updateRow = await this.model('week').update({ id, content, time, theTable, nextTable });
        return this.success(updateRow);
      } else {
        // 再次判断有没有重复提交，防止多次提交bug
        let weeklyId=await this.getCurrentWeekID()  
        weeklyId=JSON.parse(JSON.stringify(weeklyId))
        if(weeklyId.length){
          console.log("第二次判断有没有重复提交的weeklyID:",weeklyId)
          const updateRow = await this.model('week').update({ id: weeklyId, content, time, theTable, nextTable });
          return this.success(updateRow);
        }else{
          console.log('id:',id,"weeklyId:",weeklyId)
          const addRow = await this.model('week').add({ usernum, username, content, role, date, time, startDate: startWeekStamp, endDate: endWeekStamp, department_id, company_id, theTable, nextTable });
          return this.success(addRow);
        }
      }
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }
  async getCurrentWeekID(){
    const usernum = this.user.usernum;
    const username = this.user.username;
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      const List = await this.model('week').where({
        usernum: usernum, username: username, time: { '>': startWeekStamp, '<': endWeekStamp }
      }).getField('id',1);
      return List;
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }
  /* 获取当前周的周报 */
  async getCurrentWeeklyAction () {
    const usernum = this.user.usernum;
    const username = this.user.username;
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      const weekly = await this.model('week').where({
        usernum: usernum, username: username, time: { '>': startWeekStamp, '<': endWeekStamp }
      }).find();
      return this.success(weekly);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取本人-历史周报列表 */
  async getWeeklyListAction () {
    const usernum = this.user.usernum;
    const username = this.user.username;
    let page = this.get('pageNum');
    let pagesize = this.get('pageSize');
    if (!page) { page = '1' }
    if (!pagesize) { pagesize = '10' }
    try {
      const model = this.model('week');
      const weeklyList = await model.where({ usernum, username }).order('time DESC').page(page, pagesize).countSelect();
      return this.success(weeklyList);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取公司-部门本周周报列表  部门总监，部门经理 */
  async getDepartmentWeeklyListAction () {
    let page = this.post('pageNum');
    let pagesize = this.post('pageSize');
    const searchContent = this.post('searchContent');

    let companyNumber;
    let companyWeeklyList;
    let unWeeklyList;
    const usernumList = [];

    if (!page) { page = '1' }
    if (!pagesize) { pagesize = '10' }
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      // select * from weekly.week_week inner join weekly.week_user on week_user.usernum = week_week.usernum where week_user.comapny_id = 'eastmoney' and week_user.department_id='dataCenter'
      if (this.user.role == 2) {
        const companyWeeklyList = await this.model('week').where({
          'username|usernum|content': ['like', '%' + searchContent + '%'],
          company_id: this.user.company_id,
          time: { '>': startWeekStamp, '<': endWeekStamp },
          role: { '>=': this.user.role }
        }).order('department_id asc, role asc, time DESC').page(page, pagesize).countSelect();
        return this.success(companyWeeklyList);
      } else if (this.user.role == 3) {
        const departmentWeeklyList = await this.model('week').where({
          'username|usernum|content': ['like', '%' + searchContent + '%'],
          company_id: this.user.company_id,
          department_id: this.user.department_id,
          time: { '>': startWeekStamp, '<': endWeekStamp },
          role: { '>=': this.user.role }
        }).order('role asc, time DESC').page(page, pagesize).countSelect();
        return this.success(departmentWeeklyList);
      } else if (this.user.role == 1) {
        const company = await this.model('company').select();
        const tempData = [];
        let companyWeeklyData;
        for (let i = 0; i < company.length; i++) {
          if (searchContent[i] == undefined) {
            searchContent[i] = '';
          }
          /* 搜索-公司周报列表 */
          companyWeeklyData = await this.model('week').where({
            'username|usernum|content': ['like', '%' + searchContent[i] + '%'],
            company_id: company[i].company_id,
            time: { '>': startWeekStamp, '<': endWeekStamp }
          }).order('role asc, company_id asc, time DESC').page(page, pagesize).countSelect();
          /* 公司人数 */
          companyNumber = await this.model('user').where({
            company_id: company[i].company_id
          }).count('usernum');
          /* 公司已填周报人数 */
          companyWeeklyList = await this.model('week').where({
            company_id: company[i].company_id,
            time: { '>': startWeekStamp, '<': endWeekStamp }
          }).select();
          if (companyWeeklyList.length > 0) {
            for (let i = 0; i < companyWeeklyList.length; i++) {
              usernumList[i] = companyWeeklyList[i].usernum;
            }
          } else {
            companyWeeklyList = [];
          }
          if (usernumList.length > 0) {
            unWeeklyList = await this.model('user').where({
              usernum: ['not in', usernumList],
              company_id: company[i].company_id
            }).select();
          } else {
            unWeeklyList = await this.model('user').where({
              company_id: company[i].company_id
            }).select();
          }
          tempData.push({
            companyNumber: companyNumber,
            companyWeeklyList: companyWeeklyList,
            unWeeklyList: unWeeklyList,
            company_id: company[i].company_id,
            company_name: company[i].company_name,
            children: companyWeeklyData
          });
        }
        return this.success(tempData);
      }
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取公司-部门历史周报列表  部门总监，部门经理 */
  async getDepartmentHistoryWeeklyListAction () {
    let page = this.post('currentPage');
    let pagesize = this.post('pageSize');
    const searchContent = this.post('searchContent');

    let companyNumber;
    let companyWeeklyList;
    let unWeeklyList;
    const usernumList = [];

    if (!page) { page = '1' }
    if (!pagesize) { pagesize = '10' }
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      // select * from weekly.week_week inner join weekly.week_user on week_user.usernum = week_week.usernum where week_user.comapny_id = 'eastmoney' and week_user.department_id='dataCenter'
      if (this.user.role == 2) {
        const companyWeeklyList = await this.model('week').where({
          'username|usernum': ['like', '%' + searchContent + '%'],
          company_id: this.user.company_id,
          time: { '>': 1580486400000, '<': endWeekStamp },
          role: { '>=': this.user.role }
        }).order('time desc, role asc, department_id asc').page(page, pagesize).countSelect();
        return this.success(companyWeeklyList);
      } else if (this.user.role == 3) {
        const departmentWeeklyList = await this.model('week').where({
          'username|usernum': ['like', '%' + searchContent + '%'],
          company_id: this.user.company_id,
          department_id: this.user.department_id,
          time: { '>': 1580486400000, '<': endWeekStamp },
          role: { '>=': this.user.role }
        }).order('time desc, role asc, company_id asc, department_id asc').page(page, pagesize).countSelect();
        return this.success(departmentWeeklyList);
      } else if (this.user.role == 4) {
        const departmentWeeklyList = await this.model('week').where({
          'username|usernum': ['like', '%' + searchContent + '%'],
          company_id: this.user.company_id,
          department_id: this.user.department_id,
          time: { '>': 1580486400000, '<': endWeekStamp },
          role: { '>=': this.user.role }
        }).order('time desc,  department_id asc').page(page, pagesize).countSelect();
        return this.success(departmentWeeklyList);
      }
      else if (this.user.role == 1) {
        const company = await this.model('company').select();
        const tempData = [];
        let companyWeeklyData;
        for (let i = 0; i < company.length; i++) {
          if (searchContent[i] == undefined) {
            searchContent[i] = '';
          }
          if (companyWeeklyList.length > 0) {
            for (let i = 0; i < companyWeeklyList.length; i++) {
              usernumList[i] = companyWeeklyList[i].usernum;
            }
          } else {
            companyWeeklyList = [];
          }
          if (usernumList.length > 0) {
            unWeeklyList = await this.model('user').where({
              usernum: ['not in', usernumList],
              company_id: company[i].company_id
            }).select();
          } else {
            unWeeklyList = await this.model('user').where({
              company_id: company[i].company_id
            }).select();
          }
          tempData.push({
            companyNumber: companyNumber,
            companyWeeklyList: companyWeeklyList,
            unWeeklyList: unWeeklyList,
            company_id: company[i].company_id,
            company_name: company[i].company_name,
            children: companyWeeklyData
          });
        }
        return this.success(tempData);
      }
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }

  /* 获取公司的人数，已写周报人数 */
  async adminGetCompanyCount () {
    const company = await this.model('company').select();
    const tempFlagData = [];
    let companyNumber;
    let companyWeeklyNumber;
    /* 计算一周时间戳 */
    const currentYear = new Date().getFullYear();
    const currentMonth = new Date().getMonth();
    const currentDay = new Date().getDate();
    const currentTimeStamp = new Date(currentYear, currentMonth, currentDay, 0, 0, 0).getTime();
    let currentDayNum = new Date().getDay();
    if (currentDayNum == 0) currentDayNum = 7;
    const startWeekNum = currentDayNum - 1;
    const endWeekNum = 7 - currentDayNum + 1;
    const startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum;
    const endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1);
    try {
      for (let i = 0; i < company.length; i++) {
        companyNumber = await this.model('user').where({
          company_id: company[i].company_id
        }).count('usernum');

        companyWeeklyNumber = await this.model('week').where({
          company_id: company[i].company_id,
          time: { '>': startWeekStamp, '<': endWeekStamp }
        }).count('usernum');

        tempFlagData.push({
          companyNumber: companyNumber,
          companyWeeklyNumber: companyWeeklyNumber
        });
      }
      return this.success(tempFlagData);
    } catch (e) {
      return this.fail('服务器开小差');
    }
  }
};
