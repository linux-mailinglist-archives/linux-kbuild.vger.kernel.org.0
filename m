Return-Path: <linux-kbuild+bounces-9761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F1C7B5ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19F44347BEE
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 18:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8D42F12AD;
	Fri, 21 Nov 2025 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqUY0uTu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0319DF4D;
	Fri, 21 Nov 2025 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763750629; cv=none; b=pB0k5Q51NpeLs2JT2ABDB/3xsiPLThWT5AYLoLhPJ9i0H1Mr/jwnaCXumYLkZeNKUH46g3RXyT9WS2MEGdf/FTcstFgyG4u9hmOsJBkNg7M0E1ooSbfaaOikBXOpvF3M40StEiaUAYaZvzsTKggF5gJGFTSpKxwyOJ25C1lXghQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763750629; c=relaxed/simple;
	bh=q8SC2VN//oCBYngP3MuvAjbwAYZFH1/aJ9Gbg6CNu3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PxZ+s24pRodKMl594HNSj1KPJyytxlY4v1PB/gw3jG/95kqrfnAJMJiyzaU5HBKNQO9IDH9Go4SS20rFy884Qw1J+Eanjuwapdu7tYa7a2/w7TqNlbRyBOvwM3ldwTjJYE7Kdq3bEFxZ7MIMpmrtootSjS1plbsrbHLkH4dFhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqUY0uTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F08C4CEF1;
	Fri, 21 Nov 2025 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763750629;
	bh=q8SC2VN//oCBYngP3MuvAjbwAYZFH1/aJ9Gbg6CNu3E=;
	h=From:To:Cc:Subject:Date:From;
	b=aqUY0uTuM635qyw43ilFbx3Y/oTeUs6b+jDnSD825gArOzw7fi+JomaJmfcBbBr5L
	 pg/9zUhB+g4R+kpzLWuIHjCl83v50LK5wogB6j8BvcS+eC4KZDLqR6IrrAgZaygBdv
	 QqF6xAIUa1ZEU1f/otQNX80rHE2+nbyBHFvugG4/RkemVuAC5mYSOCPqGCKQNm+N71
	 BhcTp75FipmuojSjsP0kdEUouVK+jP4s7h9ROHg+e5gY12xIjbBILLxvFhgJPzsnZW
	 DCtdM+3oh9/7ZJcGvlYTF995N62U/NzFIBAjN1+QcuA3sKoIJYOd81aVypd79LFX5P
	 EmpkePyNnznVA==
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
Subject: [PATCH v2] kbuild: Enable GCC diagnostic context for value-tracking warnings
Date: Fri, 21 Nov 2025 10:43:48 -0800
Message-Id: <20251121184342.it.626-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031; i=kees@kernel.org; h=from:subject:message-id; bh=q8SC2VN//oCBYngP3MuvAjbwAYZFH1/aJ9Gbg6CNu3E=; b=owGbwMvMwCVmps19z/KJym7G02pJDJkKmx5b3DaW0pRo2Mq8Jqc10bbmX6BJ0aozBw2fhi+IU Xb+pv2vo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKiaxn+F6pds2C2czmsYTR5 oqBHvW7/8m4dj8MBr55/0/iysGvTKkaGXWVLJrHtTH7g/8fHyfpFtu3NHX3J55bd6DtVkPpu3jp mZgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Enable GCC 16's coming "-fdiagnostics-show-context=N" option[1] to
provide enhanced diagnostic information for value-tracking warnings,
which displays the control flow chain leading to the diagnostic. This
covers our existing use of -Wrestrict and -Wstringop-overread, and
gets us closer to enabling -Warray-bounds, -Wstringop-overflow, and
-Wstringop-truncation, so we can track the rationale for the warning,
letting us more quickly identify actual issues vs what have looked in
the past like false positives. Fixes based on this work have already
been landing, e.g.:

  4a6f18f28627 ("net/mlx4_core: Avoid impossible mlx4_db_alloc() order value")
  8a39f1c870e9 ("ovl: Check for NULL d_inode() in ovl_dentry_upper()")
  e5f7e4e0a445 ("drm/amdgpu/atom: Work around vbios NULL offset false positive")

The context depth ("=N") provides the immediate decision path that led
to the problematic code location, showing conditional checks and branch
decisions that caused the warning. This will help us understand why
GCC's value-tracking analysis triggered the warning and makes it easier
to determine whether warnings are legitimate issues or false positives.

For example, an array bounds warning will now show the conditional
statements (like "if (i >= 4)") that established the out-of-bounds access
range, directly connecting the control flow to the warning location.
This is particularly valuable when GCC's interprocedural analysis can
generate warnings that are difficult to understand without seeing the
inferred control flow.

While my testing has shown that "=1" reports enough for finding
the origin of most bounds issues, I have used "=2" here just to be
conservative. Build time measurements with this option off, =1, and =2
are all with noise of each other, so there seems to be no harm in "turning
it up". If we need to, we can make this value configurable in the future.

Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6faa3cfe60ff9769d1bebfffdd2c7325217d7389 [1]
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


