Return-Path: <linux-kbuild+bounces-8117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1A7B0FD1C
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 00:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3C7E7B98BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 22:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C1C24DCF6;
	Wed, 23 Jul 2025 22:47:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2F8238C23;
	Wed, 23 Jul 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310866; cv=none; b=ALgAUIgLJaJfb7rZ3h5jLDqYENwXzaR+7GQstFFNwzqhtID/ED7s3zOFIi3vUhpD9aNoTFPsQ9nbL3mzC3M585jytdMa0BmuPf5ApX5aqZd0395GucPoCVz8P9tRIe8Id5tdpuhcPO23Yrc8kiWYnGHlK0+B0THWKlB6CLHtVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310866; c=relaxed/simple;
	bh=DLuyI7z9GPxvLZ5rhlSBjNWOITr/CXFaVzLBHXWo3UM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3CoySPRQjA6veWmwVQzR9o1dX6yF3jJHwFe+ixGb7lW7KduUbU2hbdu+h1hzHu7U2dGGSXnZ2+3I7rP9/+qWd74zDFbwu4S8HIQSKsXPq9nmchcHPbYYtyt7mngyVOVfQecq6L/OyzV7dwKCp+BipwQjeqDtd97mjJx69l2DKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 82454B741D;
	Wed, 23 Jul 2025 22:47:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 6FCB017;
	Wed, 23 Jul 2025 22:47:39 +0000 (UTC)
Date: Wed, 23 Jul 2025 18:47:40 -0400
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
Message-ID: <20250723184740.6dd2b2fc@gandalf.local.home>
In-Reply-To: <CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
References: <20250723194141.617125835@kernel.org>
	<20250723194211.768813368@kernel.org>
	<CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
	<20250723182701.195a5ddf@gandalf.local.home>
	<CAHk-=wgQA+kGVKaUqSGenXVZHaPFkuojb7MgJKVetsXZnLMFuQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: bnw9etasmxcye7fh1qrojxwdaupn1m98
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 6FCB017
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19vHSXX1osOSuRrLzj2GLEfvW1P+MPxBN8=
X-HE-Tag: 1753310859-874152
X-HE-Meta: U2FsdGVkX1+Zvm1/6+mrnOpyExfgSSxSK99vfhZ3bq6ubZwnbghb7azWv31T50KQ3Axas0ZOY8RBFUCF72ROz306V7jtpGGwj2W0axLTe7yayT19S8MUp2fV1xjJwcF0VonvQH0RT/Nm/8B99YsayOKpdGEEP8NqNXIZCcbyBbOPwzVOYs0yFVYNWqvrY7zWBouoNp+55QTZqHDZzR/ueotmrBfAI4/6iWlErOqTgdFYMmHSm9WEKaxks2JC2LouT1WRXFOw2ZAa2iGN9g76OLHDWFgTnWlDPwPtfffM+PcsB3cI1ReYzVtb3Ze2BndmOVUajWp/lHnPFUlQE2+sa2QbHIF3AO5bBzSzZWjdKhKweOkSfUt+WlftJAc4cQnP

On Wed, 23 Jul 2025 15:33:16 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > I could probably take some of the sorttable.c elf parsing and move that
> > into a header that would share the code.  
> 
> Hmm. Why not just make sorttable then use vmlinux.o?
> 
> No need to do it twice. Can't you just work on the original object
> file before re-linking?

I believe the sorttable code needs vmlinux to be finished linked, otherwise
it needs to handle all the relocations in vmlinux.o

  $ readelf -r vmlinux

  There are no relocations in this file.

Compared to:

   $ readelf -r vmlinux.o| wc -l
   22449337

But we are looking at moving the fix-ups of the event format files from
boot time into build time. That is, currently at boot, the enum strings
are converted to their numbers and some expanded tags from PAHOLE_TAG gets
removed from the format files to not confuse the parsers.

The sorttable.c should be just that, code to sort Linux tables. I think
adding the tracepoint check to it was a bit of a hack. Perhaps it should
have its own program that focuses on tracepoint changes.

Thus it could find unused trace points and fix up the format strings. I'm
not sure how bad the relocations not being resolved will affect that though.

-- Steve

