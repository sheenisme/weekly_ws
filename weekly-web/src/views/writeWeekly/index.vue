<template>
  <div class="write-keySupervision">
    <el-drawer size="90%"
               direction="ttb"
               :visible.sync="drawer">
      <div style="width:88%; position: absolute;left:6%;right:6%;top:1%;">
        <template>
          <!-- <h3 style="text-align:center;">{{this.newsTitle}}</h3>
            <p class="scrollbar ql-editor"
                 v-html="this.newsContent"></p> -->
          <!--  重点督办显示  -->
          <h3 style="text-align:center;">最近一期的重点督办事项</h3>
          <el-table class="key-table"
                    :data="nowKeysData"
                    height="550"
                    border
                    style="width: 100%">
            <el-table-column label="重点项目名称"
                             width="230px">
              <template slot-scope="scope">
                <span>{{ scope.row.重点项目名称 }}</span>
              </template>
            </el-table-column>
            <el-table-column label="完成要求"
                             width="210px">
              <template slot-scope="scope">
                <span>{{ scope.row.完成要求 }}</span>
              </template>
            </el-table-column>
            <el-table-column disabled
                             label="时间节点"
                             width="150px">
              <template slot-scope="scope">
                <span>{{ scope.row.时间节点 }}</span>
              </template>
            </el-table-column>
            <el-table-column label="负责人"
                             width="150px">
              <template slot-scope="scope">
                <span>{{ JSON.stringify(JSON.parse(JSON.stringify(scope.row.负责人))).replace(/"/g,'').replace(/,/g,'、').replace('[','').replace(']','') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="完成情况"
                             width="207px">
              <template slot-scope="scope">
                <span>{{ scope.row.完成情况 }}</span>
              </template>
            </el-table-column>
            <el-table-column label="任务来源"
                             width="160px">
              <template slot-scope="scope">
                <span>{{ scope.row.任务来源 }}</span>
              </template>
            </el-table-column>
            <el-table-column label="期数"
                             width="150px">
              <template slot-scope="scope">
                <span>{{ scope.row.期数 }}</span>
              </template>
            </el-table-column>
            <el-table-column label="完成时间"
                             width="150px">
              <template slot-scope="scope">
                <span>{{ scope.row.完成时间 }}</span>
              </template>
            </el-table-column>
          </el-table>
          <div class="pagination-box"
               v-if="nowKeysData.length>0">
            <el-pagination background
                           @current-change="handleCurrentChange"
                           :current-page.sync="currentPage"
                           layout="total, prev, pager, next"
                           :total="nowKeysDataTotal">
            </el-pagination>
          </div>

        </template>
      </div>
    </el-drawer>

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
          <el-table-column label="本周重点目标内容(O)"
                           width="390px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.本周重点目标内容"></el-input>
              </span>
              <span v-else>{{ scope.row.本周重点目标内容 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="关键结果(KRs)"
                           width="390px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
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
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
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
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
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
          <el-table-column label="下周重点工作计划"
                           width="390px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
                          placeholder="请输入内容"
                          v-model="scope.row.下周重点工作计划"></el-input>
              </span>
              <span v-else>{{ scope.row.下周重点工作计划 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="完成标准及输出结果"
                           width="390px">
            <template slot-scope="scope">
              <span v-if="scope.row.show">
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
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
                              size="small"
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
                <el-input type="textarea"
                          :autosize="{ minRows: 1, maxRows: 3}"
                          size="mini"
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
      // 下面6行为新增
      tabledatas: [],
      tabledatas2: [],
      multipleSelection: [],
      drawer: true,
      // 新闻的
      // newsTitle: '',
      // newsContent: '',
      // 重点督办的
      currentPage: 1,
      nowKeysDataTotal: 0,
      nowKeysData: [],

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
    /* 获取全部重点事项列表 */
    this.getNowKeysList(1, 10)
    // // 获取新闻
    // this.getNews().then(res => {
    //   // console.log(res)
    //   if (res.errno == 0) {
    //     // console.log(res.data.data)
    //     let newsdata = res.data.data[0]
    //     // console.log(newsdata)
    //     for (let key in newsdata) {
    //       if (key == 'title') {
    //         this.newsTitle = newsdata[key]
    //       } else if (key == 'content') {
    //         this.newsContent = newsdata[key]
    //       } else {
    //         // console.log(key + '---' + newsdata[key])
    //       }
    //     }
    //     // console.log(this.newsTitle + '   内容为：' + this.newsContent)
    //   } else {
    //     this.$message.error(res.errmsg || '服务器开小差')
    //   }
    // })
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
        完成时间点: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        完成时间点: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        完成时间点: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        完成时间点: '',
        备注: ''
      },
      {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        完成时间点: '',
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
    ...mapGetters(['userInfo'])
  },
  methods: {
    ...mapActions([
      'getCurrentWeekly',
      'addWeekly',
      'getNowKeySupervision',
      'getNews'
    ]),
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
          完成时间点: '',
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
      let weekcontenttext = '<span class="content1 backgroundSet">本周重点目标内容(O)</span><span class="content1 backgroundSet">关键结果(KRs)</span><span class="content2 backgroundSet">未完成原因分析</span><span class="content3 backgroundSet rightContent">备注</span><br>'
      let str1 = JSON.parse(JSON.stringify(this.tabledatas))
      let str2 = JSON.parse(JSON.stringify(this.tabledatas2))
      let keys1 = {
        本周重点目标内容: '',
        关键结果: '',
        未完成原因分析: '',
        备注: ' '
      }
      let keys2 = {
        下周重点工作计划: '',
        完成标准及输出结果: '',
        完成时间点: 2020 - 6 - 23,
        备注: ' '
      }

      console.log(str1)
      for (let i1 of str1) {
        // console.log(i1)
        // console.log(Object.keys(i1))
        // console.log(Object.values(i1))
        let classi = 0
        for (let key1 in keys1) {
          // console.log(key1 + '---' + i1[key1])
          if (classi == 2) {
            weekcontenttext += '<span class="content2 clearcenter">'
          } else if (classi == 3) {
            weekcontenttext += '<span class="content3 clearcenter rightContent">'
          } else {
            weekcontenttext += '<span class="content1 clearcenter">'
          }
          weekcontenttext += i1[key1]
          weekcontenttext += '</span>'
          classi++
        }
        weekcontenttext += '<br>'
      }
      weekcontenttext += '<span class="content1 backgroundSet">下周重点工作计划</span><span class="content1 backgroundSet">完成标准及输出结果</span><span class="content2 backgroundSet">完成时间点</span><span class="content3 backgroundSet rightContent">备注</span><br>'
      console.log(str2)
      for (let i2 of str2) {
        // console.log(i2)
        // console.log(Object.keys(i1))
        // console.log(Object.values(i1))
        let classi = 0
        for (let key2 in keys2) {
          // console.log(key2 + '---' + i2[key2])
          if (classi == 2) {
            weekcontenttext += '<span class="content2 clearcenter">'
          } else if (classi == 3) {
            weekcontenttext += '<span class="content3 clearcenter rightContent">'
          } else {
            weekcontenttext += '<span class="content1 clearcenter">'
          }
          weekcontenttext += i2[key2]
          weekcontenttext += '</span>'
          classi++
        }
        weekcontenttext += '<br>'
      }
      console.log('即将要进入数据库的周报内容为：')
      console.log(weekcontenttext)
      // 下面为原始代码
      var params = {
        content: weekcontenttext,
        date: this.currentDate,
        id: this.weeklyId
      }
      if (params.content) {
        console.log(params.content)
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
    },
    // 处理页码变化
    handleCurrentChange (currentPage) {
      this.getNowKeysList(currentPage, 10)
      // console.log('当前页数：', currentPage)
    },
    getNowKeysList (pageNum, pageSize) {
      this.getNowKeySupervision({ pageNum, pageSize }).then(res => {
        // console.log('查询的页数：', pageNum)
        if (res.errno === 0) {
          this.nowKeysDataTotal = res.data.count
          this.currentPage = pageNum
          this.nowKeysData = res.data.data.map(item => {
            return {
              id: item.id,
              重点项目名称: item.item_name,
              完成要求: item.item_requires,
              时间节点: item.item_time,
              负责人: JSON.parse(item.item_leadings),
              完成情况: item.item_execution,
              任务来源: item.item_sources,
              期数: item.item_period,
              完成时间: item.item_date,
              show: false
            }
          })
        } else {
          this.$message.error(res.errmsg || '服务器开小差')
        }
        console.log(this.nowKeysData)
      })
    }
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
