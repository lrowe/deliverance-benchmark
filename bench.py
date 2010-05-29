
import os

REQNUM = 100
REPEAT = 10
#TESTS = {
#    'nginx': {'url': 'http://127.0.0.1:8000',
#              'tests': {'static':               '/static/',
#                        'static + xdv':         '/static-xdv/',
#                        'plone':                '/plone/',
#                        'plone + xdv':          '/plone-xdv/',}},
#    'paster': {'url': 'http://127.0.0.1:8001',
#              'tests': {'static':               '/static/',
#                        'static + xdv':         '/static-xdv/',
#                        'static + deliverance': '/static-deliverance/',
#                        'plone':                '/plone/',
#                        'plone + xdv':          '/plone-xdv/',
#                        'plone + deliverance':  '/plone-deliverance/',}},
TESTS = {
    'gunicorn': {'url': 'http://127.0.0.1:8002',
              'tests': {'static':               '/static/',
                        'static + xdv':         '/static-xdv/',
                        'static + deliverance': '/static-deliverance/',
                        'plone':                '/plone/',
                        'plone + xdv':          '/plone-xdv/',
                        'plone + deliverance':  '/plone-deliverance/',}},
    }
COMMAND = 'ab -n %s %s'


RESULTS = {}
for item in TESTS:
    print item
    if item not in RESULTS.keys():
        RESULTS[item] = {}

    for repeat in range(REPEAT+1):
        print '  |--> '+str(repeat)
        for test in TESTS[item]['tests']:
            testres = float(os.popen(COMMAND % (REQNUM, TESTS[item]['url']+TESTS[item]['tests'][test])).read().split('Time per request:')[1].strip().split(' ')[0])

            # warming up
            if repeat == 0:
                continue

            if test not in RESULTS[item].keys():
                RESULTS[item][test] = []
            RESULTS[item][test].append(testres)
            print '    |--> '+test + ' --> '+str(testres)

print '----------------'
print 'Final results:'
print '----------------'
for item in RESULTS:
    print item
    for test in RESULTS[item]:
        print '  |--> '+test+' - '+str(sum(RESULTS[item][test])/len(RESULTS[item][test]))
print '----------------'
