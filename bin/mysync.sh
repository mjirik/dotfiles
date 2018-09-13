#! /bin/bash
#
# sync.sh
# Copyright (C) 2016 mjirik <mjirik@hp-mjirik>
#
# Distributed under terms of the MIT license.
#

rsync -O -ave ssh ~/projects/paper_graphics/ mjirik@147.228.240.61:/mnt/proNAS/korpusy/queetech/paper_graphics/
rsync -O -ave ssh mjirik@147.228.240.61:/mnt/proNAS/korpusy/queetech/paper_graphics/ ~/projects/paper_graphics/
# rsync -ave ssh --delete ~/projects/paper_graphics/ mjirik@147.228.240.61:/mnt/proNAS/public/queetech/paper_graphics/


