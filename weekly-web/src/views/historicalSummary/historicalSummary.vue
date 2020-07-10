<template>
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
          <el-form-item label="纪要内容">
            <div class="scrollbar"
                 v-html="props.row.content"></div>
          </el-form-item>
        </el-form>
      </template>
    </el-table-column>
    <el-table-column label="标题"
                     prop="title">
    </el-table-column>
    <el-table-column label="来源"
                     prop="type">
    </el-table-column>
    <el-table-column label="发布人"
                     prop="publisher">
    </el-table-column>
    <el-table-column label="发布时间"
                     prop="date">
    </el-table-column>
  </el-table>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  data () {
    return {
      newsdata: []
    }
  },
  created () {
    // 获取新闻
    this.getNews().then(res => {
      // console.log(res)
      if (res.errno == 0) {
        this.newsdata = res.data.data
        console.log(newsdata)
      } else {
        this.$message.error(res.errmsg || '服务器开小差')
      }
    })
  },
  computed: {
    ...mapGetters([])
  },
  methods: {
    ...mapActions([
      'getNews'
    ])
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
