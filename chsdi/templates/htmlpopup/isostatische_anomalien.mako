<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
   <tr><td class="cell-left">${Translator.translate('et_fromatt_anom', lang)}</td><td>${c['attributes']['et_fromatt'] or '-'}</td></tr>
</%def>
