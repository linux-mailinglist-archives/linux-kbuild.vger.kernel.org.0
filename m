Return-Path: <linux-kbuild+bounces-9179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C0BE0A83
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 22:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4B51A206CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 20:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45383306486;
	Wed, 15 Oct 2025 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH0u0Agh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B502046BA;
	Wed, 15 Oct 2025 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760560756; cv=none; b=Eky7zQg/ry9kXM1hKqtJhzXfExkz0hLcKVxQ+KKxXhEmfYUTpTqQu7b4hyPHcE38t+MEJovhh1rrygenvKpz4yqIs8JNT5PafTZuWCY8sL8Pl7/i+wnnkh28HdCC8dKDxpwWGNUz8vOg3E2jfuItZmjxFPoggDm/FFKtu0TOcFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760560756; c=relaxed/simple;
	bh=GCe9eJUn79iomx/VyEAapHyw7lvT6vcl5DCI1hWlrQw=;
	h=Message-ID:Date:From:To:Cc:Subject; b=qFkRIbQVS/xVFRZlFmk2bTF99qUt1cBojIzvJtQe3h4TnmTJ1JRpvR/f2/w5E7QR+nGlM8aMgfRrXwBSLRAKGtzZvLWqeLcRYmlT15Gl4HSzvaHXntPlSmL0LB+4ZmdTDC33TiwNYdlsmddJretWtdYIKEv0O2WjFJyjoe0h0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH0u0Agh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2A6C4CEF8;
	Wed, 15 Oct 2025 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760560755;
	bh=GCe9eJUn79iomx/VyEAapHyw7lvT6vcl5DCI1hWlrQw=;
	h=Date:From:To:Cc:Subject:From;
	b=NH0u0AghG4s38hZtEF1kWpgEvdB/k4KF9spuU+4ChTqrjJ13gGYHS0ujL1xsbG+4N
	 8O6yVN/xUHfaOg+Oxswa32CCiHI6GyHatrAhK7n/OYblJcn+ufNAxBCJnk81mNNK+j
	 TzOqlh1ij8REG0Fr6kZSt0whijUsmMgGWX+ftKQ7RRSUZW/ZpQkayIaO5LxPxELEkv
	 CQS/oPSKsgS98P2nxt2biyVCi4fhpVuQ8s4GwhQkb/gcoUuLSasUzXjZ9MRFti50T2
	 BV4+e7zKnaXzBdnS1jwJq+Qo1yyiscDw69QS6JtQcOmgxlURw0sEWOjbox90QQbLPo
	 zBjDaE0SsFN0w==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1v98HM-000000015ut-0pFv;
	Wed, 15 Oct 2025 16:39:24 -0400
Message-ID: <20251015203842.618059565@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 15 Oct 2025 16:38:42 -0400
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
Subject: [PATCH v9 0/4] tracepoints: Add warnings for unused tracepoints and trace events
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

Instead of hiding this behind a config option, where allmodconfig can
cause the warnings to trigger, and we don't want current warnings
to suddenly appear. Have the warnings trigger by a new make command line:

   make UT=1

This will enable the unused tracepoints warnings. Now this should not
be an issue to upstream before all warnings are removed. When all current
warnings are removed, we can then make this the default option where
it will always cause the build to warn if there's a unused tracepoint
defined.

Changes since v8: https://lore.kernel.org/linux-trace-kernel/20250828203555.783399758@kernel.org/

- Instead of hiding the unused tracepoint warnings behind a config
  option, which means allmodconfig will trigger it, make it a
  make command line option. Now to enable the warnings, on must run

    make UT=1

- Trigger warnings for modules as well as built in unused tracepoints.

Steven Rostedt (4):
      sorttable: Move ELF parsing into scripts/elf-parse.[ch]
      tracing: Add a tracepoint verification check at build time
      tracepoint: Do not warn for unused event that is exported
      tracing: Add warnings for unused tracepoints for modules

----
 Makefile                          |  15 ++
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  13 ++
 scripts/Makefile                  |   6 +
 scripts/Makefile.modfinal         |   7 +
 scripts/elf-parse.c               | 198 ++++++++++++++++
 scripts/elf-parse.h               | 305 ++++++++++++++++++++++++
 scripts/link-vmlinux.sh           |   7 +
 scripts/sorttable.c               | 477 +++-----------------------------------
 scripts/tracepoint-update.c       | 239 +++++++++++++++++++
 10 files changed, 825 insertions(+), 443 deletions(-)
 create mode 100644 scripts/elf-parse.c
 create mode 100644 scripts/elf-parse.h
 create mode 100644 scripts/tracepoint-update.c

