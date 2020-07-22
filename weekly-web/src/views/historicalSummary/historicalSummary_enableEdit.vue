<template>
  <div>
    <el-table :data="newsdata"
              style="width: 100%">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left"
                   inline
                   class="demo-table-expand">
            <!-- <el-form-item label="发布人">
            <div>{{props.row.publisher}}</div>
          </el-form-item> -->
            <el-form-item>
              <p class="scrollbar ql-editor"
                 v-html="props.row.content"></p>
            </el-form-item>
            <el-form-item label="操作"
                          width="100%">
                <el-button @click="editClick(props.row)"
                           type="text"
                           size="small">编辑</el-button>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <!-- <el-table-column label="id"
                        prop="id">
      </el-table-column> -->
      <el-table-column label="督办事项"
                       prop="title">
      </el-table-column>
      <el-table-column label="任务来源"
                       prop="type">
      </el-table-column>
      <el-table-column label="期数"
                       prop="periods">
      </el-table-column>
      <el-table-column label="发布人"
                       prop="publisher">
      </el-table-column>
      <el-table-column label="最后修改时间"
                       prop="date">
      </el-table-column>
    </el-table>
    <!-- <div class="pagination-box"
         v-if="newsdata.length > 0">
      <el-pagination background
                     @current-change="handleCurrentChange"
                     :current-page.sync="currentPage"
                     layout="total, prev, pager, next"
                     :total="newsDataTotal">
      </el-pagination>
    </div> -->
    <div id="editor" class="ql-editor">
      <el-dialog :title="dialogTitle"
                 :visible.sync="confirmSubmitVisiable"
                 :before-close="handleClose"
                 width="85%"
                 center>
        <el-card>
          <quill-editor v-model="editContent"
                        ref="myQuillEditor"
                        style="height:70%"
                        @blur="onEditorBlur($event)"
                        @focus="onEditorFocus($event)" @change="onEditorChange($event)"
                        :options="editorOption"
                        >
          </quill-editor>
        </el-card>
        <span slot="footer"
              class="dialog-footer">
          <el-button @click="handleClose()">取 消</el-button>
          <el-button type="primary"
                     :loading="loadingFlag"
                     @click="successConfirm()">确 定</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
// 调用富文本编辑器
import {
  quillEditor
} from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import Quill from 'quill'
import QuillBetterTable from 'quill-better-table'

Quill.register({
  'modules/better-table': QuillBetterTable
}, true)

export default {
  components: {
    quillEditor
  },
  data () {
    return {
      editContentRow: '',
      editContent: null,
      editId: 0,
      quill: null,
      currentDate: this.getNowFormatDate(),
      loadingFlag: false,
      dialogTitle: '',
      confirmSubmitVisiable: false,
      newsdata: [],
      editorOption: {
        theme: 'snow',
        modules: {
          toolbar: {
            container: [
              [{ 'header': 1 }, { 'header': 2 }],
              [{ 'align': [] }],
              [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
              [{ 'size': ['small', false, 'large', 'huge'] }],
              [{ 'font': [] }],
              [{ 'color': [] }, { 'background': [] }],
              ['bold', 'italic', 'underline', 'strike'],
              ['blockquote', 'code-block'],
              [{ 'list': 'ordered' }, { 'list': 'bullet' }],
              [{ 'script': 'sub' }, { 'script': 'super' }],
              [{ 'indent': '-1' }, { 'indent': '+1' }],
              [{ 'direction': 'rtl' }],
              ['clean'],
              ['link', 'image', 'video', 'table']
            ],
            handlers: {
              'table': function (val) {
                this.quill.getModule('table').insertTable(2, 3)
              },
              'table-insert-row': function () {
                this.quill.getModule('table').insertRowBelow()
              },
              'table-insert-column': function () {
                this.quill.getModule('table').insertColumnRight()
              },
              'table-delete-row': function () {
                this.quill.getModule('table').deleteRow()
              },
              'table-delete-column': function () {
                this.quill.getModule('table').deleteColumn()
              }
            }
          },
          table: true
        },
        placeholder: '点击输入 ...'
      },
      newsDataTotal: 0,
      currentPage: 1
    }
  },
  created () {
    // 获取新闻
    this.getNews().then(res => {
      // console.log(res)
      if (res.errno == 0) {
        this.newsdata = res.data.data
        console.log(this.newsdata)
      } else {
        this.$message.error(res.errmsg || '服务器开小差')
      }
    })
  },
  computed: {
    ...mapActions([])
  },
  methods: {
    ...mapActions([
      'updateNews',
      'addNews',
      'getNews'
    ]),
    onEditorBlur () { // 失去焦点事件
    },
    onEditorFocus () { // 获得焦点事件
    },
    onEditorChange () { // 内容改变事件
    },
    editClick (row) {
      console.log('ROW:', row)
      this.editContentRow = row
      this.confirmSubmitVisiable = true
      this.dialogTitle = '修改内容'
      // this.editContent = row.content
      this.editId = this.editContentRow.id
      console.log('editContent', this.editContent)
      console.log('quill', this.Quill)
    },
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
    successConfirm () {
      var params = {
        id: this.editId,
        content: this.editContent,
        date: this.currentDate
      }
      if (params.content) {
        console.log('修改后的内容为：')
        console.log(params)
        this.loadingFlag = true
        this.updateNews(params).then(res => {
          if (res.errno === 0) {
            this.$message.success(res.errmsg || '提交成功!')
            this.confirmSubmitVisiable = false
          } else {
            this.$message.error(res.errmsg || '服务器开小差!')
          }
          this.loadingFlag = false
        })
      } else {
        console.log('输入的新闻内容为：' + params.content)
        this.$message.warning('输入新闻后才能提交')
      }
    },
    handleClose () {
      this.confirmSubmitVisiable = false
      this.editContentRow = ''
    },
    handleCurrentChange (currentPage) {
      this.getNews(currentPage, 10)
    }
  }
}
</script>

<style>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 98px;
  font-size: 18px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 100%;
  overflow: auto;
}
</style>
<style type="text/css">
.scrollbar {
  max-height: 480px;
  overflow: auto;
}
</style>
