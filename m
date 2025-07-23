Return-Path: <linux-kbuild+bounces-8108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECEB0FB0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 21:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51F6582A83
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 19:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A12E22F772;
	Wed, 23 Jul 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEl9jvoY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657F1EEA5F;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753299731; cv=none; b=eJHrnJjHKMJE1Unj7/6yUXJgOJHHu2o3JpKM7Atie/wFCb0zT+n7YLS2vYWWJj3+p90TLOe0Cepu4iQEeAFCBsXAi9kNN8hXqsDdcEtDBi0E5qJb5la5w5zJcQfFcDgCzzF+wDH13aakjVXmjEt8gvTDeu59gPFt9NecjrM223Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753299731; c=relaxed/simple;
	bh=uiFhIkZy0tlTk32coNdQPuQQNKT9RuBXTy7Nj/6sDZQ=;
	h=Message-ID:Date:From:To:Cc:Subject; b=JMH6F4V9LnNdgiXSOwV5zLhRgShYaYcDqeqKHxPFIxqLee2X1t2yjaTVV+7uE7l25+6xlbZ35MYGnG+LTqE7mkgsscmKVcHJg3CyTvEccLW2nLOwH9eJFOlJh3MMbS/U7cpx0ASkhFUYHxOM2nxHmuwtf58iqQEh28LEWEympx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEl9jvoY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B144C4CEE7;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753299730;
	bh=uiFhIkZy0tlTk32coNdQPuQQNKT9RuBXTy7Nj/6sDZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=PEl9jvoYbDaLyuq5A9oQyHsWhWw69WG/NTb/khbEug2R0r7qegOZ9ZRffpBeir7Ch
	 9zJPtGEUsug3lEMNjzPgouRfKTeWdMZlHqvTH6OPBHm6LiQnk6TPLH9VScGaKH/L7P
	 7d++U55SWYDPn5mgVz/F37PsNG7xmYtYkJ9AflLZQtyXeVJJPB3nbWoEPe51X83ul1
	 uqxsen+wnUe7PMPCEyQRJDBxNT6jq3wjx/ri+ePM4xxcuGP8yL7FxZ5YbwULVPF5Wu
	 a+xsWt385AynYcHjcEElf/iSE34Osqx7VlF4RoXPn2fCGMmOI66mXYs0xv173aDELV
	 sgkUhzds+IoKA==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uefLv-00000000QY2-36MI;
	Wed, 23 Jul 2025 15:42:11 -0400
Message-ID: <20250723194141.617125835@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 23 Jul 2025 15:41:41 -0400
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
Subject: [PATCH v4 0/4] tracepoints: Add warnings for unused tracepoints and trace events
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
a pointer to the tracepoint they use.  The scripts/sorttable.c is modified to
read the __tracepoint_check section. It sorts it, and then reads the
__tracepoint_ptr section that has all compiled in tracepoints. It makes sure
that every tracepoint is found in the check section and if not, it prints a
warning message about it. This lists the missing tracepoints at build time.

The secord patch updates sorttable to work for arm64 when compiled with gcc. As
gcc's arm64 build doesn't put addresses in their section but saves them off in
the RELA sections. This mostly takes the work done that was needed to do the
mcount sorting at boot up on arm64.

The third patch adds EXPORT_TRACEPOINT() to the __tracepoint_check section as
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

Changes since v3: https://lore.kernel.org/linux-trace-kernel/20250722152053.343028095@kernel.org/

- Folded this patch with patch 2: https://lore.kernel.org/20250722152157.839415861@kernel.org

- Removed the runtime boot check and only have the build time check (Linus Torvalds).


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
unused-tracepoints/core

Head SHA1: 474058274955ba3bfec3053171cfa468e4849b5e


Steven Rostedt (4):
      tracing: sorttable: Add a tracepoint verification check at build time
      tracing: sorttable: Find unused tracepoints for arm64 that uses reloc for address
      tracepoint: Do not warn for unused event that is exported
      tracing: Call trace_ftrace_test_filter() for the event

----
 include/asm-generic/vmlinux.lds.h  |   1 +
 include/linux/tracepoint.h         |  13 ++
 kernel/trace/Kconfig               |  19 ++
 kernel/trace/trace_events_filter.c |   4 +
 scripts/Makefile                   |   4 +
 scripts/sorttable.c                | 444 ++++++++++++++++++++++++++++++-------
 6 files changed, 399 insertions(+), 86 deletions(-)

