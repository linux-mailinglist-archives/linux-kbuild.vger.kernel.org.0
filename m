Return-Path: <linux-kbuild+bounces-9185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 301F2BE1009
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 01:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D7A619C5C15
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 23:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BD631690A;
	Wed, 15 Oct 2025 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r742GAJH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CC531579B;
	Wed, 15 Oct 2025 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760569945; cv=none; b=bGFhxzP4CAgsbcPQ3RyGJuyOzZIC07FStncfZzG/0o2z061hM6WBhY75vYUnYmcHVl0x7sflAwNO0jbMBj0sLqNCQZvjSNwm+Y6ii8PnsuhpOHq7OWGQT8/S7Dz7B3PFrlqnadwuCld6seUat3HkzeRV26LdHic9ddkfElgZwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760569945; c=relaxed/simple;
	bh=S2Ya2yQzemibr6HZsTuRgiLf/45RF5wC6HtSHNrxObo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3ep5p3HnIq4u7PG1bphYKHpnLyGDaYK22QZshWxLzqd4ufZBskBgjQKnR9hgWFOALre0pWPuSxTZuVAWJqv3vkJTi2Ogi1UGHf987CLh0IUU2kX8AVDZ09LEqk8kmtOOSVC1agXPD5bGf165GVlHV2HRIspkze3npDLHtw1TBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r742GAJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C785CC4CEFB;
	Wed, 15 Oct 2025 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760569944;
	bh=S2Ya2yQzemibr6HZsTuRgiLf/45RF5wC6HtSHNrxObo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r742GAJH0x3PFoSz2u60+EnecSdHVlG5+/hwlpXx6Z5BQ44im3nIWt9VTEQ9RrHwn
	 7puv4r1qnWrVlFuodBmLjK7eiT2TqkUQW3lmD3p6aQ5+vlKgDXNAcurVfgXZttBqot
	 SMPtuvJM1yHec/D+6oBfEjcFo0KzDxWf8Jl754O2vQ2ESnK5yvpe/5ZMa5dLbkh+Pw
	 Q2om1jkn6R57ieEeI7B6xFcbvuTkaVn1Rddm8i/i9m/VAy9UK9mIIRPVR0MUaBygFZ
	 qg5zLYHCtNMZ35FDOXTBPChiN8Vd4unTG3AdOox09mbGoqEYlWairA0RXfG+i8syQb
	 qtAUB5O3trU/Q==
Date: Wed, 15 Oct 2025 16:12:19 -0700
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
Subject: Re: [PATCH v9 2/4] tracing: Add a tracepoint verification check at
 build time
Message-ID: <20251015231219.GB3943617@ax162>
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

Hi Steve,

The kbuild portions of this seem fine, as they mirror existing patterns.

On Wed, Oct 15, 2025 at 04:38:44PM -0400, Steven Rostedt wrote:
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 8a9a2e732a65..08ca759fb992 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -1048,6 +1048,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  	*(.no_trim_symbol)						\
>  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
>  	*(.gnu.version*)						\
> +	*(__tracepoint_check)

Please add a trailing slash like the other lines so that one does not
need to be added when someone else needs to grow this macro (also helps
with 'git blame').

Cheers,
Nathan

