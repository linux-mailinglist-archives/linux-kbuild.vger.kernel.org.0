Return-Path: <linux-kbuild+bounces-8612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38605B34F99
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 01:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07FB72A2ED2
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB732C1597;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/aqtjNJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39B2C08CE;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756163621; cv=none; b=KdzenONuc2b/FNsPBaCBjMdKw7n/3b5OLqwPXT78cDO8pUUa1e0j2FrxJ8JQPMseYkDA9YJjj0a+JsbsPU5iChRRDCPH+cZF/iptIQ2MIvvY2Q2kxqOK01GHfqcpVCwNeoKEiNVUbOwnRqeDGqjz3jQ54mVE9zUWFDU3CXURHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756163621; c=relaxed/simple;
	bh=6peswoOhdw7dXI0cwkW9pPp7bgdjqqT10/tl3qs06UY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rapZppVsjRE+1cD0N7tyZ0qZyFDYPimprXR83O+hpznVejwmqD4kGEe6YTApHym23YoIf7yjzpKe6f93EnolLit9gTbhUnwAS9H6WnHklvLGxUISG9L7y0rD1qbHB8xEqxyrWJlne/1Pd0bqr3JDK8hIe4aykHGGm00JloR0IZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/aqtjNJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D76C16AAE;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756163621;
	bh=6peswoOhdw7dXI0cwkW9pPp7bgdjqqT10/tl3qs06UY=;
	h=Date:From:To:Cc:Subject:References:From;
	b=l/aqtjNJ7X/5+QTZHxh8H7Kt4eB1ImWxN4Cyyqu4M8vwI01xzIDroVctFkUIXbsSD
	 N1m87czBgj1PZLQBGn/3HHXKzViJBGk0VpV8goz9xkcHc32rScMNaeovtfXyIlN17p
	 nRTg39qvBuV1wtgZ2T+JCNfNMkNB2uvY7WpGMSudsBqrU8mxwS6ING0nV+w75PKVlz
	 E+3DYemOI4KrsRoLX6GlqvRFqvH5H9ch07jGELOiBLJhEo3RdDRC7od67Rf2apXRW+
	 ovDeS0HXzDsxNnTlFJSp9WacZ7xmtfHY8oVh0UvaurOp7MOWPtngBsV/EkqW2oO0cW
	 4DkduZ1VHW2Zw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uqgNw-00000002tGj-0NLr;
	Mon, 25 Aug 2025 19:13:56 -0400
Message-ID: <20250825231355.939259124@kernel.org>
User-Agent: quilt/0.68
Date: Mon, 25 Aug 2025 19:13:04 -0400
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
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 3/3] tracepoint: Do not warn for unused event that is exported
References: <20250825231301.433412523@kernel.org>
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
2.50.1



