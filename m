Return-Path: <linux-kbuild+bounces-13611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ct8OCs1KJWoVGQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13611-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 12:41:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DE64FE7C
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 12:41:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Ffw75xAm;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13611-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13611-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CC20300361E
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jun 2026 10:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5613264F5;
	Sun,  7 Jun 2026 10:41:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7235329371;
	Sun,  7 Jun 2026 10:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828874; cv=none; b=ZLrAS2G7/WmwND5HAaAgx3qnjD58+ha2An+sqazfMZJTcIMpNk2vtc5oK6IAgkl+iFpoVviikMOUqvPk+I3CWE4d51TgzuBeNISAEbQxvCUAG1Ka75BHcHtSYmQVCadFlFDfhzGWXxZV3UedeuTiJYnJi/VdpsXD7doP4dv3pGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828874; c=relaxed/simple;
	bh=0Xt5VUXrplXBy3PHdeC6rzHazkpQJfh0RhYkRYTKYGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtERl39OZAzANL02nu+YzhhQB6Hc4SaO7Qr1TRleJhgtcscb1cr7JYlosdendSyosQhP3ebGkS+DD1hjc0D/AhdXFzas8f+mRCLehdiYhCrU7ZKPY7kqqPRugQjC+3kqdOn3vUpKrd7eQR6pTNJbeymhg6KGEAQUCzF19VHILUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ffw75xAm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934221F00893;
	Sun,  7 Jun 2026 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780828873;
	bh=9ZRm6HP61A9SKbcgUmXtRrvJbfq8dSqDuluEOzieY8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ffw75xAmPJm4PkBKHNru5hRKP9qCaucAtWJGMty2QfUWw5mRWXJxF2pQGmZ5+gGys
	 itOnBfmbKBrvpC4EjPE+YF5pS9gbjY79KU2GbVY0V+dAp2zK4mSduvHw4wUC/YAdvq
	 s7pK42eHmUoWLnjU+4de8oLY7cm5CPHsb1OZTSSY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 6.18 198/315] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
Date: Sun,  7 Jun 2026 11:59:45 +0200
Message-ID: <20260607095734.844256780@linuxfoundation.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607095727.528828913@linuxfoundation.org>
References: <20260607095727.528828913@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13611-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:patches@lists.linux.dev,m:will@kernel.org,m:tglx@kernel.org,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:linux-kbuild@vger.kernel.org,m:arnd@arndb.de,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,linuxfoundation.org:email,linux-foundation.org:email,amd.com:email,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B82DE64FE7C

6.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Arnd Bergmann <arnd@arndb.de>

commit 4c9ad387aa2d6785299722e54224d34764edaeb3 upstream.

gcc-16 has gained some more advanced inter-procedual optimization
techniques that enable it to inline the dummy_tlb_add_page() and
dummy_tlb_flush() function pointers into a specialized version of
__arm_v7s_unmap:

WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
ERROR: modpost: Section mismatches detected.

>From what I can tell, the transformation is correct, as this is only
called when __arm_v7s_unmap() is called from arm_v7s_do_selftests(),
which is also __init. Since __arm_v7s_unmap() however is not __init,
gcc cannot inline the inner function calls directly.

In debug_objects_selftest(), the same thing happens. Both the
caller and the leaf function are __init, but the IPA pulls
it into a non-init one:

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x7c (section: .text.lookup_object_or_alloc) -> is_static_object (section: .init.text)

Marking the affected functions as not "__init" would reliably avoid this
issue but is not a good solution because it removes an otherwise correct
annotation. I tried marking the functions as 'noinline', but that ended
up not covering all the affected configurations.

With some more experimenting, I found that marking these functions as
__attribute__((noipa)) is both logical and reliable.

In order to keep the syntax readable, add a custom macro for this in
include/linux/compiler_attributes.h next to other related macros and
use it to annotate both files.

Link: https://lore.kernel.org/all/abRB6g-48ZX6Yl2r@willie-the-truck/
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c  |   18 ++++++++++++------
 include/linux/compiler_attributes.h |   11 +++++++++++
 lib/debugobjects.c                  |    2 +-
 3 files changed, 24 insertions(+), 7 deletions(-)

--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -777,21 +777,27 @@ struct io_pgtable_init_fns io_pgtable_ar
 
 static struct io_pgtable_cfg *cfg_cookie __initdata;
 
-static void __init dummy_tlb_flush_all(void *cookie)
+/*
+ * __noipa prevents gcc from turning indirect iommu_flush_ops calls
+ * into direct calls from a specialized __arm_v7s_unmap() that triggers
+ * a build time section mismatch assertion.
+ */
+static __noipa void __init dummy_tlb_flush_all(void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static void __init dummy_tlb_flush(unsigned long iova, size_t size,
-				   size_t granule, void *cookie)
+static __noipa void __init dummy_tlb_flush(unsigned long iova, size_t size,
+					   size_t granule, void *cookie)
 {
 	WARN_ON(cookie != cfg_cookie);
 	WARN_ON(!(size & cfg_cookie->pgsize_bitmap));
 }
 
-static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
-				      unsigned long iova, size_t granule,
-				      void *cookie)
+static __noipa void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
+					      unsigned long iova,
+					      size_t granule,
+					      void *cookie)
 {
 	dummy_tlb_flush(iova, granule, granule, cookie);
 }
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -397,6 +397,17 @@
 #endif
 
 /*
+ * Optional: not supported by clang
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-noipa
+ */
+#if __has_attribute(noipa)
+# define __noipa __attribute__((noipa))
+#else
+# define __noipa
+#endif
+
+/*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-weak-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-weak-variable-attribute
  */
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -1212,7 +1212,7 @@ struct self_test {
 
 static __initconst const struct debug_obj_descr descr_type_test;
 
-static bool __init is_static_object(void *addr)
+static __noipa bool __init is_static_object(void *addr)
 {
 	struct self_test *obj = addr;
 



