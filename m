Return-Path: <linux-kbuild+bounces-224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6A7FFD1E
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 21:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1DCE1C210CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Nov 2023 20:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB1B4A998;
	Thu, 30 Nov 2023 20:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PH9L32LD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D42B9D6;
	Thu, 30 Nov 2023 20:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B17C433C7;
	Thu, 30 Nov 2023 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701377534;
	bh=R7LNuLwRzlt/17e18V7R1EEOuUFGqpcWy3MHGj0x6iM=;
	h=Date:From:To:Cc:Subject:From;
	b=PH9L32LDTUo5YBVfdO+i974H6l5nZItyapR+AsLpeoGzf/+dGCu1c+X+ivz0qgAhv
	 +ubaCZfQPmAeHFtWPvxjrYsyh8V0OvLWxCfqKemE0TiBLk02sCZqL65asc3cPEz/9t
	 KAT/mFR7jEEK8re5RUp3wiVeqEIDk9V9LU9zz17+5drCadHLfMdB18Q9ndgkdF+uku
	 ImJYlkGfUNJvFioVreeYdyiVIcczEMuV+ZhFF6y1+hSwDx5p+IrMUcF8X7vDRt51M5
	 6JB4ng2ylWAtNJxDcQGXioxeERJhmYABsjgkx2EecpJs0NnW2DCHpRgTUUN5u38X3l
	 IpQI2NCEwvZlA==
Date: Thu, 30 Nov 2023 14:52:10 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] init: Kconfig: Disable -Wstringop-overflow for GCC-11
Message-ID: <ZWj1+jkweEDWbmAR@work>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wstringop-overflow is buggy in GCC-11. Therefore, we should disable
this option specifically for that compiler version. To achieve this,
we introduce a new configuration option: GCC11_NO_STRINGOP_OVERFLOW.

The compiler option related to string operation overflow is now managed
under configuration CC_STRINGOP_OVERFLOW. This option is enabled by
default for all other versions of GCC that support it.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 Makefile     |  4 +++-
 init/Kconfig | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2cfd71ae3a86..8adc611fb611 100644
--- a/Makefile
+++ b/Makefile
@@ -982,7 +982,9 @@ NOSTDINC_FLAGS += -nostdinc
 # perform bounds checking.
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
-KBUILD_CFLAGS += $(call cc-option, -Wstringop-overflow)
+#Currently, disable -Wstringop-overflow for GCC 11, globally.
+KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
+KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
diff --git a/init/Kconfig b/init/Kconfig
index 9ffb103fc927..aaaa99a5d2a9 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -876,6 +876,18 @@ config CC_NO_ARRAY_BOUNDS
 	bool
 	default y if CC_IS_GCC && GCC_VERSION >= 110000 && GCC11_NO_ARRAY_BOUNDS
 
+# Currently, disable -Wstringop-overflow for GCC 11, globally.
+config GCC11_NO_STRINGOP_OVERFLOW
+	def_bool y
+
+config CC_NO_STRINGOP_OVERFLOW
+	bool
+	default y if CC_IS_GCC && GCC_VERSION >= 110000 && GCC_VERSION < 120000 && GCC11_NO_STRINGOP_OVERFLOW
+
+config CC_STRINGOP_OVERFLOW
+	bool
+	default y if CC_IS_GCC && !CC_NO_STRINGOP_OVERFLOW
+
 #
 # For architectures that know their GCC __int128 support is sound
 #
-- 
2.34.1


