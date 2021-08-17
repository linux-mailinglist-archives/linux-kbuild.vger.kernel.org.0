Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009453EE0CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhHQAVu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbhHQAVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:21:50 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E0FC061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:17 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id m6-20020ac807c6000000b0029994381c5fso1360425qth.5
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GoAh6ziV2V4ZClkyAY1jCdUTNM+9oT0Sys3KyM6Hf6w=;
        b=EXTMmJssho+L26FeyM3b5kiuUC9j5/MhTf3SjCP+YW78ZfpNNZIHheGOZgeLfuLAPP
         XqIUHFdFQDt6RG4MK3r5HV/R/osq3Ps+wfnNm481qAB1G4Nwaf+GrE6KezdsMEKewYfA
         /LKq7vyqOu3JpvUT1ggmhlYAw3O46mq2heUzqn8yvCMxKrV9D6UFQiQmuc4zxyjRzFSY
         QoELTjbI82TpmGwwbFQKa/oLT5zRli+D0Z6i0miUwutt64EllkbTweEzLEkO0OcWJf3l
         bMYBo2ZuUbkm+/4W3JLDNFWkob9UWOIxUWVKbYpagiwYnccDGZ32ScxGdPjK4b+qBmGJ
         IQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GoAh6ziV2V4ZClkyAY1jCdUTNM+9oT0Sys3KyM6Hf6w=;
        b=NSNzBjyGUo9B79SNP65GRMINGE75JcyqC9xUyUxiCFPiG6mz0M3h65RAFnVIp5AuJ/
         sMX4NN6i8l7gV7R5i8xP2iYvN1p7U/9X6r0dd9DPGxhLPv/X4FOODLQzuSTnTvT/b7Ap
         qCLwtHl0ciH/10coVtqFEce71Ggxvoohz3asvTSjYFRnvqjdSR5g2r4NsYkluFBtRh65
         XnymYl2efTNUQFg3RFByiG1LwFDX/08pS/gnXqlqFLzFXo8RTyOALvLH/NRsGewDufQQ
         trWSTnLwgUWCHCy5PwXtPb8NDk6cF2LimAPuctwbpq4btgMUrKD5Am8ZFcfB0zxlo7Co
         XdCA==
X-Gm-Message-State: AOAM533sJh9sqtQuE8Flrjfn2xMJ1ADQ3R+orxZcfbhz8hFkn3V24jlO
        +SVa259pWDQuLsSSfc1eXu5BVvs2GSIkOPF2b8c=
X-Google-Smtp-Source: ABdhPJxebjMZZHVnSs4LBsse9u4Y2EeTSxRvxa7vqynqIB1hiacdigtKA+tlBz8uAH/fgizMZs8ndft8FX3MaZaBTeA=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:d65:: with SMTP id
 5mr595577qvs.11.1629159676946; Mon, 16 Aug 2021 17:21:16 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:02 -0700
Message-Id: <20210817002109.2736222-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 0/7] kbuild: remove cc-option-yn
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to remove cc-option-yn. Do so, and update the
docs.

Base is linux-next.

Nick Desaulniers (7):
  MIPS: replace cc-option-yn uses with cc-option
  s390: replace cc-option-yn uses with cc-option
  powerpc: replace cc-option-yn uses with cc-option
  arc: replace cc-option-yn uses with cc-option
  x86: remove cc-option-yn test for -mtune=
  Makefile: replace cc-option-yn uses with cc-option
  kbuild: remove cc-option-yn, update Docs

 Documentation/kbuild/makefiles.rst | 22 ++++++---------
 Makefile                           |  2 +-
 arch/arc/Makefile                  |  3 +-
 arch/mips/Makefile                 | 44 +++++++++++++++---------------
 arch/mips/sgi-ip22/Platform        |  4 +--
 arch/powerpc/Makefile              | 12 ++++----
 arch/powerpc/boot/Makefile         |  5 +---
 arch/s390/Makefile                 | 14 +++++-----
 arch/x86/Makefile_32.cpu           |  6 ----
 scripts/Makefile.compiler          |  5 ----
 10 files changed, 49 insertions(+), 68 deletions(-)

-- 
2.33.0.rc1.237.g0d66db33f3-goog

