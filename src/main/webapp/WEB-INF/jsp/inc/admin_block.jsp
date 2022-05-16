<% if(admin != null) { %>
                            	<div class="woocommerce-info">Connection en cours: <%= admin.getEmail() %></div>
                            	<div class="woocommerce-info"><a href="/admin/logout">Se deconnecter</a></div>
                            <% } %>