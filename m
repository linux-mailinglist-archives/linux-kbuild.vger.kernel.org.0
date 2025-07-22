Return-Path: <linux-kbuild+bounces-8102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEECB0E04E
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 565A9AA0CBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 15:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AF02652AE;
	Tue, 22 Jul 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lekq/KFJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0308263F5E;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197685; cv=none; b=lc6pn405ny9Gt8/1DORZ4elU15bKXwkyXBzMOsIo0jZGBNt42Xc8lyrPLJLqgog/2f81uYpoz90CBduAnJpRGceTT4TKzvLRZ6nQprlhwaXq73ymIM9Y0g1vxj8YhJHsZ3eS3RqvZGyfqYR7NewwHpGzIDLDXfTAkCYFWlMrW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197685; c=relaxed/simple;
	bh=7tiMCctQO1e8SNLVYP6Hz/phXEyg6eSp49kHjXlum+M=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rWn885unra0NfXPwiFZZPjVgwLqncbvZqZRtCInJVnck1C0xGoMrfN/V8lJUGr830LeeEvem28w9XuR/6ysu8mV+AuEYGaU6HyUWwPRDwIFThaE1Sj6qz/WTYEdseB5saLnt1CD66CqncC2YptFOQ4v9U4/hvoqdQwSDUbe1Z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lekq/KFJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80CDC4CEFC;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197685;
	bh=7tiMCctQO1e8SNLVYP6Hz/phXEyg6eSp49kHjXlum+M=;
	h=Date:From:To:Cc:Subject:References:From;
	b=Lekq/KFJcx0oQOLyvIWI9Kf0SywVd+BeAPxzeCHRBrgiz/CjQiJviluIBh44JOMJj
	 dR5H48HbWclBKpemHhlqUaSi3K0Qx2hxCV7DD8E0Vao9+HwOuDr6429JH3/B/bMW1F
	 f+1JAHjKGwNtRKExxH4sJQr8voE/0d8/B1N8bUcouo5equeAscFOqw39RI7uLJItyZ
	 P5Wf2WmvsVAFqWxpvE3OAg5fC96eqfL6NmeSp4muAM5fSyw5GYtNaoWF0lnnbHzDTv
	 4FZHHSsaoQ9bEVp9n44K8oYL8HWwXHbg50f8V2W0ir+8DaSskzK8nCDwzvr+JeiVUb
	 RGAZ8cxjPZaug==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1ueEoY-0000000AZ0M-21Cr;
	Tue, 22 Jul 2025 11:21:58 -0400
Message-ID: <20250722152158.334327422@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 22 Jul 2025 11:20:58 -0400
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
Subject: [PATCH v3 5/5] tracing: Call trace_ftrace_test_filter() for the event
References: <20250722152053.343028095@kernel.org>
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



