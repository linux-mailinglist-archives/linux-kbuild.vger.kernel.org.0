Return-Path: <linux-kbuild+bounces-8097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA0B0E04A
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0BB547CCB
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 15:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8B82638BF;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utueuAUP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60E25B1C4;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197685; cv=none; b=sY0wdhFe7JVhDemzSFX96mploN3f3tEduNoF/7DKOyEbJqNJq8SFEhriochaQFvGLIgQqyJB0zL6N2zXBdwYNAwtipMmC5ZJqtHG4OMi+xfWC0fJd9oRvj6S2swLpjFHTrl1c21i3KkdFswIpUGaVlHLAf/j3v/VP8GWDqcPB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197685; c=relaxed/simple;
	bh=gOCuZvkmjwwVrNCSUeQSPcF994zEyy2TkJIMewgYLQc=;
	h=Message-ID:Date:From:To:Cc:Subject; b=Hvjn5RS1iDI6m4ZZRX5KIUHV7HGPhDWIzRC8LYtMRhRD/aXUzI6AwhQnkCQypeD1MvJakYwgagdcXK3Bv/nvlnoYvrzUIO+9YduJG5fIuYgbt+O6l/t8InBKVqV+Dv+FwtLNYnkcqSB64CwcxmNRIGT1ic7PDLyvdaUJjzvsS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utueuAUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D160C4CEF1;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197685;
	bh=gOCuZvkmjwwVrNCSUeQSPcF994zEyy2TkJIMewgYLQc=;
	h=Date:From:To:Cc:Subject:From;
	b=utueuAUPwZ9GZM3TGpEKRZKwfGCnI/a4v4upmUdDWVN+v8/xb7O9JQAvnKwjRi5TX
	 C2gqV00L3ZchlLoMJJTUvTf+EPLz9V7IHnw4E2OSiZl+HHnD8TkKodNcVUUGHP+baJ
	 6j5EmA/GwiFilD7qFoZKrVIaRxqgEUkLaHy4CLYNBnCZUNwzJh3DtGS3Nmo9s5BPP3
	 wvSE5qj64sIJyiyOgg3xeIW/FCqKi1r8db050Nhd2bbI0I2e6QGB0fwvV5oNODdBV7
	 6qjXJWAt7Kv+3MIkLArKud/gHw3eWY/FkRpkpwZULN0tU4iahzhYtdZvHX8lFAJTcJ
	 lpGMurVhBKhWw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1ueEoX-0000000AYxs-2fFC;
	Tue, 22 Jul 2025 11:21:57 -0400
Message-ID: <20250722152053.343028095@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 22 Jul 2025 11:20:53 -0400
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
Subject: [PATCH v3 0/5] tracepoints: Add warnings for unused tracepoints and trace events
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Every trace event can take up to 5K of memory in text and metadata regardless
if they are used or not. Trace events should not be created if they are not
used.  Currently there's over a hundred events in the kernel that are defined
but unused, either because their callers were removed without removing the
trace event with it, or a config hides the trace event caller but not the
trace event itself. And in some cases, trace events were simply added but were
never called for whatever reason. The number of unused trace events continues
to grow.

This patch series aims to fix this.

The first patch creates a new section called __tracepoint_check, where all
callers of a tracepoint creates a variable that is placed in this section with
a pointer to the tracepoint they use. Then on boot up, it iterates this
section and will modify the tracepoint's "func" field to a value of 1 (all
tracepoints "func" fields are initialized to NULL and is only set when they
are registered). This takes place before any tracepoint can be registered.

Then each tracepoint is iterated on and if any tracepoint does not have its
"func" field set to 1 a warning is triggered and every tracepoint that doesn't
have that field set is printed. The "func" field is then reset back to NULL.

The second patch modifies scripts/sorttable.c to read the __tracepoint_check
section. It sorts it, and then reads the __tracepoint_ptr section that has all
compiled in tracepoints. It makes sure that every tracepoint is found in the
check section and if not, it prints a warning message about it. This lists the
missing tracepoints at build time.

The third patch updates sorttable to work for arm64 when compiled with gcc. As
gcc's arm64 build doesn't put addresses in their section but saves them off in
the RELA sections. This mostly takes the work done that was needed to do the
mcount sorting at boot up on arm64.

The fourth patch adds EXPORT_TRACEPOINT() to the __tracepoint_check section as
well. There was several locations that adds tracepoints in the kernel proper
that are only used in modules. It was getting quite complex trying to move
things around that I just decided to make any tracepoint in a
EXPORT_TRACEPOINT "used". I'm using the analogy of static and global
functions. An unused static function gets a warning but an unused global one
does not.

The last patch updates the trace_ftrace_test_filter boot up self test. That
selftest creates a trace event to run a bunch of filter tests on it without
actually calling the tracepoint. To quiet the warning, the selftest tracepoint
is called within a if (!trace_<event>_enabled()) section, where it will not be
optimized out, nor will it be called.

Changes since v2: https://lore.kernel.org/all/20250612235827.011358765@goodmis.org/

- Fixed some typos in the above change log, and in comments within patches.

- Have the build warning on unused events be default off. There is still too
  many events that are unused to make a warning a default. But after all
  current offenders are fixed, I plan on making it default enabled to prevent
  new trace events from being added when they are unused.

Steven Rostedt (5):
      tracepoints: Add verifier that makes sure all defined tracepoints are used
      tracing: sorttable: Add a tracepoint verification check at build time
      tracing: sorttable: Find unused tracepoints for arm64 that uses reloc for address
      tracepoint: Do not warn for unused event that is exported
      tracing: Call trace_ftrace_test_filter() for the event

----
 include/asm-generic/vmlinux.lds.h  |   1 +
 include/linux/tracepoint.h         |  13 ++
 kernel/trace/Kconfig               |  30 +++
 kernel/trace/trace_events_filter.c |   4 +
 kernel/tracepoint.c                |  26 +++
 scripts/Makefile                   |   4 +
 scripts/sorttable.c                | 444 ++++++++++++++++++++++++++++++-------
 7 files changed, 436 insertions(+), 86 deletions(-)

