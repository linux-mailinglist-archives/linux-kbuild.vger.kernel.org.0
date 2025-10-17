Return-Path: <linux-kbuild+bounces-9209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB4BEBB7B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 22:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C7CF358862
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 20:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C430233155;
	Fri, 17 Oct 2025 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8UkHgKP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2F354AC9;
	Fri, 17 Oct 2025 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733989; cv=none; b=Yfn3zIdXSad7pA13wp/Ja15XuBtGYwOX58nxUN+dOfFcW8rNciF9HM99W8JN/bNUcThg3yBx60TIt7Qwj3NxAvcZqfdlmC5Q15n/92aKyNnkqOwC8xQg1j1PTjZVLeXKOxBIlF6H6O1guY6kJNhW7GVlo/3CNpQJZtd1dm5bXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733989; c=relaxed/simple;
	bh=n5voMkpzvEXXvxmSXe4Ca95hjXPOO788xsJ2QkEupAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCWsBvVnzepFf/8KIVjG4iqQ3jPWvyoD2VQDhiJ5qMV/FGs9ybtcdEkNw4zzFko438VgZBqSNBPbnYll7zx5Ukl1facyI0TRBCYsl/aYX+7dsnzD/iF4MTObySvdQ4MDM400YdYAanVMdcvBLQGS/K5VycBG0dkQDiavtQWElaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8UkHgKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4C7C4CEE7;
	Fri, 17 Oct 2025 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760733988;
	bh=n5voMkpzvEXXvxmSXe4Ca95hjXPOO788xsJ2QkEupAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8UkHgKPu/CtQAbDWbYN1KU4OrS1W0ve82R+RDZ+C7wBvWiwrgzUjXwJXbTqmSCLK
	 IBq4k/z3BmX7jINbxdF6jhVrSfTPXDJzZolYe0u3oTdHZ6QlIMppR7BSDibjdxSPZv
	 4WmOJzUGyZ4kuFbr0TSlb7bzIMsBdqvZLo6+A793kEgckxmPdL6OzOY4GLPSlts+RG
	 LUDXZVDqtBx7IQMziTKYGn4+lKQosA6Au3fk6P60vE2ANiQAswF4lgo4aa0sGwwuhc
	 A6nTyAtOOCLdPF4i7Ha3qSWRd4vv6nudLlpRlxVfZC1e7Ybl48Gr3KRXuurHqLfO5V
	 wxU467mKTUvNA==
Date: Fri, 17 Oct 2025 22:15:20 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v9 2/4] tracing: Add a tracepoint verification check at
 build time
Message-ID: <aPKj2Ilnq7F0xLFx@levanger>
References: <20251015203842.618059565@kernel.org>
 <20251015203924.391455037@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015203924.391455037@kernel.org>

