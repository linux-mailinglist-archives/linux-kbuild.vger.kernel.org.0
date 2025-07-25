Return-Path: <linux-kbuild+bounces-8153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61EB116B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 04:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C221174F6D
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 02:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913D1233D9C;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axrZpQ0u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621BF2E371C;
	Fri, 25 Jul 2025 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753411929; cv=none; b=Ks8XdSYEhMnhylrSvUttYwS/8qNXfxwDgzZW8+bTCzMS48lBxxJBQQxHghEF0/KAlgh3Tz0FsAJ9zxhZINsCNgNlvAQUWikzXFa/p+N2JMJSjeQGYuu6dpnOUrYjaT/uU9NT6q0bOSRIPba3sDuk81Ktc9qFgHxdyAevbQpm6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753411929; c=relaxed/simple;
	bh=R0Vf0/62xTyA9egbPRVH/2L8oOUFCF5pph8LJHWXu9o=;
	h=Message-ID:Date:From:To:Cc:Subject; b=WOGQmLWnaS89K0Zi3ZEDPJ+4L4LMEp26GLC7WyGcQyKRJUgZNC668npO9JMnalzfNbGI2TM7mAQYAjFO356eHD/J4ri/PXUIQX6O13cc0e+iGTi/7/u7VN1p6keFiyD6z2ly6m50DX0PlR63jPwajiQ9xrA8VNmqkG3/QsmJ9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axrZpQ0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95C9C4CEED;
	Fri, 25 Jul 2025 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753411928;
	bh=R0Vf0/62xTyA9egbPRVH/2L8oOUFCF5pph8LJHWXu9o=;
	h=Date:From:To:Cc:Subject:From;
	b=axrZpQ0uHLxDpAF+6IhpbsFBvd3QuDlDOtFwZuEjMv5jCzX0Trt2NJ7nqY+fe47Aq
	 GLfuDb7k3MRWK6sIptP2u7HFCQUTgB1S6Byi0A9DIA6I6XL8y0qMvYdXVn5IgRpeRi
	 rF8+oN2OIY5oFdrSCToJD/Uvnyo3ZLCu212bpuLfb0zypU9ueLe1qYhNUAqUl4YDve
	 JMfp1+peOkHvJONGKx1v9WoS3eBSUKd0TAXolMoPoexPEjetMhRaLSe5pA8KSjRzy4
	 DpIuFnVJJefEg9k3lQeCZp2myZXifFsXfnb0TENC/bqeXbZC+VooYJOMK3Sfike2k3
	 MpHUAteCREb1g==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uf8Xd-000000010nu-0auA;
	Thu, 24 Jul 2025 22:52:13 -0400
Message-ID: <20250725025149.726267838@kernel.org>
User-Agent: quilt/0.68
Date: Thu, 24 Jul 2025 22:51:49 -0400
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
Subject: [PATCH v5 0/3] tracepoints: Add warnings for unused tracepoints and trace events
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

The first patch moves the elf parsing out of sorttable.c so that it can be
used by other tooling.

The second patch creates a new program to run during build called
tracepoint-update (note this may be extended to do other tracepoint
modifications in the future). It also creates a new section called
__tracepoint_check, where all callers of a tracepoint creates a variable
that is placed in this section with the name of the tracepoint they use.
The scripts/tracepoint-update.c is used to find tracepoints that are defined
but not used which would mean they would not be in the __tracepoint_check
section. It sorts it, and then reads the __tracepoint_strings section that
has all compiled in tracepoint names. It makes sure that every tracepoint is
found in the check section and if not, it prints a warning message about it.
This lists the missing tracepoints at build time.

The third patch adds EXPORT_TRACEPOINT() to the __tracepoint_check section as
well. There was several locations that adds tracepoints in the kernel proper
that are only used in modules. It was getting quite complex trying to move
things around that I just decided to make any tracepoint in a
EXPORT_TRACEPOINT "used". I'm using the analogy of static and global
functions. An unused static function gets a warning but an unused global one
does not.

Changes since v4: https://lore.kernel.org/linux-trace-kernel/20250723194141.617125835@kernel.org/

- Took out the last patch that updated trace_ftrace_test_filter boot up self
  test as it was agnostic to the rest of the patches. I just queued it up by
  itself.

- Added elf-parse.c that takes the elf parsing code out of sorttable.c so
  that it can be used with tracepoint-update.c.

- Use the tracepoint name instead of the pointer to map the checks to the
  tracepoints (Mathieu Desnoyers)

- Create a new tool "tracepoint-update" instead of hacking sorttable

- Move the __tracepoint_check into the discard section so it is never
  loaded into memory. (Linus Torvalds)

- Parse the vmlinux.o instead of vmlinux as the discard section is removed
  between those two steps.


Steven Rostedt (3):
      sorttable: Move ELF parsing into scripts/elf-parse.[ch]
      tracing: Add a tracepoint verification check at build time
      tracepoint: Do not warn for unused event that is exported

----
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  12 +
 kernel/trace/Kconfig              |  10 +
 scripts/Makefile                  |   6 +
 scripts/elf-parse.c               | 198 ++++++++++++++++
 scripts/elf-parse.h               | 306 ++++++++++++++++++++++++
 scripts/link-vmlinux.sh           |   4 +
 scripts/sorttable.c               | 477 +++-----------------------------------
 scripts/tracepoint-update.c       | 217 +++++++++++++++++
 9 files changed, 788 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h
 create mode 100644 scripts/tracepoint-update.c

