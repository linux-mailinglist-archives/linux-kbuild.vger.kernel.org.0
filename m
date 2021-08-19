Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E263F0F03
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhHSACz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:02:55 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38683 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbhHSACz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:02:55 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17J01JAq002135;
        Thu, 19 Aug 2021 09:01:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17J01JAq002135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629331280;
        bh=dDA48cE2QbNp7aCgzfGh6ePv10lHArBqOHlfXE7pros=;
        h=From:To:Cc:Subject:Date:From;
        b=ZauWzjVBRhoLV61SwZfpXF/25uYTu4P5h1GfwgTQD1ft9NCJpLRsY4Hhrg/AMLSeC
         pan2wOmX/npxC3AB2yUkKquLoeWOgaOyRzqse2JO4ywnRnXLccHLSLQ35vmYvj6Qxh
         2IqCvuSjX1BtgBQTLS79Qqodx+hUvkrmk5U3QI+RcCyVXiUyzuZhTGyiUBaHxTejPx
         BdQGE2IqW0WeO088dUL1CqOH2rHyp3f92xVuC64J0B+EkTfvAkx+14CcuXWu56u/JJ
         k8nUIHzh4n+rX6aFFjVF2JJauVwBGIe2Cvy9VRp2s12skqFgYhSFPJXvkrU+Rnmjd9
         3DD5f/aT7fqIA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2] kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
Date:   Thu, 19 Aug 2021 09:01:14 +0900
Message-Id: <20210819000114.634042-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this:

  nm: arch/x86/entry/vdso/vdso32/note.o: no symbols

$NM (both GNU nm and llvm-nm) warns when no symbol is found in the
object. Suppress the stderr.

Fangrui Song mentioned binutils>=2.37 `nm -q` can be used to suppress
"no symbols" [1], and llvm-nm>=13.0.0 supports -q as well.

We cannot use it for now, but note it as a TODO.

[1]: https://sourceware.org/bugzilla/show_bug.cgi?id=27408

Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v2:
  - Add TODO
  - Fix 'stdout' to 'stderr' in the comment

 scripts/gen_ksymdeps.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
index 1324986e1362..725e8c9c1b53 100755
--- a/scripts/gen_ksymdeps.sh
+++ b/scripts/gen_ksymdeps.sh
@@ -4,7 +4,13 @@
 set -e
 
 # List of exported symbols
-ksyms=$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
+#
+# If the object has no symbol, $NM warns 'no symbols'.
+# Suppress the stderr.
+# TODO:
+#   Use -q instead of 2>/dev/null when we upgrade the minimum version of
+#   binutils to 2.37, llvm to 13.0.0.
+ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
 
 if [ -z "$ksyms" ]; then
 	exit 0
-- 
2.30.2

