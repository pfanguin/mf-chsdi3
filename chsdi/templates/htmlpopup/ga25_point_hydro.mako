<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
    <tr><td class="cell-left">${mod_translate.Translator.translate('geocover_basisdatensatz', lang)}</td><td>${c['attributes']['basisdatensatz'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('geocover_description', lang)}</td><td>${c['attributes']['description'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('geocover_spec_description', lang)}</td><td>${c['attributes']['spec_description'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('geocover_azimut', lang)}</td><td>${c['attributes']['azimut'] or '-'}</td></tr>
    <tr><td class="cell-left">${mod_translate.Translator.translate('geocover_depth', lang)}</td><td>${c['attributes']['depth'] or '-'}</td></tr>
    <tr><td class="cell-left"></td><td><a href="${c['attributes']['url_legend']}" target="_blank">${mod_translate.Translator.translate('linkzurlegende', lang)}</a></td></tr>
</%def>
