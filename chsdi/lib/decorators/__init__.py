# -*- coding: utf-8 -*-

import six
from functools import wraps
import xml.parsers.expat
import json

import pyramid.httpexceptions as exc

import re

from six.moves.urllib.parse import unquote_plus

import logging

log = logging.getLogger(__name__)


EXPECTED_KML_CONTENT_TYPE = 'application/vnd.google-earth.kml+xml'
EXPECTED_GLSTYLE_CONTENT_TYPE = 'application/json'


def requires_authorization():
    def wrapper(f):
        @wraps(f)
        def wrapped(self, *args, **kwargs):
            if hasattr(self, 'request'):
                request = self.request
            else:
                request = self
            if request.headers.get('X-SearchServer-Authorized', '').lower() != 'true':
                raise exc.HTTPForbidden(detail='This service requires an authorization')
            else:
                return f(self, *args, **kwargs)
        return wrapped
    return wrapper


def validate_kml_input():
    def decorator(func):
        @wraps(func)
        def wrapper(self, *args, **kwargs):
            log.debug("entry in wrapper")
            if hasattr(self, 'request'):
                request = self.request
            else:
                request = self

            MAX_FILE_SIZE = 1024 * 1024 * 2
            log.debug("request")
            log.debug(request)
            # IE 9/10 doesn't send custom headers
            # webO default Content-Type to 'application/x-www-form-urlencoded' when not explictly set
            if request.content_type in (None, '', 'application/x-www-form-urlencoded'):
                request.content_type = EXPECTED_KML_CONTENT_TYPE

            if request.content_type != EXPECTED_KML_CONTENT_TYPE:
                raise exc.HTTPUnsupportedMediaType('Only KML file are accepted')
            # IE9 sends data urlencoded
            log.debug("right before PYTHON 2/3 shenanigans")
            # Python2/3
            if six.PY3:
                quoted_str = request.body.decode('utf-8')
            else:
                quoted_str = request.body
            data = unquote_plus(quoted_str)
            log.debug("data")
            log.debug(data)
            log.debug("---..---..---")
            if len(data) > MAX_FILE_SIZE:
                error_msg = 'File size exceed %s bytes' % MAX_FILE_SIZE
                log.error(error_msg)
                raise exc.HTTPRequestEntityTooLarge(error_msg)
            log.debug("before kml regex")
            # Prevent erroneous kml
            data = re.sub('(\s+on\w*=(\"[^\"]+\"|\'[^\']+\'))', ' ', data, flags = re.I | re.M)
            data = re.sub('(<|&lt;)script\s*\S*[^(>|&gt;)]*?(>|&gt;)(.|\s)*?(<|&lt;)\/script(>|&gt;)', ' ', data, flags = re.I | re.M)
            try:
                p = xml.parsers.expat.ParserCreate()
                p.Parse(data)
            except Exception:
                raise exc.HTTPUnsupportedMediaType('Only valid KML file are accepted')
            # Python2/3
            if six.PY3:
                request.body = data.encode('utf8')
            else:
                request.body = data
            log.debug("right before return")
            return func(self, *args, **kwargs)
        return wrapper
    return decorator


def validate_glstyle_input():
    def decorator(func):
        @wraps(func)
        def wrapper(self, *args, **kwargs):
            request = self.request if hasattr(self, 'request') else self
            if request.content_type in (None, '', 'application/x-www-form-urlencoded'):
                request.content_type = EXPECTED_GLSTYLE_CONTENT_TYPE

            if request.content_type != EXPECTED_GLSTYLE_CONTENT_TYPE:
                raise exc.HTTPUnsupportedMediaType('Only JSON files are accepted')

            try:
                json.loads(request.body)
            except ValueError:
                raise exc.HTTPUnsupportedMediaType('Only JSON files are accepted, file could not be serialized')

            return func(self, *args, **kwargs)
        return wrapper
    return decorator
