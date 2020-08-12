<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">

<%
    lang = lang if lang in ('fr','it','en') else 'de'
    typ1_text = 'typ1_%s' % lang
    typ2_text = 'typ2_%s' % lang
    typ3_text = 'typ3_%s' % lang
    typ4_text = 'typ4_%s' % lang
%>

<tr><td class="cell-left">${_('ch.bfs.landschaftswandel.gmde')}</td><td>${c['attributes']['gmde'] or '-'}</td></tr>

<tr><td class="cell-left">${_('ch.bfs.landschaftswandel.swissnames')}</td><td colspan="4">${c['attributes']['swissnames'] or '-'}</td></tr>

<tr>
  <td class="cell-left">${_('ch.bfs.landschaftswandel.typ1')}</td>
  <td>${[typ1_text]}</td>
  <td>${[typ2_text]}</td>
  <td>${[typ3_text]}</td>
  <td>${[typ4_text]}</td>
</tr>

</%def>

