Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0F72A5B3E
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbgKDAxt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbgKDAxt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:53:49 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944EEC0401C1
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 16:53:47 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id a1so11596678qvj.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 16:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ozY6qdV80EEdEz3LDLEtJ+2VRilA83Eh+aRjlDLkLJ8=;
        b=bxOTw/FSCq2/D3ukSPSlo5pkso1+jVH15V1mEAsq4uXXJswR6edUcaUcRdCg93HJk7
         7R/I+QkbxRQDRS3SEx+zrKjEBTPZoTze9TQOsp7mnt3DSV4M6MHJ3NwG4E1Wazg6snMy
         KbO5ENidAogXlfQtZyZlCYSVO7VEn3HvX+avxPTOrkzJOtV/WNs3Z9KS1+lHde9zC1/6
         xmQ3sjbGOWToTSx9jl3qRz+y56192GC6d5AU+k4SpWyIy4pCNO6ya5HwjjyqdXg4/eeJ
         ZZBYCNv9eoOLwrE1IW18kZQmiSpI/0c2FRB/xIWTBy4krv+DPOayj9HJKvesj6xwmJIe
         QQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ozY6qdV80EEdEz3LDLEtJ+2VRilA83Eh+aRjlDLkLJ8=;
        b=anGeQl2ha72BfoVY5yPOZ6zBsENTmAFSoOwmgsCXc2wdnuUbE6fDQj7rfIaghujoKl
         Un8vDgSAzPgwhQOX05MMO/8HRKHu4NGK0rzK7d6sItQYh/iQRTOuWAt91sa62ELmloNa
         RQfbUqaowad13cacLnZm+HEKZg9Go20ldOo0r1YtV2qKA+HRmhPK+HVSiXMx7yRjj1uf
         ZbAuEs6V68Vp21psk0FHVhF75Ptr4KGbMkRPJii4zWQtgoe/5zI5IIINIrH6WBmITBKW
         ExtbvtMnKwjOyNdp494KTvqIWkPY56wTt0GsjEwHy52wcwFCV7/McqbFOXH2WZ7wkLzy
         BzXw==
X-Gm-Message-State: AOAM531ok1e7uASqQu9F/rwxBl1h4QgX+2pmUE0QxhErN+KbiwY7PAvS
        QeLPBq2Rx9Fr4KCfzggVBp0fWMedZDERKvYRkwE=
X-Google-Smtp-Source: ABdhPJzFeJPtArXndiS7fYN24JqXcFlvglHjq/P0AetsiQAVxPd1F4kWgNqWsByTQs0Jf2p1lt35T7HKyHCxHvm7lU0=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:192d:: with SMTP id
 es13mr28271108qvb.27.1604451226656; Tue, 03 Nov 2020 16:53:46 -0800 (PST)
Date:   Tue,  3 Nov 2020 16:53:39 -0800
In-Reply-To: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
Message-Id: <20201104005343.4192504-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2 0/4] Kbuild: DWARF v5 support
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DWARF v5 is the latest standard of the DWARF debug info format.

DWARF5 wins significantly in terms of size when mixed with compression
(CONFIG_DEBUG_INFO_COMPRESSED).

Link: http://www.dwarfstd.org/doc/DWARF5.pdf

Patch 1 is a fixup already sent, but necessary for trying to use
LLVM_IAS=1 with ToT LLVM.
https://lore.kernel.org/stable/20201103012358.168682-1-maskray@google.com/

Patches 2 and 3 are cleanups that lay the ground work and aren't DWARF
v5 specific. In particular, I would like to see Patch 2 sent to stable
so that Android and CrOS can move to LLVM_IAS=1 ASAP.

Patch 4 implements Kconfig and Kbuild support for DWARFv5.

Changes from the RFC:
* split patch in 3 patch series, include Fangrui's patch, too.
* prefer `DWARF vX` format, as per Fangrui.
* use spaces between assignment in Makefile as per Masahiro.
* simplify setting dwarf-version-y as per Masahiro.
* indent `prompt` in Kconfig change as per Masahiro.
* remove explicit default in Kconfig as per Masahiro.
* add comments to test_dwarf5_support.sh.
* change echo in test_dwarf5_support.sh as per Masahiro.
* remove -u from test_dwarf5_support.sh as per Masahiro.
* add a -gdwarf-5 cc-option check to Kconfig as per Jakub.

Fangrui Song (1):
  x86_64: Change .weak to SYM_FUNC_START_WEAK for arch/x86/lib/mem*_64.S

Nick Desaulniers (3):
  Kbuild: do not emit debug info for assembly with LLVM_IAS=1
  Kbuild: make DWARF version a choice
  Kbuild: implement support for DWARF v5

 Makefile                          | 13 +++++++++----
 arch/x86/lib/memcpy_64.S          |  4 +---
 arch/x86/lib/memmove_64.S         |  4 +---
 arch/x86/lib/memset_64.S          |  4 +---
 include/asm-generic/vmlinux.lds.h |  6 +++++-
 lib/Kconfig.debug                 | 27 +++++++++++++++++++++++----
 scripts/test_dwarf5_support.sh    |  9 +++++++++
 7 files changed, 49 insertions(+), 18 deletions(-)
 create mode 100755 scripts/test_dwarf5_support.sh

-- 
2.29.1.341.ge80a0c044ae-goog

