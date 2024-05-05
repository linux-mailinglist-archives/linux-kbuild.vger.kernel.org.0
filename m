Return-Path: <linux-kbuild+bounces-1776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E93348BBFA9
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 10:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F09281E8E
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 08:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041DE63AE;
	Sun,  5 May 2024 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="ACxoLOHO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CAB65F
	for <linux-kbuild@vger.kernel.org>; Sun,  5 May 2024 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714896254; cv=none; b=u/UZanoJj8r3SJtESUviusHlW6Gm8nW16cGdDLqcMzf4bX3bm6PO27Luv+ultJOcvHJSQbImfuIoC8Z6QwOm74tBvuI77PrEeKXpfC60oCxcEH5OH1skbBOp4GGRT4aoJngvooQMc5JstRbtfNZXohuQGhTDbKSi0UcIcN0BA1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714896254; c=relaxed/simple;
	bh=jPpeliNLD3xfpbdvB61oUItob4pmHCdmDr2vaAlfDtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P3q/qkRytf1yuRV3qf5Jfnmj2CO6ghBDpf02GXx5FxneaiQGstrF5PM101mutMlPNANSj10UCAoY8DZiLME5ur78tN95on3aM8UQ9XSvSt2nKuWxGhQapOkQHP4QD79P4s7AdCYOeukSzT2v+xbcSbwvxznE2xbzCrnAEJCvd0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=ACxoLOHO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41ba1ba5592so6747465e9.1
        for <linux-kbuild@vger.kernel.org>; Sun, 05 May 2024 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714896249; x=1715501049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b95b/QlxWUuWxAnCRBIf40ujUjqNzj8rC10ackjOgcI=;
        b=ACxoLOHOK+1vOI4OFaTcUzykT7jDgg2oZKvu4lgWXZ14MCfsZ4IIsGn8nStjEQHggy
         swv1CfsBUgGuUZoG4a9xpCmh+nSH64bjbkPNlz383284C+D5eV3re3CNITrpndoAZif5
         xpV+pZsgg0CFa6Y2fS69QIwoqlWSHMODzroxA0pVuGwpjEZkqGAqYObep1tLxaE2lkyj
         KFpXncsrPyYGs7I0q/K0fPzCP3z0/zZCQ7PNG7o695upf8OLFHMEYIqtmu3NREqWuviU
         EXizX2JTfqmFdn4GxLXUTnA4Zdp53r/5qSXN8R2c/mnFBi5GDzbun6p7fg0e4CyjXmHU
         WPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714896249; x=1715501049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b95b/QlxWUuWxAnCRBIf40ujUjqNzj8rC10ackjOgcI=;
        b=SWJvBj3IWqh8KDGxnmojU8jAhk/Yd/I94ds9RvLWx45+M8J/z3Zla1jbxEi36GbXat
         LyyRD9Trzp7IP3EC5t6gEERYFqGyqqaAEfV6YiekKtG7gOxqwplvOFESYqPuQf5ZQb0I
         G2a6K2Sf3Z0GnAs9d6FA8hmZKvA+GALaUJ05dYMjTxc3bfCLF9rEkAkRB47/ShK3Td4N
         +hdY5K6X8lPxgVXszwq1+6ftLvvg3x6MsynfRSWvSGSKHBlQ5aKmT+0HIcZoH+9WV0lf
         6YfPCL/DSNDf1cBspUSwmkOY+2cSqi2i1c+Szd3LaDapCMVCISFOOCAoihIExaVOt8oK
         cHsg==
X-Forwarded-Encrypted: i=1; AJvYcCW99UGk6IvL5oHSNfdTi1rZlLdbWuTNG3vhVn7dprNkFBkMTIvQjLtDgBgcUfaJ3zw/tOYkio0bAiZp3IAHPdeNZwqy54Y5N1A13GCQ
X-Gm-Message-State: AOJu0YxAmmJy4Lt1hhwZf8MukE3t6wgTriPc+BQXn6EXjXkCZa5jNQ1X
	e+nFsxBiVwnFL0IcxJRgfy+tGSRlqD7AaNC/HuY+tLGPby5SIgHMQ5TL577QW3M=
X-Google-Smtp-Source: AGHT+IHt1D4gFk4D/XEDn7s+zC66BZ27KueGAYmrGBC5k+VaalpZvWi2dsxwD0ODrc2TNO+t/78GlA==
X-Received: by 2002:a05:600c:1386:b0:41b:13d5:7da9 with SMTP id u6-20020a05600c138600b0041b13d57da9mr6611972wmf.38.1714896248940;
        Sun, 05 May 2024 01:04:08 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id s3-20020adfe003000000b0034e8a10039esm4705295wrh.10.2024.05.05.01.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 01:04:08 -0700 (PDT)
From: yoann.congal@smile.fr
To: linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	x86@kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Borislav Petkov <bp@alien8.de>,
	Darren Hart <dvhart@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH RESEND v6 0/3] printk: CONFIG_BASE_SMALL fix for LOG_CPU_MAX_BUF_SHIFT and removal of CONFIG_BASE_FULL
Date: Sun,  5 May 2024 10:03:40 +0200
Message-Id: <20240505080343.1471198-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yoann Congal <yoann.congal@smile.fr>

