<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
    <% c['stable_id'] = True %>
    <tr><td class="cell-left">${h.translate('name', lang)}</td><td>${c['attributes']['objname'] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('typ', lang)}</td><td>${c['attributes']['objval'] or '-'}</td></tr>
</%def>
