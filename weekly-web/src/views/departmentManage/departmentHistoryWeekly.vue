<template>
  <div class="view-weekly">
    <el-row v-if="userInfo.role == 2 || userInfo.role == 3">
      <div class="title">历史周报：--<span v-if="userInfo.role == 2">公司</span><span v-else>部门</span>周报概览</div>
      <p>公司<span v-if="userInfo.department_name">--部门</span>：<span>{{userInfo.company_name}}<span v-if="userInfo.department_name">--{{userInfo.department_name}}</span></span></p>
      <p>
        <label>
          <span v-if="userInfo.role == 2">公司人员({{departmentMember.length}}人)：</span>
          <span v-else>部门人员({{departmentMember.length}}人)：</span>
          <el-tag v-for="(item, index) in departmentMember"
                  :key="index"
                  @click.native="search_dir(item.usernum)">{{item.username}}</el-tag>
        </label>
      </p>
      <p><label>历史周报(<span class="data-style">{{weeklyListTotal}}份</span>)如下所示：</label></p>
      <div class="search-group">
        <el-col :xs="12"
                :sm="12"
                :md="12"
                :lg="12"
                :xl="12">
          <el-col :span="16">
            <el-input placeholder="请输入内容"
                      maxlength="20"
                      v-model="searchContent"
                      clearable
                      class="input-with-select">
              <el-button slot="append"
                         icon="el-icon-search"
                         @click="search()">查询</el-button>
            </el-input>
          </el-col>
        </el-col>
      </div>
      <el-table :data="weeklyTableData"
                border
                style="width: 100%">
        <el-table-column label="周报内容">
          <template slot-scope="scope">
            <div style="text-align:center;">
              <span style="font-size:16px;font-weight:bold;">姓名：{{scope.row.username}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              <span style="font-size:16px;font-weight:bold;">周报时间：{{scope.row.startDate | dateFormat}}</span>
              ---<span style="font-size:16px;font-weight:bold;">{{scope.row.endDate | dateFormat}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              <span style="font-size:16px;font-weight:bold;">提交时间：{{scope.row.time | dateTimeFormat}}</span><br>
            </div>
            <p v-html="scope.row.content" class="weeklycontent"></p>
          </template>
        </el-table-column>
        <!-- <el-table-column label="最近一次提交日期"
                         width="160">
          <template slot-scope="scope">
            {{scope.row.time | dateTimeFormat}}
          </template>
        </el-table-column>
        <el-table-column label="操作"
                         width="100">
          <template slot-scope="scope">
            <el-button v-if="new Date().getTime()>= scope.row.startDate && new Date().getTime()<=scope.row.endDate"
                       @click="editClick(scope.row)"
                       type="text"
                       size="small">编辑</el-button>
            <span v-else>--</span>
          </template>
        </el-table-column> -->
      </el-table>
      <!-- 页码显示和设置  -->
      <div class="pagination-box"
           v-if="weeklyTableData.length>0">
        <el-pagination background
                       @current-change="handleCurrentChange"
                       :current-page.sync="currentPage"
                       layout="total, prev, pager, next"
                       :total="weeklyListTotal">
        </el-pagination>
      </div>
      <!--dialog-->
      <el-dialog :title="dialogTitle"
                 :visible.sync="confirmSubmitVisiable"
                 :before-close="handleClose"
                 width="600px"
                 center>
        <p>周报日期：<span>{{editWeeklyDate}}</span></p>
        <el-input type="textarea"
                  maxlength="500"
                  :autosize="{ minRows: 4, maxRows: 6}"
                  placeholder="请输入内容"
                  v-model="editWeeklyContent">
        </el-input>
        <span slot="footer"
              class="dialog-footer">
          <el-button @click="handleClose()">取 消</el-button>
          <el-button type="primary"
                     :loading="loadingFlag"
                     @click="successConfirm()">确 定</el-button>
        </span>
      </el-dialog>
    </el-row>
    <el-row v-if="userInfo.role == 4">
      <div class="title"><span>本部门</span>历史周报概览</div>
      <p>公司<span v-if="userInfo.department_name">--部门</span>：<span>{{userInfo.company_name}}<span v-if="userInfo.department_name">--{{userInfo.department_name}}</span></span></p>
      <p>
        <label>
          <span>部门人员({{departmentMember.length}}人)：</span>
          <el-tag v-for="(item, index) in departmentMember"
                  :key="index"
                  @click.native="search_dir(item.usernum)">{{item.username}}</el-tag>
        </label>
      </p>
      <p><label>历史周报(<span class="data-style">{{weeklyTableData.length}}份</span>)如下所示：</label></p>
      <div class="search-group">
        <el-col :xs="12"
                :sm="12"
                :md="12"
                :lg="12"
                :xl="12">
          <el-col :span="16">
            <el-input placeholder="请输入内容"
                      maxlength="20"
                      v-model="searchContent"
                      clearable
                      class="input-with-select">
              <el-button slot="append"
                         icon="el-icon-search"
                         @click="search()">查询</el-button>
            </el-input>
          </el-col>
        </el-col>
      </div>
      <el-table :data="weeklyTableData"
                border
                style="width: 100%">
        <el-table-column label="周报内容">
          <template slot-scope="scope">
            <div style="text-align:center;">
              <span style="font-size:16px;font-weight:bold;">姓名：{{scope.row.username}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              <span style="font-size:16px;font-weight:bold;">周报时间：{{scope.row.startDate | dateFormat}}</span>
              ---<span style="font-size:16px;font-weight:bold;">{{scope.row.endDate | dateFormat}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              <span style="font-size:16px;font-weight:bold;">提交时间：{{scope.row.time | dateTimeFormat}}</span><br>
            </div>
            <p v-html="scope.row.content"
               class="weeklycontent"></p>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-box"
           v-if="weeklyTableData.length>0">
        <el-pagination background
                       @current-change="handleCurrentChange"
                       :current-page.sync="currentPage"
                       layout="total, prev, pager, next"
                       :total="weeklyListTotal">
        </el-pagination>
      </div>
      <!--dialog-->
      <el-dialog :title="dialogTitle"
                 :visible.sync="confirmSubmitVisiable"
                 :before-close="handleClose"
                 width="600px"
                 center>
        <p>周报日期：<span>{{editWeeklyDate}}</span></p>
        <el-input type="textarea"
                  maxlength="500"
                  :autosize="{ minRows: 4, maxRows: 6}"
                  placeholder="请输入内容"
                  v-model="editWeeklyContent">
        </el-input>
        <span slot="footer"
              class="dialog-footer">
          <el-button @click="handleClose()">取 消</el-button>
          <el-button type="primary"
                     :loading="loadingFlag"
                     @click="successConfirm()">确 定</el-button>
        </span>
      </el-dialog>
    </el-row>
    <el-row v-if="userInfo.role == 1">
      <p> 管理员禁止查看历史周报 </p>
    </el-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      weeklyContent: '',
      searchContent: '',
      currentDate: new Date().toLocaleDateString(),
      day: new Date().getDay(),
      weekDay: ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
      currentWeek: '',
      weeklyId: '',
      weeklyTableData: [],
      departmentMember: [],
      unWeeklyData: [],
      weeklyListTotal: 0,
      currentPage: 1,
      confirmSubmitVisiable: false,
      editWeeklyDate: '',
      editWeeklyContent: '',
      dialogTitle: '',
      loadingFlag: false
    }
  },
  created () {
    this.currentWeek = this.weekDay[this.day]

    if (this.userInfo.role == 1) {
      ;
    } else {
      /* 获取部门人员列表 */
      this.departmentMemberList()
      /* 获取已写周报列表 */
      this.departmentWeeklyList()
    }
  },
  computed: {
    ...mapGetters([
      'userInfo'
    ])
  },
  methods: {
    ...mapActions([
      'getCurrentWeekly',
      'addWeekly',
      'getDepartmentWeeklyList',
      'getDepartmentHistoryWeeklyList',
      'NoPage',
      'getUnDepartmentMemberList',
      'getDepartmentMemberListNoPage'
    ]),
    // 实现查找功能
    search () {
      this.queryDepartmentWeeklyList(1, 10)
    },
    // 实现点击名字直接查找他的周报
    search_dir (id) {
      // console.log(id)
      this.searchContent = id
      this.queryDepartmentWeeklyList(1, 10)
    },
    formatDateTime (item) {
      var date = new Date(parseInt(item))
      var y = date.getFullYear()
      var m = date.getMonth() + 1
      m = m < 10 ? ('0' + m) : m
      var d = date.getDate()
      d = d < 10 ? ('0' + d) : d
      var h = date.getHours()
      h = h < 10 ? ('0' + h) : h
      var minute = date.getMinutes()
      minute = minute < 10 ? ('0' + minute) : minute
      var second = date.getSeconds()
      second = second < 10 ? ('0' + second) : second
      return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second
    },
    dateFormatSpe (item) {
      if (!item) return '--'
      var date = new Date(parseInt(item))
      var y = date.getFullYear()
      var m = date.getMonth() + 1
      m = m < 10 ? ('0' + m) : m
      var d = date.getDate()
      d = d < 10 ? ('0' + d) : d
      var h = date.getHours()
      h = h < 10 ? ('0' + h) : h
      var minute = date.getMinutes()
      minute = minute < 10 ? ('0' + minute) : minute
      var second = date.getSeconds()
      second = second < 10 ? ('0' + second) : second
      return y + '.' + m + '.' + d
    },
    handleCurrentChange (currentPage) {
      this.queryDepartmentWeeklyList(currentPage, 10)
    },
    departmentWeeklyList () {
      this.queryDepartmentWeeklyList(1, 10)
    },
    queryDepartmentWeeklyList (currentPage, pageSize) {
      console.log('当前页面数：', currentPage, '页面大小是：', pageSize)
      /* 获取已写历史全部周报列表 */
      this.getDepartmentHistoryWeeklyList({ currentPage, pageSize, searchContent: this.searchContent }).then(res => {
        console.log('已写历史全部周报列表的返回结果res', res)
        if (res.errno == 0) {
          this.weeklyTableData = res.data.data
          this.weeklyListTotal = res.data.count
          var usernumList = this.weeklyTableData.map(item => {
            return {
              usernum: item.usernum
            }
          })
          /* 获取未写周报人员列表 */
          var params = {
            usernumList: usernumList
          }
          this.getUnDepartmentMemberList(params).then(res => {
            if (res.errno == 0) {
              this.unWeeklyData = res.data.data
            } else {
              this.$message.warning('服务器出了小差1')
            }
          })
        } else {
          this.$message.error('服务器出了小差2')
        }
      })
    },
    departmentMemberList () {
      this.getDepartmentMemberListNoPage().then(res => {
        if (res.errno == 0) {
          this.departmentMember = res.data.map(item => {
            return {
              username: item.username,
              usernum: item.usernum
            }
          })
        } else {
          this.$message.error(res.errmsg || '服务器开小差3')
        }
      })
    },
    submitWeekly () {
      var params = {
        content: this.weeklyContent,
        date: this.currentDate,
        id: this.weeklyId
      }
      this.addWeekly(params).then(res => {
        if (res.errno == 0) {
          this.$message.success(res.errmsg || '提交成功')
        } else {
          this.$message.error(res.errmsg || '服务器开小差4')
        }
      })
    },
    editClick (row) {
      console.log(row, 'row')
      this.editWeeklyContentRow = row
      this.confirmSubmitVisiable = true
      this.dialogTitle = '修改周报'
      this.editWeeklyContent = this.editWeeklyContentRow.content
      this.editWeeklyDate = this.dateFormatSpe(this.editWeeklyContentRow.startDate) + '--' + this.dateFormatSpe(this.editWeeklyContentRow.endDate)
    },
    successConfirm () {
      var params = {
        content: this.editWeeklyContent,
        date: this.currentDate,
        id: this.editWeeklyContentRow.id
      }
      if (this.editWeeklyContent) {
        this.loadingFlag = true
        this.addWeekly(params).then(res => {
          if (res.errno == 0) {
            this.$message.success(res.errmsg || '提交成功')
            this.confirmSubmitVisiable = false
            this.editWeeklyContentRow = ''
            this.departmentWeeklyList()
          } else {
            this.$message.error(res.errmsg || '服务器开小差5')
          }
          this.loadingFlag = false
        })
      } else {
        this.$message.warning('输入周报才能提交')
      }
    },
    handleClose () {
      this.confirmSubmitVisiable = false
      this.editWeeklyContentRow = ''
    }
  }
}
</script>

<style lang="postcss" scoped>
.view-weekly {
  & .data-style {
    color: #5579ee;
  }
  & .pagination-box {
    text-align: right;
    margin: 10px 0px;
  }
}

</style>
<style type="text/css">
.weeklycontent{
  margin-top: 0px;
  margin-bottom: 0px;
  font-size:14px;
  font-weight:normal;
  overflow: auto;
}
span.content1 {
  display: block;
  float: left;
  border-left: 1px solid #ebeef5;
  border-top: 1px solid #ebeef5;
  text-align: center;
  height: 36px;
  line-height: 36px;
  width: 30%;
  overflow: auto;
}
span.content2 {
  display: block;
  float: left;
  border-left: 1px solid #ebeef5;
  border-top: 1px solid #ebeef5;
  text-align: center;
  height: 36px;
  line-height: 36px;
  width: 25%;
  overflow: auto;
}
span.content3 {
  display: block;
  float: left;
  border-left: 1px solid #ebeef5;
  border-top: 1px solid #ebeef5;
  text-align: center;
  height: 36px;
  line-height: 36px;
  width: 14%;
  overflow: auto;
}
span.clearcenter {
  text-align: left;
  overflow: auto;
}
span.rightContent {
  border-right: 1px solid #ebeef5;
}
span.bottomContent {
  border-bottom: 1px solid #ebeef5;
}
span.backgroundSet {
  background-color: #AAD4D4;
  font-size: 15px;
  color: #378A8A;
}
span.backgroundSetNext {
  background-color: #fac08f;
  font-size: 15px;
  color: #a3642e;
}
</style>