This series focuses on CONFIG_BASE_SMALL.
The first patch fixes LOG_CPU_MAX_BUF_SHIFT when CONFIG_BASE_SMALL is
used.
The second patch globally changes the type of CONFIG_BASE_SMALL and
adapts usages.
The third patch removes the now redundant BASE_FULL, puts BASE_SMALL
in its place in the config menus and updates usages in defconfigs.

Thanks everyone for your reviews! :)

Patch history:
v5->v6:
* Gathered the "Reviewed-by" tags from v4 into the commit messages (no
  other change)

v5 series: https://lore.kernel.org/lkml/20240207171020.41036-1-yoann.congal@smile.fr/

v4->v5:
* Applied Petr Mladek's suggestion (Thanks!):
  * Added defconfig update to patch 3/3
* Applied Masahiro Yamada's comments (Thanks!):
  * Shorter form in patch 2/3
  * Dropped the redundant "default n" in patch 3/3

v4 series:
https://lore.kernel.org/all/20240206001333.1710070-1-yoann.congal@smile.fr/
* Patch v4 1/3: (unchanged in v5)
  * Reviewed-by: Petr Mladek <pmladek@suse.com>
  * Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
* Patch v4 2/3:
  * Reviewed-by: Petr Mladek <pmladek@suse.com>
  * Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  * Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

v3->v4: Applied Petr Mladek's suggestion (Thanks!):
* Keep BASE_SMALL instead of BASE_FULL
* A patch changing the type of BASE_SMALL was added.

v3 series was named "printk: CONFIG_BASE_SMALL fix for
LOG_CPU_MAX_BUF_SHIFT and removal"
https://lore.kernel.org/all/20240204232945.1576403-1-yoann.congal@smile.fr/
* Patch v3 1/2:
  * Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
  * Reviewed-by: John Ogness <john.ogness@linutronix.de>
  * Reviewed-by: Petr Mladek <pmladek@suse.com>
* Patch v3 2/2:
  * Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

v2 -> v3: Applied Luis Chamberlain's comments (Thanks!):
* Split the single commit in two : one functional fix, one global
  removal.

v2 patch was named "printk: Remove redundant CONFIG_BASE_SMALL"
https://lore.kernel.org/all/20240127220026.1722399-1-yoann.congal@smile.fr/
* Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
* Reviewed-by: John Ogness <john.ogness@linutronix.de>

v1 -> v2: Applied Masahiro Yamada's comments (Thanks!):
* Changed from "Change CONFIG_BASE_SMALL to type bool" to
  "Remove it and switch usage to !CONFIG_BASE_FULL"
* Fixed "Fixes:" tag and reference to the mailing list thread.
* Added a note about CONFIG_LOG_CPU_MAX_BUF_SHIFT changing.

v1 patch was named "treewide: Change CONFIG_BASE_SMALL to bool type"
https://lore.kernel.org/all/20240126163032.1613731-1-yoann.congal@smile.fr/

Yoann Congal (3):
  printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL is enabled
  printk: Change type of CONFIG_BASE_SMALL to bool
  printk: Remove redundant CONFIG_BASE_FULL

 arch/arm/configs/collie_defconfig                  |  2 +-
 arch/arm/configs/keystone_defconfig                |  2 +-
 arch/arm/configs/lpc18xx_defconfig                 |  2 +-
 arch/arm/configs/moxart_defconfig                  |  2 +-
 arch/arm/configs/mps2_defconfig                    |  2 +-
 arch/arm/configs/omap1_defconfig                   |  2 +-
 arch/arm/configs/stm32_defconfig                   |  2 +-
 arch/microblaze/configs/mmu_defconfig              |  2 +-
 arch/mips/configs/rs90_defconfig                   |  2 +-
 arch/powerpc/configs/adder875_defconfig            |  2 +-
 arch/powerpc/configs/ep88xc_defconfig              |  2 +-
 arch/powerpc/configs/mpc866_ads_defconfig          |  2 +-
 arch/powerpc/configs/mpc885_ads_defconfig          |  2 +-
 arch/powerpc/configs/tqm8xx_defconfig              |  2 +-
 arch/riscv/configs/nommu_k210_defconfig            |  2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |  2 +-
 arch/riscv/configs/nommu_virt_defconfig            |  2 +-
 arch/sh/configs/edosk7705_defconfig                |  2 +-
 arch/sh/configs/se7619_defconfig                   |  2 +-
 arch/sh/configs/se7712_defconfig                   |  2 +-
 arch/sh/configs/se7721_defconfig                   |  2 +-
 arch/sh/configs/shmin_defconfig                    |  2 +-
 arch/x86/include/asm/mpspec.h                      |  6 +++---
 drivers/tty/vt/vc_screen.c                         |  2 +-
 include/linux/threads.h                            |  4 ++--
 include/linux/udp.h                                |  2 +-
 include/linux/xarray.h                             |  2 +-
 init/Kconfig                                       | 14 ++++----------
 kernel/futex/core.c                                |  2 +-
 kernel/user.c                                      |  2 +-
 .../testing/selftests/wireguard/qemu/kernel.config |  1 -
 31 files changed, 36 insertions(+), 43 deletions(-)

-- 
2.39.2


