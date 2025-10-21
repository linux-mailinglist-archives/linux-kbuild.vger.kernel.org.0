Return-Path: <linux-kbuild+bounces-9236-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 094EEBF8502
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 21:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8434419A2619
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 19:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5E7274659;
	Tue, 21 Oct 2025 19:48:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69D1DF269;
	Tue, 21 Oct 2025 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076084; cv=none; b=Ms9Z5hUpffIhSun5zn9Nak3fE9xeOb+W3kcf9xj1y4SdW2B6NamEM+ZKvl+V5bZ6rCBC5HZrMnsJeddRrSgGA4yKX7g6H6Vi3uR9gCYJgWvqQWe9eR9YSR/q1sBZzmYeiPRR5wE4wze7b79GKfQKcrMJLS5tx3ZNVwLI6bRZiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076084; c=relaxed/simple;
	bh=hxLpV0EOxu4GQBIqttLySiMrCFWfhH4tkx+ydujGqxo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HcJG6RdAra3l+lcY/htqfTPqyrlzJRgQWvj8FKLHKv7QweDJf9PnR2Ok9L47ZWvmw2207eGUxq0dlyoF6Rq7sY6Pa5JKeywN8VN6kc3dwXi7qqpLT2I0GI7Qv+RK2phtnOXYqEGUUFRwvXTg9XTjFe8WPQoNDcvy4fLcRRgvW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id F0E5B1A0651;
	Tue, 21 Oct 2025 19:47:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 9752620023;
	Tue, 21 Oct 2025 19:47:50 +0000 (UTC)
Date: Tue, 21 Oct 2025 15:48:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for
 modules
Message-ID: <20251021154813.4b77822a@gandalf.local.home>
In-Reply-To: <aPKliHl3k26RO0YJ@levanger>
References: <20251015203842.618059565@kernel.org>
	<20251015203924.731213165@kernel.org>
	<20251015231928.GC3943617@ax162>
	<aPKliHl3k26RO0YJ@levanger>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 3bx6u9tf5n4qs3gsczbm48jkabzbmxxn
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 9752620023
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Zz+gNK15SC9atC7bLzBKBN+K6uLGaxcE=
X-HE-Tag: 1761076070-191965
X-HE-Meta: U2FsdGVkX19kry9/Mjb2SwEc69CHZfHj6rlyyq27d9g3EYmyqmKu4W/H9ta4ezVs6afeQnt02IszQf3+JV+aC1Gsf6XzPjJ2fpotLhCxKgGas5giw9eGQoZj8211mLKOOBBhAmIo8ygmENgqvUf1g3eoIoEZbaI2b2KwXwPQNXqVpDGoKWzSbY1Mv+dukasXJO/5HYyrNWwumtZliTc3/c91qmggXE5c+uYx9y5kjpc2t8xokr1joIS6pzI0K+RiEqcCLU9VxTJooe5RxrMCefBROPKzlnIwbLKBYREk1E7UuzayIYbZsEfiaxMmhCXWTYaCCqJrOAfm0LhK5/jwCDMooN/dVc1f

On Fri, 17 Oct 2025 22:22:32 +0200
Nicolas Schier <nsc@kernel.org> wrote:

> On Wed, Oct 15, 2025 at 04:19:28PM -0700, Nathan Chancellor wrote:
> > Hi Steve,
> > 
> > On Wed, Oct 15, 2025 at 04:38:46PM -0400, Steven Rostedt wrote:  
> > > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > > index 542ba462ed3e..6f909979af91 100644
> > > --- a/scripts/Makefile.modfinal
> > > +++ b/scripts/Makefile.modfinal
> > > @@ -28,6 +28,12 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
> > >  .module-common.o: $(srctree)/scripts/module-common.c FORCE
> > >  	$(call if_changed_rule,cc_o_c)
> > >  
> > > +ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),"")  
> > 
> > Drop the "", nowhere else in Kbuild appears to do this.
> >   
> > > +cmd_check_tracepoint = ${objtree}/scripts/tracepoint-update $<;  
> > 
> > Please use $(objtree) to be consistent with the rest of Kbuild.
> >   
> > > +else
> > > +cmd_check_tracepoint =
> > > +endif  
> 
> The else part is not required, cp. definition of e.g. cmd_checkdoc in
> scripts/Makefile.build.

Thanks, will do.

-- Steve

