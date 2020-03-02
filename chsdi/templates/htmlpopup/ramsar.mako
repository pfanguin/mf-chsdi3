<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
    <tr><td class="cell-left">${t.Translator.translate('objektname', lang)}</td>         <td>${c['attributes']['ra_name'] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('objektnr', lang)}</td>          <td>${c['attributes']['ra_obj'] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('flaeche_ha', lang)}</td>          <td>${c['attributes']['ra_fl'] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('gesamtflaeche_ha', lang)}</td>         <td>${c['attributes']['ra_gf'] or '-'}</td></tr>
</%def>

