Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42721302E2
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgADPEF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:04:05 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:54710 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgADPDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:54 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcQ018492;
        Sun, 5 Jan 2020 00:02:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcQ018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150163;
        bh=+Ym/FObftlApE4ehJPoyk8sOyxo8gIw2RqfNnfV/RE8=;
        h=From:To:Cc:Subject:Date:From;
        b=wMH38s3KOQQqZomKMm9xreZUT3T5uv077cd6fVWk6nxxMS8t1X8KpdjbV/MPapROV
         WuGHzLgrMDR3zU9UczvasLaEFmqH4XR34AHL0+qnz8b9hL2YqYr/qcwygDNUyk6Olq
         JXvI9ayW8h0XIoCs9FgXtVlOgcC7/L676JIUUuvpd+uGUYEhk0ZCdSqM0osNj0EVEL
         xr9WZ9wUi8VJVDw+08V4dm0tAC7spCUIZPnjzvhDi3jcXIkd1DQuyOFU5Zmcetwwjl
         gDUvs25OjjVRVgk7hgrJ5zul5DzN2sy12eqzOaLxq+r1WtWRNob4OruAysN8mqc3tC
         DWLXwW6V7UT0g==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] initramfs: a lot of cleanups
Date:   Sun,  5 Jan 2020 00:02:25 +0900
Message-Id: <20200104150238.19834-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Masahiro Yamada (13):
  initramfs: replace klibcdirs in Makefile with FORCE
  gen_initramfs_list.sh: remove unused variable 'default_list'
  gen_initramfs_list.sh: fix the tool name in the comment
  initramfs: rename gen_initramfs_list.sh to gen_initramfs.sh
  initramfs: remove redundant dependency on BLK_DEV_INITRD
  initramfs: make compression options not depend on INITRAMFS_SOURCE
  initramfs: make initramfs compression choice non-optional
  initramfs: specify $(src)/gen_initramfs.sh as a prerequisite in
    Makefile
  initramfs: generate dependency list and cpio at the same time
  initramfs: add default_cpio_list, and delete -d option support
  gen_initramfs.sh: always output cpio even without -o option
  initramfs: refactor the initramfs build rules
  gen_initramfs.sh: remove intermediate cpio_list on errors

 usr/.gitignore                                |   8 +-
 usr/Kconfig                                   |  26 ---
 usr/Makefile                                  |  97 ++++++----
 usr/default_cpio_list                         |   6 +
 ...gen_initramfs_list.sh => gen_initramfs.sh} | 167 +++++-------------
 usr/initramfs_data.S                          |   5 +-
 6 files changed, 112 insertions(+), 197 deletions(-)
 create mode 100644 usr/default_cpio_list
 rename usr/{gen_initramfs_list.sh => gen_initramfs.sh} (53%)

-- 
2.17.1

