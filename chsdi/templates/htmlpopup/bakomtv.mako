<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <tr><td class="cell-left">${h.translate('ch.bakom.versorgungsgebiet-tv.prog', lang)}</td>    <td>${c['attributes']['prog']}</td></tr>
</%def>

