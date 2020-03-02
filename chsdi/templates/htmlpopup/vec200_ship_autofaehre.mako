<%inherit file="base.mako"/>

<%def name="table_body(c,lang)">
    <% c['stable_id'] = True %>
    <tr><td class="cell-left">${t.Translator.translate('zielhafen', lang)}</td><td>
        % if c['attributes']['detn'].strip() in ['N_A','N_P']:
        -
        % else:
        ${c['attributes']['detn'] or '-'}
        % endif
    </td></tr>
    <tr><td class="cell-left">${t.Translator.translate('jahrezeitenrythmus', lang)}</td><td>${t.Translator.translate(c['attributes']['rsu'], lang)}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('nutzungsart_verbindung', lang)}</td><td>${t.Translator.translate(c['attributes']['use'], lang)}</td></tr>
</%def>
