Return-Path: <linux-kbuild+bounces-9239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17770BF97F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 02:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E29134E6CEC
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 00:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9481D5CEA;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rqzm/YyG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9A76025;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093870; cv=none; b=hktmPYbKSPxcvY2UYZUqK9KcqKjXlG68y7glzoxPADlddbeOchWpoKY2RqRfDmmQrCB8lyX2AjkTJFy/EoLrnHyHhXsI2wmZnW72wodOh/IlBK6dXL7ITbEbd6bXF9L6yym6Je1gdYUu7WACIzmduOOJfZbiHUmHhnuihXnmINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093870; c=relaxed/simple;
	bh=gr5rO+ucHH2Xhpa6kqotEVBRGlgtbhDPRr2EzQYyVjk=;
	h=Message-ID:Date:From:To:Cc:Subject; b=UkFz14T7hK4aRqgBt1XqEenkYkaLLppONCYTtV6Ii+NYyYK5eVqigZgJGBmXT9Au3DJSS4ou+XEzbs9FtoaAING1pLRvF0LleAJsabZHj5IeC+c1XeJwLZz3zMZv+AgRgwc4irgvFMIyPGaqyM4miLCL8yd6W2zy40CoosuqWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rqzm/YyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDE7C4CEFD;
	Wed, 22 Oct 2025 00:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761093869;
	bh=gr5rO+ucHH2Xhpa6kqotEVBRGlgtbhDPRr2EzQYyVjk=;
	h=Date:From:To:Cc:Subject:From;
	b=Rqzm/YyGtXsMB1dK1YJnSHujShTgNxHVl4jn9lKIZMgP6t3iqs9f6RbPtz6lLhe3S
	 EP9iVJMo9aqRqHKCRmBs6GY3FUoXZ6cf2rPlUXBs04iHzu5M0Vl9bxhd/+dCSlSxa1
	 dobsmguLPj7ZrXOILgzdQXpzytdn3qd1DDh5E/7FJ3C2yVv2MXG3p9KtnipTdZHUTE
	 iRgY//hn4ZOt8FiYWaXPCUhLkFxbpXAIIy0IUqRVNQRDnNk44ZeQzshwruaisNn+iJ
	 3l2H2tBmT+a3bTfi5tFaABnnex+H/3FhGRFZwCERzfK+UxrEkIuN1m6fnXU0RsaMdX
	 +lHkbBxuUnYWQ==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1vBMyC-00000002M7f-32Hr;
	Tue, 21 Oct 2025 20:44:52 -0400
Message-ID: <20251022004338.731044739@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 21 Oct 2025 20:43:38 -0400
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
Subject: [PATCH v10 0/5] tracepoints: Add warnings for unused tracepoints and trace events
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

The last patch triggers warnings when a module defines a tracepoint but
does not use it.

The fourth patch updates the tracepoint-update program to handle modules.

Instead of hiding this behind a config option, where allmodconfig can
cause the warnings to trigger, and we don't want current warnings
to suddenly appear. Have the warnings trigger by a new make command line:

   make UT=1

This will enable the unused tracepoints warnings. Now this should not
be an issue to upstream before all warnings are removed. When all current
warnings are removed, we can then make this the default option where
it will always cause the build to warn if there's a unused tracepoint
defined. The UT=1 command line can then be removed.

Changes since v9: https://lore.kernel.org/linux-trace-kernel/20251015203842.618059565@kernel.org/

- Add backslash to end of __tracepoint_check in vmlinux.lds.h
  (Nathan Chancellor)

- Put the enabling of this around ifdef CONFIG_TRACEPOINTS as the
  tracepoint-update is only compiled when that is enabled.

- Add comment in make help that the UT=1 option is only temporary and will
  be removed when all current unused tracepoints are eliminated.

- Make updating tracepoint-update.c to handle modules a separate
  patch. This also allowed to pass "--module" to it to denote that
  the object is a module so that it can handle it differently.

- Remove use of "" in Makefile script (Nathan Chancellor)

- Use $(objtree) instead of ${obtree} (Nathan Chancellor)

- Move the update to tracepoint-update.c to a separate patch
  (Nathan Chancellor)

- Remove unneeded "else" block for cmd_check_tracepoint define
  (Nicolas Schier)


Steven Rostedt (5):
      sorttable: Move ELF parsing into scripts/elf-parse.[ch]
      tracing: Add a tracepoint verification check at build time
      tracepoint: Do not warn for unused event that is exported
      tracing: Allow tracepoint-update.c to work with modules
      tracing: Add warnings for unused tracepoints for modules

----
 Makefile                          |  21 ++
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  13 ++
 scripts/Makefile                  |   6 +
 scripts/Makefile.modfinal         |   5 +
 scripts/elf-parse.c               | 198 ++++++++++++++++
 scripts/elf-parse.h               | 305 ++++++++++++++++++++++++
 scripts/link-vmlinux.sh           |   7 +
 scripts/sorttable.c               | 477 +++-----------------------------------
 scripts/tracepoint-update.c       | 261 +++++++++++++++++++++
 10 files changed, 851 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h
 create mode 100644 scripts/tracepoint-update.c

