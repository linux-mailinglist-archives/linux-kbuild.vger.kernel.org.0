Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBC13DBF7B
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 22:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhG3URL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 16:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhG3URL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 16:17:11 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14EC06175F
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 13:17:06 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id r1-20020a0569021541b029054df41d5cceso11711598ybu.18
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8AtCRYZlS4QAcv/oikz1vcPY2UcNkw1l4cMxrL2XXUs=;
        b=Xt4ghdxr6eTKUrRyzxYXaojhwSFQ7W/mNOY5xzvZOdguRvdnZPlc9JztK+oJrmpo01
         u5FgXq++fGEkr75EiujjyuAD9IlzLnoCrUzyKWJny08lygMXyrRCsjnwZlrfMbYTRDUx
         OF3qkUfpfGQVtrRbVyRdGrEfCbqIhbWMKRttku0FH2cXq2kjdGVbP+Dcq+Fiy9QX6L36
         XnWkHlFh0xc5ZVJlnbQEUABBL6i4Tuenl1sp3c5Wpa1hDIkgPFh5i5S8EfLyEC6Lw2kb
         ADWBm9nVwL7HO35r8Atq7+VH1qhGVGfsv3/GC5RIFtZUGunaU2ee5zLznBz636qPekkc
         wZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8AtCRYZlS4QAcv/oikz1vcPY2UcNkw1l4cMxrL2XXUs=;
        b=a2EN4CZAg8Je7E9oyffBOruAbt9Df1H0cx/k6qVLDt7NQFXJsPTZC3b0pRiyN24eK1
         RH8V1oJBHszchj+FXA52IyMJQVwqu0iN17EIv/zstkkc7JZuaFBXEW77IMn4I9Ay0IBc
         maeY7A+4L06mt++t/Lh/hNkhKYhKcgOhc0PWFlYZv4t6J24LDEOs/80AUbhvX5n7nz18
         frJ88CLHJ2nYF5sW2bXRTzu2dqd8pvpuWJhrWQS4e1zbWFqWKFIpyHknzgOtNce1uQtb
         05odHOXySUyILNR+QoXpctUTkCN+sUfp+c4grBexKL6IkIRt6TdC0lJMsswNnBTZ5ILN
         60zA==
X-Gm-Message-State: AOAM530pSFD12mii10CRttU9qCLl4EBx5/P5Wd//MXEMQPjm9LQon5SL
        ySaq+Of0GsFLle+0diykmN4LQDazKW7TvHtFC4c=
X-Google-Smtp-Source: ABdhPJwbn3Yz6zvVwbYDxHU2FejYVja/oVIqOYHTckrFhld53TQ6LmttsGWcDaorA8B2crL65f17e2u0DaFAagAkrIU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7bc2:: with SMTP id
 w185mr5271445ybc.3.1627676225211; Fri, 30 Jul 2021 13:17:05 -0700 (PDT)
Date:   Fri, 30 Jul 2021 13:16:59 -0700
Message-Id: <20210730201701.3146910-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v4 0/2] infer --target from SRCARCH for CC=clang
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

*** BLURB HERE ***

Nick Desaulniers (2):
  Makefile: infer --target from ARCH for CC=clang
  Documentation/llvm: update CROSS_COMPILE inferencing

 Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
 scripts/Makefile.clang        | 30 ++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)


base-commit: 27932b6a2088eac7a5afa5471963b926cfbb4de7
prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
-- 
2.32.0.554.ge1b32706d8-goog

