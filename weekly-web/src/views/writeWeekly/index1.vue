<template>
    <div class="write-weekly">
        <div class="title">写周报</div>
        <p>
        今天：
        <span>{{currentDate}}</span>，
        <span>{{currentWeek}}</span>
        </p>
        <div>
        <el-button @click="editAll">批量编辑</el-button>
        <el-button @click="submit">提交</el-button>
        <el-button @click="addAll">批量增加</el-button>
        <el-button @click="delectAll">批量删除</el-button>
        <el-table :data="tabledatas" border @selection-change="handleSelectionChange">
            <el-table-column type="selection"></el-table-column>
            <el-table-column label="本周工作情况">
                <template slot-scope="scope">
                    <span v-if="scope.row.show">
                        <el-input size="mini" placeholder="请输入内容" v-model="scope.row.title"></el-input>
                    </span>
                    <span v-else>{{scope.row.title}}</span>
                </template>
            </el-table-column>
            <el-table-column label="完成情况">
                <template slot-scope="scope">
                    <span v-if="scope.row.show">
                        <el-input size="mini" placeholder="请输入内容" v-model="scope.row.text"></el-input>
                    </span>
                    <span v-else>{{scope.row.text}}</span>
                </template>
            </el-table-column>
             <el-table-column label="完成情况">
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
                    <el-button @click="cope(scope.row,scope.$index)">单个复制</el-button>
                    <el-button @click="delect(scope.$index)">单个删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        </div>
    </div>
</template>
<script>
    import Vue from 'vue'
    export default {
        data() {
            return {
                tabledatas: [],
                multipleSelection: [],
            }
        },
        created() {
            this.tabledatas = [
                { title: '标题1', text: 's111sssa' },
                { title: '标题2', text: 'ss222ssa' },
            ]
            this.tabledatas.map(i => {
                i.show = false
                return i
            })
        },
        methods: {
            edit(row, index) {
                row.show = row.show ? false : true
                Vue.set(this.tabledatas, index, row)
                // 修改后保存
            },
            editAll() {
                this.tabledatas.map((i, index) => {
                    i.show = true
                    Vue.set(this.tabledatas, index, i)
                })
            },
            submit() {
                this.tabledatas.map((i, index) => {
                    i.show = false
                    Vue.set(this.tabledatas, index, i)
                })
            },
            // 单个复制
            cope(val, index) {
     			this.tabledatas.splice(index, 0,JSON.parse(JSON.stringify(val)))
   			},  
            // 单个删除
            delect(index) {
                this.tabledatas.splice(index, 1)
            },
            //批量新增
            addAll() {
                if (this.multipleSelection.length == 0) {
                    let list = {
                        title: "",
                        text: ""
                    }
                    this.tabledatas.push(list)
                } else {
                     this.multipleSelection.forEach((val, index)=> {
                   		this.tabledatas.splice(index, 0,JSON.parse(JSON.stringify(val)))
                    });
                }
            },
            //批量删除
            delectAll() {
                for (let i = 0; i < this.tabledatas.length; i++) {
                    const element = this.tabledatas[i];
                    element.id = i
                }
                if (this.multipleSelection.length == 0) this.$message.error('请先至少选择一项')
                this.multipleSelection.forEach(element => {
                    this.tabledatas.forEach((e, i) => {
                        if (element.id == e.id) {
                            this.tabledatas.splice(i, 1)
                        }
                    });
                });
            },
            //选
            handleSelectionChange(val) {
                this.multipleSelection = val;
            }
        },
    }
</script>