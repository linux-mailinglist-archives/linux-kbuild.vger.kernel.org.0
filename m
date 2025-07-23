Return-Path: <linux-kbuild+bounces-8110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A7B0FB0C
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 21:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270841C84DFF
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 19:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC65230BCC;
	Wed, 23 Jul 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2r+F18Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6D22FF37;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753299731; cv=none; b=jr9ZVTvQWZOlpCR+rCiM8up2nx03EY2NuoqkfAZDs6nKDotJTxmVSArQusD/MvnxFhKsaGchk6EWugJ6D1OK85wzZmjopTpnlGFZKhvQvAF8yDj15drbdErNZ7JSppSz9RBzlRDzjBC5RRwNV37Y1pCkzXKD7asaRPlx4RJ9Jk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753299731; c=relaxed/simple;
	bh=8DgMDOVyi1UQysuCYqsGqAUmquXWykBR0aOhtrr7Gzk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=JVfnOKYIgxBMXvOFPfM+7WJB+RkewHKombRcALffCZWKRean+GcdHTbvMe5eDhiruaPRLv/X6hBkLdbE3qXnMi/NYlAu0F/SjfCFjE9Cv+bQY0sTv7+Qm6qWWLvLLtVx986mppAYfx3R/wsp5qTsHKi4akpy0WPzjgpFlmkyTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2r+F18Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1AAC4CEF7;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753299730;
	bh=8DgMDOVyi1UQysuCYqsGqAUmquXWykBR0aOhtrr7Gzk=;
	h=Date:From:To:Cc:Subject:References:From;
	b=X2r+F18Z9m3yHS1D9k7y30vYa3RdkRc06p+51Uoj3CMJNgZbJPZMQ1FghD3Z3311G
	 KITcfLQS6LGJ+Bw0BbdqiAPfqPjFHIJkAWFv6yPOzaMR7B+jVUYj2a1dF72t82ZPLt
	 4dh6QM3Rr5Gk4FAjgHoGTd5zf4u52aLdOZRoOC1tU9BZQ6hY3CipIbgakWI+BXncw6
	 dEo164H1Cr1c0QmoL2r5pVfPLaJR8pGDT5lnuEQI6CZhF4YUXOP/OhlpNjaeAI3e3v
	 3jWYEUe3ZgxbUmTsV5Gg6eHZ2U1vYlgYRXKM2KAmCkKtw2GXZ/yGbQD5hcRu1CMtcJ
	 83z3B1cwmItPA==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uefLw-00000000QZW-1413;
	Wed, 23 Jul 2025 15:42:12 -0400
Message-ID: <20250723194212.103057866@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 23 Jul 2025 15:41:44 -0400
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
Subject: [PATCH v4 3/4] tracepoint: Do not warn for unused event that is exported
References: <20250723194141.617125835@kernel.org>
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
 include/linux/tracepoint.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 2b96c7e94c52..8026a0659580 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -223,7 +223,8 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #ifdef CONFIG_TRACEPOINT_VERIFY_USED
 # define TRACEPOINT_CHECK(name)						\
-	static void __used __section("__tracepoint_check") *__trace_check = \
+	static void __used __section("__tracepoint_check") *		\
+	__trace_check_##name =						\
 		&__tracepoint_##name;
 #else
 # define TRACEPOINT_CHECK(name)
@@ -381,10 +382,12 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
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



