Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88073402E78
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 20:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345981AbhIGSkK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 14:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345964AbhIGSkJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 14:40:09 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081A8C061757
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Sep 2021 11:39:02 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j9-20020a2581490000b02905897d81c63fso263449ybm.8
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Sep 2021 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=301LxysQcBJybm7Zr97WzyGah9Mc2jXduBLK47CHcWo=;
        b=RcR05aOOHxdnTig8jgiJJEPJhTOos2LGSimPmkVE/3L47H13fID1nKMh/mI2poArf4
         ro9K1CMQ9tBTrhMVg04sQqsAQXxHSokaBagbXWKwzc43mqPe1ObOnPQaBFrnm1zcm1WB
         jF0JT1E2Ev4t8GJ/4vO6CSGJZckEbrtG8YM2DvUZpicvuvNtTO6ZD15+RKwCxXI/iTXE
         sU5CznyUlSOjOydJu7yXa0dKPNzsVve6lEoRLpFgTAgm2jck/EZLtM1ZWEIa9nLJQJFG
         Uyxl/nDiQ9GXQBJXP24uwLxbfeHUuPRICLxic57w9JeBMhQVOnWq9DpBjlat3qxslGir
         6sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=301LxysQcBJybm7Zr97WzyGah9Mc2jXduBLK47CHcWo=;
        b=kc77/03KAVcMTBHQ2rS5ohPutYDWlqVuqbdlwQJ3toFvct3fSYitlplZT5MOHRl/5S
         aarM2hcVdpVm/CZ15vy13LjRIudsb5bRZVnS1ovzk1Ukg4nO5cawgqlp88yiUnp3XQtJ
         noQEW1K1P80pS/v1+5PeVI7G6n2cJVlsO41JNQWt1JpzybBRYHE21oHWRg1B/VyT4ptd
         hWPfb09JNpxKVqbEw74B39mtv6rLJU+4CrTBtK8fDKRjMRgr1Cr13O3W29gPN3NNIxyt
         JWg15k3CuBrXszuw3zog5xAPbJT7fPBNX52WISlQFbe/LyYmpG2U+oCnSSL997k7TILS
         ODSg==
X-Gm-Message-State: AOAM530tATmjlsZ2CMf7zukJvztQRM6ffElbhelXOurigZlzzBpqjNUf
        NVJabsaCAqWU0dBFGkcFN/zdCbDbTIBsHBQN9N4=
X-Google-Smtp-Source: ABdhPJwXjkFjB6p3Qvjmaa/s3cfB6ETEgjnRavOsqvYZQ5ZgIylPD3crx3iRKw/9e5GeQaXRYj6u6fuofhFKvg6y7gg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:329a:8c54:7706:34e2])
 (user=ndesaulniers job=sendgmr) by 2002:a25:b941:: with SMTP id
 s1mr24246390ybm.304.1631039941767; Tue, 07 Sep 2021 11:39:01 -0700 (PDT)
Date:   Tue,  7 Sep 2021 11:38:40 -0700
Message-Id: <20210907183843.33028-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     llvm@lists.linux.dev, linux-security-module@vger.kernel.org,
        linux-toolchains@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 3fe617ccafd6f5bb33c2391d6f4eeb41c1fd0151.

The above commit seems as though it was merged in response to
https://lore.kernel.org/linux-hardening/CAHk-=3Dwj4EG=3DkCOaqyPEq5VXa97kyUH=
sBpBn3DWwE91qcnDytOQ@mail.gmail.com/.

While I can appreciate the intent of enabling -Werror, I don't think it
is the right tool to address the root cause of developers not testing
certain toolchains or configurations, or taking existing reports they're
getting serious enough.

Having more appropriate CI or processes in place to prevent untested
patches from being merged into mainline may also be worth discussing.

I'd also like to see such a patch sent formally to the list for
discussion and have time to soak in next rather than be merged directly
into mainline without either.

-Werror is great for preventing new errors from creeping in when a
codebase is free of warnings for all configs and all targets and the
toolchain is never updated. Unfortunately, none of the above is the case
for the Linux kernel at this time.

The addition of new compiler diagnostic flags in the -W group to -Wall
make toolchain updates excessively more painful. This can lead to
commits that disable warnings rather than work towards addressing them.
Some diagnostics are useful but take incredible work or churn to
completely free a codebase from them.

Warning can be upgraded to errors with -Werror=3Dfoo or downgraded from
errors back to warnings via -Wno-error=3Dfoo. -Wno-error=3Dfoo is a double
edged sword; it doesn't help you spot the introduction of additional
instances of that warning easily.

This change has caused nearly all of our CI to go red, and requires us
to now disable CONFIG_WERROR until every last target and every last
config is addressed. Rather than require everyone to disable the above
config to keep builds going, perhaps certain CI systems should instead
set CFLAGS_KERNEL=3D-Werror.

Why don't we just fix every warning? We have been, for years, and we're
still not done yet. See our issue tracker below, contributors wanted.

With more time/active discussion, we can probably land something more
appropriate. It should involve the Kbuild maintainer and list.

For instance, I have questions around how should such a config interact
with randconfigs and allconfigs. This config also seems to duplicate the
existing CONFIG_PPC_DISABLE_WERROR without merging the two.

I do recognize the irony of someone who's spent a lot of time cleaning
up warnings to be advocating for disabling -Werror...it's not lost on
me. Our Pixel (n=C3=A9e Nexus) team has been effectively carrying an out of
tree patch enabling -Werror since before I ever contributed to the
kernel.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1449
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile     |  3 ---
 init/Kconfig | 14 --------------
 2 files changed, 17 deletions(-)

diff --git a/Makefile b/Makefile
index d45fc2edf186..6bc1c5b17a62 100644
--- a/Makefile
+++ b/Makefile
@@ -785,9 +785,6 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      :=3D =
-fstack-protector-strong
=20
 KBUILD_CFLAGS +=3D $(stackp-flags-y)
=20
-KBUILD_CFLAGS-$(CONFIG_WERROR) +=3D -Werror
-KBUILD_CFLAGS +=3D $(KBUILD_CFLAGS-y)
-
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS +=3D -Qunused-arguments
 # The kernel builds with '-std=3Dgnu89' so use of GNU extensions is accept=
able.
diff --git a/init/Kconfig b/init/Kconfig
index 8cb97f141b70..e708180e9a59 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -137,20 +137,6 @@ config COMPILE_TEST
 	  here. If you are a user/distributor, say N here to exclude useless
 	  drivers to be distributed.
=20
-config WERROR
-	bool "Compile the kernel with warnings as errors"
-	default y
-	help
-	  A kernel build should not cause any compiler warnings, and this
-	  enables the '-Werror' flag to enforce that rule by default.
-
-	  However, if you have a new (or very old) compiler with odd and
-	  unusual warnings, or you have some architecture with problems,
-	  you may need to disable this config option in order to
-	  successfully build the kernel.
-
-	  If in doubt, say Y.
-
 config UAPI_HEADER_TEST
 	bool "Compile test UAPI headers"
 	depends on HEADERS_INSTALL && CC_CAN_LINK

base-commit: 4b93c544e90e2b28326182d31ee008eb80e02074
--=20
2.33.0.153.gba50c8fa24-goog

