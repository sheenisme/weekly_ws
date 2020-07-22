<template>
  <div class="write-news">
    <div class="title"> </div>
    <p>
      &nbsp;&nbsp;日期是：
      <span>{{ currentDate }}</span>
    </p>
    <div>
      <div>
        <el-input placeholder="请输入新闻标题"
                  v-model="title">
          <template slot="prepend"> 标&nbsp;&nbsp;&nbsp;题:</template>
        </el-input>
      </div>
      <div>
        <el-autocomplete popper-class="my-autocomplete"
                         v-model="state"
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
      </div>
      <div>
        <el-input v-model="publisher"
                   style="width:303px;"
                   placeholder="请输入发布人"
                   >
          <template slot="prepend">发布人:</template>
        </el-input>
      </div>
      <el-button type="danger"
                 @click="submitNews">&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;
      </el-button>
      <div>
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
      currentDate: this.getNowFormatDate(),
      newsTypes: null,
      publisher: null,
      state: ''
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
    submitNews () {
      console.log(this.content)
      console.log(this.title)
      console.log(this.currentDate)
      var params = {
        content: this.content,
        date: this.currentDate,
        title: this.title,
        type: this.state,
        publisher: this.publisher
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
    },
    // 下面代码改自https://element.eleme.cn/#/zh-CN/component/input
    // 类型输入建议代码
    querySearch (queryString, cb) {
      var newsTypes = this.newsTypes
      var results = queryString ? newsTypes.filter(this.createFilter(queryString)) : newsTypes
      // 调用 callback 返回建议列表的数据
      cb(results)
    },
    createFilter (queryString) {
      return (newsTypes) => {
        return (newsTypes.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0)
      }
    },
    loadAll () {
      return [
        { 'value': '企管中心-月度总结会议' },
        { 'value': '企管中心-经营分析会议' },
        { 'value': '企管中心-其他会议' }
      ]
    },
    handleSelect (item) {
      console.log(item)
    },
    handleIconClick (ev) {
      console.log(ev)
    }
  },
  mounted () {
    this.newsTypes = this.loadAll()
  }
}
</script>

<style lang="postcss" scoped>
.write-news {
}
.my-autocomplete {
  li {
    line-height: normal;
    padding: 7px;

    .dname {
      text-overflow: ellipsis;
      overflow: hidden;
    }

    .highlighted .addr {
      color: #ddd;
    }
  }
}
</style>