On Wed, Oct 15, 2025 at 04:38:44PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> If a tracepoint is defined via DECLARE_TRACE() or TRACE_EVENT() but never
> called (via the trace_<tracepoint>() function), its metadata is still
> around in memory and not discarded.
> 
> When created via TRACE_EVENT() the situation is worse because the
> TRACE_EVENT() creates metadata that can be around 5k per trace event.
> Having unused trace events causes several thousand of wasted bytes.
> 
> Add a verifier that injects a string of the name of the tracepoint it
> calls that is added to the discarded section "__tracepoint_check".
> For every builtin tracepoint, its name (which is saved in the in-memory
> section "__tracepoint_strings") will have its name also in the
> "__tracepoint_check" section if it is used.
> 
> Add a new program that is run on build called tracepoint-update. This is
> executed on the vmlinux.o before the __tracepoint_check section is
> discarded (the section is discarded before vmlinux is created). This
> program will create an array of each string in the __tracepoint_check
> section and then sort it. Then it will walk the strings in the
> __tracepoint_strings section and do a binary search to check if its name
> is in the __tracepoint_check section. If it is not, then it is unused and
> a warning is printed.
> 
> Note, this currently only handles tracepoints that are builtin and not in
> modules.
> 
> Enabling this currently with a given config produces:
> 
> warning: tracepoint 'sched_move_numa' is unused.
> warning: tracepoint 'sched_stick_numa' is unused.
> warning: tracepoint 'sched_swap_numa' is unused.
> warning: tracepoint 'pelt_hw_tp' is unused.
> warning: tracepoint 'pelt_irq_tp' is unused.
> warning: tracepoint 'rcu_preempt_task' is unused.
> warning: tracepoint 'rcu_unlock_preempted_task' is unused.
> warning: tracepoint 'xdp_bulk_tx' is unused.
> warning: tracepoint 'xdp_redirect_map' is unused.
> warning: tracepoint 'xdp_redirect_map_err' is unused.
> warning: tracepoint 'vma_mas_szero' is unused.
> warning: tracepoint 'vma_store' is unused.
> warning: tracepoint 'hugepage_set_pmd' is unused.
> warning: tracepoint 'hugepage_set_pud' is unused.
> warning: tracepoint 'hugepage_update_pmd' is unused.
> warning: tracepoint 'hugepage_update_pud' is unused.
> warning: tracepoint 'block_rq_remap' is unused.
> warning: tracepoint 'xhci_dbc_handle_event' is unused.
> warning: tracepoint 'xhci_dbc_handle_transfer' is unused.
> warning: tracepoint 'xhci_dbc_gadget_ep_queue' is unused.
> warning: tracepoint 'xhci_dbc_alloc_request' is unused.
> warning: tracepoint 'xhci_dbc_free_request' is unused.
> warning: tracepoint 'xhci_dbc_queue_request' is unused.
> warning: tracepoint 'xhci_dbc_giveback_request' is unused.
> warning: tracepoint 'tcp_ao_wrong_maclen' is unused.
> warning: tracepoint 'tcp_ao_mismatch' is unused.
> warning: tracepoint 'tcp_ao_key_not_found' is unused.
> warning: tracepoint 'tcp_ao_rnext_request' is unused.
> warning: tracepoint 'tcp_ao_synack_no_key' is unused.
> warning: tracepoint 'tcp_ao_snd_sne_update' is unused.
> warning: tracepoint 'tcp_ao_rcv_sne_update' is unused.
> 
> Some of the above is totally unused but others are not used due to their
> "trace_" functions being inside configs, in which case, the defined
> tracepoints should also be inside those same configs. Others are
> architecture specific but defined in generic code, where they should
> either be moved to the architecture or be surrounded by #ifdef for the
> architectures they are for.
> 
> This tool could be updated to process modules in the future.
> 
> I'd like to thank Mathieu Desnoyers for suggesting using strings instead
> of pointers, as using pointers in vmlinux.o required handling relocations
> and it required implementing almost a full feature linker to do so.
> 
> To enable this check, run the build with: make UT=1
> 
> Link: https://lore.kernel.org/all/20250528114549.4d8a5e03@gandalf.local.home/
> 
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com> # for using strings instead of pointers
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Changes since v8: https://lore.kernel.org/20250828203741.401496225@kernel.org
> 
> - Instead of using a config option to enable this, enable it via: make UT=1
>   This will allow it to go into linux-next without triggering all the
>   current warnings but also allow people to find and fix current unused
>   tracepoints.
> 
>  Makefile                          |  15 ++
>  include/asm-generic/vmlinux.lds.h |   1 +
>  include/linux/tracepoint.h        |  11 ++
>  scripts/Makefile                  |   3 +
>  scripts/link-vmlinux.sh           |   7 +
>  scripts/tracepoint-update.c       | 232 ++++++++++++++++++++++++++++++
>  6 files changed, 269 insertions(+)
>  create mode 100644 scripts/tracepoint-update.c
> 
> diff --git a/Makefile b/Makefile
> index 17cfa11ca716..a3141890f38f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -157,6 +157,20 @@ endif
>  
>  export KBUILD_EXTRA_WARN
>  
> +# To check for unused tracepoints (tracepoints that are defined but never
> +# called), run with:
> +#
> +# make UT=1
> +#
> +# Each unused tracepoints can take up to 5KB of memory in the running kernel.
> +# It is best to remove any that are not used.
> +
> +ifeq ("$(origin UT)", "command line")
> +  WARN_ON_UNUSED_TRACEPOINTS := $(UT)
> +endif
> +
> +export WARN_ON_UNUSED_TRACEPOINTS

Is there a special reason why you chose to introduce a new command-line
variable instead of extending KBUILD_EXTRA_WARN / W ?

Kind regards,
Nicolas

