Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8319254E21
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Aug 2020 21:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgH0TW4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Aug 2020 15:22:56 -0400
Received: from mx2.veeam.com ([12.182.39.6]:47846 "EHLO mx2.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbgH0TWz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Aug 2020 15:22:55 -0400
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.veeam.com (Postfix) with ESMTPS id 2BB0B4124C;
        Thu, 27 Aug 2020 15:13:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx2;
        t=1598555635; bh=uuVVtNTXos6TrxWLD31pE4Nljl8CRMkhd1Fps+/HTCY=;
        h=From:To:CC:Subject:Date:From;
        b=WoqX3id4kRGUEErEeD5r1bIBreUPa4QMcUMGSkJPpFqaI2pbKJkA1X/djpPZ4fcF8
         8cSHgeQ2cn6MQAv+dieyCScDk8vdTyLh5Rz98qLWLZi4WcGt7otu/lQMm+3+Rf2qFe
         KphQBbXv/Z10ldsVluHkJoPwnRZBRmreWo/HDkGc=
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
 prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3;
 Thu, 27 Aug 2020 21:13:53 +0200
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <axboe@kernel.dk>, <koct9i@gmail.com>, <jack@suse.cz>,
        <damien.lemoal@wdc.com>, <ming.lei@redhat.com>, <steve@sk2.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-block@vger.kernel.org>
CC:     Sergei Shtepa <sergei.shtepa@veeam.com>
Subject: [PATCH 0/1] block io layer filters api
Date:   Thu, 27 Aug 2020 22:13:38 +0300
Message-ID: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26B607C6A
X-Veeam-MMEX: True
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx2.veeam.com [172.18.16.6]); Thu, 27 Aug 2020 15:13:55 -0400 (EDT)
X-Veeam-MailScanner-Information: Please contact email@veeam.com if you have any problems
X-Spam-Status: No
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello everyone! Requesting for your comments and suggestions.

We propose new kernel API that should be beneficial for out-of-tree
kernel modules of multiple backup vendors: block layer filter API.

Functionality:
* Provide callback to intercept bio requests, the main purpose is to
allow block level snapshots for the devices that do not support it,
for example, non-LVM block devices and implementation of changed block
tracking for faster incremental backups without system reconfiguration
or reboot, but there could be other use cases that we have not thought of.
* Allow multiple filters to work at the same time. The order in which the
request is intercepted is determined by their altitude.
* When new block devices appear, send a synchronous request to the
registered filter to add it for filtering.
* If a block device is permanently deleted or disappears, send a
synchronous request to remove the device from filtering.

Why dm-snap and dm-era is not the solution:
Device mapper must be set up in advance, usually backup vendors have very
little ability to change or convince users to modify the existing setup
at the time of software installation.
One of the most common setups is still a block device without LVM and
formatted with ext4.
Convincing users to redeploy or reconfigure machine, just to make block
level snapshots/backup software work, is a challenging task.

As of now, commit c62b37d96b6e removed make_request_fn from
struct request_queue and our out-of-tree module [1] can no longer
hook/replace it to intercept bio requests. And fops in struct gendisk
is declared as const and cannot be hooked as well.

We would appreciate your feedback!

[1] https://github.com/veeam/veeamsnap

Sergei Shtepa (1):
  block io layer filters api

 block/Kconfig               |  11 ++
 block/Makefile              |   1 +
 block/blk-core.c            |  11 +-
 block/blk-filter-internal.h |  34 +++++
 block/blk-filter.c          | 288 ++++++++++++++++++++++++++++++++++++
 block/genhd.c               |  24 +++
 include/linux/blk-filter.h  |  41 +++++
 include/linux/genhd.h       |   2 +
 8 files changed, 410 insertions(+), 2 deletions(-)
 create mode 100644 block/blk-filter-internal.h
 create mode 100644 block/blk-filter.c
 create mode 100644 include/linux/blk-filter.h

-- 
2.20.1

