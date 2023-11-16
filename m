Return-Path: <linux-kbuild+bounces-32-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 280297EDA2A
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 04:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B0E1F2374B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 03:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B869D8F40;
	Thu, 16 Nov 2023 03:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g28Utjwy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D479D4;
	Thu, 16 Nov 2023 03:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE41C433C7;
	Thu, 16 Nov 2023 03:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700105229;
	bh=0RxvFSGgxRT7IzJsthnJWzmXWCyJavEwPeaq9aEW7Sc=;
	h=Date:From:To:Cc:Subject:From;
	b=g28Utjwy9tiQeSYo5Ou1JeJZ+xpcjmO2McxjRXcY6dku5ZFpCfd89/xGX+FMUj7dR
	 kAYlx66JNZF+0x8GSf495dBz12b92M2laK/mKiH/gyHH41odO33dbCsvCFal1bMLcH
	 cbE4DGYuxS7/QuWOfMspVxWURHDZOMvDACU8uXZh8hb1mowsEbUCIQZI9cCXhZidET
	 ZnPcFPPM8C+5uRjgPiM48cPMbP+zB5NQv5tTrV5/TJac1BGN3KB1ISnTGH8RDY+TjQ
	 baJqz3isNod82PvbColGx2jWivFpsEEO5RatsdyDagTQSjfVHCftQ4tYjmrtozdRJf
	 QrLuGZhbeTHRA==
Date: Wed, 15 Nov 2023 21:27:05 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] Makefile: Enable -Wstringop-overflow globally
Message-ID: <ZVWMCZ/jb4nX3yHn@work>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

It seems that we have finished addressing all the remaining
issues regarding compiler option -Wstringop-overflow. So, we
are now in good shape to enable this compiler option globally.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 Makefile                   | 3 +++
 scripts/Makefile.extrawarn | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 690cde550acd..452b7d0e19e9 100644
--- a/Makefile
+++ b/Makefile
@@ -985,6 +985,9 @@ NOSTDINC_FLAGS += -nostdinc
 # perform bounds checking.
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
+# We are now in good shape to enable this option.
+KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2fe6f2828d37..1527199161d7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -106,7 +106,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
 KBUILD_CFLAGS += $(call cc-option, -Wformat-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wformat-truncation)
-KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 
 KBUILD_CPPFLAGS += -Wundef
@@ -122,7 +121,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
-KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 ifdef CONFIG_CC_IS_CLANG
-- 
2.34.1


