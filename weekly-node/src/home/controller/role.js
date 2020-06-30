'use strict';
const Base = require('./base');
module.exports = class extends Base {
  /* 获取部门role */
  async getRoleAction() {
    const {company_id, department_id, noLeader} = this.post();
    try {
      if (this.user.role == 2) {
        if (department_id) {
          const departmentLeaderExist = await this.model('user').where({
            company_id: this.user.company_id, department_id, role: 3
          }).select();
          if (!think.isEmpty(departmentLeaderExist)) {
            const role = await this.model('role').where({
              company_id: this.user.company_id,
              role: {'>': this.user.role + 1}
            }).select();
            return this.success(role);
          } else {
            const role = await this.model('role').where({
              company_id: this.user.company_id,
              role: {'>': this.user.role}
            }).select();
            return this.success(role);
          }
        } else {
          const role = await this.model('role').where({
            company_id: this.user.company_id,
            role: {'>': this.user.role}
          }).select();
          return this.success(role);
        }
      } else if (this.user.role == 1) {
        // if(department_id){
        const companyLeaderExist = await this.model('user').where({
          company_id, role: 2
        }).select();
          /* role 2-总监，3-部门经理，4-组员 */
        if (!think.isEmpty(companyLeaderExist)) {
          // 总监不为空
          const departmentLeaderExist = await this.model('user').where({
            company_id, department_id, role: 3
          }).select();
          if (!think.isEmpty(departmentLeaderExist)) {
            //  部门不为空
            const role = await this.model('role').where({
              company_id: company_id,
              role: 4
            }).select();
            return this.success(role);
          } else {
            const role = await this.model('role').where({
              company_id: company_id,
              role: {'>=': 3}
            }).select();
            return this.success(role);
          }
        } else {
          // 为空
          const role = await this.model('role').where({
            company_id: company_id,
            role: {'>=': 2}
          }).select();
          return this.success(role);
        }
        // }
      }
    } catch (e) {
      return this.fail(e);
    }
  }
};
