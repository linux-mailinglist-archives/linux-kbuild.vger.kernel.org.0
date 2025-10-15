Return-Path: <linux-kbuild+bounces-9180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD1BE0A86
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 22:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F8B94E535F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 20:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732BA30C630;
	Wed, 15 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJP43uA8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C88306B33;
	Wed, 15 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760560756; cv=none; b=gLmA/SFuU2NpcxNT9bpfbMZcdijbqZNuCAxmCqjjvg3e1k8mKKmJBD/93SeBGem1zyi/VFTSQv6y1XCQfM9T+1v7uwdXV+yvp1P8zMfHSFeeEW/OVPJ4glshFnYWR5c9aNVGVcflMTwowdSuCBNBMV8hSFgFtxm4sy/bwS6Dcgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760560756; c=relaxed/simple;
	bh=Vzi5WNSJgKyG4HPrKMsBmHSReHMUffHQWeN3x0XJSkM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=OxeuBMTNl76dEWEuFbYluQF2jIqW+M0qEMNu2EmttyjQXT9eyBGe2LZqD7brsZZfY1ymBOt8I+TllE3W81722g6Qez8sO0TC2eNthowQgUUZbK5NcOoWhoKKPXPwEFBmZmeEZn9keOKm0Qwrzvq8cwGPCxlT14lUW6sR7OFxo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJP43uA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB3CC116D0;
	Wed, 15 Oct 2025 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760560755;
	bh=Vzi5WNSJgKyG4HPrKMsBmHSReHMUffHQWeN3x0XJSkM=;
	h=Date:From:To:Cc:Subject:References:From;
	b=SJP43uA8KY7awA0Ic4cbeVSwwDa2b+eShtL4Cx3Dhb5kjo3yZ9XQEPeuPaHeBpPR4
	 hZ9Nut9ta0nKrRfPba9vZrLfciZga6pz/oDICvGfQXsUefBjO8bSpIBbwoAHlttqF7
	 hLhyPHiLAHKziXdYmI1ZSHibhmGCgBnZj9hSVUfgo3WPr437ZC/2vCIYdKvKmm9zdk
	 uUdi/i6kZgx7wFPUFV3F6wep2NDJ7mdunwAw3d1kZ9Y1mIYnVl0geErqgpruUR/AaX
	 NpEy/h90gHwDHy9d4JW0ztzYy6Fg6DQKBoZMwkPG1VJ9fluOyRM4lsNY55VMH5XHfL
	 lYPWd5lQ4Dvkg==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1v98HM-000000015wO-2v8Y;
	Wed, 15 Oct 2025 16:39:24 -0400
Message-ID: <20251015203924.555052453@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 15 Oct 2025 16:38:45 -0400
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
Subject: [PATCH v9 3/4] tracepoint: Do not warn for unused event that is exported
References: <20251015203842.618059565@kernel.org>
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



