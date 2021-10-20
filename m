Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D072A435160
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhJTRiM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhJTRiL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:38:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8260C061755
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id np13so2968682pjb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ws4j8gO4JntA0wlKwlmQrmrVOGmPKcOTbGQbFPeYxe8=;
        b=SbblMPzMlPY8A4MSnv3l2Wo17xTLRkKnbJY1T9AlW16vMzYUT4nWpQKHzWojxD0zmD
         XoRT6OhfgXgfV1c+OPJinKiJUviKMLxu/lh6trMG9rbv6gPZyRud3Dud8n5nD/cYt61f
         8qfrMQBiYBwpJS1T6d3noRRz41Pc8/yRc4kGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ws4j8gO4JntA0wlKwlmQrmrVOGmPKcOTbGQbFPeYxe8=;
        b=1r3B47Kap1V6xbG5w3+TWffhA5JSHDiMf3DtlFFf80R8nItP0kvAJbpPMFMAfoluKv
         lBgRUFGmqzd8baW4xkzhovioJCN07yCUiLa83cscq41RGKosmpSNLCEIdXtfyQQUOX/V
         dDlOY1E+q22/JzJexQj8MrBIiA0WwR9iSxUiDS2Ed2SHm9rK8eEKhYV5vq2Z+YaMi4LU
         cfmSROIj60xZ/+6uA9LR3iw/5frXRqhItUDP6B+i8couGem1w+smB/HpQ2hCLRYKxc8y
         iEuuyvBKKjUdkvVI4xxBHY0vQbGlc1Q8aHMFM166baB5CTaVxjKNVT+o8PkUbxS845me
         ocPg==
X-Gm-Message-State: AOAM5308sRJCBgYpgg1D50Tyv49cG7ahNITAKq1orKbD7i6OOo0kSAwB
        iI9MHKJfvMR8spq5Q3McrfpVjA==
X-Google-Smtp-Source: ABdhPJx6T/k29TC03YiaucAFwr0Br6abF98oVDvUsim52qn/NPhaCpNs2adzvGgXzay2hOX7y0jVNQ==
X-Received: by 2002:a17:90b:4c4a:: with SMTP id np10mr233234pjb.233.1634751356359;
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i124sm3266217pfc.153.2021.10.20.10.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
        llvm@lists.linux.dev, Dan Li <ashimida@linux.alibaba.com>,
        ardb@kernel.org, ojeda@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gcc-plugins: Explicitly document purpose and deprecation schedule
Date:   Wed, 20 Oct 2021 10:35:53 -0700
Message-Id: <20211020173554.38122-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020173554.38122-1-keescook@chromium.org>
References: <20211020173554.38122-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804; h=from:subject; bh=Kk2hDVQKDHU81p/hq2gHwgV4ExxhvGmxDL3o/9ljT8c=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhcFN5m7tUmu78WD8GEq7nnZOssuJVi1eV1tkp6m44 ECcS0E6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYXBTeQAKCRCJcvTf3G3AJjDfEA CG4zTatumYmooLLsrwZmk+APIY3n++Qt3f+4SACaWAkayQIe/8CR+Sc83nQEFXZPJwYBX66E5Jq72K XuPj98uHYA/nj55MwLSarOYeLKJI937+zb0ROuprJ5VyWAqSlOnOALL4wxKpSr/kNsXtgSlutct9bS eqwPzdnsY7YLng50ABUBwSWkPdmjmZlJpy9rpaCgOJ9eesgfB8J8SUY9At3crZXZU6tg0/HDb8MDly zQ308qV/hez5lb/H0+qkYrAhjydssyqvd7cObO8EAQzA29yS7TQIcAnU3/Rk1SNtUrGa8gJ9qDJNMP X5wE4Q5tTW1ttTwaVf0rnrnlPgJtDutpqyPTn9yK31lG/6BGuTDj7QS0vnvE8MQ/Lw8dEX/geDnJXN isrvLzJssEcui65dEnb+DXxYW/8Nq3sGJdMB4SJb1P+rvC1JDKpi0I5K/EcKe2QoG4s4ol4w+Aq5nW dubO68BLqUePSjF2m5X0pdbRbnbM+Fl0MTbPOmhUpeI0Hbat5H0citqCqLPWxQn3hpsbEYCr8Bb3nn l3JY539yxClVsZeChRYvzZ+XPbA0ql9AtQ3GynE6JAY2VejJjFSAHwXAM3a6sR7/dApqQyZDreMVBZ r0z/ASfvImyAno48Mxiic8p+hfy/E4p1gbB+eYpjcIVezmhm02Lhxup5H2Hw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC plugins should only exist when some compiler feature needs to be
proven but does not exist in either GCC nor Clang. For example, if a
desired feature is already in Clang, it should be added to GCC upstream.
Document this explicitly.

