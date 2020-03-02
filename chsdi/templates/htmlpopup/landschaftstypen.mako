<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">

    <tr><td class="cell-left">${t.translate('nummer', lang)}</td>    <td>${c['attributes']['typ_nr']}</td></tr>
    <tr><td class="cell-left">${t.translate('typnummer', lang)}</td>    <td>${c['attributes']['typ_nr']}</td></tr>
    <tr><td class="cell-left">${t.translate('typ', lang)}</td>
      % if lang in ('de', 'rm', 'en'):
           <td>${c['attributes']['typname_de'] or '-'}</td>
      % else:
           <td>${c['attributes']['typname_fr'] or '-'}</td>
      % endif
    </tr>
    <tr><td class="cell-left">${t.translate('regname', lang)}</td>
      % if lang in ('de', 'rm', 'en'):
           <td>${c['attributes']['regname_de'] or '-'}</td>
      % else:
           <td>${c['attributes']['regname_fr'] or '-'}</td>
      % endif
    </tr>
    <tr><td class="cell-left">${t.translate('flaeche_ha', lang)}</td>    <td>${int(round(c['attributes']['object_are'])) or '-'}</td></tr>
    <tr><td class="cell-left">${t.translate('gesamtflaeche_ha', lang)}</td>    <td>${int(round(c['attributes']['typ_area'])) or '-'}</td></tr>
    <tr><td class="cell-left">${t.translate('stand', lang)}</td>    <td>${c['attributes']['stand'] or '-'}</td></tr>
</%def>
