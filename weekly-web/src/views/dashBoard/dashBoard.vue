<template>
  <div class="dash-board">
    <!-- <el-drawer size="90%"
               direction="ttb"
               :visible.sync="drawer">
      <div style="width:1024px; position: absolute;left:20%;top:1%;">
        <h3 style="text-align:center;">{{this.newsTitle}}</h3>
        <p v-html="this.newsContnt"></p>
      </div>
    </el-drawer> -->
    <!-- <el-row v-if="userInfo.role == 2 || userInfo.role == 3">
      <div class="title">首页</div>
      <el-row :gutter="40"
              class="panel-group">
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetData('depNum')">
            <div class="card-panel-icon-wrapper icon-people">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">部门人数</div>
              <count-to :start-val="0"
                        :end-val="departmentNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetData('unWeekly')">
            <div class="card-panel-icon-wrapper icon-message">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">未写周报</div>
              <count-to :start-val="0"
                        :end-val="unWeeklyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetData('weekly')">
            <div class="card-panel-icon-wrapper icon-money">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">已写周报</div>
              <count-to :start-val="0"
                        :end-val="alreadyWeeklyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetData('hisWeekly')">
            <div class="card-panel-icon-wrapper icon-shopping">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">本周总周报</div>
              <count-to :start-val="0"
                        :end-val="myWeeklyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
      </el-row>
    </el-row>
    <el-row v-if="userInfo.role == 1">
      <div class="title">首页-公司列表</div>
      <el-row :gutter="40"
              class="panel-group">
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetDataAdmin('companyNum')">
            <div class="card-panel-icon-wrapper icon-people">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">公司个数</div>
              <count-to :start-val="0"
                        :end-val="companyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetDataAdmin('totalNum')">
            <div class="card-panel-icon-wrapper icon-message">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">总人数</div>
              <count-to :start-val="0"
                        :end-val="totalUserNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetDataAdmin('totalWeekly')">
            <div class="card-panel-icon-wrapper icon-money">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">本周总周报</div>
              <count-to :start-val="0"
                        :end-val="totalWeeklyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
        <el-col :xs="6"
                :sm="6"
                :lg="6"
                class="card-panel-col">
          <div class="card-panel"
               @click="handleSetDataAdmin('hisWeekly')">
            <div class="card-panel-icon-wrapper icon-shopping">
              <i class="el-icon-edit"></i>
            </div>
            <div class="card-panel-description">
              <div class="card-panel-text">查看周报</div>
              <count-to :start-val="0"
                        :end-val="myWeeklyNumber"
                        :duration="1000"
                        class="card-panel-num" />
            </div>
          </div>
        </el-col>
      </el-row>
      <el-row>

      </el-row>
    </el-row> -->
    <div class="mainContent">
      <p></p>
      <p style="text-align:center; font-weight:bold; font-size:20px; margin:0px;">致炜盛管理干部的一席话</p>
      <p style="text-indent:2em;  margin:0px;">OKR（Objectives and Key Results）即目标与关键结果，OKR是一种战略目标任务体系，是一套明确目标并跟踪其完成情况的管理工具和方法。OKR的主要目标是明确公司和团队的“目标”以及明确每个目标达成的可衡量的“关键结果”。 </p>
      <div style="float:left;"><img src="../../assets/index-pic.jpg"></div>
      <p style="text-indent:2em;  margin:0px;">亲爱的伙伴们，路遥知马力，疾风知劲草。突如其来的全球疫情，让全球经济竞争格局发生演变，我们必须居安思危，敏捷应对。</p>
      <p style="text-indent:2em;  margin:0px;">2020年，我们必须坚定“以客户为中心”的管理和工作理念，践行“尽责、创新、厉行价值创造，铸就同一个汉威”的核心价值观，在集团的赋能支持下，大胆变革，严格管理。我们要坚持高质量发展，坚持长期主义，战略牵引，创新驱动，以“奋斗者、价值创造者”的姿态，聚焦目标，仰望星空，注重结果，脚踏实地。</p>
      <p style="text-indent:2em;  margin:0px;">管理者必须卓有成效，以使命、责任、实践为核心导向，思考自己和负责的团队：我应该为组织贡献什么？我应该对哪些工作成果负责？</p>
      <p style="text-indent:2em;  margin:0px;">所有的想法和观念必须化为行动。2019年，我们“高筑墙、广积粮、缓称王”；2020年，我们“强管理、谋发展、炼内功”，为“高质量百亿汉威“发展贡献应有的价值！不忘初心，牢记使命；奋斗担当，为梦前行！</p>
      <p style="text-align:right; padding-right:100px; font-weight:bold;">总经理：刘瑞玲</p>
      <p style="margin:0px;text-indent:2em;  font-weight:bold;">品牌语：</p>
      <p style="margin:0px;text-indent:2em;  font-weight:bold; ">物联天下 传感先行</p>
      <p></p>
      <p style="margin:0px;text-indent:2em; font-weight:bold;">使命：</p>
      <p style="margin:0px;text-indent:2em;   font-weight:bold; ">感知世界 传递梦想</p>
      <p></p>
      <p style="margin:0px;text-indent:2em; font-weight:bold;">愿景：</p>
      <p style="margin:0px;text-indent:2em; font-weight:bold; ">成为受人尊敬的民族气体传感器企业</p>
      <p></p>
      <p style="margin:0px;text-indent:2em;  font-weight:bold;">核心价值观：</p>
      <p style="margin:0px;text-indent:2em; font-weight:bold; ">尽责、创新、厉行价值创造，铸就同一个汉威。</p>
      <p></p>
      <p style="margin:0px;text-indent:2em; font-weight:bold;">战略方针：</p>
      <p style="margin:0px;text-indent:2em; font-weight:bold; c">依托气体传感器，夯实独特优势和壁垒，为顾客创造价值。</p>
      <p style="margin:0px;text-indent:2em; font-size:16px; font-weight:bold;"></p>
      <p></p>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import CountTo from 'vue-count-to'
