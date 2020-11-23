Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FFE2C12CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 19:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390593AbgKWSAz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 13:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388701AbgKWSAy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 13:00:54 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2713FC0613CF;
        Mon, 23 Nov 2020 10:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=j/9AeUveHgMPC2fylXvN/FlLEse24q6/y6E43XicMes=; b=Qw4lI9BD/GvRxZauaTYfPurx9e
        3QPT86LRSNQgFySHm1JrLjxaya1xm0Y9ujFto47OqKRfqBhzbq2zMI/+G/CtuV0KtAKkJp7Nf+lcj
        fGEfVzQmrmkqQDgOAH9TEkSTitBraF5pOccEKsk+CyytALGYDpLjBmhulg7aaAZiOMp2B6siBecly
        sAOextB/4WjbqCyGP7DWWKo1EaJqSklGjowz72U9fmFfVwbZTNLu8uuryowaEum2EvFMokCx/ukYX
        PAyPaaQntB705U9kR12hJa5KayYFlFxDoxzj5HpqzZkHD2ujO4OOWuizLTF5wR1FJ8eNcCYbw9h4k
        gAbKGfnA==;
Received: from [2601:1c0:6280:3f0::bcc4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1khG8x-0007Ur-AA; Mon, 23 Nov 2020 18:00:51 +0000
Subject: Re: [PATCH 6/7] kbuild: doc: clarify the difference between extra-y
 and always-y
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201123045403.63402-1-masahiroy@kernel.org>
 <20201123045403.63402-6-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <92b910de-7039-a260-456c-865201ef7629@infradead.org>
Date:   Mon, 23 Nov 2020 10:00:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123045403.63402-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/22/20 8:54 PM, Masahiro Yamada wrote:
> The difference between extra-y and always-y is obscure.
> 
> Basically, Kbuild builds targets listed in extra-y and always-y in
> visited Makefiles without relying on any dependency.
> 
> The difference is that extra-y is used to list the targets needed for
> vmlinux whereas always-y is used to list the targets that must be always
> built irrespective of final targets.
> 
> Kbuild skips extra-y when it is building only modules (i.e.
> 'make modules'). This is the long-standing behavior since extra-y was
> introduced in 2003, and it is explained in that commit log [1].
> 
> For clarification, this is the extra-y vs always-y table:
> 
>                   extra-y    always-y
>   'make'             o          o
>   'make vmlinux'     o          o
>   'make modules'     x          o

FWIW, I would find y/n easier to comprehend that x/o here.

> Kbuild skips extra-y also when building external modules since obviously
> it never builds vmlinux.
> 
> Unfortunately, extra-y is wrongly used in many places of upstream code,
> and even in external modules.
> 
> Using extra-y in external module Makefiles is wrong. What you should
> use is probably always-y or 'targets'.
> 
> The current documentation for extra-y is misleading. I rewrote it, and
> moved it to the section 3.7.
> 
> always-y is not documented anywhere. I added.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=f94e5fd7e5d09a56a60670a9bb211a791654bba8
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/makefiles.rst | 110 +++++++++++++++++++----------
>  1 file changed, 71 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 49afcb1d3695..159e470f2616 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -15,13 +15,15 @@ This document describes the Linux kernel Makefiles.
>  	   --- 3.4 Objects which export symbols
>  	   --- 3.5 Library file goals - lib-y
>  	   --- 3.6 Descending down in directories
> -	   --- 3.7 Compilation flags
> -	   --- 3.8 Dependency tracking
> -	   --- 3.9 Custom Rules
> -	   --- 3.10 Command change detection
> -	   --- 3.11 $(CC) support functions
> -	   --- 3.12 $(LD) support functions
> -	   --- 3.13 Script Invocation
> +	   --- 3.7 Non-builtin vmlinux targets - extra-y
> +	   --- 3.8 Always built goals - always-

	Should that be always-y ?

> +	   --- 3.9 Compilation flags
> +	   --- 3.10 Dependency tracking
> +	   --- 3.11 Custom Rules
> +	   --- 3.12 Command change detection
> +	   --- 3.13 $(CC) support functions
> +	   --- 3.14 $(LD) support functions
> +	   --- 3.15 Script Invocation
>  
>  	=== 4 Host Program support
>  	   --- 4.1 Simple Host Program
> @@ -321,7 +323,60 @@ more details, with real examples.
>  	names. This allows kbuild to totally skip the directory if the
>  	corresponding `CONFIG_` option is neither 'y' nor 'm'.
>  
> -3.7 Compilation flags
> +3.7 Non-builtin vmlinux targets - extra-y
> +-----------------------------------------
> +
> +	extra-y specifies targets which are needed for building vmlinux,
> +	but not combined into built-in.a.
> +
> +	Examples are:
> +
> +	1) head objects
> +
> +	    Some objects must be placed at the head of vmlinux. They are
> +	    directly linked to vmlinux without going through built-in.a
> +	    A typical use-case is an object that contains the entry point.
> +
> +	    arch/$(SRCARCH)/Makefile should specify such objects as head-y.
> +
> +	    Discussion:
> +	      Given that we can control the section order in our linker script,
> +	      why do we need head-y?
> +
> +	2) vmlinux linker script
> +
> +	    The linker script for vmlinux is located at
> +	    arch/$(SRCARCH)/kernel/vmlinux.lds
> +
> +	Example::
> +
> +		# arch/x86/kernel/Makefile
> +		extra-y	:= head_$(BITS).o
> +		extra-y	+= head$(BITS).o
> +		extra-y	+= ebda.o
> +		extra-y	+= platform-quirks.o
> +		extra-y	+= vmlinux.lds
> +
> +	$(extra-y) should only contain targets needed for vmlinux.
> +
> +	Kbuild skips extra-y when vmlinux is apparently not a final goal.
> +	(e.g. 'make modules', or building external modules)
> +
> +	If you intend to build targets unconditionally, always-y (explained
> +	in the next section) is the correct syntax to use.
> +
> +3.8 Always built goals - always-y
> +---------------------------------
> +
> +	always-y specifies targets which are literally always built when
> +	Kbuild visited the Makefile.

	       visits

> +
> +	Example::
> +	  # ./Kbuild
> +	  offsets-file := include/generated/asm-offsets.h
> +	  always-y += $(offsets-file)
> +
> +3.9 Compilation flags
>  ---------------------
>  
>      ccflags-y, asflags-y and ldflags-y

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


thanks.
-- 
~Randy

