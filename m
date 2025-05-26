Return-Path: <linux-kbuild+bounces-7264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A455AC3C64
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 11:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A136618942B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 09:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A152D1F03D8;
	Mon, 26 May 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixS11m5v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3A1EFFBB;
	Mon, 26 May 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250501; cv=none; b=AMJLfDYkULX8n2LWyii6+GZmvC2cGFaUPv4gi9M4t+7fWDVk0KvrfO9h52FvFyWrOttvHL9sLxHyFrULt8C/UVL3EX/DAK4wOBK7OClLPWxFATnNZo6Vr4Cz/5AqFIH8/UxcDPp9gGNOz+wNG3+qvZhCqiqq0DCct61Hz9o+SMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250501; c=relaxed/simple;
	bh=r4vpfhgdTadsX6mz1zhFSBmVO2ukjTVGrtilLo/HSbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYGQS9eCNC4eshV8beeQo4HudbRGG+M0lnKu1rvPOok3RfaLMEH1k9+Q4F7hcVFukvzv7n59Y/yYu7haFMnVs0mHSKPfUSFFc2bGGKuHqOfwaSlNXef+GCQxO138HerR6pWpMHIPXFQRv2o1cnO3ME8W6WWBjcpiF8Xi2A+TFak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixS11m5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2B2C4CEE7;
	Mon, 26 May 2025 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748250501;
	bh=r4vpfhgdTadsX6mz1zhFSBmVO2ukjTVGrtilLo/HSbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixS11m5vNBl+x1MjxaJahoecwMd1genvJH/NwfkxBBjBjE9NeBR3l5Wmt6IlGzrcl
	 0osT2yl/BYb548NG8iPJ5/2p+4ubluyPUkAb3+2tlexh8Uco45vrvS6q0xE8E+2bRP
	 LYLiBhKn+ffXxVmzow/otwuuPXyStfDpD7sZ7G37UNTFeD7rQ4nV5Q+p3vxhVR+Qb0
	 Q96m2vRik4uDzOktYUzKEWbThORuzYiW/BVWO7uAHTwLHtKy4nro/j23nVbBepnhDQ
	 MX1h0bsEVXa+fkkmdn2do4d+17pkH3UUeH4y282m8aqqPQCyWWhEYWbYUfDA0UPaz1
	 In5mWs7UMgamA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH 2/2] kbuild: link lib-y objects to vmlinux forcibly even when CONFIG_MODULES=n
Date: Mon, 26 May 2025 18:07:52 +0900
Message-ID: <20250526090815.416922-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526090815.416922-1-masahiroy@kernel.org>
References: <20250526090815.416922-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 7273ad2b08f8 ("kbuild: link lib-y objects to vmlinux
forcibly when CONFIG_MODULES=y"), all objects from lib-y have been
forcibly linked to vmlinux when CONFIG_MODULES=y.

To simplify future changes, this commit makes all objects from lib-y
be linked regardless of the CONFIG_MODULES setting.

Most use cases (CONFIG_MODULES=y) are not affected by this change.

The vmlinux size with ARCH=arm allnoconfig, where CONFIG_MODULES=n,
increases as follows:

   text    data     bss     dec     hex filename
1368644  835104  206288 2410036  24c634 vmlinux.before
1379440  837064  206288 2422792  24f808 vmlinux.after

We no longer benefit from using static libraries, but the impact is
mitigated by supporting CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.

For example, the size of vmlinux remains almost the same with ARCH=arm
tinyconfig, where CONFIG_MODULES=n and
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y.

   text    data     bss     dec     hex filename
 455316   93404   15472  564192   89be0 vmlinux.before
 455312   93404   15472  564188   89bdc vmlinux.after

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 682a8002b7a1..b8d94c7fe4af 100644
--- a/Makefile
+++ b/Makefile
@@ -1184,13 +1184,8 @@ export ARCH_LIB		:= $(filter %/, $(libs-y))
 export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 # Externally visible symbols (used by link-vmlinux.sh)
 
-KBUILD_VMLINUX_OBJS := ./built-in.a
-ifdef CONFIG_MODULES
-KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
+KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
-else
-KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
-endif
 
 export KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
-- 
2.43.0


