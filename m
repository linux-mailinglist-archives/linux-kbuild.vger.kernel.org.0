Return-Path: <linux-kbuild+bounces-1109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BF86F745
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Mar 2024 22:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E97280D8F
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Mar 2024 21:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A58B7B3E7;
	Sun,  3 Mar 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="ZiQSv6Xl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787E07A732
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Mar 2024 21:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709502441; cv=none; b=gFtH74XU0oXbyhoYUAUqq8jNrxiPaDmbwmPbYNYA7Gg8HhgDIrAhWPLwmOBFGj1ZZ/xOqGJE98XH0Omz/JaPsLblfZESCTiewtIkOxZZuWy0WK1wf+9jqKQdgwlCV0JcK/2XXPPj68+NBRChmKVHW3I4su4r/f4C7M3x6hoVmDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709502441; c=relaxed/simple;
	bh=qLHHve/IJsVJlqgF6Jk70C+/XLkpF6P4w2riD0m3DKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a6Pwh1Kzty/q7/CMUgbmljA5cyXpllZ6BMoQRz1w5D0CE7gu45O/N3AkEgL9gHJiQv9VYCcPf5vPZDAXkms3PeXr1DSPM5WfHgjQ0Vq82dDmYQGej6jwBx1p2uAmf4HcyQrIr7MtIx4dh5N0C3nbTOVSIT+RU1qLNkDdOynNtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=ZiQSv6Xl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33e2774bdc7so1526279f8f.0
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Mar 2024 13:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709502437; x=1710107237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FD+6MDmKRX3rBNbRNBvTaUK966jMpDDoNcEIpOuczko=;
        b=ZiQSv6XlP7hxl3FBe0G9CmETmipYotNTqP7KaqBE4jSO58YbdYz5dXUxZpdn4bPrV8
         rFuNbL4HaqiXdSshnv3SDJlKcJKeoVU3J4yEM+pclPiDj3atV2njbnXvTvIif4XnK6fO
         LYmmGy0cAjpCm0Ek1sRWtsWeVXyjDfz+skzlLcWB9W3uoGotAd4vbvLk43PblTbAi8dw
         LB2rgOGgrhLyMv6pg6sNGj6gBhyS2LVzhkBcrq6Xb6xvTe1Lff8xUCK5Ms9/jqBhIi98
         0TDC6uIJ1dmelQITP9XOrzsvvt2nIWCje5FDg74DtT8g/st9fX1qGvKS1wIdPDtxP3zn
         fPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709502437; x=1710107237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FD+6MDmKRX3rBNbRNBvTaUK966jMpDDoNcEIpOuczko=;
        b=dv3RRMqm/HHRWJC1hncs27CjZAUQM6+X97fn+NBL/ggPd6Klbg2XFhNluSry8PcY0u
         oppubiti0sxL5NiiQf0EF7onUI5HFz4zTV8ON4lSDt1C2l2K+50/GTFpTTlA/EtSE3D6
         Vr0fTdC8/6X1bgu9gfLpbVK9CNapLoGgfiQF31kj9HK3c+6b+hvgSOBMXu8l28wMgn/6
         jqVVWEDsk+v4JcRLajLlZR47/CliklVOPEW3PONNqckvAIZCZSebWg0YoaRKmwEuBrYl
         HAPbrSB+W6RqBv6ZIvRZicCQfakgxGSp/Vrm/tfqRVLe1lamIz8Lx2YyFAf1XAhDKtvZ
         /tMg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Q+qnZ4KOdfW0NBillRd4psH0hT09nhGSTJdZgbGopjpAZJn3j4vKNaTiDjNOHAg81JtzRQdELzOTrHX4CMajvWR5yfRNMVzhyQbf
X-Gm-Message-State: AOJu0YzVescn4wACb4ws8lq3DxXcOh5xw9Q3gHE07Bq8mLbJ7ZUjXwKK
	Fcff9PGct5jGCVrtVrYzcnJ9o6R+9NLHhpMLRkrvM9YD87J0cjJI+vA0ArT+BWM=
