Return-Path: <linux-kbuild+bounces-8704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DFBB4308E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF121A00434
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306B02264CB;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MylokCOL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C352253E1;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=j8P6CAlR8v6NTVVeFivscKRgv/QDT92R7yl2NIJD0zllGDNcWbIV8HDUptkCOIL/BseSLS85ujbkAxIyqpsX/lzItc9867UbPgzw6ESXqQzQq9TXsQhuM6sA8OUmLU7KFF8vOsgvLo9v86pMS08gW92te4pSWnHh6M2SaxByQ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=/OwwI41G7+Tx15l2gGzfUnj2QKLIC0KZTQah1RCXchQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LQsO7uECYGyFXWPlBQI+zc3icyEe/noXqAJuBMfYsC2Wpljh7d4CE2Lk+z/RqAbeFpsLjYJnZLIg2WAiDowe8+MnJfv2UJzHwjFtx0FKzreYl4GqpYAuZppdQzXmEcVqG2bf3wGab5F2amgB8kB361XFRHzwAAjs+FoiTHOdMEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MylokCOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B1C4CEF1;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=/OwwI41G7+Tx15l2gGzfUnj2QKLIC0KZTQah1RCXchQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MylokCOLrkzILw21dOISnvzdCnC5ic0BWGjbhj8ixodadygjQteMcRPhO8kWoA6oM
	 6GGtXCwET8NKOjZBkeQkGxSP6IXjq1MixvApdHAq/v86BP1hkZUR0qeSbyCvE/ddJl
	 nx+Fz20MrH6eKgXxDA9x1tjRS2xT7WVy2EwOeLedKKzRsKXAYtXbuC/jxFE1u9qpvj
	 t+BktwnoIU7pmPMUzvEyGkybllUiJoG+Zmx/52PVWdBYgjjJZ+ZCXE/AeZwsmBRq9p
	 GkGB5PYo+MShdaIc3qEtNQ8SgapozpZ2b0dMj9QaWmUCcQ6kOEbIQKgteHkRbDJXVx
	 uMZB0k8YpJ8EA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/9] x86/cfi: Document the "cfi=" bootparam options
Date: Wed,  3 Sep 2025 20:46:42 -0700
Message-Id: <20250904034656.3670313-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=kees@kernel.org; h=from:subject; bh=/OwwI41G7+Tx15l2gGzfUnj2QKLIC0KZTQah1RCXchQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYslK7sPyK8r/yYYUab2O3f2jr2JoYvqn009+jJ05 /mHQR/4OkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACbyXpnhf5wCS2RwSuTUzIet 4T/Zd6uV+UjqykrE3eZIe6IgUGClyshwNDmyTXFnvZOH35caoe/G/HMao/tC9mbahsZZqp28lcQ NAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The kernel-parameters.txt didn't have a section for the cfi= options.
Add it.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: <linux-doc@vger.kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..8bbffbb334ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -608,6 +608,23 @@
 	ccw_timeout_log	[S390]
 			See Documentation/arch/s390/common_io.rst for details.
 
+	cfi=		[X86-64] Set Control Flow Integrity checking features
+			when CONFIG_FINEIBT is enabled.
+			Format: feature[,feature...]
+			Default: auto
+
+			auto:	  Use FineIBT if IBT available, otherwise kCFI.
+				  Under FineIBT, enable "paranoid" mode when
+				  FRED is not available.
+			off:	  Turn off CFI checking.
+			kcfi:	  Use kCFI (disable FineIBT).
+			fineibt:  Use FineIBT (even if IBT not available).
+			norand:   Do not re-randomize CFI hashes.
+			paranoid: Add caller hash checking under FineIBT.
+			bhi:	  Enable register poisoning to stop speculation
+				  across FineIBT. (Disabled by default.)
+			warn:	  Do not enforce CFI checking: warn only.
+
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
 			The effects of cgroup_disable=foo are:
-- 
2.34.1


