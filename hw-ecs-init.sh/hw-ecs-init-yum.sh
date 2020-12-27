# 备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
# 进入yum源配置文件夹 
cd /etc/yum.repos.d
# 下载源配置文件
wget -O /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-7-reg.repo   //下载华为mirrors
# 重新安装epel源 
yum remove  -y  epel-release
yum install -y  https://repo.huaweicloud.com/epel/epel-release-latest-7.noarch.rpm
cd /etc/yum.repos.d/
rm -rf epel-testing.repo
# 配置华为云源
sed -i "s/#baseurl/baseurl/g" /etc/yum.repos.d/epel.repo
sed -i "s/mirrorlist/#mirrorlist/g" /etc/yum.repos.d/epel.repo
sed -i "s@http://download.fedoraproject.org/pub@https://repo.huaweicloud.com@g" /etc/yum.repos.d/epel.repo
# 清理缓存
yum clean all
yum makecache
yum repolist all  
