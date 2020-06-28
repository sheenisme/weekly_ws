<template>
  <div class="write-weekly">
    <div class="title">写周报</div>
    <p>
      今天：
      <span>{{ currentDate }}</span>，
      <span>{{ currentWeek }}</span>
    </p>
    <div>
      <el-button type="danger"
                 @click="submitWeekly">提交</el-button>
      <el-button type="success"
                 @click="save_More">保存</el-button>
      <el-button type="warning"
                 @click="edit_More">编辑</el-button>
      <el-button type="primary"
                 @click="add_More">本周加一行</el-button>
      <el-button type="primary"
                 @click="add_More2">下周加一行</el-button>
      <!-- <el-button type="primary" @click="edit_More">批量编辑</el-button>
      <el-button type="danger" @click="delect_More">批量删除</el-button>-->
      <div>
        <el-table :data="tabledatas"
                  border
                  :header-cell-style="{
           'background-color': '#F9F9F9',
           'font-size': '14px',
           'text-align': 'center',
          }">
          <!-- <el-table-column type="selection"></el-table-column> -->
          <el-table-column label="本周重点目标内容(O)">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.本周重点目标内容"></el-input>
              </span>
              <span v-else>{{ scope.row.本周重点目标内容 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="关键结果(KRs)">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.关键结果"></el-input>
              </span>
              <span v-else>{{ scope.row.关键结果 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="未完成原因分析"
                           width="162px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.未完成原因分析"></el-input>
              </span>
              <span v-else>{{ scope.row.未完成原因分析 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="备注"
                           width="148px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.备注"></el-input>
              </span>
              <span v-else>{{ scope.row.备注 }}</span>
            </template>
          </el-table-column>
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
      <div style="margin-top:20px">
        <el-table :data="tabledatas2"
                  border
                  :header-cell-style="{
           'background-color': '#F9F9F9',
           'font-size': '14px',
           'text-align': 'center',
          }">
          <!-- <el-table-column type="selection"></el-table-column> -->
          <el-table-column label="下周重点工作计划">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.下周重点工作计划"></el-input>
              </span>
              <span v-else>{{ scope.row.下周重点工作计划 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="完成标准及输出结果">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.完成标准及输出结果"></el-input>
              </span>
              <span v-else>{{ scope.row.完成标准及输出结果 }}</span>
            </template>
          </el-table-column>
          <el-table-column disabled
                           label="完成时间点"
                           width="160px">
            <template slot-scope="scope">
              <el-date-picker v-if="scope.row.show"
                              v-model="scope.row.完成时间点"
                              type="date"
                              placeholder="选择日期"
                              format="yyyy年MM月dd日"
                              value-format="yyyy-MM-dd"
                              :picker-options="pickerOptions"></el-date-picker>
              <span v-else>{{ scope.row.完成时间点 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="备注"
                           width="148px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.备注"></el-input>
              </span>
              <span v-else>{{ scope.row.备注 }}</span>
            </template>
          </el-table-column>
          <!-- <el-table-column label="操作"
                           width="148px">
            <template slot-scope="scope">
              <el-button size="mini"
                         type="primary"
                         plain
                         @click="edit_Single2(scope.row, scope.$index)">{{ scope.row.show ? "保存" : "修改" }}</el-button>
              <el-button size="mini"
                         type="danger"
                         plain
                         @click="delect_Single2(scope.$index)">删除</el-button>
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
      // 下面3行为新增
      tabledatas: [],
      multipleSelection: [],

      currentDate: new Date().toLocaleDateString(),
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
      loadingFlag: false,

      pickerOptions: {
        disabledDate (time) {
          return time.getTime() < Date.now()
        }
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
    // 下面部分为新增
    this.tabledatas = [
      {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ''
      },
      {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ''
      },
      {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ''
      },
      {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ''
      },
      {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ''
      }
    ]
    this.tabledatas2 = [
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        备注: ''
      }
    ]
    this.tabledatas.map(i => {
      i.show = true
      return i
    })
    this.tabledatas2.map(i => {
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
    // 之后为新增的代码
    // 单个修改
    edit_Single (row, index) {
      row.show = !row.show
      this.$set(this.tabledatas, index, row)
    },
    edit_Single2 (row, index) {
      row.show = !row.show
      this.$set(this.tabledatas2, index, row)
    },
    // 批量修改
    edit_More () {
      // 保存本周
      this.tabledatas.map((i, index) => {
        i.show = true
        this.$set(this.tabledatas, index, i)
      })
      // 保存下周
      this.tabledatas2.map((i, index) => {
        i.show = true
        this.$set(this.tabledatas2, index, i)
      })
    },
    // 本周数据批量保存
    save_More () {
      // 保存本周
      this.tabledatas.map((i, index) => {
        i.show = false
        this.$set(this.tabledatas, index, i)
      })
      // 保存下周
      this.tabledatas2.map((i, index) => {
        i.show = false
        this.$set(this.tabledatas2, index, i)
      })
    },
    // //下周数据批量保存
    //  save_More2() {
    //   this.tabledatas2.map((i, index) => {
    //     i.show = false;
    //     this.$set(this.tabledatas2, index, i);
    //   });
    // },
    // 单个删除
    delect_Single (index) {
      this.$confirm('此操作将删除该行的数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.tabledatas.splice(index, 1)
        this.$message({
          type: 'success',
          message: '删除成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    delect_Single2 (index) {
      this.$confirm('此操作将删除该行的数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.tabledatas2.splice(index, 1)
        this.$message({
          type: 'success',
          message: '删除成功!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
    },
    // 批量新增
    add_More () {
      if (this.multipleSelection.length === 0) {
        let list = {
          本周重点目标内容: '',
          关键结果: '',
          未完成原因分析: '',
          备注: ''
        }
        this.tabledatas.push(list)
      } else {
        this.multipleSelection.forEach((val, index) => {
          this.tabledatas.splice(index, 0, JSON.parse(JSON.stringify(val)))
        })
      }
    },
    // 批量新增2
    add_More2 () {
      if (this.multipleSelection.length === 0) {
        let list = {
          下周重点工作计划: '',
          完成标准及输出结果: '',
          备注: ''
        }
        this.tabledatas2.push(list)
      } else {
        this.multipleSelection.forEach((val, index) => {
          this.tabledatas2.splice(index, 0, JSON.parse(JSON.stringify(val)))
        })
      }
    },
    // // 批量删除
    // delect_More() {
    //   for (let i = 0; i < this.tabledatas.length; i++) {
    //     const element = this.tabledatas[i];
    //     element.id = i;
    //   }
    //   if (this.multipleSelection.length === 0) {
    //     this.$message.error("请先至少选择一项");
    //   }
    //   this.multipleSelection.forEach(element => {
    //     this.tabledatas.forEach((e, i) => {
    //       if (element.id === e.id) {
    //         this.tabledatas.splice(i, 1);
    //       }
    //     });
    //   });
    // },
    // // 选
    // handleSelectionChange(val) {
    //   this.multipleSelection = val;
    // },

    // 之后为原始代码
    ...mapActions(['getCurrentWeekly', 'addWeekly']),
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
    submitWeekly () {
      // 下面为新增
      this.save_More()
      let weekcontenttext = '数据来了！！'
      weekcontenttext += JSON.stringify(this.tabledatas)
      weekcontenttext += JSON.stringify(this.tabledatas2)
      console.log(weekcontenttext)

      // 下面为原始代码
      var params = {
        content: weekcontenttext,
        date: this.currentDate,
        id: this.weeklyId
      }
      if (weekcontenttext) {
        this.loadingFlag = true
        this.addWeekly(params).then(res => {
          if (res.errno === 0) {
            this.$message.success(res.errmsg || '提交成功!')
          } else {
            this.$message.error(res.errmsg || '服务器开小差!')
          }
          this.loadingFlag = false
        })
      } else {
        console.log('输入的周报内容为：' + weekcontenttext)
        this.$message.warning('输入周报才能提交')
      }
    }
  }
}
</script>

<style lang="postcss" scoped>
.write-weekly {
}
</style>
