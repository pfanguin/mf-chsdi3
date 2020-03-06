<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
<%
    lang = lang if lang != 'rm' else 'de'
%>

    <tr><td class="cell-left">${h.translate('betrieb', lang)}</td>                     <td>${c['attributes']['betrieb'] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('tt_swissprtr_ort', lang)}</td>            <td>${c['attributes']['ort'] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('tt_swissprtr_detaildaten', lang)}</td>    <td><a href="http://www.prtr.admin.ch/PublicWebSite/CompanyDetails.aspx?IDCompany=${c['featureId']}&Year=${c['attributes']['jahr'] or '-'}&lng=${lang}" target="_blank">${h.translate('linkzurbeschreibung', lang)}</a></td></tr>
</%def>

