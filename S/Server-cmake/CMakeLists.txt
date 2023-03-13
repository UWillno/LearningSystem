cmake_minimum_required(VERSION 3.14)

project(Server-cmake LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS HttpServer Sql Network Concurrent)
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core)

add_executable(Server-cmake
    main.cpp
    interface/iQuestion.h
    interface/iQuestionFactory.h
    choicequestion.cpp
    choicequestion.h
    fillintheblanksquestion.cpp
    fillintheblanksquestion.h
    questionfactory.cpp
    questionfactory.h
    singleton.h
    sqloperator.cpp
    sqloperator.h
    tcpserver.cpp
    tcpserver.h
    trueorfalsequestion.cpp
    trueorfalsequestion.h
    user.h user.cpp
    comment.h comment.cpp
    post.h post.cpp
    httpserver.h httpserver.cpp
    resource.h resource.cpp
    #    interface/resource.h interface/resource.cpp
    resource.h resource.cpp
)
target_link_libraries(Server-cmake Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Sql Qt${QT_VERSION_MAJOR}::Network Qt${QT_VERSION_MAJOR}::Concurrent Qt${QT_VERSION_MAJOR}::HttpServer)

install(TARGETS Server-cmake
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} )
