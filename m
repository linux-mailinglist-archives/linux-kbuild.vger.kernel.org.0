Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8E245937E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2019 07:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfF1Fhq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jun 2019 01:37:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45892 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfF1Fhq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 01:37:46 -0400
Received: by mail-ed1-f66.google.com with SMTP id a14so9362894edv.12;
        Thu, 27 Jun 2019 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WBYYhW5Gh0k02Xn+yXF169t1R5n8yBBOosh2AW+cTaQ=;
        b=GtVR6TaqkFxA+ga9RJofdwkyd9AJCLMAHaq8a+pDwL0nnpoyjcuEaNhquQ4QGScQch
         EffmqEivEprN5negwbrFtyQ/RX8L09FQFu2e6AjdyKNGuBNNe3QIQiI4FnQWjihEF1uH
         0KvSElLDh0070EMet06gmn+zUGB9MhnZwQxIgGXczILCZAB6dlWHL37plKlaGrSdv6Ld
         u/s7Sql/h2O/t0D976AlIHzbRyC370+fmWAeFLniP8HoaoUlIBHo6Q4RUaOYjEQYcpsG
         kMm0XjvDzoJTMJEOnX0sk8NEWT8U23L1LuMRAhvpVNU4ZWTQRvMA3VPXjHujGLnnwBYT
         01FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WBYYhW5Gh0k02Xn+yXF169t1R5n8yBBOosh2AW+cTaQ=;
        b=GfVkcClVuaaobsMRIPJHlO7KsIcqD1dTxRNuFPtYkmijCo3gBxc7g2HGA0LIhWFtzK
         I20jV2CNJ8JB+mggbyFDpF2aI+YpUlUI+q2OtqaCofG+Gy8HhD7EHH0t6gV2RdxvbMeT
         EaF4fWeWLZ9uTx6yezLJRQZ4Qxwu8uBs8SR7LCuzBoNLPI60WGVH+k2B4RwOpD4XfBUp
         5RZlwnrRT2Jih1TdBQij23Q5vdqqo/yVOdb1QvdGpIKpKC14hrYWgnTkciI6iD/0MORE
         KLqkBERfcmgcVhWydiIUpW2iyGiujssxCt7tPzdLGiNWt9gC/wXQObKc4/EUOtv2ICiP
         fB9g==
X-Gm-Message-State: APjAAAUB8IVeomdRBZK70qywYj+j53ZVB3wM4WtN+jA3RXWsmkyfXwvA
        neJM0NiYVwUhMlYHg/e0EiM=
X-Google-Smtp-Source: APXvYqyd2XD3+n9+PBJj8C6DbONs1KgdBOen5jkEIw6KvO5MwLTnc011AewDZ5yfHNuOe2CdLHeKHg==
X-Received: by 2002:a50:86b7:: with SMTP id r52mr9194235eda.100.1561700263495;
        Thu, 27 Jun 2019 22:37:43 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id lw5sm237965ejb.59.2019.06.27.22.37.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 22:37:42 -0700 (PDT)
Date:   Thu, 27 Jun 2019 22:37:40 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH] kbuild: get rid of misleading $(AS) from documents
Message-ID: <20190628053740.GA43239@archlinux-epyc>
References: <20190628020433.19156-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628020433.19156-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 28, 2019 at 11:04:33AM +0900, Masahiro Yamada wrote:
> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Hence, we always use $(CC) as an assembler driver.
> 
> $(AS) is almost unused in Kbuild. As of writing, there is just one user.
> 
>   $ git grep '$(AS)' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)
> 
> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading since we do not invoke $(AS)
> directly.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I did notice this when I grepped for $(AS) in the tree. Certainly makes
sense and looks good to me.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Documentation/kbuild/kbuild.txt    |  5 ++---
>  Documentation/kbuild/makefiles.txt | 12 ++++++------
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
> index 9c230ea71963..7a7e2aa2fab5 100644
> --- a/Documentation/kbuild/kbuild.txt
> +++ b/Documentation/kbuild/kbuild.txt
> @@ -31,12 +31,11 @@ Additional options to the assembler (for built-in and modules).
>  
>  AFLAGS_MODULE
>  --------------------------------------------------
> -Additional module specific options to use for $(AS).
> +Additional module specific options to use for assembler.
>  
>  AFLAGS_KERNEL
>  --------------------------------------------------
> -Additional options for $(AS) when used for assembler
> -code for code that is compiled as built-in.
> +Additional options when used for assembling code that is compiled as built-in.
>  
>  KCFLAGS
>  --------------------------------------------------
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index d65ad5746f94..f0b3a30b985d 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -306,7 +306,7 @@ more details, with real examples.
>  	variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
>  	entire tree.
>  
> -	asflags-y specifies options for assembling with $(AS).
> +	asflags-y specifies options for assembling.
>  
>  	Example:
>  		#arch/sparc/kernel/Makefile
> @@ -441,7 +441,7 @@ more details, with real examples.
>  	as-instr checks if the assembler reports a specific instruction
>  	and then outputs either option1 or option2
>  	C escapes are supported in the test instruction
> -	Note: as-instr-option uses KBUILD_AFLAGS for $(AS) options
> +	Note: as-instr-option uses KBUILD_AFLAGS for assembler options
>  
>      cc-option
>  	cc-option is used to check if $(CC) supports a given option, and if
> @@ -814,7 +814,7 @@ When kbuild executes, the following steps are followed (roughly):
>  	In this example, the binary $(obj)/image is a binary version of
>  	vmlinux. The usage of $(call if_changed,xxx) will be described later.
>  
> -    KBUILD_AFLAGS		$(AS) assembler flags
> +    KBUILD_AFLAGS		assembler flags
>  
>  	Default value - see top level Makefile
>  	Append or modify as required per architecture.
> @@ -853,15 +853,15 @@ When kbuild executes, the following steps are followed (roughly):
>  	The first example utilises the trick that a config option expands
>  	to 'y' when selected.
>  
> -    KBUILD_AFLAGS_KERNEL	$(AS) options specific for built-in
> +    KBUILD_AFLAGS_KERNEL	assembler options specific for built-in
>  
>  	$(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
>  	resident kernel code.
>  
> -    KBUILD_AFLAGS_MODULE   Options for $(AS) when building modules
> +    KBUILD_AFLAGS_MODULE   Options for assembler when building modules
>  
>  	$(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
> -	are used for $(AS).
> +	are used for assembler.
>  	From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
>  
>      KBUILD_CFLAGS_KERNEL	$(CC) options specific for built-in
> -- 
> 2.17.1
> 
