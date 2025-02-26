Return-Path: <linux-kbuild+bounces-5914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE503A46128
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2025 14:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04EC16D428
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2025 13:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B325218858;
	Wed, 26 Feb 2025 13:42:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2941C71;
	Wed, 26 Feb 2025 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577350; cv=none; b=XURUS5PM6R5XqeGw0BEcI76lFiq1LINOKxPzxCq8BZTQG47kbk//HaWDSkcrxl4QK8m4ZolNk0kISaeqj0m9Zfd48p6UKzGh8/ea1tCbACdQBRACeFNB0PX96ObdYqtAIuv3Ws8qmVCtUBpS+6WvozAN+x+UwL+z1/feQ35sCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577350; c=relaxed/simple;
	bh=ET8IdWibJq88gqcdMDd8LUX/7ELv88Rz1Le9FXQoe4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxMAN/As6gydzMhYY6dPNWhz1u3yxPZzPEtWqFsFaeLYEUWWpoKNF5m9cfZO0N3cdntS7Decb8xmilA8AE93N5T0VowCqa1PlHWozTxaVEZ59ftBRzbT4fViznY7GGT0h7AY7iBZ2KTJLPMW3xwHXgOg6jxm8v86mphXJ+Ek5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56662C4CED6;
	Wed, 26 Feb 2025 13:42:29 +0000 (UTC)
Date: Wed, 26 Feb 2025 08:43:09 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add dependency from vmlinux to sorttable
Message-ID: <20250226084309.0665a335@gandalf.local.home>
In-Reply-To: <20250226133014.381585-1-xry111@xry111.site>
References: <20250226133014.381585-1-xry111@xry111.site>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 21:30:14 +0800
Xi Ruoyao <xry111@xry111.site> wrote:

> Without this dependency it's really puzzling when we bisect for a "bad"
> commit in a series of sorttable change: when "git bisect" switches to
> another commit, "make" just does nothing to vmlinux.
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  scripts/Makefile.vmlinux | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 873caaa55313..fb79fd6b2465 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -79,6 +79,10 @@ ifdef CONFIG_DEBUG_INFO_BTF
>  vmlinux: $(RESOLVE_BTFIDS)
>  endif
>  
> +ifdef CONFIG_BUILDTIME_TABLE_SORT
> +vmlinux: scripts/sorttable
> +endif

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I haven't tested this yet, but when working on the sorttable.c changes, it
definitely was an annoyance that the updates to sorttable.c didn't make any
changes without first modifying something in the kernel.

-- Steve


> +
>  # module.builtin.ranges
>  #
> ---------------------------------------------------------------------------
> ifdef CONFIG_BUILTIN_MODULE_RANGES