X-Google-Smtp-Source: AGHT+IGznqr/wt4dtduea4dIZTe9E+kioM4CSved/7ZHQdDUAuqkwksDJT4LqAvpVGrM69Yv7U63uA==
X-Received: by 2002:a05:6000:90d:b0:33d:4fca:b7dc with SMTP id cw13-20020a056000090d00b0033d4fcab7dcmr5288160wrb.62.1709502436851;
        Sun, 03 Mar 2024 13:47:16 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bu16-20020a056000079000b0033dc3f3d689sm10525236wrb.93.2024.03.03.13.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 13:47:16 -0800 (PST)
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
Subject: [PATCH v6 3/3] printk: Remove redundant CONFIG_BASE_FULL
Date: Sun,  3 Mar 2024 22:46:52 +0100
Message-Id: <20240303214652.727140-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240303214652.727140-1-yoann.congal@smile.fr>
References: <20240303214652.727140-1-yoann.congal@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_BASE_FULL is equivalent to !CONFIG_BASE_SMALL and is enabled by
default: CONFIG_BASE_SMALL is the special case to take care of.
So, remove CONFIG_BASE_FULL and move the config choice to
CONFIG_BASE_SMALL (which defaults to 'n')

For defconfigs explicitely disabling BASE_FULL, explicitely enable
BASE_SMALL.
For defconfigs explicitely enabling BASE_FULL, drop it as it is the
default.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 arch/arm/configs/collie_defconfig                    |  2 +-
 arch/arm/configs/keystone_defconfig                  |  2 +-
 arch/arm/configs/lpc18xx_defconfig                   |  2 +-
 arch/arm/configs/moxart_defconfig                    |  2 +-
 arch/arm/configs/mps2_defconfig                      |  2 +-
 arch/arm/configs/omap1_defconfig                     |  2 +-
 arch/arm/configs/stm32_defconfig                     |  2 +-
 arch/microblaze/configs/mmu_defconfig                |  2 +-
 arch/mips/configs/rs90_defconfig                     |  2 +-
 arch/powerpc/configs/adder875_defconfig              |  2 +-
 arch/powerpc/configs/ep88xc_defconfig                |  2 +-
 arch/powerpc/configs/mpc866_ads_defconfig            |  2 +-
 arch/powerpc/configs/mpc885_ads_defconfig            |  2 +-
 arch/powerpc/configs/tqm8xx_defconfig                |  2 +-
 arch/riscv/configs/nommu_k210_defconfig              |  2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig       |  2 +-
 arch/riscv/configs/nommu_virt_defconfig              |  2 +-
 arch/sh/configs/edosk7705_defconfig                  |  2 +-
 arch/sh/configs/se7619_defconfig                     |  2 +-
 arch/sh/configs/se7712_defconfig                     |  2 +-
 arch/sh/configs/se7721_defconfig                     |  2 +-
 arch/sh/configs/shmin_defconfig                      |  2 +-
 init/Kconfig                                         | 10 +++-------
 tools/testing/selftests/wireguard/qemu/kernel.config |  1 -
 24 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index 01b5a5a73f037..42cb1c8541188 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -3,7 +3,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_EPOLL is not set
 CONFIG_ARCH_MULTI_V4=y
 # CONFIG_ARCH_MULTI_V7 is not set
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 59c4835ffc977..c1291ca290b23 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -12,7 +12,7 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index d169da9b2824d..f55c231e08708 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -8,7 +8,7 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_LZ4 is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_UID16 is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/arm/configs/moxart_defconfig b/arch/arm/configs/moxart_defconfig
index 1d41e73f4903c..34d079e03b3c5 100644
--- a/arch/arm/configs/moxart_defconfig
+++ b/arch/arm/configs/moxart_defconfig
@@ -6,7 +6,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
 # CONFIG_EVENTFD is not set
diff --git a/arch/arm/configs/mps2_defconfig b/arch/arm/configs/mps2_defconfig
index 3ed73f184d839..e995e50537efd 100644
--- a/arch/arm/configs/mps2_defconfig
+++ b/arch/arm/configs/mps2_defconfig
@@ -5,7 +5,7 @@ CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 729ea8157e2a5..025b595dd8375 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -9,7 +9,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_SHMEM is not set
 # CONFIG_KALLSYMS is not set
 CONFIG_PROFILING=y
diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index b9fe3fbed5aec..3baec075d1efd 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -6,7 +6,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index 4da7bc4ac4a37..176314f3c9aac 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -4,7 +4,7 @@ CONFIG_AUDIT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_EXPERT=y
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
 CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 4b9e36d6400e0..a53dd66e9b864 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -9,7 +9,7 @@ CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 # CONFIG_SGETMASK_SYSCALL is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_TIMERFD is not set
 # CONFIG_AIO is not set
 # CONFIG_IO_URING is not set
