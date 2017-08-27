function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

// articles.html: configure date picker for closing date
$(function () {
    $("div[id^='datetimepicker_close_date_']").datetimepicker({
        // locale: 'ru',
        format: 'DD.MM.YYYY', 
    });
});

// articles.html: function has called by click on "close_<id>" button
var onClose = function(b) {
    // console.log("%s %s", b, b.id);
    // console.log("%s click; id=%s", $("#"+b.id).attr("id"), $("#"+b.id).data('value'));
    var id = $("#"+b.id).data('value');
    var cdate = $("#input_datetimepicker_close_date_"+id).val();
    if (cdate != ''){
        // console.log("close click; id=%s, date=%s", id, cdate);
        $.ajax({url:"/api/item/"+id+'/', 
            type: "POST",
            data: { 
                csrfmiddlewaretoken: getCookie('csrftoken'),
                closing_date: cdate, 
            },
            success:function(result){
                // console.log("result data=%s", JSON.stringify(result,null,2));
                    // console.log("result.status=%s", result.status);
                if(result.status == "200"){
                    // console.log("200 result.status=%s %s", result.status, '#tr_'+result.content.id);
                    $("#td_input_"+result.content.id).html('<input type="text" class="form-control" disabled="disabled" value="'+result.content.closing_date+'" />');
                    $("#td_button_"+result.content.id).html('Закрыта');
                    // $("#td_button_"+result.content.id).innerHTML='Закрыта';
                    // console.log($("#td_input_"+result.content.id).html());
                    // $("#tr_"+result.content).remove();
                }
                else{
                    console.log("result.status=%s: %s", result.status, result.statusText);
                }
            },
            error:function(result){
                console.log("error result data=%s", JSON.stringify(result,null,2));
            }
        });
    };    
};

// article_form.html: configure date picker for closing date of new article
$(function () {
    $('#datetimepicker').datetimepicker({
        // format: 'DD.MM.YYYY', // %Y-%m-%d
        format: 'YYYY-MM-DD', // %Y-%m-%d
    });
});

// report.html: action for a showing of a report in selected date interval
// for AJAX response - not used now
$("#show").click(function(){
    // console.log("click")
    $.ajax({url:"{% url 'report_result' %}", 
        type: "POST",
        data:{ 
            csrfmiddlewaretoken: getCookie('csrftoken'),
            start_date: $("#start_date").val(), 
            end_date: $("#end_date").val(), 
        },
        success:function(result){
            alert( "Получены данные: " + result );
            $("#text").html(result)
        }
   });
});

// report.html: configure date picker that is showing report
$(function () {
    $('#datetimepicker6').datetimepicker({
        locale: 'ru',
    });
    $('#datetimepicker7').datetimepicker({
        locale: 'ru',
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});



// report_res.html: function is called by click of button in a row of report table for delete the row
var onDelete = function(b) {
    // console.log("%s %s", b, b.id);
    // console.log("%s click; id=%s", $("#"+b.id).attr("id"), $("#"+b.id).data('value'));
    var idestimate = $("#"+b.id).data('value');
    $.ajax({url:"/api/estimate/"+idestimate, 
        type: "DELETE",
        success:function(result){
            // console.log("result data=%s", JSON.stringify(result,null,2));
            // console.log("result.status=%s", result.status);
            if(result.status == "200"){
                // console.log("200 result.status=%s %s", result.status, '#tr_'+result.content);
                // console.log($("#tr_"+result.content).html())
                $("#tr_"+result.content).remove();
            }
            else{
                console.log("result.status=%s", result.status, result.statusText);
            }
        },
        error:function(result){
            console.log("error result data=%s", JSON.stringify(result,null,2));
        }
    });
}

// report_res.html: event from a click of button for add new record
// $("#add_record").click(function(){
var onAdd = function(b) {
    // console.log("%s click;", $(this).attr("id"));
    // console.log("onAdd %s",  $("#"+b.id).val());
    var data={ 
            csrfmiddlewaretoken: getCookie('csrftoken'),
            datetime: $("#new_date").val(), 
            item_id: $("#new_item").val(), 
            item: $('#new_item option:selected').text(), 
            value: $("#new_value").val(), 
            kind: $('#new_kind option:selected').text(),
            plan: $('#new_plan').text(),
        };
    var jsonPretty = JSON.stringify(data,null,2); 
    // console.log("add_record data=%s", jsonPretty);
    $.ajax({url:"/api/estimate/new/", 
        type: "POST",
        data: { 
            csrfmiddlewaretoken: getCookie('csrftoken'),
            datetime: $("#new_date").val(), 
            item_id: $("#new_item").val(), 
            value: $("#new_value").val(), 
        },
        success:function(result){
            // console.log("result=%s",  result);
            // console.log("result data=%s", JSON.stringify(result,null,2));
            if(result.status == 200){
                var idest = result.content;
                var tr="<tr ";
                if ( data.kind == "Доход") { tr+='class="success" id="tr_'+idest+'">'
                    } else {tr+='class="danger" id="tr_'+idest+'">'};
                tr+="<td>"+data.datetime+"</td>";
                tr+="<td>"+data.kind+"</td>";
                tr+="<td>"+data.item+"</td>";
                tr+="<td>"+data.plan+"</td>";
                tr+="<td>"+data.value+"</td>";
                tr+='<td><button id="remove_'+idest+'" class="btn btn-danger" data-value="'+idest+'" onclick="onDelete(this)"><span class="glyphicon glyphicon-remove"></span></button></td>';
                tr+="</tr>";
                // console.log("result %s", tr);
                var r = $("#add_record").closest('tr');
                // var r = $("#add_record").closest('tr').remove();
                $(tr).insertBefore(r);
                // $("#report_table").append(tr);
            }
        },
        error:function(result){
            console.log("result data=%s", JSON.stringify(result,null,2));
        }
    });
// });
};

// report_res.html: event from change kind selection to show items of the selected kind
var onChange = function(b) {
    // console.log("%s %s", b, b.id);
    // console.log("%s click; id=%s", $("#"+b.id).attr("id"), $("#"+b.id).data('value'));
// $('#new_kind').on('change', function(){
    // console.log("changed new_kind %s",  $("#"+b.id).val());
    var idkind = $("#"+b.id).val();
    $('#new_kind option[value=default]').remove();
    $("#new_item").empty();
    $.ajax({url:"/api/items/"+idkind, 
        type: "GET",
        success:function(result){
            for (var item in result.content){
                if(item==0){
                    // console.log("plan=%s",  result.content[item].plan);
                    $('#new_plan').text(result.content[item].plan)
                };
                $('#new_item').append('<option id="option_' + result.content[item].id + 
                    '" value="' + result.content[item].id + 
                    '" data-plan="' + result.content[item].plan + 
                    '">' + result.content[item].name + '</option>');
            };
        }
    });
 // });
};

// report_res.html: event from change kind selection to show items of the selected kind
var onChangeItem = function(b) {
    // console.log("%s %s", b, b.id, $('#'+b.id+' option:selected').val());
    // console.log("%s click; id=%s", b.value,  $('#'+b.id+' option:selected').data('plan'));
    $("#new_plan").text($('#'+b.id+' option:selected').data('plan'));
};

// report_res.html: configure date picker of new record
$(function () {
    $('#datetimepicker_new_date').datetimepicker({
        locale: 'ru',
    });
});

