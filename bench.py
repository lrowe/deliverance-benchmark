# -*- coding: utf-8 -*-
"""Deliverance / XDV benchmark
"""

import unittest
import funkload.FunkLoadTestCase


class bench(funkload.FunkLoadTestCase.FunkLoadTestCase):
    """ This test use a configuration file Simple.conf.
    """

    __name__ = 'bench'

    def setUp(self):
        """ Setting up test.
        """
        self.logd("setUp")
        self.label = 'Deliverance / XDV benchmark'
        self.server_url = self.conf_get('main', 'url')
        self.nb_time = self.conf_getInt('test_bench', 'nb_time')

    def test_all(self):
        for i in range(self.nb_time):
            for path in ['/static/', '/static-xdv/', '/static-deliverance/']:
                self.get(self.server_url+path, description=path)


def test_suite():
    return unittest.makeSuite(bench)

additional_tests = test_suite

if __name__ in ('main', '__main__'):
    unittest.main(defaultTest='test_suite')
