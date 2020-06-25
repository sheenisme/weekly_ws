/* eslint-disable no-sequences */
/* eslint-disable no-unused-expressions */
/* eslint-disable no-unused-expressions */
/* eslint-disable no-sequences */
<template>
  <div class="write-weekly">
    <div class="title">写周报</div>
    <p>
      今天：
      <span>{{ currentDate }}</span>，
      <span>{{ currentWeek }}</span>
    </p>
    <el-input type="textarea"
              maxlength="500"
              :autosize="{ minRows: 4, maxRows: 6 }"
              placeholder="请输入内容"
              v-model="weeklyContent">
    </el-input>-->
    <el-button @click="show = true">开始编辑</el-button>
    <el-table :data="tabledatas1"
              v-model="weeklyContent"
              border>
      <el-table-column label="本周工作情况">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab1"></el-input>
          <span v-show="!show">{{ scope.row.tab1 }}</span>
        </template>
      </el-table-column>
      <el-table-column label="完成情况">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab2"></el-input>
          <span v-show="!show">{{ scope.row.tab2 }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab3"></el-input>
          <span v-show="!show">{{ scope.row.tab3 }}</span>
        </template>
      </el-table-column>
    </el-table>
    <el-table :data="tabledatas2"
              v-model="weeklyContent"
              border>
      <el-table-column label="下周工作情况">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab1"></el-input>
          <span v-show="!show">{{ scope.row.tab1 }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预计完成时间">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab2"></el-input>
          <span v-show="!show">{{ scope.row.tab2 }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注">
        <template slot-scope="scope">
          <el-input placeholder="请输入内容"
                    v-show="show"
                    v-model="scope.row.tab3"></el-input>
          <span v-show="!show">{{ scope.row.tab3 }}</span>
        </template>
      </el-table-column>
    </el-table>
    <p>
      <el-button type="primary"
                 :loading="loadingFlag"
                 plain
                 @click="submitWeekly, (show = false)">提交周报</el-button>
    </p>
    <p>
      <!-- <el-button @click="editAll">批量编辑</el-button>
      <el-button @click="submitWeekly,show=false">提交</el-button>
      <el-button @click="addAll">批量增加</el-button>
      <el-button @click="delectAll">批量删除</el-button>
      <el-table
        v-model="weeklyContent"
        :data="tabledatas"
        border
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection"></el-table-column>
        <el-table-column label="本周工作内容">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.本周工作内容"></el-input>
            </span>
            <span v-else>{{scope.row.本周工作内容}}</span>
          </template>
        </el-table-column>
        <el-table-column label="完成情况">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.完成情况"></el-input>
            </span>
            <span v-else>{{scope.row.完成情况}}</span>
          </template>
        </el-table-column>
        <el-table-column label="备注">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.备注"></el-input>
            </span>
            <span v-else>{{scope.row.备注}}</span>
          </template>
        </el-table-column> -->
      <!-- <el-table-column label="下周工作内容">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.下周工作内容"></el-input>
            </span>
            <span v-else>{{scope.row.下周工作内容}}</span>
          </template>
        </el-table-column>
        <el-table-column label="需协调的资源">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.需协调的资源"></el-input>
            </span>
            <span v-else>{{scope.row.需协调的资源}}</span>
          </template>
        </el-table-column>
        <el-table-column label="预计完成时间">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.预计完成时间"></el-input>
            </span>
            <span v-else>{{scope.row.预计完成时间}}</span>
          </template>
        </el-table-column> -->
      <!-- <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="edit(scope.row,scope.$index)">{{scope.row.show?'保存':"修改"}}</el-button>
            <el-button @click="delect(scope.$index)">删除</el-button>
          </template>
        </el-table-column>
      </el-table> -->
    </p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      // 下面三行为新增
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
      loadingFlag: false
    }
  },

  created () {
    // 下面部分为新增
    // eslint-disable-next-line no-unused-expressions
    (this.tabledatas = [
      {
        本周工作内容: '标题1',
        完成情况: '完成/未完成，并说明详细情况',
        备注: '无',
        下周工作内容: '标题2',
        需协调的资源: '说明全部未掌握的资源',
        预计完成时间: '下周五'
      },
      {
        本周工作内容: '标题1',
        完成情况: '完成/未完成，并说明详细情况',
        备注: '无',
        下周工作内容: '标题2',
        需协调的资源: '说明全部未掌握的资源',
        预计完成时间: '下周五'
      },
      {
        本周工作内容: '标题1',
        完成情况: '完成/未完成，并说明详细情况',
        备注: '无',
        下周工作内容: '标题2',
        需协调的资源: '说明全部未掌握的资源',
        预计完成时间: '下周五'
      },
      {
        本周工作内容: '标题1',
        完成情况: '完成/未完成，并说明详细情况',
        备注: '无',
        下周工作内容: '标题2',
        需协调的资源: '说明全部未掌握的资源',
        预计完成时间: '下周五'
      },
      {
        本周工作内容: '标题1',
        完成情况: '完成/未完成，并说明详细情况',
        备注: '无',
        下周工作内容: '标题2',
        需协调的资源: '说明全部未掌握的资源',
        预计完成时间: '下周五'
      }
      // eslint-disable-next-line no-sequences
    ]),
    this.tabledatas.map(i => {
      i.show = false
      return i
    }),
    // 下面代码为原始代码
    (this.currentWeek = this.weekDay[this.day])
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
    let startWeekDate = this.formatDateTime(startWeekStamp)
    let endWeekDate = this.formatDateTime(endWeekStamp)

    this.getCurrentWeekly().then(res => {
      if (res.errno === 0) {
        this.weeklyContent = res.data.content
        this.weeklyId = res.data.id
      }
    })
  },
  computed: {
    ...mapGetters([])
  },
  methods: {
    // 之后为新增代码
    edit (row, index) {
      row.show = !row.show
      Vue.set(this.tabledatas, index, row)
      // 修改后保存
    },
    editAll () {
      this.tabledatas.map((i, index) => {
        i.show = true
        Vue.set(this.tabledatas, index, i)
      })
    },
    // 单个删除
    delect (index) {
      this.tabledatas.splice(index, 1)
    },
    // 批量新增
    addAll () {
      if (this.multipleSelection.length === 0) {
        let list = {
          本周工作内容: '       ',
          完成情况: '完成/未完成，并说明详细情况',
          备注: '    ',
          下周工作内容: '      ',
          需协调的资源: '说明全部未掌握的资源',
          预计完成时间: '下周五'
        }
        this.tabledatas.push(list)
      } else {
        this.multipleSelection.forEach((val, index) => {
          this.tabledatas.splice(index, 0, JSON.parse(JSON.stringify(val)))
        })
      }
    },
    // 批量删除
    delectAll () {
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
      // 下面函数为新增
      this.tabledatas.map((i, index) => {
        i.show = false
        Vue.set(this.tabledatas, index, i)
      })

      // 下面为原始代码
      var params = {
        content: this.weeklyContent,
        date: this.currentDate,
        id: this.weeklyId
      }
      if (this.weeklyContent) {
        this.loadingFlag = true
        this.addWeekly(params).then(res => {
          if (res.errno === 0) {
            this.$message.success(res.errmsg || '提交成功')
          } else {
            this.$message.error(res.errmsg || '服务器开小差')
          }
          this.loadingFlag = false
        })
      } else {
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
