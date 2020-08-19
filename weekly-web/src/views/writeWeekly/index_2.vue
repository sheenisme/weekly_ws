<template>
  <div class="write-weekly">
    <div class="title">写周报</div>
    <p>
      今天：
      <span>{{currentDate}}</span>，
      <span>{{currentWeek}}</span>
    </p>
    <!-- <el-input
      type="textarea"
      maxlength="500"
      :autosize="{ minRows: 4, maxRows: 6}"
      placeholder="请输入内容"
      v-model="weeklyContent">
    </el-input>-->
    <!-- <el-button @click="show=true">开始编辑</el-button>
    <el-table :data="tabledatas1" v-model="weeklyContent" border>
            <el-table-column label="本周工作情况">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab1"></el-input>
                    <span v-show="!show">{{scope.row.tab1}}</span>
                </template>
            </el-table-column>
            <el-table-column label="完成情况">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab2"></el-input>
                    <span v-show="!show">{{scope.row.tab2}}</span>
                </template>
            </el-table-column>
            <el-table-column label="备注">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab3"></el-input>
                    <span v-show="!show">{{scope.row.tab3}}</span>
                </template>
            </el-table-column>
    </el-table>
    <el-table :data="tabledatas2" v-model="weeklyContent" border>
            <el-table-column label="下周工作情况">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab1"></el-input>
                    <span v-show="!show">{{scope.row.tab1}}</span>
                </template>
            </el-table-column>
            <el-table-column label="预计完成时间">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab2"></el-input>
                    <span v-show="!show">{{scope.row.tab2}}</span>
                </template>
            </el-table-column>
            <el-table-column label="备注">
                <template slot-scope="scope">
                    <el-input placeholder="请输入内容" v-show="show" v-model="scope.row.tab3"></el-input>
                    <span v-show="!show">{{scope.row.tab3}}</span>
                </template>
            </el-table-column>
    </el-table>
    <p>
      <el-button type="primary" :loading="loadingFlag" plain @click="submitWeekly,show=false">提交周报</el-button>
    </p>-->
    <p>
      <el-button @click="editAll">批量编辑</el-button>
      <el-button @click="submitWeekly,show=false">提交</el-button>
      <el-button @click="addAll">批量增加</el-button>
      <el-button @click="delectAll">批量删除</el-button>
      <el-table
        v-model="weeklyContent"
        :data="tabledatas1"
        border
        @selection-change="handleSelectionChange">

        <el-table-column type="selection"></el-table-column>
        <el-table-column label="title">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.title"></el-input>
            </span>
            <span v-else>{{scope.row.title}}</span>
          </template>
        </el-table-column>
        <el-table-column label="text1">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.text"></el-input>
            </span>
            <span v-else>{{scope.row.text}}</span>
          </template>
        </el-table-column>
        <el-table-column label="text2">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.text"></el-input>
            </span>
            <span v-else>{{scope.row.text}}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="edit(scope.row,scope.$index)">{{scope.row.show?'保存':"修改"}}</el-button>
            <el-button @click="delect(scope.$index)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button @click="editAll">批量编辑</el-button>
      <el-button @click="submitWeekly,show=false">提交</el-button>
      <el-button @click="addAll">批量增加</el-button>
      <el-button @click="delectAll">批量删除</el-button>
      <el-table
        :data="tabledatas2"
        border
        @selection-change="handleSelectionChange"
        v-model="weeklyContent">

        <el-table-column type="selection"></el-table-column>
        <el-table-column label="title2">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.title"></el-input>
            </span>
            <span v-else>{{scope.row.title}}</span>
          </template>
        </el-table-column>
        <el-table-column label="text1">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.text"></el-input>
            </span>
            <span v-else>{{scope.row.text}}</span>
          </template>
        </el-table-column>
        <el-table-column label="text2">
          <template slot-scope="scope">
            <span v-if="scope.row.show">
              <el-input size="mini" placeholder="请输入内容" v-model="scope.row.text"></el-input>
            </span>
            <span v-else>{{scope.row.text}}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button @click="edit(scope.row,scope.$index)">{{scope.row.show?'保存':"修改"}}</el-button>
            <el-button @click="delect(scope.$index)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      // 下面三行为新增
      tabledatas1: [],
      tabledatas2: [],
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
    this.tabledatas1 = [
      { title: '标题1', text: 's111sssa' },
      { title: '标题2', text: 'ss222ssa' },
      { title: '标题1', text: 's111sssa' },
      { title: '标题2', text: 'ss222ssa' },
      { title: '标题3', text: 'ss222ssa' }
    ]
    this.tabledatas1.map(i => {
      i.show = false
      return i
    })
    (this.tabledatas2 = [
      { title: '标题1', text: 's111sssa' },
      { title: '标题2', text: 'ss222ssa' },
      { title: '标题1', text: 's111sssa' },
      { title: '标题2', text: 'ss222ssa' },
      { title: '标题3', text: 'ss222ssa' }
    ])
    this.tabledatas2.map(i => {
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
      if (res.errno == 0) {
        this.weeklyContent = res.data.content
        this.weeklyId = res.data.id
      }
    })
  },
  computed: {
    ...mapGetters([])
  },
  methods: {
    // 之后为新增
    edit (row, index) {
      row.show = !row.show
      Vue.set(this.tabledatas1, index, row)
      Vue.set(this.tabledatas2, index, row)
      // 修改后保存
    },
    editAll () {
      this.tabledatas1.map((i, index) => {
        i.show = true
        Vue.set(this.tabledatas1, index, i)
        Vue.set(this.tabledatas1, index, i)
      })
      this.tabledatas2.map((i, index) => {
        i.show = true
        Vue.set(this.tabledatas2, index, i)
        Vue.set(this.tabledatas2, index, i)
      })
    },
    // 单个删除
    delect (index) {
      this.tabledatas1.splice(index, 1)
      this.tabledatas2.splice(index, 1)
    },
    // 批量新增
    addAll () {
      if (this.multipleSelection.length == 0) {
        let list = {
          title: '',
          text: ''
        }
        this.tabledatas1.push(list)
        this.tabledatas2.push(list)
      } else {
        this.multipleSelection.forEach((val, index) => {
          this.tabledatas1.splice(index, 0, JSON.parse(JSON.stringify(val)))
          this.tabledatas2.splice(index, 0, JSON.parse(JSON.stringify(val)))
        })
      }
    },
    // 批量删除
    delectAll () {
      for (let i = 0; i < this.tabledatas1.length; i++) {
        const element = this.tabledatas1[i]
        element.id = i
      }
      for (let i = 0; i < this.tabledatas2.length; i++) {
        const element = this.tabledatas2[i]
        element.id = i
      }
      if (this.multipleSelection.length == 0) { this.$message.error('请先至少选择一项') }
      this.multipleSelection.forEach(element => {
        this.tabledatas1.forEach((e, i) => {
          if (element.id == e.id) {
            this.tabledatas1.splice(i, 1)
          }
        })
        this.tabledatas2.forEach((e, i) => {
          if (element.id == e.id) {
            this.tabledatas2.splice(i, 1)
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
      // 下面两个函数为新增
      this.tabledatas1.map((i, index) => {
        i.show = false
        Vue.set(this.tabledatas, index, i)
      })
      this.tabledatas2.map((i, index) => {
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
          if (res.errno == 0) {
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
