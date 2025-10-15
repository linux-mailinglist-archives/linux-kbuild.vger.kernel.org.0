Return-Path: <linux-kbuild+bounces-9186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DFBE1015
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 01:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C316719C5DF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 23:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444912BE041;
	Wed, 15 Oct 2025 23:14:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D729C338;
	Wed, 15 Oct 2025 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760570093; cv=none; b=qybTE51wfCw0lHs8ZClKxyS28RL+QwdXUY18l7cNMEG6MH0bVdc1qPZPaZh4m0SvKoKCvol7IdGXlGnpmpG9V59uqfB6Ki14b0UNMdyxQ43tXbzEcAs/NFzJvFmO/t7ibrYVzsz7KRMSjwutaTzmznNs7n6ZktDYPbH55k5NgFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760570093; c=relaxed/simple;
	bh=mKDj+RKAZ/ChtpzNw2dDSsk4PZx6+Tw/xjGldSQKPeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCMPuZA49MBVmp2dG3mVYbIngmTZohxhZqAXcX1aw4eZpNZa7ft8wm2TSYHINfMcElX6rzWASkCOgfsrDVtkIwHmrV6c/D+LT61OOIqD/bu0x4hGVx1MCRcb9IlJ08sZQHMXFa4mDaBtFC97/jpcdtIWKPL16Sds8OPCEJTX5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 50EBC14011A;
	Wed, 15 Oct 2025 23:14:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id C946E20033;
	Wed, 15 Oct 2025 23:14:44 +0000 (UTC)
Date: Wed, 15 Oct 2025 19:14:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 2/4] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20251015191453.76b9a5e6@gandalf.local.home>
In-Reply-To: <20251015231219.GB3943617@ax162>
References: <20251015203842.618059565@kernel.org>
	<20251015203924.391455037@kernel.org>
	<20251015231219.GB3943617@ax162>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: qy8xza7gp3m3z7crnx5w5mebdgggc3mx
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: C946E20033
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ReiiUV4xOpEbcwh2P6bQ4hDJONUTLwZM=
X-HE-Tag: 1760570084-399383
X-HE-Meta: U2FsdGVkX1/iZqBNmRz+EGdWkY+V+5bx+cQ40jP2REtRPDKxsbtkI7eaMT8i6h2q9MFnxh61PM5iw12HGS9zalc8bcjGIUs7LKKEPqQRTGpXagNxISKgJtxEDpKp0mnWQ4gjS1MifxclShMR+NgDpUHnKlN2Elw4OGnoKM9jj+ki8r6S/YW7TMrbzTw0b4CcHBE3bkdtayL1pKXcHSzgi27QQjhvWVRfhvvvlSXn5FkNtvbbtKSvUWxKfGJoqv45pUph/YeyTL1zLT0dn0/GYvgC6t/mI4hLTbQk8coQ/rEkOjdnpQiJtpJauZ9G50oOVMdzf/nlSVRyrG7DECAwZ2hIFMv5YQBC

On Wed, 15 Oct 2025 16:12:19 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Steve,
> 
> The kbuild portions of this seem fine, as they mirror existing patterns.
> 
> On Wed, Oct 15, 2025 at 04:38:44PM -0400, Steven Rostedt wrote:
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index 8a9a2e732a65..08ca759fb992 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -1048,6 +1048,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >  	*(.no_trim_symbol)						\
> >  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
> >  	*(.gnu.version*)						\
> > +	*(__tracepoint_check)  
> 
> Please add a trailing slash like the other lines so that one does not
> need to be added when someone else needs to grow this macro (also helps
> with 'git blame').

Sure thing! Thanks for looking at these patches!

-- Steve


