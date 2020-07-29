apt_package 'default-jdk' do
    action :install 
end


remote_file '/tmp/flink-1.11.1-bin-scala_2.11.tgz' do
    source 'https://aamir-nclouds.s3.amazonaws.com/flink-1.11.1-bin-scala_2.11.tgz'
    action :create
end



# archive_file 'flink-1.11.1' do
#     path '/tmp/flink-1.11.1-bin-scala_2.11.tgz'
#     destination '/flink-1.11.1'
#     action :extract
# end

execute 'extract' do
    command 'tar zxvf /tmp/flink-1.11.1-bin-scala_2.11.tgz -C /'
    action :run
end


execute 'flink' do
    command 'sh /flink-1.11.1/bin/start-cluster.sh'
    action :run
end


































