Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA233C1C04
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 01:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhGHX2L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 19:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhGHX2K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 19:28:10 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5801EC061574
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jul 2021 16:25:27 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s186-20020a252cc30000b029055bc7fcfebdso9025614ybs.12
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jul 2021 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3UNGNWby+JwNaCoHIhHyVIJsq6+YeBmss1XfIpN9rvI=;
        b=v+itpwtNHus5Oj2rA04Z5doOdxbPffIS8ptB8Gm3Mn26g63+uudriQZUlm3OYJ9Y2I
         Cbop6S5cp9y9ZS/5N7EUYC99i9fePSYTwoduL8za5UVsjnZpdDsWZDF2z9aW7s3gqU5i
         R9/oqkLOHtwtffByV7CZcnWZ5Y9WYlP5mY+psQO6QuzuWmqSvRZTtR8kEaT3co93qSpg
         GgdQd5lZy0eM8wxv79o+ENCeQ5KMMloPmXm8ywUYP0wcNNud6ChbB+p9JgwdREEKGS6Z
         4NGlJ8O3CkMT9dpd2KcyGRCW2peLe1/UhmJKbMKmCZhGu2OdhY7PJs/CIVEl1AXI6us6
         AVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3UNGNWby+JwNaCoHIhHyVIJsq6+YeBmss1XfIpN9rvI=;
        b=AweDxf0pzRn8gEyePYXynrfxNbi+5eCnfsN229BzXAlvofSyr16Uyn2SKWK18CGfBe
         +23ilu4WT6wFLabevaEkWmGCUIRBqzp1vyQmQT/YAW0nEmFapRSN8bp/klbeffH8UPKh
         9O8jWaSeFj9cVjeq3KCaWK/Tw4lLKFGiJwNmuwrZk9nMZ8ByCNiwzqahA5xNUtXzFWXg
         tn6x6QgkaPf1quKT2d7xLlFGkyHZTCwL/OkLAaL3X2nNCjqJAD9VYze409dAZr94f0ix
         S47TVb7HNlZyiETeYLCgFfXr+iTmrec0kRjX3HWEngNcSsRKEV++A0ehKa3PdwUWj+iH
         rc+g==
X-Gm-Message-State: AOAM532KIfllZ7w1E2fYEntrOVn1kNME5w1RcRw9JIfHEKv0Iyp2xJKA
        bz73VhGZeeFcLDWuok2hLeTq2IVaX/9RUXz0TOo=
X-Google-Smtp-Source: ABdhPJxoxbWITubhOzR1BOEqmjmDar82hmG56b6oTrMrXwpxuhuSrEsv3rZzg+qc9j8rRowBU4NsTRuQ8X9i9EHNigM=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9fd:98a9:be3a:391d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:81c5:: with SMTP id
 n5mr43225237ybm.323.1625786726476; Thu, 08 Jul 2021 16:25:26 -0700 (PDT)
Date:   Thu,  8 Jul 2021 16:25:20 -0700
Message-Id: <20210708232522.3118208-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v2 0/2] infer CROSS_COMPILE from SRCARCH for LLVM=1 LLVM_IAS=1
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

Changes v1 -> v2:
* patch 1/2 untouched.
* Fix typos in commit message as per Geert and Masahiro.
* Use SRCARCH instead of ARCH, simplifying x86 handling, as per
  Masahiro. Add his sugguested by tag.
* change commit oneline from 'drop' to 'infer.'
* Add detail about explicit host --target and relationship of ARCH to
  SRCARCH, as per Masahiro.

Nick Desaulniers (2):
  Makefile: move initial clang flag handling into scripts/Makefile.clang
  Makefile: infer CROSS_COMPILE from SRCARCH for LLVM=1 LLVM_IAS=1

 Documentation/kbuild/llvm.rst |  5 ++++
 MAINTAINERS                   |  1 +
 Makefile                      | 15 +-----------
 scripts/Makefile.clang        | 44 +++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 14 deletions(-)
 create mode 100644 scripts/Makefile.clang


base-commit: a0e781a2a35a8dd4e6a38571998d59c6b0e32cd8
-- 
2.32.0.93.g670b81a890-goog

