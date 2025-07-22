Return-Path: <linux-kbuild+bounces-8100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D35B0E04B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CD5AA0B2C
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 15:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048DF264625;
	Tue, 22 Jul 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMVqPpwD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AE4263F5B;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197685; cv=none; b=jowcn+bnY1DyFzqFYKHh5fbKvUVNIO0WgvIAHEgY0fyphT/3aKlbtK1OBUOFjBmz4unpl8muqurwhIum6VI9n9rnp832fvhGNm59ABXorszQeyHG4b6IYymz10IaHlSlnmNnex6lC+MqJXNBxabrDRv0M/v5zPHvTzSSbLw954E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197685; c=relaxed/simple;
	bh=8DgMDOVyi1UQysuCYqsGqAUmquXWykBR0aOhtrr7Gzk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=fTOubSAMz0DG9tUR4BJruvDyHxk6Vbii47Ej6VLjkRKQ8VCIg/X0NbFrlrf51b/D27M/XS1t2ZUB0yHE63lIGOK6bMS4W9u0CJahQH4vLd/AF7+v62gZuzBRvmQ3UZ4g3OCfakzPnuBH00VwikauRDnCfzLMT6xMP1i7cvrWnWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMVqPpwD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F107C4CEF7;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197685;
	bh=8DgMDOVyi1UQysuCYqsGqAUmquXWykBR0aOhtrr7Gzk=;
	h=Date:From:To:Cc:Subject:References:From;
	b=cMVqPpwD6CUxA//YsB4wWzvJgiE5LHObwoguRyA2Z519cVFA274MUKPeOb8SoC3iZ
	 6op5BLpPw5pvzyxWVtLY4+1Y2ptlVR/XJ3sQ9rHQo4oxQqjfgPn3CNp0dkCHet1pMH
	 s9wcFh3u3rbosRkeqBT1bOLkT+GsLc0aDLqS1TJE6hRqpDFmeEha8+wXmso70pOdN5
	 UbNnvDv/rLn0s1EsaSxUkOKlLKbTp5dBDWrBfH5614bUAz7rpH4YnUbF4OBf5hwFWZ
	 oqgJIl7obLfIdzcW8UPHKbpIW0HlC6WQBPbngjq+gp0jnGZ7oEiaLznJSVX+wPHFyq
	 85uzNC/Ghzy7Q==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1ueEoY-0000000AYzr-1Ji9;
	Tue, 22 Jul 2025 11:21:58 -0400
Message-ID: <20250722152158.166727806@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 22 Jul 2025 11:20:57 -0400
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
Subject: [PATCH v3 4/5] tracepoint: Do not warn for unused event that is exported
References: <20250722152053.343028095@kernel.org>
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



