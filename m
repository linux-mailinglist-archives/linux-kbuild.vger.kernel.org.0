Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493CD1BA9BC
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 18:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgD0QE0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Apr 2020 12:04:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:28353 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0QE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 12:04:26 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 03RG3xdt003323;
        Tue, 28 Apr 2020 01:03:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 03RG3xdt003323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588003440;
        bh=0CGYHJmK2yWekUYDarQ9DAs2H4quvx8YrRVmZbO53dE=;
        h=From:To:Cc:Subject:Date:From;
        b=h5xEDWHIIthLPUPY3CsZEt6BQ22q4yX8peoXuywUE3CYWgG95kPb0BlCKlGV6JbGO
         mni4iff8tEOgykUuyc+KKYlU70QKCLDjT/xA9TE4AaNyQKwVL1Sv5Rqg2FCt3frQYQ
         iNPO77Y9A1AYynt2Tl0pbMKKnImwS/xODGisfmvtOtWhzglGzCxgSnrXgeanS2sfX1
         zsESMrtY17qbjEmovxZcNab3EZB9lY1eL3p5xEU2aN42gvhq1gwocpjueHX0V61Da2
         hM0alywvtBFaBYKOU0U//PbRFBrNrscmBZa/wswafH6qu2uaP3RUCgCTV+6OludNC1
         EzTFGXKEfBnzA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: warn if always, hostprogs-y, or hostprogs-m is used
Date:   Tue, 28 Apr 2020 01:03:57 +0900
Message-Id: <20200427160357.253085-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

always, hostprogs-y, and hostprogs-m are deprecated.

There is no user in upstream code, but I am keeping them for external
modules. I want to remove them entirely someday. Notify the deprecation
to downstream users.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd52a8c6428f..f869a4b2646c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,8 +4,14 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
+ifneq ($(always),)
+$(warning 'always' is deprecated. Please use 'always-y' instead)
 always-y   += $(always)
+endif
+ifneq ($(hostprogs-y)$(hostprogs-m),)
+$(warning 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead)
 hostprogs  += $(hostprogs-y) $(hostprogs-m)
+endif
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
-- 
2.25.1

