<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
       <tr><td class="cell-left">${Translator.translate('ch.swisstopo.geologie-geotechnik-ziegeleien_1995.ziegeleien', lang)}</td><td>${c['attributes']['ziegeleien'] or '-'}</td></tr>
       <tr><td class="cell-left">${Translator.translate('produkt', lang)}</td><td>${c['attributes']['produkt'] or '-'}</td></tr>
</%def>
