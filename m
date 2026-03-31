Return-Path: <linux-kbuild+bounces-12411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HWCCqkAzGk8NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12411-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:13:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFA36E32F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44FE7319333B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59F1426689;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mx9+0th8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77249423A80;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=pFgCBRxGj4zcpNgNdpeLPJL0UmgUbx3bLhyg29U2nJZjWfYNLsg1Yf5g2Geh3c9RZVrkBgb0xQnp7dWnpmCWMZ19APGmZEzfpif/yW0OwvGp/BVPmFinW60VUE/xhXBKhIxGmhd58mqMdc4xhUaxfWtQAi+XcUv4sQW0ClHSf6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=dRUACUfYM3hpUKt4oHZzZpLCHG7xwGYcgN8GkPASyZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bJk8f3MQYkxoOV5OM7obEFxluB1mjvNs2TN1QZae8uqW31e91ZV+Qo6otZpqoYruJUneNOMi598h8Kt6bnQtKtegDG6jUd3fIeGKLDLH2/v6XXADaGuo3tLKvsbBAIUW6L3WyOJq4uHKT5QHdS37Sb3gDSa8qa6tpMSIHbj51iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mx9+0th8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C23C19424;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=dRUACUfYM3hpUKt4oHZzZpLCHG7xwGYcgN8GkPASyZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mx9+0th8pvcSxWRvrrGWA1SxYzlIrfH/HDcZF3Sfp4ilvNE70PI8fbV60dps73LV+
	 ql9/kGvtatJYWvGiTq03UQSnhF6rPVLKOezvLBT3BqkAzS48eqZxIvJ+jelzsjAwqI
	 HKK/EtEZNMOWtzo2Uh7xw3ewdW6WtOF9f2mdtVayiBui2ykpfK/xOybWsgvQAn/jUy
	 eFIIF7fswGILddpC2a0Tg3klWU7b6oAQUAEkxQ5gbKAg1ob6O6NjzDNwOxYyjNb8EC
	 r34iZKrLorKyjejfdidY4GK/skyXXVzCIGktFY9p7sBXIAvsmXUVKpZXNzMLEomdDW
	 LQRKlfpq38Tfw==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Marco Elver <elver@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/5] refcount: Remove unused __signed_wrap function annotations
Date: Tue, 31 Mar 2026 09:37:19 -0700
Message-Id: <20260331163725.2765789-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331163716.work.696-kees@kernel.org>
References: <20260331163716.work.696-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3451; i=kees@kernel.org; h=from:subject; bh=dRUACUfYM3hpUKt4oHZzZpLCHG7xwGYcgN8GkPASyZU=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzjK7LzR55a3/gbn9ZMvGFiuWGzI0L91uq5bYbeS1 doc6dAJHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABPpKGVkWN5yPK/dyLb64jZ7 Wb3rJw8LhXBf31h2mFeiSj1j4grZdEaGiXtDoi15rZQu3+QMezF3PpN/T/7xYPbvD9ilrEoPe+z hBAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12411-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,intel.com:email,arm.com:email,infradead.org:email]
X-Rspamd-Queue-Id: A7CFA36E32F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With CONFIG_UBSAN_INTEGER_WRAP being replaced by Overflow Behavior
Types, remove the __signed_wrap function annotation as it is already
unused, and any future work here will use OBT annotations instead.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
 include/linux/compiler_types.h |  9 +--------
 include/linux/refcount.h       | 10 +++++-----
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 890076d0974b..e8fd77593b68 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -432,18 +432,11 @@ struct ftrace_likely_data {
 #define at_least
 #endif
 
-/* Do not trap wrapping arithmetic within an annotated function. */
-#ifdef CONFIG_UBSAN_INTEGER_WRAP
-# define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
-#else
-# define __signed_wrap
-#endif
-
 /* Section for code which can't be instrumented at all */
 #define __noinstr_section(section)					\
 	noinline notrace __attribute((__section__(section)))		\
 	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
-	__no_sanitize_memory __signed_wrap
+	__no_sanitize_memory
 
 #define noinstr __noinstr_section(".noinstr.text")
 
diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 3da377ffb0c2..ba7657ced281 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -170,7 +170,7 @@ static inline unsigned int refcount_read(const refcount_t *r)
 	return atomic_read(&r->refs);
 }
 
-static inline __must_check __signed_wrap
+static inline __must_check
 bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 {
 	int old = refcount_read(r);
@@ -212,7 +212,7 @@ static inline __must_check bool refcount_add_not_zero(int i, refcount_t *r)
 	return __refcount_add_not_zero(i, r, NULL);
 }
 
-static inline __must_check __signed_wrap
+static inline __must_check
 bool __refcount_add_not_zero_limited_acquire(int i, refcount_t *r, int *oldp,
 					     int limit)
 {
@@ -244,7 +244,7 @@ __refcount_inc_not_zero_limited_acquire(refcount_t *r, int *oldp, int limit)
 	return __refcount_add_not_zero_limited_acquire(1, r, oldp, limit);
 }
 
-static inline __must_check __signed_wrap
+static inline __must_check
 bool __refcount_add_not_zero_acquire(int i, refcount_t *r, int *oldp)
 {
 	return __refcount_add_not_zero_limited_acquire(i, r, oldp, INT_MAX);
@@ -277,7 +277,7 @@ static inline __must_check bool refcount_add_not_zero_acquire(int i, refcount_t
 	return __refcount_add_not_zero_acquire(i, r, NULL);
 }
 
-static inline __signed_wrap
+static inline
 void __refcount_add(int i, refcount_t *r, int *oldp)
 {
 	int old = atomic_fetch_add_relaxed(i, &r->refs);
@@ -383,7 +383,7 @@ static inline void refcount_inc(refcount_t *r)
 	__refcount_inc(r, NULL);
 }
 
-static inline __must_check __signed_wrap
+static inline __must_check
 bool __refcount_sub_and_test(int i, refcount_t *r, int *oldp)
 {
 	int old = atomic_fetch_sub_release(i, &r->refs);
-- 
2.34.1


