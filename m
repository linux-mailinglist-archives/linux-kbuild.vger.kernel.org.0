Return-Path: <linux-kbuild+bounces-9237-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE191BF868B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 21:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7612C189F51E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 19:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02082274B5C;
	Tue, 21 Oct 2025 19:57:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD416350A2A;
	Tue, 21 Oct 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076657; cv=none; b=KNWtGLl3hBbU4YOcv697wGmytiYUS7WyxNjutELSYpwd+saerRAANqCw2j1RvH7oNRgx9+pSIuJbpN1bZqnGfulmiiMA9IbML/u4K8ggYAe5q706+C3me1vuOhVdWgvEteEWLzTuVOmdh7/P5zA4PU+Em+1CCCpCIo+PnvJqIBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076657; c=relaxed/simple;
	bh=mQAeIUj+5N6ZMI+9sCTvDOby4ZK86es/53DbWVnlNwc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEfiaq1ggkQUlGbubdxRaKCccIs2MByNO7C4SqjoNSPS+Yod9ticwSLroR3A9JiNiGYpHmzyKvDChaqD8JSxTj3ZsDyxDGbJhjCnSjmpnjdQZSEBHCrpujskFC4iMFtv0e9+EP+dpR/WF5v9GEupLHndPrgDDxPyEWBuxmw7lyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 99D7A16065D;
	Tue, 21 Oct 2025 19:57:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 3647430;
	Tue, 21 Oct 2025 19:57:24 +0000 (UTC)
Date: Tue, 21 Oct 2025 15:57:46 -0400
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
Subject: Re: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for
 modules
Message-ID: <20251021155746.7623b0f4@gandalf.local.home>
In-Reply-To: <20251015231928.GC3943617@ax162>
References: <20251015203842.618059565@kernel.org>
	<20251015203924.731213165@kernel.org>
	<20251015231928.GC3943617@ax162>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1o9gydmia61y3jehqe9awbktnhqobewu
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 3647430
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19btsGDjdf3yUND2ucEAIwOWovMpIr+28w=
X-HE-Tag: 1761076644-924534
X-HE-Meta: U2FsdGVkX1+rvTCtXMUuQ3Ao89OtwXtoLr7g43VgtOfYrHJ8ufTIkxn1etAIbhOeta2Fkyspe1Rk9sUnHdjm6qRWWUunyu8xL/luruEL9eBdtiLrlDZD732WkaPbtKWGvlZreWGfxreHI3S23O5GJ5LoAyV0eT22hmK2XdeCnhA2NbtFOsFD8i1qyLXvC+gXEJkTX/7LxK1Qir1VpxlXyjfsp7/8HYI5ax2Io24m0u9zxkUtlZdeFBQ1TaidMAncmWEcV+mVCAtAs1BKfZ46dwRZw43UIGztAGBCaBNRBRjA7VLLIYOt7r+DkvI8hvheWhSKWR4v5mFF09dBerglA9O3sbQQ4j7Y

On Wed, 15 Oct 2025 16:19:28 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Steve,
> 
> On Wed, Oct 15, 2025 at 04:38:46PM -0400, Steven Rostedt wrote:
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 542ba462ed3e..6f909979af91 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -28,6 +28,12 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
> >  .module-common.o: $(srctree)/scripts/module-common.c FORCE
> >  	$(call if_changed_rule,cc_o_c)
> >  
> > +ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),"")  
> 
> Drop the "", nowhere else in Kbuild appears to do this.
> 
> > +cmd_check_tracepoint = ${objtree}/scripts/tracepoint-update $<;  
> 
> Please use $(objtree) to be consistent with the rest of Kbuild.

OK for both.

> 
> > +else
> > +cmd_check_tracepoint =
> > +endif
> > +
> >  quiet_cmd_ld_ko_o = LD [M]  $@
> >        cmd_ld_ko_o =							\
> >  	$(LD) -r $(KBUILD_LDFLAGS)					\
> > @@ -57,6 +63,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
> >  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> >  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> >  endif
> > +	+$(call cmd,check_tracepoint)
> >  
> >  targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
> >  
> > diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
> > index 6ec30f39d0ad..7e068de9c7f1 100644
> > --- a/scripts/tracepoint-update.c
> > +++ b/scripts/tracepoint-update.c
> > @@ -188,6 +188,13 @@ static int process_tracepoints(void *addr, char const *const fname)
> >  		}
> >  	}
> >  
> > +	/*
> > +	 * Modules may not have either section. But if it has one section,
> > +	 * it should have both of them.
> > +	 */
> > +	if (!check_data_sec && !tracepoint_data_sec)
> > +		return 0;
> > +  
> 
> This feels like it could be its own patch but I guess it does not make
> much sense without enablement. It might be worth calling this out a bit
> more in the commit message.
> 

It was found during debugging. I could make this a separate patch in
preparation for this patch.

-- Steve



> >  	if (!check_data_sec) {
> >  		fprintf(stderr,	"no __tracepoint_check in file: %s\n", fname);
> >  		return -1;
> > -- 
> > 2.51.0
> > 
> >   


