function show_result(data){
    var result = document.getElementById("res");
    result.innerHTML = '<h1>Test</h1>'
    }
$(document).ready(function(){
    $("#form").bind("ajax:success", function(xhr, data, status)
    {
        show_result(data)
    })
})