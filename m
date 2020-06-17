Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA33F1FC468
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2020 05:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgFQDDK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 23:03:10 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:29153 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFQDDJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 23:03:09 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 05H32LoZ025819;
        Wed, 17 Jun 2020 12:02:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 05H32LoZ025819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592362943;
        bh=yKXR0cT/+VFFEJJCIIRrJfsD75s0u6/WxSSRzJbVNo8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WKh9kho36Ns2SluPZe5tStpRhrfuz/buZZkAaL/VHccZLC1xvI3oNLFNJIZRTaYjl
         usEpZsEVV964pZb78zlQ+flLoVNGMotkVtJbvqP0y+/7Fm5C8gp+z7cje1PfB+Zs9O
         N+N3BhIPXZ4rn0H+3s47rinM9uGoblCUivKeqZFuzH0SO5w846Eug2Lkfc46V0HAHx
         VtT6J8fNEE5EvP0sav7PvKkDRDACMB/n4RjNBc+2ywCz+R9UzTtLff9ZF+b7l+EnC3
         mLJjkIhDc5PM29pzK0NkOtZ1MTt/cAALr3w0yL8u2pYNCrXivHNaBTmWlRV1J7xopi
         RwN0brUiyDDdQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over '---help---'"
Date:   Wed, 17 Jun 2020 12:02:20 +0900
Message-Id: <20200617030220.34733-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200617030220.34733-1-masahiroy@kernel.org>
References: <20200617030220.34733-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.

The conversion is done.

Cc: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkpatch.pl | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..1351e052eb99 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3042,11 +3042,7 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
-					if ($lines[$ln - 1] =~ "---help---") {
-						WARN("CONFIG_DESCRIPTION",
-						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
-					}
+				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:---)?help(?:---)?$/) {
 					$length = -1;
 				}
 
-- 
2.25.1

