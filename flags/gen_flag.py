#!/usr/bin/python

import sys

if __name__ == '__main__':
    if len(sys.argv) != 4:
        print './this flag-file weight-file new-flag-file'
        sys.exit(-1)

    fflag = open(sys.argv[1],'rU')
    fweight = open(sys.argv[2],'rU')
    fou = open(sys.argv[3],'w')

    weights = fweight.readline().strip().split()
    fweight.close()

    for line in fflag:
        if line.find('--features') != -1:
            head_str,feat_str = line.strip().split('=')
            feats = [x.strip().split(':')[0] for x in feat_str.strip().split(',')]
            assert len(feats) == len(weights)
            items = zip(feats, weights)
            print >>fou, '%s=%s' %( head_str, \
                            ','.join(['%s:%s' %(x[0],x[1]) for x in items]) \
                                  )
        else:
            print >>fou, line.strip()

