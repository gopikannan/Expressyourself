<% if @poll_items.any? %>
        <table class="polls">
                <%= render :partial => 'shared/poll', :collection => @poll_items %>
        </table>
<% end %>
