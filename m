Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB387CF93D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbfJHMGn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Oct 2019 08:06:43 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:28287 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730648AbfJHMGm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Oct 2019 08:06:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x98C6137021176;
        Tue, 8 Oct 2019 21:06:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x98C6137021176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570536365;
        bh=o08jjtAXayQQibqWZRK6KQghEgpMnJSKKT2mpiY9c0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2Uu9Qr+8AGGzvZd0q21inKfPqkb3+LMAVmxPBumQEdVjLZ3i/EXLi8qnf6VOzyIvr
         NcIteZbNS121zvZNqlfXSJNr/R1AireeQYJTDrJ3Lff3VhRZ2W3pm6+7sHX+nlr5Te
         8jcKIg8Rc83tFGhW4eJG5H5qPmyBeFwD24pVr7BZYVPJRIvBpfklJ7b613JD6iltzw
         JaPKxFdHBfjLL4tRVGOBWi7ZaOaCKewtd9sfxRUT0bbdl0RfJRA38ukFmFHqJTdNAa
         EVG8g0WUUGLfE2PKeGCsHOi7AtKte8oW8UH4aYzis7LsQ91o0N7YETeQ8TNGniFb5O
         Bj1/7DImlJvPg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] kheaders: explain why include/config/autoconf.h is excluded from md5sum
Date:   Tue,  8 Oct 2019 21:05:56 +0900
Message-Id: <20191008120556.4263-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008120556.4263-1-yamada.masahiro@socionext.com>
References: <20191008120556.4263-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This comment block explains why include/generated/compile.h is omitted,
but nothing about include/generated/autoconf.h, which might be more
difficult to understand. Add more comments.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/gen_kheaders.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 6c5f88f3ca2d..b229a84693e5 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -32,8 +32,15 @@ fi
 all_dirs="$all_dirs $dir_list"
 
 # include/generated/compile.h is ignored because it is touched even when none
-# of the source files changed. This causes pointless regeneration, so let us
-# ignore them for md5 calculation.
+# of the source files changed.
+#
+# When Kconfig regenerates include/generated/autoconf.h, its timestamp is
+# updated, but the contents might be still the same. When any CONFIG option is
+# changed, Kconfig touches the corresponding timestamp file include/config/*.h.
+# Hence, the md5sum detects the configuration change anyway. We do not need to
+# check include/generated/autoconf.h explicitly.
+#
+# Ignore them for md5 calculation to avoid pointless regeneration.
 headers_md5="$(find $all_dirs -name "*.h"			|
 		grep -v "include/generated/compile.h"	|
 		grep -v "include/generated/autoconf.h"	|
-- 
2.17.1

