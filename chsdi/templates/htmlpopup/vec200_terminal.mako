<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
    <tr><td class="cell-left">${t.translate('typ', lang)}</td><td>${c['attributes']['objval']}</td></tr>
</%def>
