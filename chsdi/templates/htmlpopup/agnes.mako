<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
    <tr><td class="cell-left">${h.translate('name', lang)}</td>   <td>${c['featureId']}</td></tr>
    <tr><td class="cell-left">${h.translate('url', lang)}</td>    <td><a target="_blank" href="http://${c['attributes']['url']}">${_('url') or '-'}</a></td></tr>
</%def>
