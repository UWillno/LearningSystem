# Install script for directory: /home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/appLearningSystem-Felgo4.run")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local" TYPE EXECUTABLE FILES "/home/uwillno/Desktop/BYSJ/C/build-LearningSystem-Felgo4-Felgo_SDK_Desktop_Qt_6_4_1_GCC_64bit-Debug/appLearningSystem-Felgo4.run")
  if(EXISTS "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run"
         OLD_RPATH "/home/uwillno/Felgo/Felgo/gcc_64/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/local/appLearningSystem-Felgo4.run")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/Main.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/BlankComponent.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/ChoiceQuestionItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/CommentRow.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/FillInTheBlanksQuestionItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/InsertSwipeView.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/LoginItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/ModifyQuestionPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/PostItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/PostRow.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/PostsPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/QGridView.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/QuestionRect.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/ResourceRow.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/SelectSwipeView.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/TrueOrFalseQuestionItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/loader" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/loader/LoaderItem.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/practice" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/practice/ExercisesPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/template" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/template/ModifyButtons.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/template" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/template/UWAppTextEdit.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/toast" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/toast/SelectSwipeView.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/toast" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/toast/Toast.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/items/toast" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/items/toast/ToastManager.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/logic" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/logic/AdminLogic.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/logic" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/logic/Logic.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/logic" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/logic/UserLogic.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/AddResourcePage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/AdministratorPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/ChoiceQuestionPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/ExercisesPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/ForumPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/ImagePage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/IndexPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/MediaPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/PdfPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/PostDetailPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/PostingPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/PostsPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/PracticePage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/QuestionPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/ResourceListPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/SRMListPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/StudyPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/UserResourcesListPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/WebPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/pages" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/pages/XxtWebPage.qml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/assets" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/assets/felgo-logo.png")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/config.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/qml/logic" TYPE FILE FILES "/home/uwillno/Desktop/BYSJ/C/LearningSystem-Felgo4/qml/logic/adminscript.mjs")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/uwillno/Desktop/BYSJ/C/build-LearningSystem-Felgo4-Felgo_SDK_Desktop_Qt_6_4_1_GCC_64bit-Debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
