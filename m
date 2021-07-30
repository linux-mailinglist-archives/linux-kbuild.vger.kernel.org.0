Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356D83DC094
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhG3V5U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhG3V5T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:57:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E72BC0613C1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:13 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id n192-20020a25dac90000b029054c59edf217so12020415ybf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OuQ5TmLpp058PbGqh8D13Jsu8FS4m2xyhutHftN2hx0=;
        b=YiYCv9hGm6Qdi2iSGPtKfAfUUNTpaVdgeclTsVwvikuOLPvv9GEIDfyumGrj+7Vo/6
         lRQdRZjvXHHwSUEcXV6QoT7qwgfOh25RRGXqKWOrLwhW8jtKNNcrsd9ymj7Hr6YpMEmZ
         oyBWvT2DAs/pjsj17ylFUS9e141LF6C/5BDRrUHkjyCS1BarRB86jsLzW9gDnkyeJXES
         nnA+yRsD9e2ieENz4w61xjvBQ/SVZlJsPy6TORaZ/OwQCE1yfe2Gq6yQaBD0QM8leFH0
         rdGCSbmyp1MDoe5l/9RPVaTtbnrWQQubcmrv9vRt90YSG4eyuDbp5gTazoCtCKM7vIdz
         DrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OuQ5TmLpp058PbGqh8D13Jsu8FS4m2xyhutHftN2hx0=;
        b=cDYPQHZIKRAL9JPKNgngeelwI7laD45hsoT2Lz4bQ8FKy7He1yD3N/3uGztsG0KnEb
         PEtoGnUzA9upu7Gebtb/8FDJEC9OXr6+TeKyxgPYufVRsa5bGlJv2pt0MTjvzwtkcItF
         aFNZREhwdd5ZgeVTCfOnCHP7E7vtF8s/ntzQoDoB2EAFBRRhadtev+dcEkQefD7L8PMG
         E9qRN8ER3iptiM6/L6uaSiHw2J+RUMdzZp2VlFPG7mEOpug4CqxtcawYKyciLqpboyKr
         i9BrDBcxccw0lkl13JtEMek2RHq4Vcq7tZa6vknBgvY4AsFeX6r0j9o01EZNjuzFh0Vs
         tnIA==
X-Gm-Message-State: AOAM533WDxQl38qo9r2SEjUuI0cGFZqfY0Zuz6W4PV7bC3cZmkEZmrPm
        15YRjGb9Kg6Dyyn9U/pcLUczn99wApHR5iYru4M=
X-Google-Smtp-Source: ABdhPJz+ssWMLL8qBVkJ8BK6giC5iUL2NzTfXDMUofWj6IfHNSqW9NWWnI/ea1sm47YgisqIAON5T/KXlf94W7RGdlg=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1ac2:: with SMTP id
 a185mr6286643yba.350.1627682232434; Fri, 30 Jul 2021 14:57:12 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:57:05 -0700
Message-Id: <20210730215708.276437-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 0/3] infer --target from SRCARCH for CC=clang
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We get constant feedback that the command line invocation of make is too
long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
target triple, or is an absolute path outside of $PATH, but it's mostly
redundant for a given ARCH.

Instead, let's infer it from SRCARCH, and move some flag handling into a
new file included from the top level Makefile.

Changes v4 -> v5:
* Include previously missing first patch!

Changes v3 -> v4:
* Remove the requirement that LLVM_IAS=1 be set, as per Masahiro.
* Remove the Documentation/ change from patch 2, as per Masahiro and
  Nathan.
* Add Documentation/ change as patch 3, from Masahiro.
* Reword commit message of patch 2, as per Nathan.
* Change patch 2 oneline to refer to --target and CC=clang (not
  CROSS_COMPILE).
* Carry Arnd's and Nathan's AB/RB/TB tags, confirmed ok on IRC+discord.

Changes v2 -> v3:
* Remove requirement that LLVM=1 be set. Instead, if building with just
  CC=clang LLVM_IAS=1 instead of LLVM=1 LLVM_IAS=1, you should use
  LD=ld.lld explicitly, or LD=aarch64-linux-gnu-ld. (As per Masahiro)
  Example:

  $ ARCH=arm64 make CC=clang LLVM_IAS=1 LD=ld.lld OBJCOPY=llvm-objcopy \
    STRIP=llvm-strip -j72 defconfig all

  (It's still preferable to use LLVM=1 IMO, but this is maximally
  flexible.)
* Change oneliner from LLVM=1 to CC=clang.
* Update Docs slightly.

Changes v1 -> v2:
* patch 1/2 untouched.
* Fix typos in commit message as per Geert and Masahiro.
* Use SRCARCH instead of ARCH, simplifying x86 handling, as per
  Masahiro. Add his sugguested by tag.
* change commit oneline from 'drop' to 'infer.'
* Add detail about explicit host --target and relationship of ARCH to
  SRCARCH, as per Masahiro.

Nick Desaulniers (3):
  Makefile: move initial clang flag handling into scripts/Makefile.clang
  Makefile: infer --target from ARCH for CC=clang
  Documentation/llvm: update CROSS_COMPILE inferencing

 Documentation/kbuild/llvm.rst | 17 +++++++++++++++
 MAINTAINERS                   |  1 +
 Makefile                      | 15 +------------
 scripts/Makefile.clang        | 40 +++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 14 deletions(-)
 create mode 100644 scripts/Makefile.clang


base-commit: 27932b6a2088eac7a5afa5471963b926cfbb4de7
-- 
2.32.0.554.ge1b32706d8-goog