export default {
  components: {
    CountTo
  },
  data () {
    return {
      drawer: true,
      newsTitle: '',
      newsContnt: '',

      departmentNumber: 0,
      alreadyWeeklyNumber: 0,
      unWeeklyNumber: 0,
      myWeeklyNumber: 0,
      companyNumber: 0,
      totalUserNumber: 0,
      totalWeeklyNumber: 0
    }
  },
  created () {
    // this.getNews().then(res => {
    //   // console.log(res)
    //   if (res.errno == 0) {
    //     let newsdata = res.data.data[0]
    //     // console.log(newsdata)
    //     for (let key in newsdata) {
    //       if (key == 'title') {
    //         this.newsTitle = newsdata[key]
    //       } else if (key == 'content') {
    //         this.newsContnt = newsdata[key]
    //       } else {
    //         // console.log(key + '---' + newsdata[key])
    //       }
    //     }
    //     // console.log(this.newsTitle + '   内容为：' + this.newsContnt)
    //   } else {
    //     this.$message.error(res.errmsg || '服务器开小差')
    //   }
    // })
    // this.getBoard().then(res => {
    //   if (res.errno == 0) {
    //     if (this.userInfo.role == 2 || this.userInfo.role == 3) {
    //       this.departmentNumber = res.data.departmentNumber
    //       this.alreadyWeeklyNumber = res.data.alreadyWeeklyNumber
    //       this.unWeeklyNumber = res.data.unWeeklyNumber
    //       this.myWeeklyNumber = res.data.myWeeklyNumber
    //     } else if (this.userInfo.role == 1) {
    //       this.companyNumber = res.data.companyNumber
    //       this.totalUserNumber = res.data.totalUserNumber - 1
    //       this.totalWeeklyNumber = res.data.totalWeeklyNumber
    //       this.myWeeklyNumber = res.data.myWeeklyNumber
    //     } else if (this.userInfo.role == 4) {

    //     }
    //   } else {
    //     this.$message.error(res.errmsg || '服务器开小差')
    //   }
    // })
  },
  computed: {
    ...mapGetters([
      'userInfo'
    ])
  },
  methods: {
    ...mapActions([
      'getBoard',
      'getNews'
    ]),
    handleSetData (type) {
      if (type == 'depNum') {
        this.$router.push({
          path: `/weekly/memberList`
        })
      } else if (type == 'unWeekly') {
        this.$router.push({
          path: `/weekly/weeklyView`
        })
      } else if (type == 'weekly') {
        this.$router.push({
          path: `/weekly/weeklyView`
        })
      } else if (type == 'hisWeekly') {
        this.$router.push({
          path: `/weekly/weeklyList`
        })
      }
    },
    handleSetDataAdmin (type) {
      if (type == 'companyNum') {
        this.$router.push({
          path: `/weekly/adminCompany`
        })
      } else if (type == 'totalNum') {
        this.$router.push({
          path: `/weekly/memberList`
        })
      } else if (type == 'totalWeekly') {
        this.$router.push({
          path: `/weekly/weeklyView`
        })
      } else if (type == 'hisWeekly') {
        this.$router.push({
          path: `/weekly/weeklyList`
        })
      }
    }
  }
}
</script>

<style lang="postcss" scoped>
.dash-board {
  & i {
    font-size: 46px;
  }
  & .card-panel-col {
    margin-bottom: 32px;
  }
  & .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #eee;
    border-radius: 4px;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, 0.05);
    border-color: rgba(0, 0, 0, 0.05);
    &:hover {
      & .card-panel-icon-wrapper {
        color: #fff;
      }
      & .icon-people {
        background: #40c9c6;
      }
      & .icon-message {
        background: #36a3f7;
      }
      & .icon-money {
        background: #f4516c;
      }
      & .icon-shopping {
        background: #34bfa3;
      }
    }
    & .icon-people {
      color: #40c9c6;
    }
    & .icon-message {
      color: #36a3f7;
    }
    & .icon-money {
      color: #f4516c;
    }
    & .icon-shopping {
      color: #34bfa3;
    }
    & .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }
    & .card-panel-icon {
      float: left;
      font-size: 48px;
    }
    & .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;
      & .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }
      & .card-panel-num {
        font-size: 20px;
      }
    }
  }
}
</style>
