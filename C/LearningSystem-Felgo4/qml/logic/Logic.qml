import QtQuick
import Felgo

Item {

    id: item

    function getQuestion(){

        HttpRequest.get("http://192.168.1.12/currentQuestions.json").timeout(50000).then(function(res){


        console.log(res.body)
        });
        //        HttpRequest.get("https://sso.chaoxing.com/apis/login/userLogin4Uname.do").timeout(50000).then(function(res){
        //    FileUtils

        //    }

    }
}
