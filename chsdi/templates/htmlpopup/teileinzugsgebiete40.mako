<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <tr><td class="cell-left-large">${mod_translate.Translator.translate('tezgnr40', lang)}</td>          <td>${c['attributes']['tezgnr40'] or '-'}</td></tr>
    <tr><td>${mod_translate.Translator.translate('teilezgfla', lang)}</td>         <td>${c['attributes']['teilezgfla'] or '-'}</td></tr>
</%def>

