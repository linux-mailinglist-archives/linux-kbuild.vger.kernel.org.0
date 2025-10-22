Return-Path: <linux-kbuild+bounces-9244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 917AFBF97FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 02:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C72A14E7E9A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 00:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA91ACEDF;
	Wed, 22 Oct 2025 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWUmSLEM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF451DEFE7;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093870; cv=none; b=Gxe9zHQ3pxsQEaX1snY9OnKIdv+stNBDA96LfOR5uRLQUpTl0MGV28nf0RlsIpgDKqLgPqjcoso1NNY+WAdIBU7AnGx4EH7Lmpxd9YiGTGMsGVv6ZUsrtT3jlpWXMAOtJ1AVw93xcSCSibp8cbpiEYndt2oVPaPnOnV47VRHt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093870; c=relaxed/simple;
	bh=MHe/CvUsaKyxRjUn5u7Tr6Y1XXg3++LMa8dD37XpM6I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=JWJRwq5KaS1zzCIcg3tGprF+9kHIrWiC0pYlBUFRQB/nkxXb2KTSvfDBFdsyyv01L2B2tZnW/PnCNDrnf9h+Q1VgaqPA2QkCIu93NjngAvdQKFNB8jwuMXiEeZi+k0D5362igDjkCjTfXRESGdmSAgJmU6Vzm0rKpzGa1S3piJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWUmSLEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEC1C4CEF1;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761093870;
	bh=MHe/CvUsaKyxRjUn5u7Tr6Y1XXg3++LMa8dD37XpM6I=;
	h=Date:From:To:Cc:Subject:References:From;
	b=LWUmSLEMHXWpDoveSyjdr4hA1ttXlVHCi4EtJBahYg382ojG1jSCUBzBDOb6OJkQo
	 DuKue6qf++WYe4nJbCbZXhiI1fLDL8lUIyekCs+9lgEBHqe3yqScNRLpE2yOYyQmrn
	 ATl8chslCDXJ0zS3R6h5seKh09UAr/xoXKgIMQmfH/Mxu8KQtU6mTIf0hNmiOkBJfT
	 eQnr7/YPobK87w92+iVC2stFiph6k0LRn7H3EeRE9y28iLWZPpddTxPY1SUNMYe7xp
	 aBR9YPeqGHHE5UKn8UdImLmht4Esc1XydL3QQjHFJ4Rol2xpaFQijhnDHn2Wj2J5MC
	 ti20jXyKkahYw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1vBMyD-00000002MA8-2NRx;
	Tue, 21 Oct 2025 20:44:53 -0400
Message-ID: <20251022004453.422000794@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 21 Oct 2025 20:43:43 -0400
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
Subject: [PATCH v10 5/5] tracing: Add warnings for unused tracepoints for modules
References: <20251022004338.731044739@kernel.org>
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
Changes since v9: https://lore.kernel.org/20251015203924.731213165@kernel.org

- Remove use of "" in Makefile script (Nathan Chancellor)

- Use $(objtree) instead of ${obtree} (Nathan Chancellor)

- Move the update to tracepoint-update.c to a separate patch
  (Nathan Chancellor)

- Remove unneeded "else" block for cmd_check_tracepoint define
  (Nicolas Schier)

- Added use of "--module" parameter.

 scripts/Makefile.modfinal | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 542ba462ed3e..149e12ff5700 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -28,6 +28,10 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
 .module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
+ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
+cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
+endif
+
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
@@ -57,6 +61,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
+	+$(call cmd,check_tracepoint)
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
 
-- 
2.51.0



