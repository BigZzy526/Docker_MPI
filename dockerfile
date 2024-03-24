# 基于 gmao/mpi-openmpi:4.0.2 镜像构建
FROM gmao/mpi-openmpi:4.0.2

# 创建一个非 root 用户 mpiuser
RUN useradd -ms /bin/bash mpiuser

# 设置工作目录
WORKDIR /home/mpiuser

# 将当前目录下的所有文件复制到容器的 /home/mpiuser 目录中
COPY . /home/mpiuser

# 切换到 mpiuser 用户
USER mpiuser

# 编译 MPI 程序
RUN mpicc -o my_mpi_program ConsoleApplication1.cpp

# 设置执行命令
CMD ["mpiexec", "-n", "1", "./my_mpi_program"]
