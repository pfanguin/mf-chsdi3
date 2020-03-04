# -*- coding: utf-8 -*-

<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
    <% c['stable_id'] = True %>
    <tr>
      <td class="cell-left">${mod_translate.Translator.translate('kkw', lang)}</td>
      <td>${c['attributes']['name']}</td></tr>
    <tr>
      <td class="cell-left">${mod_translate.Translator.translate('kkw', lang)}>${mod_translate.Translator.translate('zone', lang)}</td>
      <td>${c['attributes']['zone'] or '-'}</td></tr>
    <tr>
      <td class="cell-left">${mod_translate.Translator.translate('sektor', lang)}</td>
      <td>${c['attributes']['sektor'] or '-'}</td>
    </tr>
</%def>
