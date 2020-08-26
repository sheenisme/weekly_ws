<template>
  <div class="get-keySupervision">
    <div class="title">重点督办事项</div>
    <div>
      <span>请选择要查看的会议：&nbsp;</span>
      <el-select v-model="selectValue"
                 clearable
                 placeholder="请选择...">
        <el-option :value="selectValue">
          <el-tree :data="treeData"
                   :props="defaultProps"
                   accordion
                   highlight-current
                   icon-class='el-icon-remove'
                   @node-click="handleTreeNodeClick"></el-tree>
        </el-option>
      </el-select>
    </div>
    <div>
      <el-table class="key-table"
                :data="keysData"
                height="760"
                border
                style="width: 100%"
                :header-cell-style="{
           'background-color': '#FAC08F',
           'font-size': '15px',
           'color': '#A3642E',
           'text-align': 'center',
          }">
        <el-table-column label="重点项目名称"
                         width="170px">
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
                         width="190px">
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
                         width="140px">
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
                         width="193px">
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
        <el-table-column label="完成时间"
                         width="160px">
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
                         width="77px">
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
      showIds: null,
      treeData: [],
      defaultProps: {
        children: 'child',
        label: 'label'
      },
      selectValue: null,
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
    this.getKeyTreeList()
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    ...mapActions([
      'getCurrentWeekly',
      'getDepartmentMemberListNoPage',
      'addKeySupervision',
      'getKeySupervision',
      'getKeyTree',
      'getKeysById',
      'updateKeySupervision'
    ]),
    // 获取重点督办树列表
    getKeyTreeList () {
      this.getKeyTree().then(res => {
        if (res.errno === 0) {
          let listData = res.data
          // console.log(listData)
          // console.log(JSON.stringify(listData))
          this.changeListToTree(listData)
        } else {
          this.$message.error(res.errmsg || '服务器开小差-- getKeyTreeList ()')
        }
      })
    },
    // 循环遍历将列表转成树
    changeListToTree (listData) {
      let nowType = listData[0].type
      let addObj = {}
      let childArrary = []
      for (let i = 0; i < listData.length; i++) {
        if (listData[i].type === nowType) {
          let childObj = {}
          addObj['label'] = nowType
          // 属于同一个类型的话,增加孩子数组的内容
          childObj['label'] = listData[i].period
          childObj['lids'] = listData[i].lids
          childArrary.push(childObj)
          // 如果下一个字段没有越界
          if (i + 1 < listData.length) {
            // 如果下一个字段的类型不是现在的类型了
            if (listData[i + 1].type !== nowType) {
              addObj['child'] = childArrary
              this.treeData.push(addObj)
            }
          } else {
            addObj['child'] = childArrary
            this.treeData.push(addObj) // 说明这是最后一个字段了，直接加入
          }
        } else {
          nowType = listData[i].type
          addObj = {}
          childArrary = []
          let childObj = {}
          addObj['label'] = nowType
          // 属于同一个类型的话,增加孩子数组的内容
          childObj['label'] = listData[i].period
          childObj['lids'] = listData[i].lids
          childArrary.push(childObj)
          // 如果下一个字段没有越界
          if (i + 1 < listData.length) {
            // 如果下一个字段的类型不是现在的类型了
            if (listData[i + 1].type !== nowType) {
              addObj['child'] = childArrary
              this.treeData.push(addObj)
            }
          } else {
            addObj['child'] = childArrary
            this.treeData.push(addObj) // 说明这是最后一个字段了，直接加入
          }
        }
      }
      console.log('树形结构的内容为:', this.treeData)
      // console.log(JSON.stringify(this.treeData))
    },
    // 点击树形结构处理函数
    handleTreeNodeClick (nodeData, node, vueCompent) {
      // console.log('节点数据是：', nodeData, '节点是：', node, 'vue组件是：', vueCompent)
      /* 获取人员列表 */
      this.departmentMemberList()
      if (nodeData.lids) {
        console.log('将要查询这些ID:', JSON.stringify(nodeData.lids), '会议期数是：', JSON.stringify(nodeData.label))
        this.selectValue = nodeData.label
        this.showIds = nodeData.lids
        this.getKeysListById(1, 10)
      } else {
        console.log('点击的不是叶子节点！！！')
      }
    },

    // 点击选择器后处理组件
    handlSelectClick () {
      console.log('选择器处理事件！')
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
    // 处理页码变化
    handleCurrentChange (currentPage) {
      // this.getKeysList(currentPage, 10)
      // console.log('当前页数：', currentPage)
      this.getKeysListById(currentPage, 10)
    },

    // // 获取重点督办列表
    // getKeysList (pageNum, pageSize) {
    //   this.getKeySupervision({ pageNum, pageSize }).then(res => {
    //   // console.log('查询的页数：', pageNum)
    //     if (res.errno === 0) {
    //       this.keysDataTotal = res.data.count
    //       this.currentPage = pageNum
    //       this.keysData = res.data.data.map(item => {
    //         return {
    //           id: item.id,
    //           重点项目名称: item.item_name,
    //           完成要求: item.item_requires,
    //           时间节点: item.item_time,
    //           负责人: JSON.parse(item.item_leadings),
    //           完成情况: item.item_execution,
    //           任务来源: item.item_sources,
    //           期数: item.item_period,
    //           完成时间: item.item_date,
    //           show: false
    //         }
    //       })
    //     } else {
    //       this.$message.error(res.errmsg || '服务器开小差')
    //     }
    //   // console.log(this.keysData)
    //   })
    // },
    // 通过id获取重点督办列表
    getKeysListById (pageNum, pageSize) {
      this.getKeysById({ pageNum, pageSize, ids: this.showIds }).then(res => {
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
              完成时间: item.item_date,
              show: false
            }
          })
        } else {
          this.$message.error(res.errmsg || '服务器开小差--getKeysListById')
        }
        console.log(this.keysData)
      })
      // console.log(this.keysData)
    },

    // 修改重点督办事项
    editKeys (row, index) {
      // console.log(row)
      // 如果是管理员的话
      if (this.userInfo.role === 1) {
        if (row.show === false) {
          row.show = true
          // this.$set(this.keysData, index, row)
        } else {
          row.show = false
          this.$set(this.keysData, index, row)
          this.UpdateKeys(row)
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
<style scoped>
.el-scrollbar .el-scrollbar__view .el-select-dropdown__item {
  height: auto;
  max-height: 274px;
  padding: 0;
  overflow: hidden;
  overflow-y: auto;
}
.el-select-dropdown__item.selected {
  font-weight: normal;
}
ul li >>> .el-tree .el-tree-node__content {
  height: auto;
  padding: 0 20px;
}
.el-tree-node__label {
  font-weight: normal;
}
.el-tree >>> .is-current .el-tree-node__label {
  color: #409eff;
  font-weight: 800;
}
.el-tree >>> .is-current .el-tree-node__children .el-tree-node__label {
  color: #606266;
  font-weight: normal;
}
</style>
