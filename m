Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1E8398B54
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhFBOEi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 10:04:38 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:59215 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhFBOEi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 10:04:38 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 152E2J67002048;
        Wed, 2 Jun 2021 23:02:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 152E2J67002048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622642540;
        bh=wtAw0U8c/H4UdFIA/GtkS9uCoI75g72nADEQDRoSUtA=;
        h=From:To:Cc:Subject:Date:From;
        b=ChCr9BjshSQtJtKCPucJStiI6FTJrM4F4Vp1RLtvBo/B8G3gpj/Z1d0PG/vTdHfFZ
         KG8FVb7dwqj0AiSTyhpzmIOuOzqpUCRBmBTdH7vrGvokjLPTNhQE5EUY9xx5J2j+T1
         YVcRiIM2cdWwUv4AFP7TZANJwk62WPalzquYuWZAsGFrl7iWlpHiewlhwVlGLxexwt
         G2OemBBzlbAe6v455ByA4nBwm5bah0M+kdlVjt84SCdteAI1Pv2qShhnld5i0iUx/U
         SJKe+CZmFjFKpo0QbG31RPSCnQgolfzQGEG0rS+HUGfg4jenUfb46pYmwuU9e9eDiN
         HosqZEo7IJ83Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: remove trailing slashes from $(KBUILD_EXTMOD)
Date:   Wed,  2 Jun 2021 23:02:13 +0900
Message-Id: <20210602140213.132936-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

M= (or KBUILD_EXTMOD) generally expects a directory path without any
trailing slashes, like M=a/b/c.

If you add a trailing slash, like M=a/b/c/, you will get ugly build
logs (two slashes in a series), but it still works fine as long as it
is consistent between 'make modules' and 'make modules_install'.

The following commands correctly build and install the modules.

  $ make M=a/b/c/ modules
  $ sudo make M=a/b/c/ modules_install

Since commit ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst"),
a problem happens if you add a trailing slash only for modules_install.

  $ make M=a/b/c modules
  $ sudo make M=a/b/c/ modules_install

No module is installed in this case, Johannes Berg reported. [1]

Trim any trailing slashes from $(KBUILD_EXTMOD).

I used the 'dirname' command to remove all the trailing slashes in
case someone adds more slashes like M=a/b/c/////. The Make's built-in
function, $(dir ...) cannot take care of such a case.

[1]: https://lore.kernel.org/lkml/10cc8522b27a051e6a9c3e158a4c4b6414fd04a0.camel@sipsolutions.net/

Fixes: ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst")
Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Use $(filter %/, ) so that the shell invocation is avoided
    if M= is already good.

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index b79e0e8acbe3..8018b8adbcaf 100644
--- a/Makefile
+++ b/Makefile
@@ -129,6 +129,11 @@ endif
 $(if $(word 2, $(KBUILD_EXTMOD)), \
 	$(error building multiple external modules is not supported))
 
+# Remove trailing slashes
+ifneq ($(filter %/, $(KBUILD_EXTMOD)),)
+KBUILD_EXTMOD := $(shell dirname $(KBUILD_EXTMOD).)
+endif
+
 export KBUILD_EXTMOD
 
 # Kbuild will save output files in the current working directory.
-- 
2.27.0

