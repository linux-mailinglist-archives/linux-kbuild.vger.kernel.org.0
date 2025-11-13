Return-Path: <linux-kbuild+bounces-9617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F01C5A755
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 00:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8A6E4F3612
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Nov 2025 23:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA72326D79;
	Thu, 13 Nov 2025 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seB0Y1qT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CF3326D76;
	Thu, 13 Nov 2025 23:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763074804; cv=none; b=P6IcVqd0VD2Ujpg86c6YOKmZx+JYAPKWNoluND1EGscwfQ5Elpw4l0hM1JgnpBTFAUEFwEmEcUJd7vZ4ZxWzkRsvn/ekr57pRAzIitiiqKiAXna0ApgJZyc/yFXr60qPTbKt6UjSXFxrFmWUHHcMnPZm0Ck4FSk710dVNH3N7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763074804; c=relaxed/simple;
	bh=vwc/0+YWdp+aaq0bFVlBWiGoaUEzA36I8CJQqteolBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sI+m/pSNKT1VEwz81JdUYXb71QeFWERbqvW7yhfJxARbVUuuswTzwMr5gOfybl6reXCxhcABkNAxmup/yXfOZYs4baC453mVDxIQU6jldMtWQ+ENeLnrS74o0LD57jG/iKnfVQJOss0W96TFm3rdG74UmMHaCfJvrsw9Lw5jgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seB0Y1qT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78662C4CEF8;
	Thu, 13 Nov 2025 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763074803;
	bh=vwc/0+YWdp+aaq0bFVlBWiGoaUEzA36I8CJQqteolBw=;
	h=From:To:Cc:Subject:Date:From;
	b=seB0Y1qTbhsSdSQg/7JJLg8NkE/Jr9qfvcNL1StiwQTncDsg5D7jtsapnfbkv9S/r
	 Mta/CBiK4A8kN1z7yaDMgSX0EPwscXDqmTZQX6wn+9FqsMp3t/bJF6vPq6m7ETxoPK
	 syQO23Kl9aRHHIVg9PTWbqObXHK5n6RAr0Q0tXEDdMnbt2yofc2WqTzPpfh/3hF48Q
	 7ZLOaot+ghcA5zuaj4UNHjUwYjs7bB3nVA8qcrJLkTcdoUhPpWv4pqpuLV2BjPkya8
	 +YY3f4PtR6hhOqEttR829apXZ3Kzxq5VViV3EASaS6FZWhhJhYwSa6W8lD4gsiQIhP
	 sqZglZHTgmatQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH] kbuild: Support directory targets for building DTBs
Date: Thu, 13 Nov 2025 16:59:51 -0600
Message-ID: <20251113225952.867138-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful to be able to build all the DTBs for a vendor. One can list
all the .dts files in a directory and convert those to %.dtb targets,
but that doesn't work for base+overlay DTB targets.

Adding the dts subdirectory is straight-forward, but building the
DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
%.dtbo, and the directory target(s)).

The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
but the directory target only depends on 'scripts' which depends on
'scripts_dtc'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
RFC because only arm64 converted ATM.

I don't really like looking at MAKECMDGOALS, but that's the only way I
could come up with that works. Maybe someone knows a better way.
---
 Makefile              | 2 +-
 arch/arm64/Kbuild     | 2 ++
 scripts/Makefile.dtbs | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca716..85018d461575 100644
--- a/Makefile
+++ b/Makefile
@@ -1494,7 +1494,7 @@ export CHECK_DTBS=y
 endif
 
 ifneq ($(CHECK_DTBS),)
-dtbs_prepare: dt_binding_schemas
+scripts_dtc: dt_binding_schemas
 endif
 
 dtbs_check: dtbs
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..9e9820af48c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 2d321b813600..4d0d164df275 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -14,7 +14,10 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
+ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGOALS)),)
 always-y        += $(dtb-y)
+endif
+
 targets         += $(real-dtb-y)
 
 # dtbs-list
-- 
2.51.0


