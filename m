Return-Path: <linux-kbuild+bounces-9183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7634BE0A8F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 22:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF76D5811E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 20:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886C330DEAF;
	Wed, 15 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNiyQX1K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F893090FD;
	Wed, 15 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760560756; cv=none; b=GCzyMo0tPGzTXvHN4/1flzYZ+N522Sh/dLGH173FgBjZImN0s9Ybxc/iEmfqL87cQUjk4HNqAp8hkq8kkCouACSyk8kG0roEHxMgOjNMVO0JGZjS1hlQ+p/9Bado172APrn0Ly8tvawUxYrFTman/ej5bBlUDAkZXUF3nUAU3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760560756; c=relaxed/simple;
	bh=tVjs23gqUgAWE2MiXamRYt9GT6XjakZVzHOuxPBxOr4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=tWRAG4vK8IRrQkr+cWUDiVjcocBx3+xyG/B2yujMVumn4eKDoWljT++C4lGFfx6InfyTuk91nXap/Hc5ijpv3mkdu05nY3QXpys+0+Se08FYEHE799OnQ2e7TjNr23q3l/tlWjJiOuLf2odGbK8YqIhruU3ydEbpFy632VrDTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNiyQX1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018F8C116B1;
	Wed, 15 Oct 2025 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760560756;
	bh=tVjs23gqUgAWE2MiXamRYt9GT6XjakZVzHOuxPBxOr4=;
	h=Date:From:To:Cc:Subject:References:From;
	b=PNiyQX1KChfAgBcM2t+5mFDcQLmHnsgmwgPnmTzyjYqnydteqldbYk0D/HF5j+ihB
	 kCsTXyQysyyUFAcpuAd2HTJ5BEyI5DpPOTfv+242qD/W/hCVWSUoWhQzA8Fp8Myd2E
	 P4v75W/XDqVFgz+o4/fXwkDdGns4TGBf+MU637DvoF7Ge+ywYKOfKo6rOXmjqUaB4z
	 7uvFNvs1hy7IkW+JkZ94qU7Cl22Ym9hqAOfZpvWVEyHmiBMPCRrDptyE8XY8EGChUg
	 RVgKethMlEj8g4uQd0GZ3OJ58Nb9sF8J+IrxtWY3644ykWP8P5dpCQyEIBNFyz6ZRa
	 n8cuPq0E5FrkA==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1v98HM-000000015ws-3fH6;
	Wed, 15 Oct 2025 16:39:24 -0400
Message-ID: <20251015203924.731213165@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 15 Oct 2025 16:38:46 -0400
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
Subject: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for modules
References: <20251015203842.618059565@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

If a modules has TRACE_EVENT() but does not use it, add a warning about it
at build time.

Currently, the build must be made by adding "UT=1" to the make command
line in order for this to trigger.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/Makefile.modfinal   | 7 +++++++
 scripts/tracepoint-update.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 542ba462ed3e..6f909979af91 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -28,6 +28,12 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
 .module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),"")
+cmd_check_tracepoint = ${objtree}/scripts/tracepoint-update $<;
+else
+cmd_check_tracepoint =
+endif
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
@@ -57,6 +63,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
+	+$(call cmd,check_tracepoint)
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
 
diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 6ec30f39d0ad..7e068de9c7f1 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -188,6 +188,13 @@ static int process_tracepoints(void *addr, char const *const fname)
 		}
 	}
 
+	/*
+	 * Modules may not have either section. But if it has one section,
+	 * it should have both of them.
+	 */
+	if (!check_data_sec && !tracepoint_data_sec)
+		return 0;
+
 	if (!check_data_sec) {
 		fprintf(stderr,	"no __tracepoint_check in file: %s\n", fname);
 		return -1;
-- 
2.51.0



