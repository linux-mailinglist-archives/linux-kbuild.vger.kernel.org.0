Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE3B28BEBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 19:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403942AbgJLRIm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 13:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404074AbgJLRIg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 13:08:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0288BC0613D0;
        Mon, 12 Oct 2020 10:08:36 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id i2so14908892pgh.7;
        Mon, 12 Oct 2020 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88AU0+hOtEr3LX7JPS56bloXLsETwbX3NL4vxoI6fR8=;
        b=rcDnF/aVYnGq60l01oe+I4m8b+6mm+geAakhn1EmbfPG3tO+PnqIMKRAkDDajCwR3e
         cG5qp9c2h9k4OTqzgOre1VV6E25lvBzAo0oxeOoPhzQNTh/oWbMBC7yI6EPvIOP7Meew
         HLguismldIxcQFfznP4q9jgc6kTKe4fPBcjZ+QfGhZn9UU+Q6mS1+nsfFnkwDf3pFwkD
         VG/DwclBl6RO+ByzK2sWxUU6eX4bvWXEmCZJYR5m1M6lH2JwOVXUbEk1mItLVdulfvrl
         do+Xg9hY9hakUbh5LnaUWIu6exS7sPwEVxGBMY9K+PI3vv2L/cFUGmR2IWi5tBE0L5uy
         korg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=88AU0+hOtEr3LX7JPS56bloXLsETwbX3NL4vxoI6fR8=;
        b=LbByKL9FTjb6Ss3yReH6Nor44125TtOSoWiUqcNPNX3darxpE+sGVFzFDsYSqUsFkv
         nUmkQJ5H+MT4JF0C5stVbrvQjiir/irqK7ZXHyV76UF97Ffv1q4bTTAdzZSTOjiXgk6C
         0krbfT8Akwa0QNMAF2jp7Qd2G2L3x4zaZFRSo8Nzl8rhJavMFd5gcNxbOsGqMCiNLg1n
         dVujPmbMy6gg+xce7DOn266tXUPRovNyEOs3adTfPXGPvRSg3FpOlI4bC4rIoIOUV9kj
         alLVbJtr30yj/qJoKaryDp0LqE/LTGa9eSNAdiFHkhibD032qkg+bHW+I1Woy86nI19c
         3ESw==
X-Gm-Message-State: AOAM530z2RQcwNT+ztbYh0dSxn2i3G3JBe13W2dUmAnQ4wb3+IP0hW0L
        F2Pee46LVm+K4Xw6SFL2Hqk=
X-Google-Smtp-Source: ABdhPJzaNfI7nE3EZ2Fy8n9RsMiFJqfM9rdxrVlioaPCS1JwLBL4PqWCM0MkelaVImbjaoIcH45ORQ==
X-Received: by 2002:a17:90b:4d0d:: with SMTP id mw13mr21103770pjb.192.1602522515412;
        Mon, 12 Oct 2020 10:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id x16sm20494337pff.14.2020.10.12.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 10:08:34 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 0/2] use interpreters to invoke scripts
Date:   Mon, 12 Oct 2020 22:36:29 +0530
Message-Id: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch series aims at removing the dependency on execute
bit of the scripts in the kbuild system.

If not working with fresh clone of linux-next, clean the srctree:
make distclean
make tools/clean

To test the dependency on execute bits, I tried building the
kernel after removing x-bits for all files in the repository.
Removing execute bits:
for i in $(find -executable -type f); do chmod -x $i; done

Any attempts to configure (or build) the kernel fail because of
'Permission denied' on scripts with the following error:
$ make allmodconfig
sh: ./scripts/gcc-version.sh: Permission denied
init/Kconfig:34: syntax error
init/Kconfig:33: invalid statement
init/Kconfig:34: invalid statement
sh: ./scripts/ld-version.sh: Permission denied
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
sh: ./scripts/clang-version.sh: Permission denied
init/Kconfig:49: syntax error
init/Kconfig:48: invalid statement
make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
make: *** [Makefile:606: allmodconfig] Error 2

Changes:
  - Adds specific interpreters (in Kconfig) to invoke
    scripts.

After this patch I could successfully do a kernel build
without any errors.

  - Again, adds specific interpreters to other parts of
    kbuild system.

I could successfully perform the following make targets after
applying the PATCH 2/2:
make headerdep
make kselftest-merge
make rpm-pkg
make perf-tar-src-pkg
make ARCH=ia64 defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare

Following changes in PATCH 2/2 are not yet tested:
arch/arm64/kernel/vdso32/Makefile
arch/nds32/kernel/vdso/Makefile
scripts/Makefile.build

---
Changes in v2:

  - Changes suggested by Masahiro Yamada
    $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)


Ujjwal Kumar (2):
  kconfig: use interpreters to invoke scripts
  kbuild: use interpreters to invoke scripts

 Makefile                          |  4 ++--
 arch/arm64/kernel/vdso/Makefile   |  2 +-
 arch/arm64/kernel/vdso32/Makefile |  2 +-
 arch/ia64/Makefile                |  4 ++--
 arch/nds32/kernel/vdso/Makefile   |  2 +-
 init/Kconfig                      | 16 ++++++++--------
 scripts/Makefile.build            |  2 +-
 scripts/Makefile.package          |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)


base-commit: 2cab4ac556258c14f6ec8d2157654e95556bbb31
--
2.25.1

