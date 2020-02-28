Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7918172D0B
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 01:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbgB1AWy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 19:22:54 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50414 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgB1AWx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 19:22:53 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so505977pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2020 16:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QU+opm495Ij9T86I2aM97FnNNq2iPpjTX5kDOiaxevw=;
        b=dsuY0K/AzEQlTogEax9u0QuYhGd3iInRtMRCCHVDUfZVPqfutcASj/542CvykAG/hK
         dGCQ5AEn7pxK7ZI5bQYg1c+3OfcZrdR7UpK04HH66toPaY9cHzA3j5QKSjYXvkovrCdC
         BIU+ETMsBjNTI3hxyTJ0cRGNCu0W3aNuB1aM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QU+opm495Ij9T86I2aM97FnNNq2iPpjTX5kDOiaxevw=;
        b=tqLX01XaMb7X77cn8r05FFauRGOIFUBgVWEKaC1HrSuO3qWtxfMMVOSL4oGA6ajTeW
         RZyMHEJ6aKdaJL9r2kH6Xcq+lQO04w8pZKmCCAZmjpu56kluNf5CaY6kFgj5o5KcgSYn
         gH9d541zxa2iTkswFCPuT8Qq9/vLUw7XOSmbKstRW+07tj5Afe3o314yN/55Gartm82A
         k/IzwHWMO62o2rV21QdL5dfPS+gOpGwyQvFPKWylw5MgIneM8i2zPDNnKsdsKTPcB09L
         y2gkU/sMdSiSkkRNIkxg2kiNIZnmFtK/HKykFOzFBhlI4Nbqz0Q/YK4tj+PKlk2Jnqo3
         T9lg==
X-Gm-Message-State: APjAAAVzR49aV4wC0iNHRmqI8iiXsL2Iyk7IskyYWyetN/F4FXIak+xe
        W+Ye1C1nol78PZXzZL4lXY+l2g==
X-Google-Smtp-Source: APXvYqyj2W9u+oIsMgMVrBNeFS6zK1XRVWpal/TY17WYNgn958upMgANb4T2Coh8RuwStB7amyzgBg==
X-Received: by 2002:a17:902:be11:: with SMTP id r17mr1434176pls.144.1582849371434;
        Thu, 27 Feb 2020 16:22:51 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c19sm9164401pfc.144.2020.02.27.16.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 16:22:48 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Kees Cook <keescook@chromium.org>, "H.J. Lu" <hjl.tools@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Enable orphan section warning
Date:   Thu, 27 Feb 2020 16:22:35 -0800
Message-Id: <20200228002244.15240-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

A recent bug was solved for builds linked with ld.lld, and tracking
it down took way longer than it needed to (a year). Ultimately, it
boiled down to differences between ld.bfd and ld.lld's handling of
orphan sections. Similarly, the recent FGKASLR series brough up orphan
section handling too[2]. In both cases, it would have been nice if the
linker was running with --orphan-handling=warn so that surprise sections
wouldn't silently get mapped into the kernel image at locations up to
the whim of the linker's orphan handling logic. Instead, all desired
sections should be explicitly identified in the linker script (to be
either kept or discarded) with any orphans throwing a warning. The
powerpc architecture actually already does this, so this series seeks
to extend this coverage to x86, arm64, and arm.

This series depends on tip/x86/boot (where recent .eh_frame fixes[3]
landed), and has a minor conflict[4] with the ARM tree (related to
the earlier mentioned bug). As it uses refactorings in the asm-generic
linker script, and makes changes to kbuild, I think the cleanest place
for this series to land would also be through -tip. Once again (like
my READ_IMPLIES_EXEC series), I'm looking to get maintainer Acks so
this can go all together with the least disruption. Splitting it up by
architecture seems needlessly difficult.

Thanks!

-Kees

[1] https://github.com/ClangBuiltLinux/linux/issues/282
[2] https://lore.kernel.org/lkml/202002242122.AA4D1B8@keescook/
[3] https://lore.kernel.org/lkml/158264960194.28353.10560165361470246192.tip-bot2@tip-bot2/
[4] https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8959/1

H.J. Lu (1):
  Add RUNTIME_DISCARD_EXIT to generic DISCARDS

Kees Cook (8):
  scripts/link-vmlinux.sh: Delay orphan handling warnings until final
    link
  vmlinux.lds.h: Add .gnu.version* to DISCARDS
  x86/build: Warn on orphan section placement
  x86/boot: Warn on orphan section placement
  arm64/build: Use common DISCARDS in linker script
  arm64/build: Warn on orphan section placement
  arm/build: Warn on orphan section placement
  arm/boot: Warn on orphan section placement

 arch/arm/Makefile                             |  4 ++++
 arch/arm/boot/compressed/Makefile             |  2 ++
 arch/arm/boot/compressed/vmlinux.lds.S        | 17 ++++++--------
 .../arm/{kernel => include/asm}/vmlinux.lds.h | 22 ++++++++++++++-----
 arch/arm/kernel/vmlinux-xip.lds.S             |  5 ++---
 arch/arm/kernel/vmlinux.lds.S                 |  5 ++---
 arch/arm64/Makefile                           |  4 ++++
 arch/arm64/kernel/vmlinux.lds.S               | 13 +++++------
 arch/x86/Makefile                             |  4 ++++
 arch/x86/boot/compressed/Makefile             |  3 ++-
 arch/x86/boot/compressed/vmlinux.lds.S        | 13 +++++++++++
 arch/x86/kernel/vmlinux.lds.S                 |  7 ++++++
 include/asm-generic/vmlinux.lds.h             | 11 ++++++++--
 scripts/link-vmlinux.sh                       |  6 +++++
 14 files changed, 85 insertions(+), 31 deletions(-)
 rename arch/arm/{kernel => include/asm}/vmlinux.lds.h (92%)

-- 
2.20.1

