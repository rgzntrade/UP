cmake_minimum_required(VERSION 3.10)
project(test_cliet C CXX)

# 设置 C++ 标准为 C++11
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找 Google Test
find_package(GTest REQUIRED)

# 包含 Google Test 的头文件目录
include_directories(${GTEST_INCLUDE_DIRS})

# 添加你的可执行文件或库的目标
add_executable(${PROJECT_NAME} main.cpp)

# 链接 Google Test 库到你的测试目标
target_link_libraries(${PROJECT_NAME} ${GTEST_BOTH_LIBRARIES})