Additionally, mark the plugins with matching upstream GCC features as
removable past their respective GCC versions.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/kbuild/gcc-plugins.rst | 26 ++++++++++++++++++++++++++
 scripts/gcc-plugins/Kconfig          |  4 ++--
 security/Kconfig.hardening           |  9 ++++++---
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
index 3349966f213d..4b28c7a4032f 100644
--- a/Documentation/kbuild/gcc-plugins.rst
+++ b/Documentation/kbuild/gcc-plugins.rst
@@ -32,6 +32,32 @@ This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
 .. [7] https://pax.grsecurity.net/
 
 
+Purpose
+=======
+
+GCC plugins are designed to provide a place to experiment with potential
+compiler features that are neither in GCC nor Clang upstream. Once
+their utility is proven, the goal is to upstream the feature into GCC
+(and Clang), and then to finally remove them from the kernel once the
+feature is available in all supported versions of GCC.
+
+Specifically, new plugins should implement only features that have no
+upstream compiler support (in either GCC or Clang).
+
+When a feature exists in Clang but not GCC, effort should be made to
+bring the feature to upstream GCC (rather than just as a kernel-specific
+GCC plugin), so the entire ecosystem can benefit from it.
+
+Similarly, even if a feature provided by a GCC plugin does *not* exist
+in Clang, but the feature is proven to be useful, effort should be spent
+to upstream the feature to GCC (and Clang).
+
+After a feature is available in upstream GCC, the plugin will be made
+unbuildable for the corresponding GCC version (and later). Once all
+kernel-supported versions of GCC provide the feature, the plugin will
+be removed from the kernel.
+
+
 Files
 =====
 
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index ab9eb4cbe33a..3f5d3580ec06 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -37,6 +37,8 @@ config GCC_PLUGIN_CYC_COMPLEXITY
 
 config GCC_PLUGIN_SANCOV
 	bool
+	# Plugin can be removed once the kernel only supports GCC 6.1.0+
+	depends on !CC_HAS_SANCOV_TRACE_PC
 	help
 	  This plugin inserts a __sanitizer_cov_trace_pc() call at the start of
 	  basic blocks. It supports all gcc versions with plugin support (from
@@ -83,8 +85,6 @@ config GCC_PLUGIN_RANDSTRUCT
 	  the existing seed and will be removed by a make mrproper or
 	  make distclean.
 
-	  Note that the implementation requires gcc 4.7 or newer.
-
 	  This plugin was ported from grsecurity/PaX. More information at:
 	   * https://grsecurity.net/
 	   * https://pax.grsecurity.net/
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 90cbaff86e13..d30c6225de74 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -53,7 +53,8 @@ choice
 
 	config GCC_PLUGIN_STRUCTLEAK_USER
 		bool "zero-init structs marked for userspace (weak)"
-		depends on GCC_PLUGINS
+		# Plugin can be removed once the kernel only supports GCC 12+
+		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
 		select GCC_PLUGIN_STRUCTLEAK
 		help
 		  Zero-initialize any structures on the stack containing
@@ -64,7 +65,8 @@ choice
 
 	config GCC_PLUGIN_STRUCTLEAK_BYREF
 		bool "zero-init structs passed by reference (strong)"
-		depends on GCC_PLUGINS
+		# Plugin can be removed once the kernel only supports GCC 12+
+		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
 		depends on !(KASAN && KASAN_STACK)
 		select GCC_PLUGIN_STRUCTLEAK
 		help
@@ -82,7 +84,8 @@ choice
 
 	config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
 		bool "zero-init everything passed by reference (very strong)"
-		depends on GCC_PLUGINS
+		# Plugin can be removed once the kernel only supports GCC 12+
+		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
 		depends on !(KASAN && KASAN_STACK)
 		select GCC_PLUGIN_STRUCTLEAK
 		help
-- 
2.30.2

