
<script type="text/javascript">
    $(document).ready(function(){
        $("select#requests_user_id").change(function(){
            var id_value_string = $(this).val();
            if (id_value_string == "") {
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("select#requests_wish_list_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("select#requests_wish_list_id");
            }
            else {
                // Send the request and update sub category dropdown
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/wish_lists/for_userid/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){                    
                        // Clear all options from sub category select
                        $("select#requests_wish_list_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                        $(row).appendTo("select#requests_wish_list_id");                        
                        // Fill sub category select
                        $.each(data, function(i, j){
                            row = "<option value=\"" + j.sub_section.id + "\">" + j.sub_section.name + "</option>";  
                            $(row).appendTo("requests_wish_list_id");                    
                        });            
                     }
                });
            };
                });
    });
</script>




