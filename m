Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A359719349
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 22:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfEIUTb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 16:19:31 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:55359 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfEIUTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 16:19:30 -0400
Received: by mail-pg1-f201.google.com with SMTP id a8so2351628pgq.22
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=9SJVZdHZDV7vMt7Q88/HKWL/kPExbd/JsbUOjuQz1C4=;
        b=J+ogomPB45YKyRjFLwwk5dz5jQbrbFwqH8ZsYquGZgo7y9Gh9cGSZa5peLq7SGYIoD
         UVa7cicag0uG4ZrjPBHYXgqmcOhuLK8mICQWDu5y+sOVvT1IUrZZAo69xt5VZXuI+fOz
         Ev0HPV6/QfGN5GmovTV136dC4bdCThh9RzPbzrWKbZUaYsL5tqAAbh+MW9Se3uGi5fkA
         d2WPDV8KotABIkIRHYEvN/PYtIPVtgwU5cVNtvAn/SqSYn2r0Uk0gjCZVgwZdG1KQsoL
         IOkYf2UlWkxfeOXsFqV0zW26sXCPhObUu7mbMqab23wYxEx/gdWA08yl+nba0lnsC/bD
         drGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=9SJVZdHZDV7vMt7Q88/HKWL/kPExbd/JsbUOjuQz1C4=;
        b=St8IHoYy1ex4kplHGWJ/+J17591Jt01w7gwKr9a1RzlngIpBD2EEZQkEmkcTI4bsTl
         A+sexYCW3d+f90F37HonV7grPkzbOPnV2LBFGIkPzfwlboiyX7ke817dUo3Q72zg7F2h
         jFx/4bsaAHSyyisN1smWHQldMpVb6CiOqHzA9K0RK3t/o2HgnOUybneSd93Br7bVf5+R
         yUxttylYHSzR/OxIUuFgPJweAwDvHSKqar0rSAtY7HpoGMufSXFVq7aRXKrv4tFmehnB
         VGkPKotx57XVKSWyKj92il+bv+b+RlgGWkMsUcNgjTxR+013jrETP+49FdhcOJPJn4J7
         pITQ==
X-Gm-Message-State: APjAAAWOXpfm2B+yT/Cc/ZDMo3Sp2uXaC64WVyGecgGw30ulWn2eNxq4
        HSBL9Gk5UWpbPVFYdBwVx/2C1p4VDi1rsKorcx4=
X-Google-Smtp-Source: APXvYqwNgTQqsYAQwXXENS1CQQw7MSN+Qd5+znnAg7E14rm4nbYN8MAHXcwcVTLcdGau3oywBZiwzmMBSKUQ2CQvlYY=
X-Received: by 2002:a63:8949:: with SMTP id v70mr8548978pgd.196.1557433169453;
 Thu, 09 May 2019 13:19:29 -0700 (PDT)
Date:   Thu,  9 May 2019 13:19:21 -0700
Message-Id: <20190509201925.189615-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH] kbuild: add script check for cross compilation utilities
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     yamada.masahiro@socionext.com
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When cross compiling via setting CROSS_COMPILE, if the prefixed tools
are not found, then the host utilities are often instead invoked, and
produce often difficult to understand errors.  This is most commonly the
case for developers new to cross compiling the kernel that have yet to
install the proper cross compilation toolchain. Rather than charge
headlong into a build that will fail obscurely, check that the tools
exist before starting to compile, and fail with a friendly error
message.

Before:
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
...
/usr/bin/as: unrecognized option '-EL'
clang: error: assembler command failed with exit code 1 (use -v to see
invocation)
make[2]: *** [../scripts/Makefile.build:279: scripts/mod/empty.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/linux/Makefile:1118:
prepare0] Error 2
make: *** [Makefile:179: sub-make] Error 2

After:
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
$CROSS_COMPILE set to arm-linux-gnueabihf-, but unable to find
arm-linux-gnueabihf-as.
Makefile:522: recipe for target 'outputmakefile' failed
make: *** [outputmakefile] Error 1

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Note: this is probably more generally useful, but after a few minutes
wrestling with Make errors related to "recipe commences before first
target" and "missing separator," I came to understand my hatred of GNU
Make. Open to sugguestions for where better to invoke this from the top
level Makefile.

 Makefile                      |  1 +
 scripts/check_crosscompile.sh | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100755 scripts/check_crosscompile.sh

diff --git a/Makefile b/Makefile
index a61a95b6b38f..774339674b59 100644
--- a/Makefile
+++ b/Makefile
@@ -519,6 +519,7 @@ endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/check_crosscompile.sh
 CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
diff --git a/scripts/check_crosscompile.sh b/scripts/check_crosscompile.sh
new file mode 100755
index 000000000000..f4586fbfee18
--- /dev/null
+++ b/scripts/check_crosscompile.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# (c) 2019, Nick Desaulniers <ndesaulniers@google.com>
+function check () {
+  # Remove trailing commands, for example arch/arm/Makefile may add `-EL`.
+  utility=$(echo ${1} | awk '{print $1;}')
+  command -v "${utility}" &> /dev/null
+  if [[ $? != 0 ]]; then
+    echo "\$CROSS_COMPILE set to ${CROSS_COMPILE}," \
+      "but unable to find ${utility}."
+    exit 1
+  fi
+}
+utilities=("${AS}" "${LD}" "${CC}" "${AR}" "${NM}" "${STRIP}" "${OBJCOPY}"
+  "${OBJDUMP}")
+for utility in "${utilities[@]}"; do
+  check "${utility}"
+done
-- 
2.21.0.1020.gf2820cf01a-goog

