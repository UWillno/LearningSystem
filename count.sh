find S/Server-cmake C/LearningSystem-Felgo4  -name "*.h" -o -name "*.cpp" -o -name "*.qml" -o -name "*.html" -o -name "*.qrc"| xargs wc -l | sort -n > count.txt
echo ' 去除空白行总计:' $(find S/Server-cmake C/LearningSystem-Felgo4  -name "*.h" -o -name "*.cpp" -o -name "*.qml" -o -name "*.html" -o -name "*.qrc"| xargs cat | grep -v "^$" | wc -l) >> count.txt

