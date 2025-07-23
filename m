Return-Path: <linux-kbuild+bounces-8112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D7B0FB0E
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 21:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF8F7582AEA
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 19:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CA2233714;
	Wed, 23 Jul 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkPEzTXp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55893230269;
	Wed, 23 Jul 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753299731; cv=none; b=WIB4Kg4QIG414wYNY9qWFW4RlpqrR1DWRo0dz5rur6B2Yj+B82r+C4Z30TtgpOVGtqUGeQ8TwqO+32J4Bi3EuPu5acK9z+52TcJlH60lK3ycswnVC5JT8PSLZhI2fSNgf9vIF7tXEgG1lXhRISXQn1W4zip+ItEnpPu6rme//5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753299731; c=relaxed/simple;
	bh=7tiMCctQO1e8SNLVYP6Hz/phXEyg6eSp49kHjXlum+M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=htG4svef+UWiced4o6QiMTbaKwxapRcV6AxlYiFReUNmieZ25HJ7uj97jpZISGMce/1eZfiWC14wjsidJZAiF6IB2UOKG5AhOax8wymrC2dX46LO1uz7nmUNXP0VkqiJJJnYcUFTomQgTnrvhbQCnTKVsnhE+sSDHmHiZL7CGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkPEzTXp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DD3C4CEFB;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753299730;
	bh=7tiMCctQO1e8SNLVYP6Hz/phXEyg6eSp49kHjXlum+M=;
	h=Date:From:To:Cc:Subject:References:From;
	b=nkPEzTXpP8jdMzBhUF9d58RbXc/NAF+74ceod93dWI5aKl5F4XPBvcRKs5db8LOXO
	 2dwU+77IQEMO4lNXDLqSAxB8cqzMcAnZbafodtr1BFGpv91RRqMhF4/SQtML1OynGG
	 subJrMlYEpY7fCyD/eg/+qeAURycQxI1TMXo+n9fIEMGhDJ6eaf9CapD1Iw5d/6nKX
	 JhYe1S4xvuXQxObYKIN79OuFiG5ucDWUaHoiX6R4XP4pAxZRm7refZeXrK06KeW4YE
	 p+HDbq61L2KFohqOEj8PQiyTAerivxztHmigWk9oMWOkcQqIezchwS44PQMCJFiz1m
	 tUuxV1X4a5Lgg==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uefLw-00000000Qa0-1l5O;
	Wed, 23 Jul 2025 15:42:12 -0400
Message-ID: <20250723194212.274458858@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 23 Jul 2025 15:41:45 -0400
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
Subject: [PATCH v4 4/4] tracing: Call trace_ftrace_test_filter() for the event
References: <20250723194141.617125835@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The trace event filter bootup self test tests a bunch of filter logic
against the ftrace_test_filter event, but does not actually call the
event. Work is being done to cause a warning if an event is defined but
not used. To quiet the warning call the trace event under an if statement
where it is disabled so it doesn't get optimized out.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 3885aadc434d..e4581e10782b 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2900,6 +2900,10 @@ static __init int ftrace_test_event_filter(void)
 	if (i == DATA_CNT)
 		printk(KERN_CONT "OK\n");
 
+	/* Need to call ftrace_test_filter to prevent a warning */
+	if (!trace_ftrace_test_filter_enabled())
+		trace_ftrace_test_filter(1, 2, 3, 4, 5, 6, 7, 8);
+
 	return 0;
 }
 
-- 
2.47.2



