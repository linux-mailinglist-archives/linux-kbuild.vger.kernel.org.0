Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC27318522
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 07:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBKGPk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 01:15:40 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:17872 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBKGPj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 01:15:39 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11B6EG4R023930;
        Thu, 11 Feb 2021 15:14:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11B6EG4R023930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613024057;
        bh=jGTzkZH/trtyFuuFzWsVpFh/JBCkhkOXTqBjHWcukIs=;
        h=From:To:Cc:Subject:Date:From;
        b=g8fj8Z7Qz9Se1kaKjDKpSlER2ahG5fnR9g7ixWnsvQ0MThrah5h/jWwqn4DkIrl+e
         5OBI4RRDGBgiFT5FsbT0rehP09MsSXjLWBvFPd9Wjfz6Cs2JHzfx5WMeDrc+3xqfYm
         jWFKP6E1wJfdr35Yc6l/JJzAbowThaqo7LiJ3FL1t6aiU0g/uZpHY4wuLnIsZZZfCB
         o/TdZYZGaP4jjOV1gH08+WRzn8ozGoIu5KIFKHe5U9h7WB0xug/ZeOUIZogI0GzjEV
         +9tGz8sXrGJGZ0+wOyUxdXR4nREnJCLwZ+TJMVuJfENTEQj5t3fBWbp7O1pVqDpDt2
         9MvXcqfW7h8yw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64
Date:   Thu, 11 Feb 2021 15:14:16 +0900
Message-Id: <20210211061416.3747231-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Stephen Rothwell reported a build error on ppc64 when
CONFIG_TRIM_UNUSED_KSYMS is enabled.

Jessica Yu pointed out the cause of the error with the reference to the
ppc64 elf ABI:
  "Symbol names with a dot (.) prefix are reserved for holding entry
   point addresses. The value of a symbol named ".FN", if it exists,
   is the entry point of the function "FN".

As it turned out, CONFIG_TRIM_UNUSED_KSYMS has never worked for ppc64,
which has been unnoticed until recently because this option depends on
!UNUSED_SYMBOLS hence is disabled by all{mod,yes}config. (Then, it was
uncovered by another patch removing UNUSED_SYMBOLS.)

Removing the dot prefix in scripts/gen_autoksyms.sh fixes the issue.
Please note it must be done before 'sort -u', because modules have
both ._mcount and _mcount undefined when CONFIG_FUNCTION_TRACER=y.

Link: https://lore.kernel.org/lkml/20210209210843.3af66662@canb.auug.org.au/
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/gen_autoksyms.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 16c0b2ddaa4c..d54dfba15bf2 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -43,6 +43,9 @@ EOT
 sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
+# Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
+# point addresses.
+sed -e 's/^\.//' |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
 
-- 
2.27.0

