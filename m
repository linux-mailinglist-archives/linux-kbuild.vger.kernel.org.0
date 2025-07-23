Return-Path: <linux-kbuild+bounces-8114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C9B0FCB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 00:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF11B188F4A0
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 22:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E459207DE2;
	Wed, 23 Jul 2025 22:27:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9453D81;
	Wed, 23 Jul 2025 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309628; cv=none; b=N8rM6+Kn0krJVAhtpR75GWDk/5chU6O4ZrEmXRKq0L3hbTvhim0QdPUQEMKxsQ/vINMZXUsuacKbtK8wrDi4nqn3wV+4AVFyeVFJrbocCQn4SDYWxXiJgBXiBc9qOaWUiMe0+UGUJsjEvhhWk7sNMxfe2M2V1Uj8OE8ra71xv54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309628; c=relaxed/simple;
	bh=t3hNtdG++q1aXc9TCV/VEj3l2V1WIBgOf8j69AXV5d4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPtJ4ppd+ypzzzETeaV9PuZM7Q03ByolGrJkkG8F49dLmHX5uFSRQKag+WA/hHR/SmwB0J7glOqmg8/5e7bZOujRYTyDyarU7tAQ/ZmPWiCTe8iGTFnj5kvilKZolBeOB6rs2uBxS4uz/BSOuJS5LHSPg3coH9+wfggJnzTVvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 2793B1A01F2;
	Wed, 23 Jul 2025 22:27:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id EAC8220024;
	Wed, 23 Jul 2025 22:26:59 +0000 (UTC)
Date: Wed, 23 Jul 2025 18:27:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint
 verification check at build time
Message-ID: <20250723182701.195a5ddf@gandalf.local.home>
In-Reply-To: <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
References: <20250723194141.617125835@kernel.org>
	<20250723194211.768813368@kernel.org>
	<CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EAC8220024
X-Stat-Signature: mg7hf799a8c4ozi66xkomrii1mcb4969
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+bGHo3DbcLT+M4vLiW88BZpzBFQWTORmA=
X-HE-Tag: 1753309619-570113
X-HE-Meta: U2FsdGVkX1/7shho4xFZ4CuGMEo0bwqnoO+DN2dK6aFK1XB2pb8urdBtC2MuhtVnx/+sW1FTv938ieJd72oh2dMrEHJOd9C1zjYc5Ox8LX5dRXwWOR5d10JZSNJi//8fz4Pn5/PVa6aMH6ptxqVrK/RkDNsmIMVriE9dtS7x8CvXISVlK2FQVcqtb2dAsCEmRwKUA+DpZFcBJDkFqWJNJr8bPCiEamlnuVeF/U2IQeZpcDSW88Q/kG0JHxSngGRHKjsaBHWpFDVwVHIUrbUWN6dVR/uF7H04F3fjcNl+jK7FdzWa6Md/T/JYX8x1N/1DWMK9lTmsn6lKZzIyrVh3bURZVGAImfZAiz5D8KDbJqgV5wITS3fCm1Va1IT5U4wbZYVVd5O/h/Bq9lv/F7s9gA==

On Wed, 23 Jul 2025 13:31:52 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 23 Jul 2025 at 12:42, Steven Rostedt <rostedt@kernel.org> wrote:
> >
> >  kernel/trace/Kconfig              |  19 +++  
> 
> Annoying "one step forward, two steps back" change.
> 
> You literally sent a "remove one pointless Kconfig option" patch
> within ten minutes of sending out this "add two pointless Kconfig
> options" patch.

You mean to also get rid of the TRACEPOINT_VERIFY_USED config?

> 
> Because as long as it's a build-time thing, please just fix the
> problems it points out, and it should have no real cost to being
> enabled.
> 
> We don't want to ask people questions that don't matter.
> 
> Of course, because you *used* to check this at run-time, you put the
> new "__tracepoint_check" table in a section that is actually loaded
> into memory, and it appears to be still there.
> 
> Just put it in the discard section, the same way we have (for example)
> the export_symbols table that we also check at build-time without
> actually ever making it part of the kernel.

Ah, I wasn't sure how to do that. So you are saying to do:

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 600d8b51e315..365c92e6d0ce 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1048,6 +1047,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	*(.modinfo)							\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
+	*(.__tracepoint_check)
 
 #define DISCARDS							\
 	/DISCARD/ : {							\


But this will require that I change how it's done, as it doesn't look like
it's available when sorttable.c is used.

Looks like it will require a separate application to search the vmlinux.o
instead of the vmlinux (which sorttable does).

I could probably take some of the sorttable.c elf parsing and move that
into a header that would share the code.

-- Steve


