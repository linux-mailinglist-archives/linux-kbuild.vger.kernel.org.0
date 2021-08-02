Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0F73DDF61
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 20:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhHBSj1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 14:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhHBSj1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 14:39:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E39C06175F
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 11:39:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i32-20020a25b2200000b02904ed415d9d84so19059343ybj.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WTdy23QqSO2DMUu2Ys+7R1vYJMU/74du8VLy/2Y4DPA=;
        b=vGeI3BYBkGKRi6LHTihmZGbPjuFbs0b9QT5/pySpO0cIAIaUYmd5rtlYB7T4o43Sk4
         cDi4l4mFb1gtH6ii4bX12t8K5wqQIUfT2M52ci3FV25/4kXPuTsYvkkQYQsTmU1vbahd
         LcsJqXOQycyQcdJrtUY/AaDnMMZfe72AYB/Z8djUZDn6drxtGFE1vi++B27uQ7IWCVDM
         5HUlJY7Rk4pXHmVaz2tDSBMfV/7T0QpavDpABpYq3UZ4Ejh3MyIpZneo55Trjf3XMxhm
         EvnkVjJFpp689uLowYjggVmKbcClMvTXsvrPDL0dyqh8g+kvnsXSvEYKgaC9Ov92yahe
         fM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WTdy23QqSO2DMUu2Ys+7R1vYJMU/74du8VLy/2Y4DPA=;
        b=CQjEy4nzeP+6DDZ87I4Rl4hFhrED9HLCkg662oLFEus7qOQYHKxZUvbXKaylioBQzP
         UjtjBg+5A0r6UtJUVvEJS8QO22oy899zhSXO/phKWoAPgUjbQ/SyuteYb9sjlJYyxk7a
         2Nn72k8Fk4Xw1ySleK+eBKrzGi3JqPU96KtlMzhe29tVmeGaWBTt4KzWkk2GYPEYp7YD
         3fmHpGdzhIg3W7XjC3O9+Br8p89uCcDxdj9xgNKA34tjeCFLUcKv1ZBBPStk2/LlfV5x
         zd80GtoaRtPmQk90K8JWosf7b37cLABAxR0vSIsLta1XIY+PuQc+qo2g8McNjSA0Cprn
         1/pQ==
X-Gm-Message-State: AOAM530OHtXq8yezhcWhdDwxiWsYNazfCVXh4K8pDEv0n1Y2MaK4EwWI
        b6aZjPi+Si7ozcniES9iCWFWa8PKkfja3dVTg1Y=
X-Google-Smtp-Source: ABdhPJxdctAO0E67NQtmSrPN7peVgzEK7d1WAOiYXjH1alhAAamkoXKrI8QF7jn7wwguFYL6QSB2xEXlmrT45L0zWJ4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:3db0:42c:8665:a4ae])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1209:: with SMTP id
 9mr23717204ybs.166.1627929556907; Mon, 02 Aug 2021 11:39:16 -0700 (PDT)
Date:   Mon,  2 Aug 2021 11:39:07 -0700
Message-Id: <20210802183910.1802120-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v6 0/3] infer --target from SRCARCH for CC=clang
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

Instead, let's infer --target from SRCARCH, and move some flag handling into a
new file included from the top level Makefile.

Changes v5 -> v6:
* Use indirection as per Linus.
* Change hexagon triple to use -musl rather than -gnu. glibc doesn't
  have support for hexagon, and hexagon-linux-musl is the triple we use
  in CI.
  https://github.com/ClangBuiltLinux/continuous-integration2/blob/d659897d1700894d67feb64fe28e298da399a287/generator.yml#L53
* Pick up Fangrui's RB.
* Reorder use of Env vars in documentation to use command line
  parameters instead, for consistency.

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

 Documentation/kbuild/llvm.rst | 19 ++++++++++++++++++-
 MAINTAINERS                   |  1 +
 Makefile                      | 15 +--------------
 scripts/Makefile.clang        | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 15 deletions(-)
 create mode 100644 scripts/Makefile.clang


base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
-- 
2.32.0.554.ge1b32706d8-goog

