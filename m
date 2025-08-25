Return-Path: <linux-kbuild+bounces-8609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF51B34F96
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 01:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F1F1B26714
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6B52BDC3B;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyh5Bsl6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E2D1E32DB;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756163621; cv=none; b=lpyz2LpmCFCUF3pbOr8AKcrX3T8HhOwCIx0qL62pB6Or/LQ0rxLGzL9WptL5gHAIz17k3V+V9xUnY94wFRrRtnWtn06ioG69GzS7qG6g3oRng00z4AjiFn26OCUxVUwQA5P4i4giysqEgmyZgdxMGsJkIyQUmiDB0tQv7LnRblo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756163621; c=relaxed/simple;
	bh=9c9LXEjWXPYqkxhiHiDfT2diHN1UOnXZ4bqHvP5tpW8=;
	h=Message-ID:Date:From:To:Cc:Subject; b=g7obqdDNaRczVfCFKyi2mEGwJRWO5wpJxW3CFV+/+MpCLEOVQ3AOmnP3oDhMHdZhdJgc7f2SwAGPqw2eQKg7zjplalfOGyHBnM2jVg+9ixCuR9M/OEAQF963nxQyOxugst6HHuHrUb83IMLyXLMB6asIXef6AR8Z+qlPMjur5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyh5Bsl6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15527C4CEED;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756163621;
	bh=9c9LXEjWXPYqkxhiHiDfT2diHN1UOnXZ4bqHvP5tpW8=;
	h=Date:From:To:Cc:Subject:From;
	b=cyh5Bsl6S5dfeQR4+Y19G4yKBVJ4WhvbNDepdX34MMGXwoEPuHiV9epxiP4gWhI5q
	 u2BdJ+4fo3egaIR+m9jR2jwkBWEV4o9v45FyG24duwTVnUTrWi2Y/i3/KSRfP2J45m
	 faJXSWSLEyEJkDJpBC8HCuXhsEprsJIK4sKsPekzVUQIZHhKerAxUxawVFEtG0JMKB
	 VLDzyuoNNIBh9NaC6j2bC+gOzbaYQfwwlO70hhQSNcICYmR43IFLmaixKLowpgRx/9
	 8bEffBuw/1+fA7ApVBWZR+IAeQK7y369+6EweDlcXNQSXJwVqFMEw7CbjPtbzgI1D9
	 +o8nTdHWwQeIg==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uqgNv-00000002tFE-2Nvf;
	Mon, 25 Aug 2025 19:13:55 -0400
Message-ID: <20250825231301.433412523@kernel.org>
User-Agent: quilt/0.68
Date: Mon, 25 Aug 2025 19:13:01 -0400
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
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 0/3] tracepoints: Add warnings for unused tracepoints and trace events
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Every trace event can take up to 5K of memory in text and metadata regardless
if they are used or not. Trace events should not be created if they are not
used.  Currently there's several events in the kernel that are defined
but unused, either because their callers were removed without removing the
trace event with it, or a config hides the trace event caller but not the
trace event itself. And in some cases, trace events were simply added but were
never called for whatever reason. The number of unused trace events continues
to grow.

This patch series aims to fix this.

The first patch moves the elf parsing out of sorttable.c so that it can be
used by other tooling.

The second patch creates a new program to run during build called
tracepoint-update (note this may be extended to do other tracepoint
modifications in the future). It also creates a new section called
__tracepoint_check, where all callers of a tracepoint creates a variable
that is placed in this section with the name of the tracepoint they use.
The scripts/tracepoint-update.c is used to find tracepoints that are defined
but not used which would mean they would not be in the __tracepoint_check
section. It sorts the names from that section, and then reads the
__tracepoint_strings section that has all compiled in tracepoint names. It
makes sure that every tracepoint is found in the check section and if not, it
prints a warning message about it.  This lists the missing tracepoints at
build time.

The third patch adds EXPORT_TRACEPOINT() to the __tracepoint_check section as
well. There was several locations that adds tracepoints in the kernel proper
that are only used in modules. It was getting quite complex trying to move
things around that I just decided to make any tracepoint in a
EXPORT_TRACEPOINT "used". I'm using the analogy of static and global
functions. An unused static function gets a warning but an unused global one
does not.

Changes since v6:

- Fixed cut and paste error of elf_map_long_size() using wrong field

- Fix typo on comment (Randy Dunlap)

Steven Rostedt (3):
      sorttable: Move ELF parsing into scripts/elf-parse.[ch]
      tracing: Add a tracepoint verification check at build time
      tracepoint: Do not warn for unused event that is exported

----
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  12 +
 kernel/trace/Kconfig              |  10 +
 scripts/Makefile                  |   6 +
 scripts/Makefile.vmlinux          |   2 +
 scripts/elf-parse.c               | 198 ++++++++++++++++
 scripts/elf-parse.h               | 305 ++++++++++++++++++++++++
 scripts/link-vmlinux.sh           |   4 +
 scripts/sorttable.c               | 477 +++-----------------------------------
 scripts/tracepoint-update.c       | 232 ++++++++++++++++++
 10 files changed, 804 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h
 create mode 100644 scripts/tracepoint-update.c

