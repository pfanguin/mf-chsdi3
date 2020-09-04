<%inherit file="base.mako"/>

<%
  lang = lang if lang in ('fr','it') else 'de'
  produkt_text = 'produkt_%s' % lang
  hinweis_text = 'hinweis_%s' % lang
%>

<%def name="table_body(c, lang)">
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.standort')}</td>
    <td>${c['attributes']['standort'] or '-'}</td>
  </tr>
</%def>
