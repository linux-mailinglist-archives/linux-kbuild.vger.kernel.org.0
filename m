Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161E32FD9B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 20:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387673AbhATTc5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 14:32:57 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:64958 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731887AbhATTcp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 14:32:45 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 10KJV48g021571;
        Thu, 21 Jan 2021 04:31:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 10KJV48g021571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611171065;
        bh=LJCzdVrVW5D2zatQGn8mmtfFeSB9AqP3eU45mYZEDCE=;
        h=From:To:Cc:Subject:Date:From;
        b=XstdTI6ZGB4Zg2us8fUt3PmFMd15KR4AbGRWQS/0rw33Qa1fv/BMfkkQKJ0YpubNO
         JzO7EEbf9edJJglES/XutkbDn8zZn0Uyom4HRV8HYRkiV99ruhSBHT5ERMD5rB1kF3
         X7/pjv4Zf9vuSNfJUsn8EDNkuYPJz+JOTs5WdNzrf/47rj1vJQAsenA/iikQSOnMoP
         Q9uuKv2n8BLSrai98qUlSe+krUcc7TykY6pzeQPJ4Ow1KcNzYuzluVz2E8L1d6QJcj
         41bgtLsUxqf/RC4ts3JIwtZ9NIInsKIHrto2rNis5ULC56qSHGDpJ60jmI5VeGBT9T
         wTMbBC53dn3gA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Will McVicker <willmcvicker@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: warn a relative path used for M= in out-of-tree builds
Date:   Thu, 21 Jan 2021 04:31:00 +0900
Message-Id: <20210120193100.3414664-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Surprising to me, Kbuild can handle a relative M= path while having
in-kernel objects in a separate directory. In this case, the M= option
actually defines:

 - the path to external module sources relative to $(srctree)
 - the path to external module objects relative to $(objtree)

For example,

  make O=foo/bar M=baz

... will find the source files in baz, and create objects in foo/bar/baz.

Currently, it works like that because of the presence of VPATH and
--include-dir=$(abs_srctree), but this behavior is subtle and cannot
be guaranteed in the future. I do not know if it was even officially
supported ever.

I do not recommend this usage.

Reported-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index b0e4767735dc..e42a27447eae 100644
--- a/Makefile
+++ b/Makefile
@@ -1699,6 +1699,13 @@ else # KBUILD_EXTMOD
 #                      Install the modules built in the module directory
 #                      Assumes install directory is already created
 
+ifdef building_out_of_srctree
+ifneq ($(filter-out /%, $(KBUILD_EXTMOD)),)
+$(warning The combination of out-of-tree build and relative M= path is not well supported.)
+$(warning Please do not complain about any trouble happening under this circumstance.)
+endif
+endif
+
 # We are always building only modules.
 KBUILD_BUILTIN :=
 KBUILD_MODULES := 1
-- 
2.27.0

