
#
# 请先cd 到atom目录下的packages目录下在执行本脚本
#
# 本脚本所需的插件列表参考：
# http://www.jianshu.com/p/b4a11ab77f15
#

# 下载所有包
function clone_pkg(){
	# 安装C++环境
	git clone https://github.com/steelbrain/linter.git
	git clone https://github.com/steelbrain/linter-ui-default.git
	git clone https://github.com/steelbrain/busy-signal.git
	git clone https://github.com/steelbrain/intentions.git
	git clone https://github.com/AtomLinter/atom-minimap-linter.git

	# 语法补全
	# 1.跳转到定义，默认快捷键是f3与其它功能冲突，需要自己自定义
	# file->keymap，添加
	# 	'atom-workspace':
	# 	'f12': 'autocomplete-clang:go-declaration'
	# 	'alt-f1': 'autocomplete-clang:go-declaration'
	# 2.编写时提示、补全，在atom下可以使用autocomplere-clang工具来实现代码补全，但是添加头文件都是一件麻烦的事：
	# 在工程简单的时候可以手动添加include地址，
	#   1).在公车根目录创建 .clang_complete  
	# 	2).在文件中写入-I./inlude
	# 但是工程复杂了就很难用了，往往一个SDK都有无数include地址，
	# 会用makefile进行组织，还要继续用这个插件也许有更好的方法。
	#
	git clone https://github.com/yasuyuky/autocomplete-clang.git

	# 具体C++环境语法检测
	git clone https://github.com/hebaishi/linter-gcc.git


	# 选择高亮
	git clone https://github.com/richrace/highlight-selected.git

	# 集成 终端
	git clone https://github.com/platformio/platformio-atom-ide-terminal.git

	# 文件内容小地图
	git clone https://github.com/atom-minimap/minimap.git
	git clone https://github.com/atom-minimap/minimap-highlight-selected.git
	git clone https://github.com/olmokramer/atom-minimap-codeglance.git


	# 文件图标
	git clone https://github.com/file-icons/atom.git

	# 工具栏
	git clone https://github.com/suda/tool-bar.git

	# build
	git clone https://github.com/noseglid/atom-build.git

	# 酷炫类，耍酷用，没什么用
	git clone https://github.com/JoelBesada/activate-power-mode.git
}
#===========================
# 遍历并执行
function install_pkg(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ] ; then 
            cd $element
			npm install 
			cd ..
        fi  
    done
}

#删除所有包
function clean_pkg(){
	echo "clean all pkg"
	rm -rf $q"/*"
}
cur_dir=(`pwd`)
echo $cur_dir
cd $cur_dir

clean_pkg $cur_dir
clone_pkg
install_pkg $cur_dir






