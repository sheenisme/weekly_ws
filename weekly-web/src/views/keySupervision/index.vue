<template>
  <div class="get-keySupervision">
    <div class="title">与我相关的-重点督办事项</div>
    <div>
      <el-table class="key-table"
                :data="keysData"
                height="544"
                border
                style="width: 100%">
        <el-table-column label="期数"
                         width="129px">
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
        </el-table-column>
        <el-table-column label="重点项目名称"
                         width="143px">
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
                         width="160px">
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
                         width="99px">
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
                         width="132px">
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
                         width="140px">
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
        <el-table-column label="任务来源"
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
        <el-table-column label="完成时间"
                         width="99px">
          <template slot-scope="scope">
            <el-date-picker v-if="scope.row.show"
                            size="small"
                            v-model="scope.row.完成时间"
                            type="date"
                            placeholder="选择日期"
                            format="yyyy年MM月dd日"
                            value-format="yyyy-MM-dd"
                            :picker-options="pickerOptions"></el-date-picker>
            <span v-else>{{ scope.row.完成时间 }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作"
                         width="69px">
          <template slot-scope="scope">
            <el-button size="mini"
                       type="primary"
                       plain
                       @click="editKeys(scope.row, scope.$index)">{{ scope.row.show ? '保存' : '修改' }}</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-box"
           v-if="keysData.length>0">
        <el-pagination background
                       @current-change="handleCurrentChange"
                       :current-page.sync="currentPage"
                       layout="total, prev, pager, next"
                       :total="keysDataTotal">
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      // .replace(/"/g,'').replace(/,/g,'、').replace('[','').replace(']','')
      currentPage: 1,
      keysDataTotal: 0,
      keysData: [],
      states: [],
      charges: '',

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
    /* 获取全部重点事项列表 */
    this.getKeysList(1, 10)
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    ...mapActions([
      'getCurrentWeekly',
      'getDepartmentMemberListNoPage',
      'addKeySupervision',
      'getAllKeySupervision',
      'updateKeySupervision'
    ]),
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
    // 处理页码变化
    handleCurrentChange (currentPage) {
      this.getKeysList(currentPage, 10)
      // console.log('当前页数：', currentPage)
    },
    // 获取重点督办列表
    getKeysList (pageNum, pageSize) {
      this.getAllKeySupervision({ pageNum, pageSize }).then(res => {
        // console.log('查询的页数：', pageNum)
        if (res.errno === 0) {
          this.keysDataTotal = res.data.count
          this.currentPage = pageNum
          this.keysData = res.data.data.map(item => {
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
        // console.log(this.keysData)
      })
    },

    // 修改重点督办事项
    editKeys (row, index) {
      console.log(row)
      console.log('负责人1:', row.负责人)
      // 如果是管理员的话
      if (this.userInfo.role === 1) {
        if (row.show === false) {
          row.show = true
          // this.$set(this.keysData, index, row)
        } else {
          row.show = false
          this.$set(this.keysData, index, row)
          this.UpdateKeys(row)
          console.log('负责人2:', row.负责人)
        }
      } else if (this.userInfo.role === 2 || this.userInfo.role === 3 || this.userInfo.role === 4) {
        var belog = row.负责人.indexOf(this.userInfo.username)
        if (belog != -1) {
          if (row.show === false) {
            row.show = !row.show
            // this.$set(this.keysData, index, row)
          } else {
            row.show = !row.show
            this.$set(this.keysData, index, row)
            this.UpdateKeys(row)
          }
        } else {
          // this.$message.error('您没有权限')
          this.$alert('对不起，您没有权限！！！', '警告', {
            confirmButtonText: '确定'
          })
        }
      }
    },
    // 更新重点事项
    UpdateKeys (row) {
      var params = {
        id: row.id,
        item_name: row.重点项目名称,
        item_requires: row.完成要求,
        item_time: row.时间节点,
        item_leadings: JSON.stringify(row.负责人),
        item_execution: row.完成情况,
        item_sources: row.任务来源,
        item_period: row.期数,
        item_date: row.date
      }
      if (params.id) {
        this.updateKeySupervision(params).then(res => {
          if (res.errno === 0) {
            this.$message.success(res.errmsg || '更新成功!')
          } else {
            this.$message.error(res.errmsg || '服务器开小差!')
          }
        })
      } else {
        // console.log('修改后的重点督办内容为：' + params.content)
        this.$message.warning('重点督办id有误，请联系管理员！')
      }
      // console.log('更新成功!!')
    }
  }
}
</script>

<style lang="postcss" scoped>
.get-keySupervision {
  overflow: auto;
}
.key-table {
  text-align: center;
  height: 80%;
  overflow: auto;
}
</style>
