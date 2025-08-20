Return-Path: <linux-kbuild+bounces-8544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3DB2E453
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 19:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DE6188EEFE
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 17:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B0D26F295;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riCVKQ4u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5926B75C;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712105; cv=none; b=CC0Um6X3hZaYnTKfqZz22pOfCjorGhsZckLHmeaVHwzcPK0plc1n/pFwA+UGeGKw6bGf8/0Jc8Gmv9MFtL1MWZa4gOlojnds2ila1Xe1Kg2MFRqJUZtrgDc85VKMyxu0BqgjNHrB8YC6tZLzfKBfsDGfxLk6yGcKaAA1i3O4RKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712105; c=relaxed/simple;
	bh=PFEXvydvZEHyXRetTO6NRqrW9oqiZPFCBpP/ylw7Zvo=;
	h=Message-ID:Date:From:To:Cc:Subject; b=ixTs68i96iq8C+htP5zXQuwkGaMJaaqgLLxByAKabMONKr2cbSA7aj0iBMj0uDz+p2UEiCGH4SbfOGumR9ti0gKT8aeCecdrrRgvV8tLYOtbvOn+G5u2jsjRt0AYUggPKqu6QLM1EqjIhsoV/3/FYAYTzCRftN2zjVmtnN3mrsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riCVKQ4u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C397C4CEE7;
	Wed, 20 Aug 2025 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755712105;
	bh=PFEXvydvZEHyXRetTO6NRqrW9oqiZPFCBpP/ylw7Zvo=;
	h=Date:From:To:Cc:Subject:From;
	b=riCVKQ4uzhPejIJpN0XkjJJjHABTNU7iHMiIdDfjkCXYSZVZJ0+6u2iC4wQ/7basr
	 Ba41Fen7VgoJv5a9TPvEuGIz0qqVSwzlQjJXEjpE8+JobY6A45J/+upYl6ZFruplnc
	 DFL3LxDsk9J/wC/korBjJrNYINuz2IJdc1Ka5hJtjcemXTHnFll7v+BnK1sq/dEdFM
	 LiQNCWIWBp5hN4mJ98NSYU7SQ7rfS2ZhTy0u2zOO9G4vakAxg7DRrCEfczLNuTqSs+
	 tfabsHn7V2rf0klUhYWHYfZodOcAhKaJ2YJpxxZtbwcGQOSTXg6vMq86mk6h5WG0Pj
	 /JBWns/0iNUxw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uomvD-00000000rSh-3izi;
	Wed, 20 Aug 2025 13:48:27 -0400
Message-ID: <20250820174752.684086778@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 20 Aug 2025 13:47:52 -0400
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
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v6 0/3] tracepoints: Add warnings for unused tracepoints and trace events
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

Changes since v5: https://lore.kernel.org/linux-trace-kernel/20250725025149.726267838@kernel.org

- Removed extra blank line at end of elf-parse.h

- Fixed change log "it's name" to "its name" (Mathieu Desnoyers)

- Removed unnecessary len = strlen(str) in increment of for_each_shdr_str()

- Removed assigned but not used "count" in check_tracepoints (kernel test robot)

- Added more comments


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
 scripts/elf-parse.h               | 305 ++++++++++++++++++++++++
 scripts/link-vmlinux.sh           |   4 +
 scripts/sorttable.c               | 477 +++-----------------------------------
 scripts/tracepoint-update.c       | 232 ++++++++++++++++++
 9 files changed, 802 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h
 create mode 100644 scripts/tracepoint-update.c

