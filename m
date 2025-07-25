Return-Path: <linux-kbuild+bounces-8154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6681B116B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 04:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4227175B57
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 02:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9579C2376F2;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPO2EzUC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B7639FD9;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753411929; cv=none; b=SSx3LRFH5alTALKH2kigFLAtBhqoQ4LrnHF34Q7yxVkpHxATt4XPkrG9Ms8bao7FqnjpHP41pp1YKo3jRd7m0+luWQDcxJmzGKCdCO7M7Jf/d7HHXY054pUgU3VngFYfedpZsjHoQUJRdMINjOlBBgdiDcQ5rvphwR8ttBMFIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753411929; c=relaxed/simple;
	bh=W8XstG0jag+oNtZKPzFav967dXWnZ4npIsUdDTB34mo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=a5oUGr+PFOn447d9UWo0s/E58QX+vbeyn4TWz5YW8pVw3k1z0GeR2i9SjTSyndmF4MR7l62gpwyIVmd78Uuv2hskJ56PDjQW0VkOGlf3rRb6KZU7mBdyZhj+kcZnDAyjIJktn/DhEDWlj7FTVsQMaqreYjAxWPAZvLT/6fLSIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPO2EzUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB5AC4CEEF;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411929;
	bh=W8XstG0jag+oNtZKPzFav967dXWnZ4npIsUdDTB34mo=;
	h=Date:From:To:Cc:Subject:References:From;
	b=lPO2EzUCp6TGitOy/ExRRcZgyNFCHbqvWXh2VJ2+ndGMZiNYZ3pjC1yJcejvN2bZY
	 8k3VA9oNZJxfWlGiN4Wg5K90UFph/cRKTKitvzldGvCz9VMhDx3GvabIoixtUIOUe9
	 8fU+TKCvSdgCa+mI2urzKaojIn1tsEmjyuC9o4Dn84pW63+1+ij5SGWOZQxnW4UR5B
	 Svm8XVtNjlvMrGRcdOPIUoAQyJfhkKtmrerfEi4s2VADkO26HYpxHnafW3wG/ZROPV
	 z3LTwfiI93sPYxCSkt7RgOcmGiSO6FZKPCldCjItSRMHBI0Psz39ca42W6bxj8Ry/G
	 0mHmOITt/fhhg==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uf8Xd-000000010pQ-2lsJ;
	Thu, 24 Jul 2025 22:52:13 -0400
Message-ID: <20250725025213.514260220@kernel.org>
User-Agent: quilt/0.68
Date: Thu, 24 Jul 2025 22:51:52 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
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
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v5 3/3] tracepoint: Do not warn for unused event that is exported
References: <20250725025149.726267838@kernel.org>
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
index 71d2e085c49e..ec6827d00d79 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -223,8 +223,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #ifdef CONFIG_TRACEPOINT_WARN_ON_UNUSED
 # define TRACEPOINT_CHECK(name)						\
-	static const char __used __section("__tracepoint_check") __trace_check[] = \
-		#name;
+	static const char __used __section("__tracepoint_check")	\
+	__trace_check_##name[] = #name;
 #else
 # define TRACEPOINT_CHECK(tname)
 #endif
@@ -381,10 +381,12 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
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
2.47.2



