<template>
  <div class="write-keySupervision">
    <div class="title">新增重点督办事项</div>
    <p>
      今天：
      <span>{{ currentDate }}</span>，
      <span>{{ currentWeek }}</span>
    </p>
    <div>
      <el-button type="danger"
                 @click="submitKeySupervision">提交</el-button>
      <el-button type="success"
                 @click="save_More">保存</el-button>
      <el-button type="warning"
                 @click="edit_More">编辑</el-button>
      <el-button type="primary"
                 @click="add_More">批量增加</el-button>
      <el-button type="danger"
                 @click="delect_More">批量删除</el-button>
      <div>
        <div style="margin:3px auto;font-color:blue;">
          <el-autocomplete popper-class="my-autocomplete"
                           style="width:340px;"
                           v-model="autoState"
                           :fetch-suggestions="querySearch"
                           placeholder="请输入纪要的类型"
                           @select="handleSelect">
            <template slot="prepend"> 类&nbsp;&nbsp;&nbsp;型:</template>
            <i class="el-icon-edit el-input__icon"
               slot="suffix"
               @click="handleIconClick">
            </i>
            <template slot-scope="{ item }">
              <div class="dname">{{ item.value }}</div>
            </template>
          </el-autocomplete>
          <el-input v-model="periods"
                    style="width:275px;margin-left:3px;"
                    placeholder="请输入期数">
            <template slot="prepend">期&nbsp;&nbsp;&nbsp;数:</template>
          </el-input>
          <el-input v-model="publisher"
                   style="width:305px;margin-left:3px;"
                   placeholder="请输入发布人"
                   >
          <template slot="prepend">发布人:</template>
        </el-input>
        </div>
        <el-table :data="tabledatas"
                  border
                  :header-cell-style="{
           'background-color': '#F9F9F9',
           'font-size': '14px',
           'text-align': 'center',
          }"
                  @selection-change="handleSelectionChange">
          <el-table-column width="39px"
                           type="selection"></el-table-column>
          <el-table-column label="重点项目名称"
                           width="300px">
            <template slot-scope="scope">
              <el-input v-if="scope.row.show"
                        type="textarea"
                        :autosize="{ minRows: 1, maxRows: 3}"
                        size="mini"
                        placeholder="请输入内容"
                        v-model="scope.row.重点项目名称"></el-input>
              <span v-else>{{ scope.row.重点项目名称 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="完成要求"
                           width="280px">
            <template slot-scope="scope">
              <el-input v-if="scope.row.show"
                        type="textarea"
                        :autosize="{ minRows: 1, maxRows: 3}"
                        size="mini"
                        placeholder="请输入内容"
                        v-model="scope.row.完成要求"></el-input>
              <span v-else>{{ scope.row.完成要求 }}</span>
            </template>
          </el-table-column>
          <el-table-column disabled
                           label="时间节点"
                           width="160px">
            <template slot-scope="scope">
              <el-date-picker v-if="scope.row.show"
                              size="small"
                              v-model="scope.row.时间节点"
                              type="date"
                              placeholder="选择日期"
                              format="yyyy年MM月dd日"
                              value-format="yyyy-MM-dd"
                              :picker-options="pickerOptions"></el-date-picker>
              <span v-else>{{ scope.row.时间节点 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="负责人"
                           width="162px">
            <template slot-scope="scope">
              <el-select v-if="scope.row.show"
                         multiple
                         collapse-tags
                         size="mini"
                         v-model="scope.row.负责人"
                         placeholder="请选择">
                <el-option style="width:160px;"
                           v-for="item in states"
                           :key="item.label"
                           :label="item.label"
                           :value="item.label">
                  <span style="float: left">{{ item.label }}</span>
                </el-option>
              </el-select>
              <span v-else>{{ JSON.stringify(JSON.parse(JSON.stringify(scope.row.负责人))).replace(/"/g,'').replace(/,/g,'、').replace('[','').replace(']','') }}</span>
            </template>
          </el-table-column>
          <el-table-column label="完成情况"
                           width="154px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.完成情况"></el-input>
              </span>
              <span v-else>{{ scope.row.完成情况 }}</span>
            </template>
          </el-table-column>
          <!-- <el-table-column label="任务来源"
                           width="124px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.任务来源"></el-input>
              </span>
              <span v-else>{{ scope.row.任务来源 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="期数"
                           width="137px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.期数"></el-input>
              </span>
              <p v-else>{{ scope.row.期数 }}</p>
            </template>
          </el-table-column> -->
          <!-- <el-table-column label="操作"
                           width="148px">
            <template slot-scope="scope">
              <el-button size="mini"
                         type="primary"
                         plain
                         @click="edit_Single(scope.row, scope.$index)">{{ scope.row.show ? "保存" : "修改" }}</el-button>
              <el-button size="mini"
                         type="danger"
                         plain
                         @click="delect_Single(scope.$index)">删除</el-button>
            </template>
          </el-table-column> -->
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      // 下面6行为新增
      tabledatas: [],
      multipleSelection: [],
      states: [],
      autoTypes: [],
      periods: null,
      publisher: '',
      autoState: '',
      // 获取当前时间
      currentDate: this.getNowFormatDate(),
      day: new Date().getDay(),
      weekDay: [
        '星期天',
        '星期一',
        '星期二',
        '星期三',
        '星期四',
        '星期五',
        '星期六'
      ],
      currentWeek: '',
      weeklyId: '',

      pickerOptions: {
        // disabledDate (time) {
        //   return time.getTime() < Date.now()
        // }
        // shortcuts: [{
        //   text: '明天',
        //   onClick (picker) {
        //     const date = new Date()
        //     date.setTime(date.getTime() + 3600 * 1000 * 24)
        //     picker.$emit('pick', date)
        //   }
        // }, {
        //   text: '一周后',
        //   onClick (picker) {
        //     const date = new Date()
        //     date.setTime(date.getTime() + 3600 * 1000 * 24 * 7)
        //     picker.$emit('pick', date)
        //   }
        // }]
      }
    }
  },
  created () {
    /* 获取人员列表 */
    this.departmentMemberList()
    // 下面部分为新增
    this.tabledatas = [
      {
        重点项目名称: '',
        完成要求: '',
        时间节点: '',
        负责人: null,
        完成情况: ''
      },
      {
        重点项目名称: '',
        完成要求: '',
        时间节点: '',
        负责人: null,
        完成情况: ''
      },
      {
        重点项目名称: '',
        完成要求: '',
        时间节点: '',
        负责人: null,
        完成情况: ''
      },
      {
        重点项目名称: '',
        完成要求: '',
        时间节点: '',
        负责人: null,
        完成情况: ''
      },
      {
        重点项目名称: '',
        完成要求: '',
        时间节点: '',
        负责人: null,
        完成情况: ''
      }
    ]
    this.tabledatas.map(i => {
      i.show = true
      return i
    })
    // 下面代码为原始代码
    this.currentWeek = this.weekDay[this.day]
    let currentYear = new Date().getFullYear()
    let currentMonth = new Date().getMonth()
    let currentDay = new Date().getDate()
    let currentTimeStamp = new Date(
      currentYear,
      currentMonth,
      currentDay,
      0,
      0,
      0
    ).getTime()
    // 计算一周时间
    let currentDayNum = new Date().getDay()
    let startWeekNum = currentDayNum - 1
    let endWeekNum = 7 - currentDayNum + 1
    let startWeekStamp = currentTimeStamp - 1000 * 3600 * 24 * startWeekNum
    let endWeekStamp = currentTimeStamp + 1000 * (3600 * 24 * endWeekNum - 1)
    // eslint-disable-next-line no-unused-vars
    let startWeekDate = this.formatDateTime(startWeekStamp)
    // eslint-disable-next-line no-unused-vars
    let endWeekDate = this.formatDateTime(endWeekStamp)
    this.getCurrentWeekly().then(res => {
      if (res.errno === 0) {
        this.weekcontenttext = res.data.content
        this.weeklyId = res.data.id
      }
    })
  },
  computed: {
    ...mapGetters([])
  },

  methods: {
    // 获取当前时间
    getNowFormatDate () {
      var date = new Date()
      var seperator1 = '-'
      var seperator2 = ':'
      var month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1
      var strDate = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
      var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +
        ' ' + date.getHours() + seperator2 + date.getMinutes() +
        seperator2 + date.getSeconds()
      return currentdate
    },
    // 获取人员列表
    departmentMemberList () {
      this.getDepartmentMemberListNoPage().then(res => {
        if (res.errno === 0) {
          this.states = res.data.map(item => {
            return {
              label: item.username,
              value: item.usernum
            }
          })
        } else {
          this.$message.error(res.errmsg || '服务器开小差')
        }
        // console.log(this.states)
      })
    },
    // 之后为新增的代码
    // 单个修改
    edit_Single (row, index) {
      row.show = !row.show
      this.$set(this.tabledatas, index, row)
    },
    // 批量修改
    edit_More () {
      this.tabledatas.map((i, index) => {
        i.show = true
        this.$set(this.tabledatas, index, i)
      })
    },
    // 数据批量保存
    save_More () {
      this.tabledatas.map((i, index) => {
        i.show = false
        this.$set(this.tabledatas, index, i)
      })
    },
    // // 单个删除
    // delect_Single (index) {
    //   this.$confirm('此操作将删除该行的数据, 是否继续?', '提示', {
    //     confirmButtonText: '确定',
    //     cancelButtonText: '取消',
    //     type: 'warning'
    //   }).then(() => {
    //     this.tabledatas.splice(index, 1)
    //     this.$message({
    //       type: 'success',
    //       message: '删除成功!'
    //     })
    //   }).catch(() => {
    //     this.$message({
    //       type: 'info',
    //       message: '已取消删除'
    //     })
    //   })
    // },
    // 批量新增
    add_More () {
      if (this.multipleSelection.length === 0) {
        let list = {
          重点项目名称: '',
          完成要求: '',
          时间节点: '',
          负责人: null,
          完成情况: '',
          show: true
        }
        this.tabledatas.push(list)
      } else {
        this.multipleSelection.forEach((val, index) => {
          this.tabledatas.splice(index, 0, JSON.parse(JSON.stringify(val)))
        })
      }
    },
    // 批量删除
    delect_More () {
      for (let i = 0; i < this.tabledatas.length; i++) {
        const element = this.tabledatas[i]
        element.id = i
      }
      if (this.multipleSelection.length === 0) {
        this.$message.error('请先至少选择一项')
      }
      this.multipleSelection.forEach(element => {
        this.tabledatas.forEach((e, i) => {
          if (element.id === e.id) {
            this.tabledatas.splice(i, 1)
          }
        })
      })
    },
    // 选
    handleSelectionChange (val) {
      this.multipleSelection = val
    },

    // 之后为原始代码
    ...mapActions([
      'getCurrentWeekly',
      'getDepartmentMemberListNoPage',
      'addKeySupervision'
    ]),
    formatDateTime (item) {
      var date = new Date(parseInt(item))
      var y = date.getFullYear()
      var m = date.getMonth() + 1
      m = m < 10 ? '0' + m : m
      var d = date.getDate()
      d = d < 10 ? '0' + d : d
      var h = date.getHours()
      h = h < 10 ? '0' + h : h
      var minute = date.getMinutes()
      minute = minute < 10 ? '0' + minute : minute
      var second = date.getSeconds()
      second = second < 10 ? '0' + second : second
      return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second
    },
    judgeOption () {
      var flag = true
      for (let i = 0; i < this.tabledatas.length; i++) {
        if (this.tabledatas[i].时间节点 === '') {
          flag = false
        }
      }
      return flag
    },

    // 类型输入建议代码
    querySearch (queryString, cb) {
      var autoTypes = this.autoTypes
      var results = queryString ? autoTypes.filter(this.createFilter(queryString)) : autoTypes
      // 调用 callback 返回建议列表的数据
      cb(results)
    },
    createFilter (queryString) {
      return (autoTypes) => {
        return (autoTypes.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0)
      }
    },
    loadAll () {
      return [
        { 'value': '集团周例会' },
        { 'value': '品牌规划会' },
        { 'value': '经济运行分析会' },
        { 'value': '总经理办公会' },
        { 'value': '总结述职会' },
        { 'value': '经营分析会' },
        { 'value': '安全会议' },
        { 'value': '其他会议' }
      ]
    },
    handleSelect (item) {
      // console.log(this.autoState)
      console.log(item)
    },
    handleIconClick (ev) {
      console.log(ev)
    },
    // 提交督办
    submitKeySupervision () {
      this.save_More()

      if (this.judgeOption() === true) {
        // console.log('提交的重点表格内容为', this.tabledatas)
        // console.log('抬头是：', this.autoState, this.periods, this.publisher)

        var params = {
          content: this.tabledatas,
          date: this.getNowFormatDate(),
          type: this.autoState,
          period: this.periods,
          publisher: this.publisher
        }
        if (params.content) {
          console.log('submitKeySupervision--传到后台了这些：', params)
          this.addKeySupervision(params).then(res => {
            if (res.errno === 0) {
              this.$message.success(res.errmsg || '提交成功!')
            } else {
              this.$message.error(res.errmsg || '服务器开小差!')
            }
          })
        } else {
          this.$message.warning('输入重点督办后才能提交')
        }
      } else {
        this.$message.error('请全部填写表格，不要有空的！方可提交哦！！！')
      }
    }
  },
  mounted () {
    this.autoTypes = this.loadAll()
  }
}
</script>

<style lang="postcss" scoped>
.write-keySupervision {
}
</style>
<style type="text/css">
.scrollbar {
  max-height: 590px;
  overflow: auto;
}
</style>
