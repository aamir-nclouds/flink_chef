apt_package 'default-jdk' do
    action :install 
end


remote_file '/tmp/flink-1.11.1-bin-scala_2.11.tgz' do
    source "https://#{node['s3Bucket']['name']}/#{node['s3File']['name']}"
    action :create
end


execute 'extract_flink' do
    command 'tar zxvf /tmp/flink-1.11.1-bin-scala_2.11.tgz -C /'
    action :run
end


execute 'flink' do
    command 'sudo bash /flink-1.11.1/bin/start-cluster.sh'
    action :run
end


