diff --git a/arch/powerpc/configs/adder875_defconfig b/arch/powerpc/configs/adder875_defconfig
index 7f35d5bc12299..97f4d48517356 100644
--- a/arch/powerpc/configs/adder875_defconfig
+++ b/arch/powerpc/configs/adder875_defconfig
@@ -4,7 +4,7 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/ep88xc_defconfig b/arch/powerpc/configs/ep88xc_defconfig
index a98ef6a4abef6..50cc59eb36cf1 100644
--- a/arch/powerpc/configs/ep88xc_defconfig
+++ b/arch/powerpc/configs/ep88xc_defconfig
@@ -6,7 +6,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/mpc866_ads_defconfig b/arch/powerpc/configs/mpc866_ads_defconfig
index 5c56d36cdfc5c..6f449411abf7b 100644
--- a/arch/powerpc/configs/mpc866_ads_defconfig
+++ b/arch/powerpc/configs/mpc866_ads_defconfig
@@ -6,7 +6,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_BUG is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_EPOLL is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 56b876e418e91..77306be62e9ee 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -7,7 +7,7 @@ CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/powerpc/configs/tqm8xx_defconfig b/arch/powerpc/configs/tqm8xx_defconfig
index 083c2e57520a0..383c0966e92fd 100644
--- a/arch/powerpc/configs/tqm8xx_defconfig
+++ b/arch/powerpc/configs/tqm8xx_defconfig
@@ -6,7 +6,7 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_MODULES=y
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 146c46d0525b4..51ba0d1683383 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -11,7 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 95d8d1808f194..762aea9127ae4 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -3,7 +3,7 @@ CONFIG_LOG_BUF_SHIFT=13
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index b794e2f8144e6..ab6d618c1828f 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -10,7 +10,7 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
diff --git a/arch/sh/configs/edosk7705_defconfig b/arch/sh/configs/edosk7705_defconfig
index 9ee35269bee26..ab3bf72264df4 100644
--- a/arch/sh/configs/edosk7705_defconfig
+++ b/arch/sh/configs/edosk7705_defconfig
@@ -6,7 +6,7 @@
 # CONFIG_PRINTK is not set
 # CONFIG_BUG is not set
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
diff --git a/arch/sh/configs/se7619_defconfig b/arch/sh/configs/se7619_defconfig
index 14d0f5ead502f..4765966fec99c 100644
--- a/arch/sh/configs/se7619_defconfig
+++ b/arch/sh/configs/se7619_defconfig
@@ -4,7 +4,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/sh/configs/se7712_defconfig b/arch/sh/configs/se7712_defconfig
index dc854293da435..20f07aee5bde7 100644
--- a/arch/sh/configs/se7712_defconfig
+++ b/arch/sh/configs/se7712_defconfig
@@ -7,7 +7,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_BUG is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_SHMEM is not set
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/se7721_defconfig b/arch/sh/configs/se7721_defconfig
index c891945b8a900..00862d3c030d2 100644
--- a/arch/sh/configs/se7721_defconfig
+++ b/arch/sh/configs/se7721_defconfig
@@ -7,7 +7,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_BUG is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_SHMEM is not set
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/shmin_defconfig b/arch/sh/configs/shmin_defconfig
index e078b193a78a8..bfeb004f130ec 100644
--- a/arch/sh/configs/shmin_defconfig
+++ b/arch/sh/configs/shmin_defconfig
@@ -5,7 +5,7 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_HOTPLUG is not set
 # CONFIG_BUG is not set
 # CONFIG_ELF_CORE is not set
-# CONFIG_BASE_FULL is not set
+CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
diff --git a/init/Kconfig b/init/Kconfig
index 182f2671a49dd..2a8203628d212 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1590,11 +1590,10 @@ config PCSPKR_PLATFORM
 	  This option allows to disable the internal PC-Speaker
 	  support, saving some memory.
 
-config BASE_FULL
-	default y
-	bool "Enable full-sized data structures for core" if EXPERT
+config BASE_SMALL
+	bool "Enable smaller-sized data structures for core" if EXPERT
 	help
-	  Disabling this option reduces the size of miscellaneous core
+	  Enabling this option reduces the size of miscellaneous core
 	  kernel data structures. This saves memory on small machines,
 	  but may reduce performance.
 
@@ -1949,9 +1948,6 @@ config RT_MUTEXES
 	bool
 	default y if PREEMPT_RT
 
-config BASE_SMALL
-	def_bool !BASE_FULL
-
 config MODULE_SIG_FORMAT
 	def_bool n
 	select SYSTEM_DATA_VERIFICATION
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 507555714b1d8..f314d3789f175 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -41,7 +41,6 @@ CONFIG_KALLSYMS=y
 CONFIG_BUG=y
 CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
 CONFIG_JUMP_LABEL=y
-CONFIG_BASE_FULL=y
 CONFIG_FUTEX=y
 CONFIG_SHMEM=y
 CONFIG_SLUB=y
-- 
2.39.2


