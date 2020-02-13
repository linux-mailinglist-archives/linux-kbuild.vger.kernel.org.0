Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7819B15BE61
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2020 13:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729532AbgBMMZX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Feb 2020 07:25:23 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:46825 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbgBMMZX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 07:25:23 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01DCOMZL025517;
        Thu, 13 Feb 2020 21:24:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01DCOMZL025517
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581596663;
        bh=rQmwN5cWJQbpc39YRPGbcHf4QKGfkTR21bK6Myswez8=;
        h=From:To:Cc:Subject:Date:From;
        b=HXJyoP3VfUiao9FilYZL3qHAzts0YcWEhCCsDPGxxwzSPQH98PDUWQO6i0fNiYrbd
         Z9Co1RiXOl+L/FCDZl/3h4SI2TjNtLR1ZfOMZs5eV6p1PAsOQXS6VjAAxGK+A2HrjR
         OrUtetibC6LyhIHylAhb9MAa8OAqU++C+5cN43jwNxigYj76gU0FHRLO3XMcndzqNq
         dw7b4D7m7FMxHdXoKYjy4Rav2jIrtjqizGUoSB8ZnUQHdhkW9+anG8hP1GDQKYH5es
         So972K1R8HDBwyW5iNdvsFr8Oz9EZlfeA/9JKjALTdqJ+xwaZr627LgehFrrTgXG8s
         Z+EY4LSWXSqBg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gcc-plugins: fix gcc-plugins directory path in documentation
Date:   Thu, 13 Feb 2020 21:24:10 +0900
Message-Id: <20200213122410.1605-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix typos "plgins" -> "plugins".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/reproducible-builds.rst | 2 +-
 scripts/gcc-plugins/Kconfig                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index 503393854e2e..3b25655e441b 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -101,7 +101,7 @@ Structure randomisation
 
 If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
 pre-generate the random seed in
-``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
+``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
 is used in rebuilds.
 
 Debug info conflicts
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index e3569543bdac..7b63c819610c 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
 	  source tree isn't cleaned after kernel installation).
 
 	  The seed used for compilation is located at
-	  scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
+	  scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
 	  a make clean to allow for external modules to be compiled with
 	  the existing seed and will be removed by a make mrproper or
 	  make distclean.
-- 
2.17.1

