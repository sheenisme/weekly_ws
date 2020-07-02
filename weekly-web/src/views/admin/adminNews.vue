<template>
  <div class="write-news">
    <div class="title"> </div>
    <p>
      &nbsp;&nbsp;日期是：
      <span>{{ currentDate }}</span>
    </p>
    <div>
      <el-button type="danger"
                 @click="submitNews">提交
      </el-button>
      <div>
        <el-input type="textarea"
                  :rows="2"
                  placeholder="请输入新闻标题"
                  v-model="title">
        </el-input>
        <el-card style="height: 610px;">
          <quill-editor v-model="content"
                        ref="myQuillEditor"
                        style="height: 500px;"
                        :options="editorOption">
          </quill-editor>
        </el-card>
      </div>
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

export default {
  components: {
    quillEditor
  },
  data () {
    return {
      content: null,
      editorOption: {},
      title: '',
      // 获取当前时间
      currentDate: new Date().toLocaleDateString()
    }
  },
  created () {
    // 下面部分为新增

  },
  computed: {
    ...mapGetters([])
  },
  methods: {
    // 之后为原始代码
    ...mapActions(['getNews', 'addNews']),
    submitNews () {
      console.log(this.content)
      console.log(this.title)
      console.log(this.currentDate)
      var params = {
        content: this.content,
        date: this.currentDate,
        title: this.title
      }
      if (params.content) {
        console.log('输入的新闻内容为：')
        console.log(params)
        this.loadingFlag = true
        this.addNews(params).then(res => {
          if (res.errno === 0) {
            this.$message.success(res.errmsg || '提交成功!')
          } else {
            this.$message.error(res.errmsg || '服务器开小差!')
          }
          this.loadingFlag = false
        })
      } else {
        console.log('输入的新闻内容为：' + params.content)
        this.$message.warning('输入新闻后才能提交')
      }
    }
  }
}
</script>

<style lang="postcss" scoped>
.write-news {
}
</style>
