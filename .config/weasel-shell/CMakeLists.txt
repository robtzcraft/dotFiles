
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

cmake_minimum_required( VERSION 3.16 )
project( WeaselShell VERSION 1.0 LANGUAGES CXX )

set( CMAKE_CXX_STANDARD 23 )
set( CMAKE_CXX_STANDARD_REQUIRED ON )

find_package( Qt6 REQUIRED COMPONENTS Core Gui Qml )

set( CMAKE_AUTOMOC ON )
set( CMAKE_AUTORCC ON )
set( CMAKE_AUTOUIC ON )

add_executable( weasel main.cpp )

target_link_libraries( weasel PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
)
