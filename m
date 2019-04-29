Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD757E580
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2019 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfD2Oy1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Apr 2019 10:54:27 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:22343 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728365AbfD2Oy0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 10:54:26 -0400
Received: from grover.flets-west.jp (softbank126125154137.bbtec.net [126.125.154.137]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x3TEs2DB010195;
        Mon, 29 Apr 2019 23:54:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x3TEs2DB010195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1556549643;
        bh=ZweuqeTPoljDbmkeKikxx4wqv2jN6rBHEqKiytbbuyo=;
        h=From:To:Cc:Subject:Date:From;
        b=l9rJ2fILRGWkiRdjPQqkQ+A3OyAOOJvSctLMA4lZvRP6HDVOMRzwk/BXQnR2xJgw3
         XSmAQN8R//scUoKeNA27TkvueVuNL8yNUJHGMEEHtosKb/ue4SUdNF407j2qAX82Q4
         Y+G9f2sLUukhrZYtHvQgRzkKhxls/pxcluF3n/yYuwSYfBfQPGsYviyIlg2tLP4ZJa
         /VlhXSbP/v0GoP590kBBJwRcejz9xySlk1EDfMIkQZLuMVdA/f/b2kZGyQge9olqWP
         /h33yMzqY7UxUeAVpDSWb1yoj4Ty+b19OcEZIKg5q38ueNTWceP26F3PmlbM20c1p0
         4EMCcKdZue8Ig==
X-Nifty-SrcIP: [126.125.154.137]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] dontdiff: update with Kconfig build artifacts
Date:   Mon, 29 Apr 2019 23:53:50 +0900
Message-Id: <1556549630-17605-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add generated *conf-cfg files.

Commit 694c49a7c01c ("kconfig: drop localization support") removed
"gconf.glade.h" and "kxgettext".

"kconfig" and "lxdialog" should not be excluded either.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/dontdiff | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index ef25a06..15c54da 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -127,7 +127,7 @@ flask.h
 fore200e_mkfirm
 fore200e_pca_fw.c*
 gconf
-gconf.glade.h
+gconf-cfg
 gen-devlist
 gen_crc32table
 gen_init_cpio
@@ -148,24 +148,22 @@ int32.c
 int4.c
 int8.c
 kallsyms
-kconfig
 keywords.c
 ksym.c*
 ksym.h*
-kxgettext
 *lex.c
 *lex.*.c
 linux
 logo_*.c
 logo_*_clut224.c
 logo_*_mono.c
-lxdialog
 mach-types
 mach-types.h
 machtypes.h
 map
 map_hugetlb
 mconf
+mconf-cfg
 miboot*
 mk_elfconfig
 mkboot
@@ -181,6 +179,7 @@ modules.builtin
 modules.order
 modversions.h*
 nconf
+nconf-cfg
 ncscope.*
 offset.h
 oui.c*
@@ -200,6 +199,7 @@ pnmtologo
 ppc_defs.h*
 pss_boot.h
 qconf
+qconf-cfg
 r100_reg_safe.h
 r200_reg_safe.h
 r300_reg_safe.h
-- 
2.7.4

