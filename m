Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4A91C3410
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 10:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgEDII3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 May 2020 04:08:29 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:25563 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgEDII3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 04:08:29 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 044888nB016007;
        Mon, 4 May 2020 17:08:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 044888nB016007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588579689;
        bh=nuJbw5G3DpGKfGFZVxs3XiBYPKyFjbnT1dAooHhstog=;
        h=From:To:Cc:Subject:Date:From;
        b=sR9fn7uf5igk2yoU3Vi86n3nGJIwNe6Bqi+x5vPFjc9ZBhC4QHuOiglu1TxY23gIT
         kBOEYOP827UZfZHFIy8TwxCsbWdeBbwin8DqhkYBGcCvMKNTcGD8o7n3FywrMLs+cO
         i5/84J3Tik+8QEICZkbzeXfgxd+kGAW+Ua8905PFnKm9Cmr17iL/C1V8na1p5cB81m
         AfbZp6zD23vI4/e2k5Heu9PpjUhABPeGVZZVV18ef1X+9zDXfe+oQ26JqRdHVU9xe3
         3zlHGopXpY4Eey69V4bF8XXqKLg536elrZzd4kRi69NDhRmZNabVG9Gy9ti12Ori2U
         mA/ZGU7DNJO9w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/2] kbuild: remove misleading stale FIXME comment
Date:   Mon,  4 May 2020 17:08:06 +0900
Message-Id: <20200504080807.126396-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This comment was added by commit ("kbuild: Restore build nr, improve
vmlinux link") [1].

It was talking about if_changed_rule at that time. Now, it is unclear
what to fix.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ea52ca1b3e3882b499cc6c043f384958b88b62ff
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9ff00bfe0575..ffd80afcd0bb 100644
--- a/Makefile
+++ b/Makefile
@@ -1827,9 +1827,6 @@ tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
 
-# FIXME Should go into a make.lib or something
-# ===========================================================================
-
 quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
       cmd_rmdirs = rm -rf $(rm-dirs)
 
-- 
2.25.1

