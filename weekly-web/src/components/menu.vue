<template>
  <div class="menu"
       id="menu">
    <el-menu class="el-menu-vertical-demo"
             background-color="#545c64"
             text-color="#fff"
             active-text-color="#ffd04b"
             :router="false"
             :default-active="$route.path">
      <template>
        <div v-for="item in menuList"
             v-bind:key='item'>
          <el-submenu v-if="item.isNest && item.meta.role >= userInfo.role "
                      :index="item.path">
            <template slot="title">
              <i :class="item.icon"></i>
              <span>{{item.meta.zhName}}</span>
            </template>
            <template v-for="child in item.children">
              <el-menu-item :key="child.path"
                            :index="child.path">
                <router-link :to="child.path">
                  {{child.meta.zhName}}
                </router-link>
              </el-menu-item>
            </template>
          </el-submenu>
          <!--&& !(item.meta.role ==2 && item.meta.key !='1-2') v-if='(userInfo.role == 2 && item.meta.exp == true )'  -->
          <el-menu-item v-if="!item.isNest && item.meta.role >= userInfo.role && ((userInfo.role === 2 && item.meta.exp !== true) || userInfo.role !==2)"
                        :key="item.children[0].path"
                        :index="item.children[0].path">
            <router-link :to="item.children[0].path">
              <i :class="item.children[0].icon"></i>{{item.children[0].meta.zhName}}
            </router-link>
          </el-menu-item>
        </div>
      </template>
    </el-menu>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: 'asideItem',
  data () {
    return {
      router: true
    }
  },
  computed: {
    ...mapGetters([
      'userInfo'
    ]),
    menuList () {
      return this.$router.options.routes.filter(
        item => item.meta.key
      )
    }
  },
  created () {
    // console.log(this.$router.options.routes, 'this.$router.options.routes')
    // console.log(this.menuList, 'this.menuListmenuListmenuListmenuListmenuListmenuList')
    // console.log(this.$route.path)
  },
  methods: {
    allowUse (id) {
      return this.userInfo.menuId.split(',').indexOf(id) > -1
    }
  }
}
</script>

<style lang="postcss" scoped>
.menu {
  transition: width 0.28s ease-out;
  width: 180px;
  background: #545c64;
  & .el-menu {
    width: 100%;
    border-right: none;
    overflow: auto;
  }
}
</style>
