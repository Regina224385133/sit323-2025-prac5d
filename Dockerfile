# 使用官方 Node.js 镜像作为基础镜像
FROM node:14

# 设置容器中的工作目录
WORKDIR /usr/src/app

# 复制 package.json 并安装依赖
COPY package*.json ./
RUN npm install

# 复制应用代码到容器中
COPY . .

# 暴露应用运行的端口（根据需要修改）
EXPOSE 8080

# 定义运行应用的命令
CMD ["node", "app.js"]
