Return-Path: <linux-kbuild+bounces-1106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D9B86F739
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Mar 2024 22:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40BC7B20A0C
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Mar 2024 21:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36A47A709;
	Sun,  3 Mar 2024 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="YyuwLqPh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62147A70C
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Mar 2024 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709502437; cv=none; b=sJGCndFI0LN3fSBUReafEMFrrrhshPuUEoxItP2Sjk9YExAiKShKTQJ7npJ3Hk2205fLoLSMRSO+uWKmuSOYA7/8cU/sUnRT/nysHYFS48c0z/s0qCstIS0tkrplG3t3d+yv/CUh0gaZwrtpBnJmwYh703p3sgSl0vxksJwzyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709502437; c=relaxed/simple;
	bh=nekaU3eK/FZpv457H42O1nGUVtXm36XIVuZI/e8+Ne0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N/c1he/TqlqLBCMPK+jhk4X37ogoALdw3rtUt1bTKl/OQo3S52sFg5mfyiOepRTctopRAyt3jq5kO8JrqYLnKfUH2ZovhdzEWQo4fogiKTEDB89ZdbWgAZ0zjilSYmMMOfoQkISb3eKQTf1edX19pOVBEBPvkYZKBnt171GI/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=YyuwLqPh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33d509ab80eso1601900f8f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Mar 2024 13:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709502433; x=1710107233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gR6sw1mBWnS5G/iUpQbH2lTvcz7UdL95uEPfEUB2jRE=;
        b=YyuwLqPh8dQ708njbZKqup3ms65NjBRR4baDfjPKCFPEuXqezB610T9buPP/8fNQrb
         6oVoWdslYGevQNuxilS9ES9rjFDLwNSzKbAvzxVUzkii5bGLRcZQxO/siNhZ0uVojmzb
         XkKWOuZZF7/WvGGREaBRz2ORMhUPY6XL3/ZWNHQJFivXUj/4Ir5WWVgN6p3momFAIepR
         etdEy+wzBwhkJHzuiDs8snXFtoADcuUrz9v3HfKiseMmDTD6TzMunXcGz28LuDlVj3ud
         hfrv9bUq3jfErd39uEfGeGs9ADXx5MX2dUGZJ75+a4GrjgjVTIq5UiwfGnzsknftAqXo
         Exgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709502433; x=1710107233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR6sw1mBWnS5G/iUpQbH2lTvcz7UdL95uEPfEUB2jRE=;
        b=l1rO1y5A5sWFx3TJsKYV1Zl52moP8yKR0+nDZS/ur/BsvVdeNMHpS+8SGvrIOL31g6
         kF2DitSLhXQ16UU/+NJcOnEB9EMY5jRqyaOpNtnb440CeqqgjO0z977+YTd81mkhJrGH
         6P6Y0svNjuF8FQF36orVDCtIG5kKrlH3EcZSVX8e04WQwr1dNqdDmRsipUAzSEct7T5j
         OGPeDrevWcWs3DMpb88pZfJIfuT+EACzwG6NVMoU8ZENaL7jlTWHtmQCtHlIYOjVFP2S
         qsxbKWhvz67GYzQPWgomjstYU8rvMKQBXe1fWEmAFcs6FAtUggl1A/cycyYDd8RHbCWS
         LlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIa3l3zHYNZH2JWdwysplKu5hG07oihbywBeCwG/DnKjnfWPwaBH172RVzNn9/hW73xjtpxGALZf2V0SC6KynxDPp7M6tNxash+nos
X-Gm-Message-State: AOJu0YxPmzgq1F8J7BozYuudIYQ2fans2sYpGwoKva7ppaDrL63Y2HDR
	iHeaqBDT1t/MwiQTtHSakgfoKAQEBOqaK8z8cEp5RsYxd67VSV4VZWYPg1zatLs=
X-Google-Smtp-Source: AGHT+IGUfHEARkx1ftc09/xO5JPo91HRKykclfyNNSFBQYi2XxPNL6RWCKBfHX/gbXeqv7rd+5WgMQ==
X-Received: by 2002:a05:6000:25a:b0:33d:3abb:6db4 with SMTP id m26-20020a056000025a00b0033d3abb6db4mr4467907wrz.69.1709502433222;
        Sun, 03 Mar 2024 13:47:13 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bu16-20020a056000079000b0033dc3f3d689sm10525236wrb.93.2024.03.03.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 13:47:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
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
Subject: [PATCH v6 0/3] printk: CONFIG_BASE_SMALL fix for LOG_CPU_MAX_BUF_SHIFT and removal of CONFIG_BASE_FULL
Date: Sun,  3 Mar 2024 22:46:49 +0100
Message-Id: <20240303214652.727140-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


