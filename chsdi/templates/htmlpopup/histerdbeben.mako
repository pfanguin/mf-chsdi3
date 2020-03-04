<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <tr><td class="cell-left">${mod_translate.Translator.translate('abgintens', lang)}</td>    <td>${c['attributes']['intensity'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('abgmagn', lang)}</td>    <td>${c['attributes']['magnitude'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('datumzeit', lang)}</td>    <td>${c['attributes']['date_time'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('epizentralzone', lang)}</td>    <td>${c['attributes']['epicentral'] or '-'}</td></tr>
</%def>

