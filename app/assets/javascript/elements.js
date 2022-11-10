function show_result(data){
  var result = document.getElementById("res");
  if (data.type == 'Error') {
    alert(data.value)
  } else {
    result.innerHTML = ""
    result.innerHTML += '<tr><td>Length of sequence</td><td>' + data.value[0] + '</td></tr>'
    result.innerHTML += '<tr><td>Sequence</td><td>' + data.value[1]+ '</td></tr>'
    if (data.value[2] == "") {
      result.innerHTML += '<tr><td>Sequences of powers of 5</td><td> - </td></tr>'

    } else {
      result.innerHTML += '<tr><td>Sequences of powers of 5</td><td>' + data.value[2]+ '</td></tr>'
    }
    result.innerHTML += '<tr><td>Sequence of powers of 5 with max length</td><td>' + data.value[3]+ '</td></tr>'
    result.innerHTML += '<tr><td>Number of sequences of powers of 5</td><td>' + data.value[4] + '</td></tr>'
    result.innerHTML += '</table>'
  }
  }
$(document).ready(function(){
  $("#form").bind("ajax:success", function(xhr, data, status)
  {
      show_result(data)
  })
})