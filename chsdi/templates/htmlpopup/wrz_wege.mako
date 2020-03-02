<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
<%
    lang = lang if lang in ('fr','it') else 'de'
    wegtyp = 'wegtyp_%s' % lang
%>
    <tr><td class="cell-left">${t.Translator.translate('ch.bafu.wrz-wildruhezonen_portal.typ', lang)}</td>               <td>${c['attributes'][wegtyp] or '-'}</td></tr>
    <tr><td class="cell-left">${t.Translator.translate('ch.bafu.wrz-wildruhezonen_portal.einschraenkung', lang)}</td>               <td>${c['attributes']['einschraenkungen'] or '-'}</td></tr>
</%def>

