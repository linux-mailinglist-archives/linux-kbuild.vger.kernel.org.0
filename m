Return-Path: <linux-kbuild+bounces-12416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBr3NzD7y2mcNAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12416-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:49:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3603936D347
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A69A31A2E1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4263426EC9;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqAi4pN1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5652426686;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=PnbO255MRcW+aRP4ryirODdgsKypg/t2BycE/ZK6yRzO9tBcwQ0e3CqejguL//uEyT1nWX0jX3nwLwYXakZnRkObzYtR/qUfV0jFkLjIGeaO560HPDayFiuj4f5f916UtogMXt5tmEbZvbO4+xM3sSLWsoMiQywkZSy3KCSxTjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=a4JG7usT6Z6N0Znenn9HJ2Ff5uUsHYvIsmUVVM1ha74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3uNRHeQL6hciqVKt9AJQIHfRZgZ21+yHWFzpqTkcftt7qWRahBHkNTkvSmhz5eq6/QTDfTpSCG7A6A4yiRk2xwLeL5L9zK2JHKR5wbUgy2k4UOYqFhKBKWGkVyCu7DZm7XZMNXxvMq+PPGJowk4xn7o5tWYOywPpijfv84g9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqAi4pN1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721D1C4AF10;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=a4JG7usT6Z6N0Znenn9HJ2Ff5uUsHYvIsmUVVM1ha74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uqAi4pN1Z8ucCsiUu+1eUEmYdhAcjaNzGIJbAW+vfqMgV8q3KsXOGzY9mWLYYBh4X
	 ZQmhGSdJI0TaVO58Lqu8FphqRR/iCQuxsIEoFxRTMV10UPeK1QpZHaoQc6t4W1XQkq
	 BFU35lt9z23/4W+IlSN/mxlZGuzkQtOetnlmjbx7J4KDGU1y1i09LU3wc+GH515fgH
	 Ln57eaoQYAeAdygThC3LXzzmc3niIpq/H6kXByGfjh4w6u/KVwFJYl4klVEYZPDgNk
	 SK8qHE5w7mFovWtXo0waaUNjsVuo8A08pE+SHHf1H908opsLv2laztVDYGj754m/W8
	 SQZuSHzyfBFTA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nicolas Schier <nsc@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
Date: Tue, 31 Mar 2026 09:37:23 -0700
Message-Id: <20260331163725.2765789-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331163716.work.696-kees@kernel.org>
References: <20260331163716.work.696-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375; i=kees@kernel.org; h=from:subject; bh=a4JG7usT6Z6N0Znenn9HJ2Ff5uUsHYvIsmUVVM1ha74=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzgZ57sa8O8X3MkZ/Vz6c6bB4oNsS4PMX3XHaUXdd 3ZlaXrbUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBG3aEaGzeJcdxR3hV4+v/KV nrJlaC3f6y/mnHum/TX2kJ0qnP/oCcMfnoIja5QXO+2M6nzmfkX759RuaybtVE0Zge6GW/u+tpi xAAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12416-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3603936D347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While Linux's use of -fno-strict-overflow means that all arithmetic
operations have a defined behavior (2's-complement wrapping), there
isn't a way to unambiguously specify if a given variable was designed
or intended to wrap around by the author.

Introduce explicit trapping and wrapping types for all bit widths
including architecture word length (i.e. "long"), signed and unsigned,
for use going forward for unambiguous arithmetic, now available via
Clang 23+'s Overflow Behavior Types[1] (CONFIG_OVERFLOW_BEHAVIOR_TYPES=y).

Bike shedding time! How should these be named? We already have the short
bit width types, named as: {u,s}{8,16,32,64}. We need to construct new
type names that also indicate their overflow behavior: "trapping" or
"wrapping". And we need to capture the "architectural word" length type
too (i.e. what "unsigned long" or "size_t" captures).

Whole word addition:
- Pro: Unambiguous
- Con: Long. E.g. suffixed "u16_trap", or prefixed "wrap_u16"

Single letter addition, "t" for "trap" and "w" for "wrap":
- At the end: but "u8t" looks like the "t" is "type", like "uint8_t".
- At the front: but "wu8" looks like the "w" is "wide", like "wchar_t".

Current straw-man proposal is single letter suffix because it vaguely
felt like the least bad of all choices, and they should be short or
everyone will just continue to type "int". :)

Link: https://clang.llvm.org/docs/OverflowBehaviorTypes.html [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Justin Stitt <justinstitt@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Thomas Weißschuh" <thomas.weissschuh@linutronix.de>
Cc: <llvm@lists.linux.dev>
---
 include/linux/types.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/types.h b/include/linux/types.h
index 7e71d260763c..786eb2c9775f 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -94,6 +94,30 @@ typedef unsigned int		uint;
 typedef unsigned long		ulong;
 typedef unsigned long long	ullong;
 
+/* Trapping types. */
+typedef u8 __ob_trap		u8t;
+typedef u16 __ob_trap		u16t;
+typedef u32 __ob_trap		u32t;
+typedef u64 __ob_trap		u64t;
+typedef unsigned long __ob_trap	ulongt;
+typedef s8 __ob_trap		s8t;
+typedef s16 __ob_trap		s16t;
+typedef s32 __ob_trap		s32t;
+typedef s64 __ob_trap		s64t;
+typedef signed long __ob_trap	slongt;
+
+/* Wrapping types. */
+typedef u8 __ob_wrap		u8w;
+typedef u16 __ob_wrap		u16w;
+typedef u32 __ob_wrap		u32w;
+typedef u64 __ob_wrap		u64w;
+typedef unsigned long __ob_wrap	ulongw;
+typedef s8 __ob_wrap		s8w;
+typedef s16 __ob_wrap		s16w;
+typedef s32 __ob_wrap		s32w;
+typedef s64 __ob_wrap		s64w;
+typedef signed long __ob_wrap	slongw;
+
 #ifndef __BIT_TYPES_DEFINED__
 #define __BIT_TYPES_DEFINED__
 
-- 
2.34.1


