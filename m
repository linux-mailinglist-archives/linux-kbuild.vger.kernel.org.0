Return-Path: <linux-kbuild+bounces-5524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07506A1873C
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25FF5160668
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 21:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E821B87ED;
	Tue, 21 Jan 2025 21:21:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7423A9;
	Tue, 21 Jan 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494478; cv=none; b=ZBLzOW9Ld8evaluO5+LJ7XDMeeJ1PW4fJ16eEUB2CRIiZzOqe9w1CT3sz05QShsSZAZu6m8UVN6CCvHLiChwg4xBxeLx5hs5vzZ6XKwEmzKNlTDUHQYfuU+yikzKF0FO16a7WkKJKBP6iqIRc0nuCnN/H0j0hrYhQtNUtue5uDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494478; c=relaxed/simple;
	bh=lPXQsa70itiM+5yhxJyu8T2VWZ3WKa7FM7L1nskq2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S+J6ghV0FDwPehszETT2weY89+COuE9jri+N93CNXprm8ZUTa2Ia1dvt3HVaN5q65JdXmm/eK4NvsUVePSjF3SMZ5J0pkeu6Iq5iJd15LxaZQ+NtCykgwbE+3sapOIwZPnjNIoKg5x69wwWqO81XE9DB7sheqJ3K9LRQHA3Nc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3655BC4CEDF;
	Tue, 21 Jan 2025 21:21:16 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:21:19 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor  <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian  <zhengyejian1@huawei.com>, Martin  Kelly
 <martin.kelly@crowdstrike.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Josh Poimboeuf  <jpoimboe@redhat.com>
Subject: [GIT PULL] scripts/sorttable: Updates for 6.14
Message-ID: <20250121162119.2c3c0a4a@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit



Linus,

Updates to scripts/sorttable for 6.14:

The sorttable.c was a copy from recordmcount.c which is very hard to
maintain. That's because it uses macro helpers and places the code in a
header file sorttable.h to handle both the 64 bit and 32 bit version of
the Elf structures. It also uses _r()/r()/r2() wrappers around accessing
the data which will read the 64 bit or 32 bit version of the data as well
as handle endianess. If the wrong wrapper is used, an invalid value will
result, and this has been a cause for bugs in the past. In fact the new
ORC code doesn't even use it. That's fine because ORC is only for 64 bit
x86 which is the default parsing.

Instead of having a bunch of macros defined and then include the code
twice from a header, the Elf structures are each wrapped in a union.  The
union holds the 64 bit and 32 bit version of the needed structure. Then
a structure of function pointers is used, along with helper macros
to access the ELF types appropriately for their byte size and endianess.
How to reference the data fields is moved from the code that implements
the sorting to the helper functions where all accesses to a field will
use he same helper function. As long as the helper functions access
the fields correctly, the code will also access the fields. This is
an improvement over having to code implementing the sorting having to
make sure it always uses the right accessor function when reading an
ELF field.

This is a clean up only, the functionality of the scripts/sorttable.c
does not change.


Please pull the latest trace-sorttable-v6.14 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-sorttable-v6.14

Tag SHA1: fabf1492e45892c215eff466f80b62284f50854f
Head SHA1: 1e5f6771c247b28135307058d2cfe3b0153733dc


Steven Rostedt (15):
      scripts/sorttable: Remove unused macro defines
      scripts/sorttable: Remove unused write functions
      scripts/sorttable: Remove unneeded Elf_Rel
      scripts/sorttable: Have the ORC code use the _r() functions to read
      scripts/sorttable: Make compare_extable() into two functions
      scripts/sorttable: Convert Elf_Ehdr to union
      scripts/sorttable: Replace Elf_Shdr Macro with a union
      scripts/sorttable: Convert Elf_Sym MACRO over to a union
      scripts/sorttable: Add helper functions for Elf_Ehdr
      scripts/sorttable: Add helper functions for Elf_Shdr
      scripts/sorttable: Add helper functions for Elf_Sym
      scripts/sorttable: Use uint64_t for mcount sorting
      scripts/sorttable: Move code from sorttable.h into sorttable.c
      scripts/sorttable: Get start/stop_mcount_loc from ELF file directly
      scripts/sorttable: Use a structure of function pointers for elf helpers

----
 scripts/sorttable.c | 740 ++++++++++++++++++++++++++++++++++++++++++++++++----
 scripts/sorttable.h | 500 -----------------------------------
 2 files changed, 685 insertions(+), 555 deletions(-)
 delete mode 100644 scripts/sorttable.h
---------------------------

