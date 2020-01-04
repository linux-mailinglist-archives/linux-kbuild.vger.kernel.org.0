Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC3EC1302DB
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgADPDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:54 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:54706 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgADPDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:54 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcR018492;
        Sun, 5 Jan 2020 00:02:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcR018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150164;
        bh=qWFTJfXrTovHSQ1K+HfIhyPmZ7ecH7FTNzu3/ME2O30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qHT3UFLvU99bgjiIN4P4TEQC0/qhTcOOXcIiMpG5Iiy8U5MuS63ZyRMzSMb6iPpPB
         vSMgnm6xUhDhFHUKHNCm31EbDnHboNBiCwl0bjNB3ZEx0Af1XJ7J41zUEGxMCMSNSM
         urw9LjpCO1WfvgfgAHv9L5b89wBpAI8Q3sR3FlJquf5+Te7nn/6p6TGA7Y8mIl4sRE
         1Av0I3aegowEzoHOb7TvFGqw/Nz93xvPzfGD/FoT6+b9adZuqwCEIWW++xDzsnaT3M
         xZl0JTxINqGjvusWU9WhozTHxELO7mwz+Yf8Rn3/4k/7CB6z10k8t8AnIytwXvldFH
         MMgilXnT6DJXA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
Date:   Sun,  5 Jan 2020 00:02:26 +0900
Message-Id: <20200104150238.19834-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild initramfs
if content of initramfs changes"). If this is just a matter of forcing
execution of the recipe line, we can replace it with FORCE.

I do not understand the purpose of

   $(deps_initramfs): klibcdirs

Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch (I forgot to submit this in v1 series)

 usr/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index e6f7cb2f81db..55c942da01cd 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -3,9 +3,6 @@
 # kbuild file for usr/ - including initramfs image
 #
 
-klibcdirs:;
-PHONY += klibcdirs
-
 suffix_y = $(subst $\",,$(CONFIG_INITRAMFS_COMPRESSION))
 datafile_y = initramfs_data.cpio$(suffix_y)
 datafile_d_y = .$(datafile_y).d
@@ -50,13 +47,12 @@ targets := $(datafile_y)
 # do not try to update files included in initramfs
 $(deps_initramfs): ;
 
-$(deps_initramfs): klibcdirs
 # We rebuild initramfs_data.cpio if:
 # 1) Any included file is newer than initramfs_data.cpio
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) klibcdirs
+$(obj)/$(datafile_y): $(obj)/gen_init_cpio $(deps_initramfs) FORCE
 	$(Q)$(initramfs) -l $(ramfs-input) > $(obj)/$(datafile_d_y)
 	$(call if_changed,initfs)
 
-- 
2.17.1

