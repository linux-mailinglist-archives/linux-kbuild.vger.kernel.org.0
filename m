Return-Path: <linux-kbuild+bounces-9241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E005EBF97F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 02:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB24188BA26
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 00:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBD578F51;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Frm8N5EI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB331CAA92;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093870; cv=none; b=AA4g+6o73qV2wxzXyrJuWrJ1J/IhzwYSiwghcut2pct9P1vghk7rKv9ain5l27Fcb4ki9NAyLr8/ojdd19eF/j+SC+dM9ff57/TRu4f8fLBZPlMFGXx3xh8nucEKRVGMaX1+r5pgvmWe53GMukhmLdNktxZ+nOe83JS+gffQMGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093870; c=relaxed/simple;
	bh=Vzi5WNSJgKyG4HPrKMsBmHSReHMUffHQWeN3x0XJSkM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GDfdgkMuZ4qyLOZxwnIJ/kUg5730/FjFMAOHAC7bfIYGS3I3MiOetEpD4/ZHLN6zkQRqsnpD7DAUz1trAPk0vfluhM4JKtQpLHeuqGrCBjt5J/3DpObRkX0rvfaFOqGKnGYanPtAeZ+tu4MKOFj61OLoqiebxWcomx/j8KBCfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Frm8N5EI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12731C4CEFF;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761093870;
	bh=Vzi5WNSJgKyG4HPrKMsBmHSReHMUffHQWeN3x0XJSkM=;
	h=Date:From:To:Cc:Subject:References:From;
	b=Frm8N5EI/9iUqLClObZkAURWqdH2IzhuvtbKjCzsFZXRexmR206CopQJ0Ma6UnjqB
	 C0HcoyAMZM2Yq9ECaAueCHQSrxjSlyjlH8E1Ly83UyhAixx30vXL3HhyQ7Rmy0JJLl
	 xlTlJ49yE+Y+qzqBQl+/+oRxa4JdN79ILWI3N9GIvjabpjwr4I0gNrbIu46is6zw1M
	 7Vxghqexlg9OzjJcKvBnWs1qbuLkZdjkOXJjOk/GzYd8sHGTuP7QWEjwlIsdyWA4tO
	 /ibCHMFN7teYjICvx2djyDu1fEYbVRuN2fo4t9ZWN+ZjIkhb1Jn5UwtvchnTsVteU9
	 Xq9tTCD3A8SAg==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1vBMyD-00000002M9A-0zbE;
	Tue, 21 Oct 2025 20:44:53 -0400
Message-ID: <20251022004453.089254920@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 21 Oct 2025 20:43:41 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v10 3/5] tracepoint: Do not warn for unused event that is exported
References: <20251022004338.731044739@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

There are a few generic events that may only be used by modules. They are
defined and then set with EXPORT_TRACEPOINT*(). Mark events that are
exported as being used, even though they still waste memory in the kernel
proper.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/linux/tracepoint.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 1e53d3626c78..8a56f3278b1b 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -227,8 +227,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
  * defined tracepoints are used. It is discarded after the build.
  */
 # define TRACEPOINT_CHECK(name)						\
-	static const char __used __section("__tracepoint_check") __trace_check[] = \
-		#name;
+	static const char __used __section("__tracepoint_check")	\
+	__trace_check_##name[] = #name;
 
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
@@ -382,10 +382,12 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	__DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
 
 #define EXPORT_TRACEPOINT_SYMBOL_GPL(name)				\
+	TRACEPOINT_CHECK(name)						\
 	EXPORT_SYMBOL_GPL(__tracepoint_##name);				\
 	EXPORT_SYMBOL_GPL(__traceiter_##name);				\
 	EXPORT_STATIC_CALL_GPL(tp_func_##name)
 #define EXPORT_TRACEPOINT_SYMBOL(name)					\
+	TRACEPOINT_CHECK(name)						\
 	EXPORT_SYMBOL(__tracepoint_##name);				\
 	EXPORT_SYMBOL(__traceiter_##name);				\
 	EXPORT_STATIC_CALL(tp_func_##name)
-- 
2.51.0



