Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48180130EBC
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 09:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgAFIgz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 03:36:55 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:62462 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFIgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 03:36:55 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0068ah5N023567;
        Mon, 6 Jan 2020 17:36:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0068ah5N023567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578299803;
        bh=63DWN+a4Yo9AmdvEMwN7wE/TiezfFvD6A8r16STUDlo=;
        h=From:To:Cc:Subject:Date:From;
        b=viSyq6hNHnf63oBSIkcLIe2NrRniEqlZv9hvaNgCc2EZI0WRP9lNWR1a/5LVyd/wp
         ruzaL4iMgwa+OTzFLJgJvx2auNy+GRiylRNnJsxb++d1+9NXjXWaGoP7JDYpLPnXsZ
         gH+gi1c+p0drSl2CKUjtXPV6jJNL30KbT1K/iBMheoKEKPDA628ILRQe9wuMhVHIYb
         VzAyvhytzKJW3rVTmzRVuRfJ8ySLmLs/O7jk5OzOgjDLqE9IpeYFcl2ZxFP1Hx56la
         V1l0RafYHEXLwQgYTJvrCH0XNyk1L6fC77uvY7+4kbS6k5fKGN/v3eXJ8MhIvtxLHB
         c4CICKpHfLAwA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove PYTHON2 variable
Date:   Mon,  6 Jan 2020 17:36:28 +0900
Message-Id: <20200106083628.29729-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Python 2 has retired. There is no user of this variable.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4f01de6cd43c..4a0796b05324 100644
--- a/Makefile
+++ b/Makefile
@@ -423,7 +423,6 @@ INSTALLKERNEL  := installkernel
 DEPMOD		= /sbin/depmod
 PERL		= perl
 PYTHON		= python
-PYTHON2		= python2
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
@@ -474,7 +473,7 @@ CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
-export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
+export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
-- 
2.17.1

