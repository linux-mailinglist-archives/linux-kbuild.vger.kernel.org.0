Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048C220735F
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389554AbgFXMd6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:33:58 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43251 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388761AbgFXMdz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:33:55 -0400
Received: by mail-qt1-f196.google.com with SMTP id v19so1464870qtq.10;
        Wed, 24 Jun 2020 05:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8sHQzOYVDYH3ZNMAFgn6qFPgIIglqtoHHBWYdYcv8aA=;
        b=syuE55D0mXEdb/fxaAmKcNrq0ep91sscASWL5UeF055ScIwGCOWrHKh0oBZjhqqPgI
         WlSsuDqxkM5y9Z1Q9GXxD38eHuNDOGHncTvW+ZoEFXakXdM/j0/0LyvuXJoJHFk472cu
         iwmA6dJI9WChsd2TzgeQZKEAi+3rn4x4zNBFbSnZziFnoVvde/Vlgds60tFIKsS3/oUh
         H/H3lurQElJ0Qvtl5t/9LgM8XPD2e/AfcHR8KB3rOnd66GuyiyxsFjQTMv/7DQIEjilf
         jJy4hhDyqz6C82vqQa38ZeuwGFvK8/Lfnonmk50XMd1Zp0yebpbZAQf8qJ1PJZYCwQmU
         7aPw==
X-Gm-Message-State: AOAM531XMax1JvIBWITwoI+h5642Tvk1AIKqU/Jh6B33FYoKXITQChAd
        r74x4zZamnkg7xc1gSC7Cew=
X-Google-Smtp-Source: ABdhPJxblUCjOrDANsgZy0tfdbktunxAZXJLdRpPPWkvHCUo+/qzdIkUPYVzbM2mylESz5Zexu9MIA==
X-Received: by 2002:ac8:22e5:: with SMTP id g34mr27227271qta.227.1593002033880;
        Wed, 24 Jun 2020 05:33:53 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id x26sm3354512qtr.4.2020.06.24.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:33:53 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Alexander Popov <alex.popov@linux.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc:     notify@kernel.org
Subject: [PATCH v2 0/5] Improvements of the stackleak gcc plugin
Date:   Wed, 24 Jun 2020 15:33:25 +0300
Message-Id: <20200624123330.83226-1-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is the v2 of the patch series with various improvements of the
stackleak gcc plugin.

The first three patches disable unneeded gcc plugin instrumentation for
some files.

The fourth patch is the main improvement. It eliminates an unwanted
side-effect of kernel code instrumentation performed by stackleak gcc
plugin. This patch is a deep reengineering of the idea described on
grsecurity blog:
  https://grsecurity.net/resolving_an_unfortunate_stackleak_interaction

The final patch adds 'verbose' stackleak parameter for printing additional
info about the kernel code instrumentation during kernel building.

I would like to thank Alexander Monakov <amonakov@ispras.ru> for his
advisory on gcc internals.

This patch series was tested for gcc version 4.8, 5, 6, 7, 8, 9, and 10
on x86_64, i386 and arm64.
That was done using the project 'kernel-build-containers':
  https://github.com/a13xp0p0v/kernel-build-containers

Changes from v1:
 - rebase onto 5.8.0-rc2;
 - don't exclude alloca() from the instrumentation logic, because it
   will be used in kernel stack offset randomization;
 - reorder patches in the series;
 - don't use gcc plugins for building vgettimeofday.c in arm and
   arm64 vDSO;
 - follow alphabetic order in include/linux/compiler_attributes.h.

Link to v1:
 https://lore.kernel.org/lkml/20200604134957.505389-1-alex.popov@linux.com/


Alexander Popov (5):
  gcc-plugins/stackleak: Don't instrument itself
  ARM: vdso: Don't use gcc plugins for building vgettimeofday.c
  arm64: vdso: Don't use gcc plugins for building vgettimeofday.c
  gcc-plugins/stackleak: Use asm instrumentation to avoid useless
    register saving
  gcc-plugins/stackleak: Add 'verbose' plugin parameter

 arch/arm/vdso/Makefile                 |   2 +-
 arch/arm64/kernel/vdso/Makefile        |   2 +-
 include/linux/compiler_attributes.h    |  13 ++
 kernel/Makefile                        |   1 +
 kernel/stackleak.c                     |  16 +-
 scripts/Makefile.gcc-plugins           |   2 +
 scripts/gcc-plugins/stackleak_plugin.c | 248 +++++++++++++++++++++----
 7 files changed, 239 insertions(+), 45 deletions(-)

-- 
2.25.4

