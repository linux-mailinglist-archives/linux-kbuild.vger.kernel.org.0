Return-Path: <linux-kbuild+bounces-9187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7112BBE102B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 01:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07312482C21
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 23:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50A92F90D3;
	Wed, 15 Oct 2025 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEY318jL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B16213E9C;
	Wed, 15 Oct 2025 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760570374; cv=none; b=UrvDgpbl9FcLs0CDvJQcSg9wup2u1ONfLXC/JDaIky/Kpo0kv6w9BldJZgOnn3fDnoclWSDJ/aW7mPRXjWXztgpDwz/yIIrpQdwM9EpxkV4mD2J623lc+62ylc/fYDIGS2L+A2Rvf4bOR8GRmo7CrFJEBmu8NLhBKmT86zLvXQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760570374; c=relaxed/simple;
	bh=QPlLDwRDlp/Frp+LN0ggOfuaiDdjLzUbhrCj6gffgr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ce+DsPiJttuDgxQh8s4DlR43/C6kZWnhxlSI6gWJWKQMB27KtN7Xmzxotcu8hscxxIXl+SXHGLlXS51eNlisRmrsdu+1LCxGbpOX/72zFcHGCitj5F07354HQP1G41lsEyzWXTkUmi9SnAM4p62GBLbHgh6/gjGkTTLth6rWt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEY318jL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EEFC4CEF8;
	Wed, 15 Oct 2025 23:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760570374;
	bh=QPlLDwRDlp/Frp+LN0ggOfuaiDdjLzUbhrCj6gffgr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEY318jL3n0jXW3K6H3CazFU8ipicvSWz+sy5ONQwDkxj1OcSxrCJqzpFiG4V6+k4
	 6NS3Ek8t+DHhEb9Ny/uF2RpjrPyooX6ML3y3bO9HnxyexYJZsxND4sjQcrl2DIvxn7
	 m2jG7/lkiQ5LWIspKq+uYKnWSCyRyZ6DrUGF2GL5zN8qbdWBxsD79rBvakMf6EwqXn
	 OM2CykxMcteCSmcrWdSXAIK4ylVmJEqCck72HsSPZFVC3RClUExvxfEbS125AESkDg
	 4Dr+6T4dlvHNScHGMAEjFl66/a/A94fMVeVEauCerOisaQgKr8xCbDN31yyR/Lkgrs
	 TPQXR1BL68+1g==
Date: Wed, 15 Oct 2025 16:19:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 4/4] tracing: Add warnings for unused tracepoints for
 modules
Message-ID: <20251015231928.GC3943617@ax162>
References: <20251015203842.618059565@kernel.org>
 <20251015203924.731213165@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015203924.731213165@kernel.org>

Hi Steve,

On Wed, Oct 15, 2025 at 04:38:46PM -0400, Steven Rostedt wrote:
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 542ba462ed3e..6f909979af91 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -28,6 +28,12 @@ ccflags-remove-y := $(CC_FLAGS_CFI)
>  .module-common.o: $(srctree)/scripts/module-common.c FORCE
>  	$(call if_changed_rule,cc_o_c)
>  
> +ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),"")

Drop the "", nowhere else in Kbuild appears to do this.

> +cmd_check_tracepoint = ${objtree}/scripts/tracepoint-update $<;

Please use $(objtree) to be consistent with the rest of Kbuild.

> +else
> +cmd_check_tracepoint =
> +endif
> +
>  quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o =							\
>  	$(LD) -r $(KBUILD_LDFLAGS)					\
> @@ -57,6 +63,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
>  endif
> +	+$(call cmd,check_tracepoint)
>  
>  targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
>  
> diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
> index 6ec30f39d0ad..7e068de9c7f1 100644
> --- a/scripts/tracepoint-update.c
> +++ b/scripts/tracepoint-update.c
> @@ -188,6 +188,13 @@ static int process_tracepoints(void *addr, char const *const fname)
>  		}
>  	}
>  
> +	/*
> +	 * Modules may not have either section. But if it has one section,
> +	 * it should have both of them.
> +	 */
> +	if (!check_data_sec && !tracepoint_data_sec)
> +		return 0;
> +

This feels like it could be its own patch but I guess it does not make
much sense without enablement. It might be worth calling this out a bit
more in the commit message.

>  	if (!check_data_sec) {
>  		fprintf(stderr,	"no __tracepoint_check in file: %s\n", fname);
>  		return -1;
> -- 
> 2.51.0
> 
> 

