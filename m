Return-Path: <linux-kbuild+bounces-7864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE4AF7B91
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 17:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A4A585FD6
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4302E8E0D;
	Thu,  3 Jul 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r3S4lIrm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382E2D781F;
	Thu,  3 Jul 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555920; cv=none; b=hvbSMo3wKbmpBCCJup9m2SQwo1KnqO1I54qhTqAY2Uk1t8THLexYMSOvIkCYBUpNHIseDuxw8jjpp+YWK04obIBiyG5kaFQuC/k6jSMbDZsW0AMkBJlzfpgwShdXxHdLZoiZub1LdjCg3hQ6JEleO704S9NDnQQR0iJAsnaGqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555920; c=relaxed/simple;
	bh=S6uvD4PCYAu1Y4zCdF65tfqi3Za6w4hqbrS0+FSRhEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1WxGgZG9VDlXl7XEtizTHLTN4oPPrIT52qAQCiIMQqRAViJFZVsCaR6VVwOY+Fb3yys9f9bHGK5RxHAHMYXSyro9BIjZ3r5Eb3wW4HIcjHimzLTQidWugslwUQgDM4H/NS80UHuRPD19bYQRYzqsYkhzWI6vjV1afKE7SFAG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r3S4lIrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A205C4CEE3;
	Thu,  3 Jul 2025 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751555919;
	bh=S6uvD4PCYAu1Y4zCdF65tfqi3Za6w4hqbrS0+FSRhEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3S4lIrmg6UObK+zjLcHckHEGyLDCR6FaFC26bO6+ltpQDyRHZkslemZ667dXN8GH
	 YW5oRmGCv2OJmMH+Dv6TRyANamC78Y+PV81TOCVbGP9ar86WkHqxIbACseOfjH08eh
	 JsBRuRUkSvAvVrYXfexQ7FgNQe/2scY82mGJFQZU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 019/132] um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
Date: Thu,  3 Jul 2025 16:41:48 +0200
Message-ID: <20250703143940.152978689@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703143939.370927276@linuxfoundation.org>
References: <20250703143939.370927276@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Sami Tolvanen <samitolvanen@google.com>

[ Upstream commit 674d03f6bd6b0f8327f1a4920ff5893557facfbd ]

With CONFIG_GENDWARFKSYMS, um builds fail due to missing prototypes
in asm/asm-prototypes.h. Add declarations for cmpxchg8b_emu and the
exported checksum functions, including csum_partial_copy_generic as
it's also exported.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503251216.lE4t9Ikj-lkp@intel.com/
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Link: https://patch.msgid.link/20250326190500.847236-2-samitolvanen@google.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/um/include/asm/asm-prototypes.h | 5 +++++
 arch/x86/um/asm/checksum.h           | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/um/include/asm/asm-prototypes.h b/arch/um/include/asm/asm-prototypes.h
index 5898a26daa0dd..408b31d591279 100644
--- a/arch/um/include/asm/asm-prototypes.h
+++ b/arch/um/include/asm/asm-prototypes.h
@@ -1 +1,6 @@
 #include <asm-generic/asm-prototypes.h>
+#include <asm/checksum.h>
+
+#ifdef CONFIG_UML_X86
+extern void cmpxchg8b_emu(void);
+#endif
diff --git a/arch/x86/um/asm/checksum.h b/arch/x86/um/asm/checksum.h
index b07824500363f..ddc144657efad 100644
--- a/arch/x86/um/asm/checksum.h
+++ b/arch/x86/um/asm/checksum.h
@@ -20,6 +20,9 @@
  */
 extern __wsum csum_partial(const void *buff, int len, __wsum sum);
 
+/* Do not call this directly. Declared for export type visibility. */
+extern __visible __wsum csum_partial_copy_generic(const void *src, void *dst, int len);
+
 /**
  * csum_fold - Fold and invert a 32bit checksum.
  * sum: 32bit unfolded sum
-- 
2.39.5




