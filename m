Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A874D1EE5C5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 15:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgFDNuk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 09:50:40 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43459 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNuk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:50:40 -0400
Received: by mail-lf1-f65.google.com with SMTP id c12so3631740lfc.10;
        Thu, 04 Jun 2020 06:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/mS/crSG/SbKgPicMind4lrkGlCDOUOSlUrNN+bfdo=;
        b=PSK1YejsJgXfe2XYxbsgFP7Ka63S0ZMXy2Xva+kS1Mrnsj1USFa3KHkX9+ICOMro9W
         TQxEzs5DpLM268+yoXKixRbPWzTLPLnQTRkGoErzwvXU8TzfV7jCzlPPJE3h232e/RwH
         xf9kgNBNzgISQ0IGRdxbu9cm9GBPPOwSPLLffyq638cB2IVuM80j2YQSDhffWbCTgWXT
         6JGj++0QYtaqHB2YY96uH3K5/wQre5RReORFx0ro4nfQ+QlwLbOPE640AiVtZ26+0nRL
         ylpgUQEfHHQuSGrJpwpZF20vjMgto6PA4KH6bX4I5yvnm7aaWqeuYfcrHR/Ol0tujZP+
         y2eA==
X-Gm-Message-State: AOAM530Koi5yJBKRa4RPTviDDu3OZtzToQ7eIiejWY18iUuEG2mktZJ4
        ahhBUguKNpDfqU57Kaluunk=
X-Google-Smtp-Source: ABdhPJwrdWT6y2CL2LWAPgdgslvxxxcX+HXve/twLqm1KvVhxEovjWNPGDhPf/+ZcjY/tapJBcnulg==
X-Received: by 2002:a05:6512:20d:: with SMTP id a13mr2649191lfo.36.1591278637579;
        Thu, 04 Jun 2020 06:50:37 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id u16sm1202140lji.58.2020.06.04.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:50:36 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>,
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
Subject: [PATCH 0/5] Improvements of the stackleak gcc plugin
Date:   Thu,  4 Jun 2020 16:49:52 +0300
Message-Id: <20200604134957.505389-1-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In this patch series I collected various improvements of the stackleak
gcc plugin.

The first patch excludes alloca() from the stackleak instrumentation logic
to make it simpler.

The second patch is the main improvement. It eliminates an unwanted
side-effect of kernel code instrumentation. This patch is a deep
reengineering of the idea described on grsecurity blog:
  https://grsecurity.net/resolving_an_unfortunate_stackleak_interaction

The third patch adds 'verbose' plugin parameter for printing additional
info about the kernel code instrumentation.

Two other patches disable unneeded stackleak instrumentation for some
files.

I would like to thank Alexander Monakov <amonakov@ispras.ru> for his
advisory on gcc internals.

This patch series was tested for gcc version 4.8, 5, 6, 7, 8, 9, and 10
on x86_64, i386 and arm64.
That was done using the project 'kernel-build-containers':
  https://github.com/a13xp0p0v/kernel-build-containers


Alexander Popov (5):
  gcc-plugins/stackleak: Exclude alloca() from the instrumentation logic
  gcc-plugins/stackleak: Use asm instrumentation to avoid useless
    register saving
  gcc-plugins/stackleak: Add 'verbose' plugin parameter
  gcc-plugins/stackleak: Don't instrument itself
  gcc-plugins/stackleak: Don't instrument vgettimeofday.c in arm64 VDSO

 arch/arm64/kernel/vdso/Makefile        |   3 +-
 include/linux/compiler_attributes.h    |  13 ++
 kernel/Makefile                        |   1 +
 kernel/stackleak.c                     |  16 +-
 scripts/Makefile.gcc-plugins           |   2 +
 scripts/gcc-plugins/stackleak_plugin.c | 260 ++++++++++++++++++++-----
 6 files changed, 232 insertions(+), 63 deletions(-)

-- 
2.25.2

