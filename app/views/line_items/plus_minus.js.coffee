$("#li_plus<%= @line_item.id %>").closest('.list-group-item').html("<%=j render('line_item_row') %>")