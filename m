Return-Path: <linux-kbuild+bounces-8543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8FB2E464
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 19:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C30721EBD
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 17:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C838726D4FB;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7kIQcYr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D936CE0C;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712105; cv=none; b=rLXIEFWC6tA/T62tL+FCeYmf6AyOcrpNsWniSShH9cEUZ5tpYik5bu4b3Aj9nsP9jA5kaKaSvDNigkARA4bMMweLBEMCGZBvuzK8+qU5fTzTBEmC6WrpdJSJazoYu6tMVCEumLrkNdTbZYa/wY/ugnUHsfFLcFziZGCcY0aUVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712105; c=relaxed/simple;
	bh=6peswoOhdw7dXI0cwkW9pPp7bgdjqqT10/tl3qs06UY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=UliK3kcEBNsugm+3fI0OsUK5WhWCDfplceVu3Q9qXpyZofwtL3yqcmUyuJRGlgLYFbRoe914oGvHKal1/u3M9jb+CRNpPvK/BjlM/qYd/yA79GKEYqfq427STt+Nu8Z+zg+7NqBpFyPUPFrglE4pq3JT/NPcxLo36ODfwouWQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7kIQcYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763EEC4AF09;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755712105;
	bh=6peswoOhdw7dXI0cwkW9pPp7bgdjqqT10/tl3qs06UY=;
	h=Date:From:To:Cc:Subject:References:From;
	b=k7kIQcYr4dAU3vHgI0Kg9RAqL96t50M5aDutZqH9CH2p5gvjhZAh4coACmWKLH1yl
	 uQSzDmXp2kGfZcKzEzIffLXqu/3DEaYyG81rjz6cVu9F71xelvfee1H02j2Z4NBewf
	 PhXlJUpDa2PHyqHbEbX1++TFHoEaHLnEsm0KBP7KV0LULFESg97+3frn944ajx8/jP
	 gMu9B1RlpujqH9l8G8x/c8sM+9AvYl5LRkj9wkvhibM7xXTFNqUmBZ2T3JTH4wyOe4
	 W0+V8gQb75sd8AVMtaefqb2kYiqT2fQMt+xnn8Y100kVA013OA/yAFXJ/Cn0jEW08O
	 bgHuJc9rwREpQ==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uomvE-00000000rUD-1g1S;
	Wed, 20 Aug 2025 13:48:28 -0400
Message-ID: <20250820174828.252631905@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 20 Aug 2025 13:47:55 -0400
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
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v6 3/3] tracepoint: Do not warn for unused event that is exported
References: <20250820174752.684086778@kernel.org>
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



