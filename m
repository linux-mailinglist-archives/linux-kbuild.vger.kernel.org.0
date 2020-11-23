Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0B52C126B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 18:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390428AbgKWRwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 12:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731384AbgKWRwF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 12:52:05 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122E4C0613CF;
        Mon, 23 Nov 2020 09:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4uge9n3JvxS3oyNo5oLbmf2bkNMwC/XqE8caWlCKQJc=; b=PUTgVCe66MY5+Jh4PTEFaAu9ZW
        6rMcl+A28zu9lxCkp0Wg4rMbUi5UijNhIU6Te1a7WljzvkTZZ3NfzHpB5x0Hek2sL0ptZVNcXJwTx
        stOfzygEw/yBU1ezf2eMbCiCm9p7P3qGFGxTyNRm9v1CzmJVWDxJvFpl5eoDOTUTQe25dgpo7sDRv
        jqm2Rz5mKT2sacVvjhlHMpLLDytXOJRaptfSOoseKFi4ojsHY+7sIl/BX6bb9UdbcYw/BKramBWXk
        jGm0Alp09gG9vf4tRDlwuMFKzR6nSfmVWYipZj75thcnPMO7/huncCEgOxyfBbYodFV1U3H7gKj0J
        dKjThokQ==;
Received: from [2601:1c0:6280:3f0::bcc4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1khG0R-0005DY-09; Mon, 23 Nov 2020 17:52:03 +0000
Subject: Re: [PATCH 5/7] kbuild: doc: split if_changed explanation to a
 separate section
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201123045403.63402-1-masahiroy@kernel.org>
 <20201123045403.63402-5-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e2015905-1639-fa21-cf40-322362c3921b@infradead.org>
Date:   Mon, 23 Nov 2020 09:51:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123045403.63402-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/22/20 8:54 PM, Masahiro Yamada wrote:
> The if_changed macro is currently explained in the section
> "Commands useful for building a boot image", but the use of
> if_changed is not limited to the boot image.
> 
> It is often used together with custom rules. Let's split it as a
> separate section, and insert it after the "Custom Rules" section.
> 
> I slightly reworded the explanation, re-numbered to fill the <deleted>
> section, and also fixed the broken indentation of the Note: part.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/makefiles.rst | 94 +++++++++++++++++-------------
>  1 file changed, 52 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index f5a983709df7..49afcb1d3695 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -16,9 +16,9 @@ This document describes the Linux kernel Makefiles.
>  	   --- 3.5 Library file goals - lib-y
>  	   --- 3.6 Descending down in directories
>  	   --- 3.7 Compilation flags
> -	   --- 3.8 <deleted>
> -	   --- 3.9 Dependency tracking
> -	   --- 3.10 Custom Rules
> +	   --- 3.8 Dependency tracking
> +	   --- 3.9 Custom Rules
> +	   --- 3.10 Command change detection
>  	   --- 3.11 $(CC) support functions
>  	   --- 3.12 $(LD) support functions
>  	   --- 3.13 Script Invocation
> @@ -410,7 +410,7 @@ more details, with real examples.
>  		AFLAGS_iwmmxt.o      := -Wa,-mcpu=iwmmxt
>  
>  
> -3.9 Dependency tracking
> +3.8 Dependency tracking
>  -----------------------
>  
>  	Kbuild tracks dependencies on the following:
> @@ -422,8 +422,8 @@ more details, with real examples.
>  	Thus, if you change an option to $(CC) all affected files will
>  	be re-compiled.
>  
> -3.10 Custom Rules
> -------------------
> +3.9 Custom Rules
> +----------------
>  
>  	Custom rules are used when the kbuild infrastructure does
>  	not provide the required support. A typical example is
> @@ -499,6 +499,52 @@ more details, with real examples.
>  
>  	will be displayed with "make KBUILD_VERBOSE=0".
>  
> +3.10 Command change detection
> +-----------------------------
> +
> +	When the rule is evaluated, timestamps are compared between the target
> +	and its prerequisite files. GNU Make updates the target when any of the
> +	prerequisites is newer than that.
> +
> +	The target should be rebuilt also when the command line has changed
> +	since the last invocation. This is not supported by Make itself, so
> +	Kbuild achieves this by a kind of meta-programming.
> +
> +	if_changed is the macro used for this purpose, in the following form::
> +
> +		quiet_cmt_<command> = ...

		      cmd

> +		      cmd_<command> = ...
> +
> +		<target>: <source(s)> FORCE
> +			$(call if_changed,<command>)
> +
> +	Any target that utilizes if_changed must be listed in $(targets),
> +	otherwise the command line check will fail, and the target will
> +	always be built.
> +
> +	If the target is already listed in the recognized syntax such as
> +	obj-y/m, lib-y/m, extra-y/m, hostprogs, userprogs, Kbuild automatically

	                                                   then Kbuild automatically

> +	add it to $(targets). Otherwise, the target must be explicitly added

	adds

> +	to $(targets).
> +
> +	Assignments to $(targets) are without $(obj)/ prefix. if_changed may be
> +	used in conjunction with custom rules as defined in "3.9 Custom Rules".
> +
> +	Note: It is a typical mistake to forget the FORCE prerequisite.
> +	Another common pitfall is that whitespace is sometimes significant; for
> +	instance, the below will fail (note the extra space after the comma)::
> +
> +		target: source(s) FORCE
> +
> +	**WRONG!**	$(call if_changed, objcopy)
> +
> +	Note:
> +		if_changed should not be used more than once per target.
> +		It stores the executed command in a corresponding .cmd
> +		file and multiple calls would result in overwrites and
> +		unwanted results when the target is up to date and only the
> +		tests on changed commands trigger execution of commands.
> +
>  3.11 $(CC) support functions
>  ----------------------------
>  
> @@ -1287,42 +1333,6 @@ When kbuild executes, the following steps are followed (roughly):
>      Kbuild provides a few macros that are useful when building a
>      boot image.
>  
> -    if_changed
> -	if_changed is the infrastructure used for the following commands.
> -
> -	Usage::
> -
> -		target: source(s) FORCE
> -			$(call if_changed,ld/objcopy/gzip/...)
> -
> -	When the rule is evaluated, it is checked to see if any files
> -	need an update, or the command line has changed since the last
> -	invocation. The latter will force a rebuild if any options
> -	to the executable have changed.
> -	Any target that utilises if_changed must be listed in $(targets),
> -	otherwise the command line check will fail, and the target will
> -	always be built.
> -	Assignments to $(targets) are without $(obj)/ prefix.
> -	if_changed may be used in conjunction with custom rules as
> -	defined in "3.10 Custom Rules".
> -
> -	Note: It is a typical mistake to forget the FORCE prerequisite.
> -	Another common pitfall is that whitespace is sometimes
> -	significant; for instance, the below will fail (note the extra space
> -	after the comma)::
> -
> -		target: source(s) FORCE
> -
> -	**WRONG!**	$(call if_changed, ld/objcopy/gzip/...)
> -
> -        Note:
> -	      if_changed should not be used more than once per target.
> -              It stores the executed command in a corresponding .cmd
> -
> -        file and multiple calls would result in overwrites and
> -        unwanted results when the target is up to date and only the
> -        tests on changed commands trigger execution of commands.
> -
>      ld
>  	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
>  
> 


thanks.
-- 
~Randy

