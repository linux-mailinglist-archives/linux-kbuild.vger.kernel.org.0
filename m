Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB2F281391
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Oct 2020 15:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387785AbgJBNBU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Oct 2020 09:01:20 -0400
Received: from mx2.veeam.com ([64.129.123.6]:53752 "EHLO mx2.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgJBNBU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Oct 2020 09:01:20 -0400
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Oct 2020 09:01:18 EDT
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.veeam.com (Postfix) with ESMTPS id BC6F641351;
        Fri,  2 Oct 2020 08:55:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx2;
        t=1601643318; bh=ZJ/ocNO5lMu2BA92+jTuM3MeJsRqnpIpfBb0bZxFk4A=;
        h=From:To:CC:Subject:Date:From;
        b=D7VABUE4/1RjMmBoxuBG6ijzMdir/dW/vivU7NpTM3xZPLN8L8xPTZHFPl5+YuV4c
         CUAXw10MiVJU5Yu1qlcn1Q8MnYQ/0ScbXw2a18fY0s7YreKTten/Mm073OyaNv37wT
         G7JrOtXYfwc4Hm3nnFEzUdL5qgWta5c1Zs+4OvGk=
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
 prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3;
 Fri, 2 Oct 2020 14:55:15 +0200
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     <axboe@kernel.dk>, <mchehab+huawei@kernel.org>,
        <davem@davemloft.net>, <robh@kernel.org>, <koct9i@gmail.com>,
        <damien.lemoal@wdc.com>, <jack@suse.cz>, <ming.lei@redhat.com>,
        <steve@sk2.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, <linux-block@vger.kernel.org>
CC:     Sergei Shtepa <sergei.shtepa@veeam.com>
Subject: [PATCH 0/1] Block snapshot module and block layer filter API
Date:   Fri, 2 Oct 2020 15:56:01 +0300
Message-ID: <1601643362-7370-1-git-send-email-sergei.shtepa@veeam.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26B6C7C67
X-Veeam-MMEX: True
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello everyone! Requesting for your comments and suggestions.

We propose a new kernel module - blk-snap.

This module implements snapshot and changed block tracking functionality.
It is intended to create backup copies of any block devices without usage
of device-mapper.
Snapshots are temporary and are destroyed after the backup process has
finished. Changed block tracking allows for incremental and differential
backup copies.

blk-snap uses block layer filter API.
Block layer filter API provides a callback to intercept bio-requests.
If a block device disappears for whatever reason, send a synchronous
request to remove the device from filtering.

Previously, we have already offered a patch with the implementation of the
block layer filter api (https://patchwork.kernel.org/patch/11741447/).
Link to that discussion:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2290127.html.
Now we also offer the in-tree module.

blk-snap kernel module is a product of a deep refactoring of the
out-of-tree kernel veeamsnap (https://github.com/veeam/veeamsnap/) module:
* all conditional compilation branches that served for the purpose of
compatibility with older kernels have been removed;
* linux kernel code style has been applied;
* blk-snap mostly takes advantage of the existing kernel code instead of
reinventing the wheel;
* all redundant code (such as persistent cbt and snapstore collector) has
been removed.

We would appreciate your feedback!

Several important things are still have to be done:
* refactoring the module interface for interaction with a user-space code,
it is already clear that the implementation of some calls can be improved;
* haven't yet tested the build on architectures other than x86_64;
* the user-space library is not ready yet and tool to control the module
is to be created;
* autotests need to be created;
* regression testing has been conducted in a cursory manner, so there is
a chance for mistakes.


Sergei Shtepa (1):
  blk-snap - Block snapshot module This module implements snapshot and
    changed block tracking functionality. It is intended to create
    backup copies of any block devices without usage of device-mapper.

 MAINTAINERS                                 |  14 +
 block/Kconfig                               |  11 +
 block/Makefile                              |   1 +
 block/blk-core.c                            |  11 +-
 block/blk-filter-internal.h                 |  34 +
 block/blk-filter.c                          | 288 ++++++
 block/genhd.c                               |  24 +
 drivers/block/Kconfig                       |   6 +-
 drivers/block/Makefile                      |   3 +-
 drivers/block/blk-snap/Kconfig              |  24 +
 drivers/block/blk-snap/Makefile             |  29 +
 drivers/block/blk-snap/big_buffer.c         | 193 ++++
 drivers/block/blk-snap/big_buffer.h         |  24 +
 drivers/block/blk-snap/blk-snap-ctl.h       | 190 ++++
 drivers/block/blk-snap/blk_deferred.c       | 566 +++++++++++
 drivers/block/blk-snap/blk_deferred.h       |  67 ++
 drivers/block/blk-snap/blk_descr_file.c     |  82 ++
 drivers/block/blk-snap/blk_descr_file.h     |  26 +
 drivers/block/blk-snap/blk_descr_mem.c      |  66 ++
 drivers/block/blk-snap/blk_descr_mem.h      |  14 +
 drivers/block/blk-snap/blk_descr_multidev.c |  86 ++
 drivers/block/blk-snap/blk_descr_multidev.h |  25 +
 drivers/block/blk-snap/blk_descr_pool.c     | 190 ++++
 drivers/block/blk-snap/blk_descr_pool.h     |  38 +
 drivers/block/blk-snap/blk_redirect.c       | 507 ++++++++++
 drivers/block/blk-snap/blk_redirect.h       |  73 ++
 drivers/block/blk-snap/blk_util.c           |  33 +
 drivers/block/blk-snap/blk_util.h           |  10 +
 drivers/block/blk-snap/cbt_map.c            | 210 +++++
 drivers/block/blk-snap/cbt_map.h            |  62 ++
 drivers/block/blk-snap/common.h             |  29 +
 drivers/block/blk-snap/ctrl_fops.c          | 693 ++++++++++++++
 drivers/block/blk-snap/ctrl_fops.h          |  19 +
 drivers/block/blk-snap/ctrl_pipe.c          | 562 +++++++++++
 drivers/block/blk-snap/ctrl_pipe.h          |  34 +
 drivers/block/blk-snap/ctrl_sysfs.c         |  73 ++
 drivers/block/blk-snap/ctrl_sysfs.h         |   5 +
 drivers/block/blk-snap/defer_io.c           | 393 ++++++++
 drivers/block/blk-snap/defer_io.h           |  39 +
 drivers/block/blk-snap/filter.c             |  72 ++
 drivers/block/blk-snap/filter.h             |   7 +
 drivers/block/blk-snap/main.c               |  83 ++
 drivers/block/blk-snap/params.c             |  57 ++
 drivers/block/blk-snap/params.h             |  29 +
 drivers/block/blk-snap/rangevector.c        |  85 ++
 drivers/block/blk-snap/rangevector.h        |  31 +
 drivers/block/blk-snap/snapimage.c          | 982 ++++++++++++++++++++
 drivers/block/blk-snap/snapimage.h          |  16 +
 drivers/block/blk-snap/snapshot.c           | 228 +++++
 drivers/block/blk-snap/snapshot.h           |  17 +
 drivers/block/blk-snap/snapstore.c          | 929 ++++++++++++++++++
 drivers/block/blk-snap/snapstore.h          |  68 ++
 drivers/block/blk-snap/snapstore_device.c   | 532 +++++++++++
 drivers/block/blk-snap/snapstore_device.h   |  63 ++
 drivers/block/blk-snap/snapstore_file.c     |  52 ++
 drivers/block/blk-snap/snapstore_file.h     |  15 +
 drivers/block/blk-snap/snapstore_mem.c      |  89 ++
 drivers/block/blk-snap/snapstore_mem.h      |  20 +
 drivers/block/blk-snap/snapstore_multidev.c | 118 +++
 drivers/block/blk-snap/snapstore_multidev.h |  22 +
 drivers/block/blk-snap/tracker.c            | 521 +++++++++++
 drivers/block/blk-snap/tracker.h            |  50 +
 drivers/block/blk-snap/tracking.c           | 260 ++++++
 drivers/block/blk-snap/tracking.h           |  12 +
 drivers/block/blk-snap/version.h            |   7 +
 include/linux/blk-filter.h                  |  41 +
 include/linux/genhd.h                       |   3 +-
 67 files changed, 9157 insertions(+), 6 deletions(-)
 create mode 100644 block/blk-filter-internal.h
 create mode 100644 block/blk-filter.c
 create mode 100644 drivers/block/blk-snap/Kconfig
 create mode 100644 drivers/block/blk-snap/Makefile
 create mode 100644 drivers/block/blk-snap/big_buffer.c
 create mode 100644 drivers/block/blk-snap/big_buffer.h
 create mode 100644 drivers/block/blk-snap/blk-snap-ctl.h
 create mode 100644 drivers/block/blk-snap/blk_deferred.c
 create mode 100644 drivers/block/blk-snap/blk_deferred.h
 create mode 100644 drivers/block/blk-snap/blk_descr_file.c
 create mode 100644 drivers/block/blk-snap/blk_descr_file.h
 create mode 100644 drivers/block/blk-snap/blk_descr_mem.c
 create mode 100644 drivers/block/blk-snap/blk_descr_mem.h
 create mode 100644 drivers/block/blk-snap/blk_descr_multidev.c
 create mode 100644 drivers/block/blk-snap/blk_descr_multidev.h
 create mode 100644 drivers/block/blk-snap/blk_descr_pool.c
 create mode 100644 drivers/block/blk-snap/blk_descr_pool.h
 create mode 100644 drivers/block/blk-snap/blk_redirect.c
 create mode 100644 drivers/block/blk-snap/blk_redirect.h
 create mode 100644 drivers/block/blk-snap/blk_util.c
 create mode 100644 drivers/block/blk-snap/blk_util.h
 create mode 100644 drivers/block/blk-snap/cbt_map.c
 create mode 100644 drivers/block/blk-snap/cbt_map.h
 create mode 100644 drivers/block/blk-snap/common.h
 create mode 100644 drivers/block/blk-snap/ctrl_fops.c
 create mode 100644 drivers/block/blk-snap/ctrl_fops.h
 create mode 100644 drivers/block/blk-snap/ctrl_pipe.c
 create mode 100644 drivers/block/blk-snap/ctrl_pipe.h
 create mode 100644 drivers/block/blk-snap/ctrl_sysfs.c
 create mode 100644 drivers/block/blk-snap/ctrl_sysfs.h
 create mode 100644 drivers/block/blk-snap/defer_io.c
 create mode 100644 drivers/block/blk-snap/defer_io.h
 create mode 100644 drivers/block/blk-snap/filter.c
 create mode 100644 drivers/block/blk-snap/filter.h
 create mode 100644 drivers/block/blk-snap/main.c
 create mode 100644 drivers/block/blk-snap/params.c
 create mode 100644 drivers/block/blk-snap/params.h
 create mode 100644 drivers/block/blk-snap/rangevector.c
 create mode 100644 drivers/block/blk-snap/rangevector.h
 create mode 100644 drivers/block/blk-snap/snapimage.c
 create mode 100644 drivers/block/blk-snap/snapimage.h
 create mode 100644 drivers/block/blk-snap/snapshot.c
 create mode 100644 drivers/block/blk-snap/snapshot.h
 create mode 100644 drivers/block/blk-snap/snapstore.c
 create mode 100644 drivers/block/blk-snap/snapstore.h
 create mode 100644 drivers/block/blk-snap/snapstore_device.c
 create mode 100644 drivers/block/blk-snap/snapstore_device.h
 create mode 100644 drivers/block/blk-snap/snapstore_file.c
 create mode 100644 drivers/block/blk-snap/snapstore_file.h
 create mode 100644 drivers/block/blk-snap/snapstore_mem.c
 create mode 100644 drivers/block/blk-snap/snapstore_mem.h
 create mode 100644 drivers/block/blk-snap/snapstore_multidev.c
 create mode 100644 drivers/block/blk-snap/snapstore_multidev.h
 create mode 100644 drivers/block/blk-snap/tracker.c
 create mode 100644 drivers/block/blk-snap/tracker.h
 create mode 100644 drivers/block/blk-snap/tracking.c
 create mode 100644 drivers/block/blk-snap/tracking.h
 create mode 100644 drivers/block/blk-snap/version.h
 create mode 100644 include/linux/blk-filter.h

--
2.28.0

