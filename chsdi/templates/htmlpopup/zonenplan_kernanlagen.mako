# -*- coding: utf-8 -*-

<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
    <tr>
      <td class="cell-left">${h.translate('kkw', lang)}</td>
      <td>${c['attributes']['name']}</td></tr>
    <tr>
      <td class="cell-left">${h.translate('kkw', lang)}>${h.translate('zone', lang)}</td>
      <td>${c['attributes']['zone'] or '-'}</td></tr>
    <tr>
      <td class="cell-left">${h.translate('sektor', lang)}</td>
      <td>${c['attributes']['sektor'] or '-'}</td>
    </tr>
</%def>
