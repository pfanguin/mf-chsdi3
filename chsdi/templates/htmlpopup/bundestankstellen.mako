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
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.adresse')}</td>
    <td>${c['attributes']['adresse'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.plz')}</td>
    <td>${c['attributes']['plz'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.ort')}</td>
    <td>${c['attributes']['ort'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.oeffnungszeiten')}</td>
    <td>${c['attributes']['oeffnungszeiten'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-left">${_('ch.vbs.bundestankstellen-bebeco.kontakt')}</td>
    <td>${c['attributes']['kontakt'] or '-'}</td>
  </tr>

</%def>
