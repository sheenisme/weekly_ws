const Base = require('../../common/controller/base');
module.exports = class extends Base {
  async __before() {
    const user = await this.session('userInfo');
    if (user) {
      this.user = user;
    } else {
      this.user = '';
    }
  }
};
