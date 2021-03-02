Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C290132B013
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhCCBad (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:30:33 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:49029 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377916AbhCBO15 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 09:27:57 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 122EQHl6026843;
        Tue, 2 Mar 2021 23:26:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 122EQHl6026843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614695178;
        bh=bLEqHI17Ar/SUMtdax+/xBfsUNtwhENj2/0NG79lDvo=;
        h=From:To:Cc:Subject:Date:From;
        b=oooBct/xk1fbRtlHVwyg+ErdW47YEUgDt0S+faQnyruGtnHNq67wKjrNwFbJs9vEj
         7y0TWRWFhZK8GTveTfr3WsTxxoZIfwuwQUudPn3Thn6Lg/B8TZEQUkRf+SKHDPBIVX
         iJlr+ip6aGhofo0ms8iFv2r96/AD+gW+SBeMCciZYepR/Iw4mz6qQGpHg3y2I05IZI
         lc5ZDspqZwKj9xj0DJH1+WQhRQf147O9HYKJ2Z7f4R4+AI3xjlAkBAsC8+U38xJBnh
         Q18uJjXcxovrqKSBUSXHi0Pl618k4IXmdAjL0aDphpVx6348NuXoprHQB9O4LBoBUh
         U4R1lPuWsTSSA==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: show warning for 'make headers_check'
Date:   Tue,  2 Mar 2021 23:26:14 +0900
Message-Id: <20210302142614.505888-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 7ecaf069da52 ("kbuild: move headers_check rule to
usr/include/Makefile"), the headers_check target is no-op.

This stub target is remaining here in case some scripts still invoke
'make headers_check'. In order to prompt people to remove stale code,
show a noisy warning message if used. The stub will be really removed
after the Linux 5.15 release.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f9b54da2fca0..a3336d9b4a22 100644
--- a/Makefile
+++ b/Makefile
@@ -1339,7 +1339,11 @@ headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 # Deprecated. It is no-op now.
 PHONY += headers_check
 headers_check:
-	@:
+	@echo >&2 "=================== WARNING ==================="
+	@echo >&2 "Since Linux 5.5, 'make headers_check' is no-op,"
+	@echo >&2 "and will be removed after Linux 5.15 release."
+	@echo >&2 "Please remove headers_check from your scripts."
+	@echo >&2 "==============================================="
 
 ifdef CONFIG_HEADERS_INSTALL
 prepare: headers
-- 
2.27.0

