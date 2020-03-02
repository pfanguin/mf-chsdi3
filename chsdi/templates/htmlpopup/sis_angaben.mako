<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
<%
    import datetime
    beschreibung = c['layerBodId'] + '.' + 'description_%s' % lang
    name = c['layerBodId'] + '.' + 'name'
    lang = lang if lang in ('fr','it','de') else 'de'
    description = 'description_%s' % lang
    facility_kind = 'fackind_text_%s' % lang
    facility_status = 'facstatus_text_%s' % lang
    try:
        datefrom = datetime.datetime.strptime(c['attributes']['valid_from'].strip(), "%Y%m%d").strftime("%d.%m.%Y")
    except:
        datefrom = '-'

%>
    <tr><td class="cell-left">${t.Translator.translate(name, lang)}</td>         <td>${c['attributes']['name']}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate(beschreibung, lang)}</td>              <td>${c['attributes'][description] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('tt_sachplan-infrastruktur-schiene_aus_anlageart', lang)}</td>      <td>${c['attributes'][facility_kind] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('tt_ch.bfe.energieforschung_projektstatus', lang)}</td>             <td>${c['attributes'][facility_status] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('tt_sachplan-infrastruktur-schiene_aus_validform', lang)}</td>      <td>${datefrom or '-'}</td></tr>
</%def>
