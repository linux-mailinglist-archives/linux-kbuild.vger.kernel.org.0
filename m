Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B363BF22A
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 00:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhGGWp4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 18:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhGGWp4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 18:45:56 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19279C06175F
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jul 2021 15:43:15 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id c17-20020a37e1110000b02903b3a029f1f2so515985qkm.12
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jul 2021 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7PF5MF/PppYWlL0Lvh8CWn/Qemla6arexCWKEtWK8TA=;
        b=XNtbehT3q4pZdHdPbbXBIh7v/SKLG3UApl2MCXXFmUxbkDXWvfRfsL08zW2gclLMco
         EP5J4SuUAUzM5RCCRNSAC4atbhgYRYwJxjA/Dscu2kTKkUsBQj0ZHnPEz4tVO8DcJIIf
         4RlKyZ/Z0DbS3npAs7N3k/5TJg4k2BSA+jFU53ZgtNsfz2c2KGBeY5qMPkZ6AFHczxIB
         VvrHGBIVsUjAjhqwh0b7DolzQ0bS21KocKS7EoruhgWER+mDzXZQU/K/j3SCIrqKBx0W
         +tVNfZ+vCLHpEZeZPYqpEaH00T4eaQ7W9eB314FbQnoXOkacb/5jjNJEO7C12NYOmnb3
         Robw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7PF5MF/PppYWlL0Lvh8CWn/Qemla6arexCWKEtWK8TA=;
        b=EooKi9LazZD7luQ3TTjYe6Jy4XZnz+Dk6J3sA9mIcIqvjQolaee7gy5HIyM27U/aoW
         KX8+u1RM+Uld6iUgleHVcwLHIUHyT1bgZdajZhdIu+rB6k4H+jXQakxmPot3BE3neP2f
         YA6baPqGZ0eTiwZ5iI81ehqQZa470qcVuyyNBxWx0me3awjQKE/OZgYGCnpOUSmUM6Rj
         smk8mxKaY4cEGvK4fAW21Rr1beRZ1l3sMhADyYL9BbW+gxp0PnSwxJ7suLRuYmUvlY6f
         csjl1zG3VI+dl91nTpqV3sb0+UJgOg6jr0nE1N4B9bcOEgXPJpP5hhPW5nnnVBZC08yf
         x69w==
X-Gm-Message-State: AOAM533WdoCzELHRHytRY1Fwvv3NDoMxnrKgwTKyeA7jV3mIS0pyXwsv
        KPTA12aYLiFuIvfQZi12JjlwQdhrDtprpxKlXJM=
X-Google-Smtp-Source: ABdhPJyR2IYCNrFl/gSLnix/vfqbJaGYtBN0xeQunRqSdq+ildius84+CDJN7M4tTBufaXF6FSk/VatJd2JaLksbiqA=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:d417:6e24:4a54:1792])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1d23:: with SMTP id
 f3mr26515764qvd.10.1625697793911; Wed, 07 Jul 2021 15:43:13 -0700 (PDT)
Date:   Wed,  7 Jul 2021 15:43:08 -0700
Message-Id: <20210707224310.1403944-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We get constant feedback that the command line invocation of make is too
long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
target triple, or is an absolute path outside of $PATH, but it's mostly
redundant for a given ARCH.

Instead, let's infer it from ARCH, and move some flag handling into a
new file included from the top level Makefile.

Nick Desaulniers (2):
  Makefile: move initial clang flag handling into scripts/Makefile.clang
  Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1

 Documentation/kbuild/llvm.rst |  5 ++++
 MAINTAINERS                   |  1 +
 Makefile                      | 15 +----------
 scripts/Makefile.clang        | 48 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 14 deletions(-)
 create mode 100644 scripts/Makefile.clang


base-commit: a0e781a2a35a8dd4e6a38571998d59c6b0e32cd8
-- 
2.32.0.93.g670b81a890-goog

