Return-Path: <linux-kbuild+bounces-9688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B5C7161E
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 23:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9382335517A
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 22:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A5432C328;
	Wed, 19 Nov 2025 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEzOboja"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42932B994;
	Wed, 19 Nov 2025 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763592273; cv=none; b=hhanbMUFvnlpCtArfaZPD8HEBlA6wZPNn1ucAkOjfhACeiZwMbwDMzt+KIBisrjUc/XHC4UDqDG+x6mevouR1r4O8oqhrTrgq97ILI4lj74nMy52ot9s4etP+/kBAxb1K9Wuzhjqbu/V0g/oqyUeTep/AODA7wYojadY5SyU/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763592273; c=relaxed/simple;
	bh=IA5GMOO9Vy0/NooVwZpkppIb8LeIk+vJSQM3MYS7+ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lyYyDK2Ae/Mdma149lUIUuW1JsbqKZaRfgC+IlA1aIh30uCfNPZM73b5yiwVvtuDALFK3Fv2glIqXau1ow8xXkSt4Hc4WaZ+QhF8MHL4kr6A0/eAkv2Yzop7TK0/qE1suJk383UJCeKw5AFEca5bV7G0LfKSL9pHPvjmFu3U5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEzOboja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206BDC4CEF5;
	Wed, 19 Nov 2025 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763592273;
	bh=IA5GMOO9Vy0/NooVwZpkppIb8LeIk+vJSQM3MYS7+ig=;
	h=From:To:Cc:Subject:Date:From;
	b=jEzObojasE+oO8OTDcrOdfp3nSq4lKpUeoEmuIYHzu+xe4+3ctPom/2CT/X54KGte
	 w7KzjS9mb7SDBiO3EuydoGcD0yAJ41RPKzR7GQ05AGn7XgFppcT7dnZAmAqv1kQ9RI
	 UtaAJlEfIVvD23ZUC9iM/28Tk+++O6Neu89/i7REbwcnlo2XUy8VmysL4T+zYOF/Ya
	 XIOCH8mt5ns7CKYtQ2s7kgJuHlAPC6eQeVIWFBkgEvGPFXIowbuFkoDK7dNpyb5xDa
	 //wezwx9ROHmCm0/iwNzW7qcKPvD2R9Vb9KJOM4hppQZ052Pl5+l2pW/LPMpWYRupX
	 2n6FLmjF581rQ==
From: Kees Cook <kees@kernel.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: Enable GCC diagnostic context for value-tracking warnings
Date: Wed, 19 Nov 2025 14:44:31 -0800
Message-Id: <20251119224426.work.380-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=kees@kernel.org; h=from:subject:message-id; bh=IA5GMOO9Vy0/NooVwZpkppIb8LeIk+vJSQM3MYS7+ig=; b=owGbwMvMwCVmps19z/KJym7G02pJDJlyHn5Ozo8fmYdkhCUGX/6tZvF/iq5hw+YpcZOWXt5dJ TzB/vvPjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgImoyTL8YtKQz34e/tBnbtib fqGl8Rs3b7O8frG1valfbvuVhjdRVYwMvRtmHmNLefmTWVsqdbrfS46E+9bO23cxf53+aVPXgTs CnAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Enable GCC 16's coming "-fdiagnostics-show-context=2" option[1] to
provide enhanced diagnostic information for value-tracking warnings, which
displays the control flow chain leading to the diagnostic. This covers our
existing use of -Wrestrict and -Wstringop-overread, and gets us closer to
enabling -Warray-bounds, -Wstringop-overflow, and -Wstringop-truncation.

The context depth of 2 provides the immediate decision path that led to
the problematic code location, showing conditional checks and branch
decisions that caused the warning. This will help us understand why
GCC's value-tracking analysis triggered the warning and makes it easier
to determine whether warnings are legitimate issues or false positives.

For example, an array bounds warning will now show the conditional
statements (like "if (i >= 4)") that established the out-of-bounds access
range, directly connecting the control flow to the warning location.
This is particularly valuable when GCC's interprocedural analysis can
generate warnings that are difficult to understand without seeing the
inferred control flow.

Link: https://github.com/gcc-mirror/gcc/commit/6faa3cfe60ff9769d1bebfffdd2c7325217d7389 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index d14824792227..d97452441cd0 100644
--- a/Makefile
+++ b/Makefile
@@ -940,6 +940,9 @@ KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
 # for the randomize_kstack_offset feature. Disable it for all compilers.
 KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
 
+# Get details on warnings generated due to GCC value tracking.
+KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
+
 # Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
 ifdef CONFIG_ZERO_CALL_USED_REGS
 KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
-- 
2.34.1


