<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
   <tr><td class="cell-left">${t.translate('contour_totalintensitaet', lang)}</td><td>${c['attributes']['contour'] or '-'}</td></tr>
</%def>
