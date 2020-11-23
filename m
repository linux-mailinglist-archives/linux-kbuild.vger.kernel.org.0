Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19BE2C12DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 19:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390504AbgKWSD1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 13:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732856AbgKWSD0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 13:03:26 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1CAC0613CF;
        Mon, 23 Nov 2020 10:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=OObJ8CFs/RF4JADFo21gw1GeU5aunbU6wrCqOovTttE=; b=w9BOvjyRNYRE67mRoXEraNe4+i
        I9UG9YHuKbqyUGsDMXfc3h6lJEqN9+5ngRaASevx9zrWIjoOPBhLij3iGqFUM+UmxkAjMVAdTsV0n
        l2PVKwg8/YCtqmrHyINY09+C9KzTFMlxnwAHY0OhfZbwuAqlDjkzOoza+96YUvUjJDbeg2cRUDjhq
        nLn92uwTzGwIx8xY0OgaYJoYwML0RrxWMmmGZshrJkoQxrLQ6tBK7ERgnR1i96AWNS9g9zsRaCyF3
        U3GITzwRpohjFO3uSvAw/7CvVq0NSMmmalxgooh9tSERZNMt4T065nfUy4K65+rEDi7gTHMxuG6B+
        8V/fmSNg==;
Received: from [2601:1c0:6280:3f0::bcc4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1khGBQ-0000El-98; Mon, 23 Nov 2020 18:03:24 +0000
Subject: Re: [PATCH 7/7] kbuild: doc: document subdir-y syntax
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201123045403.63402-1-masahiroy@kernel.org>
 <20201123045403.63402-7-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5c40293a-a24a-2c85-e7ef-a08a8c732d19@infradead.org>
Date:   Mon, 23 Nov 2020 10:03:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123045403.63402-7-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/22/20 8:54 PM, Masahiro Yamada wrote:
> There is no explanation about subdir-y.
> 
> Let's document it.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 159e470f2616..6332b9ca7942 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -319,6 +319,20 @@ more details, with real examples.
>  	that directory specifies obj-y, those objects will be left orphan.
>  	It is very likely a bug of the Makefile or of dependencies in Kconfig.
>  
> +	Kbuild also supports dedicated syntax, subdir-y and subdir-m, for
> +	descending into subdirectories. It is a good fit when you know they
> +	do not contain kernel-space objects at all. A typical usage is to let
> +	Kbuild descend into subdirectories to build tools.
> +
> +	Examples::
> +
> +		subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
> +		subdir-$(CONFIG_MODVERSIONS) += genksyms
> +		subdir-$(CONFIG_SECURITY_SELINUX) += selinux
> +
> +	Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
> +	syntax is always used for directories.
> +

Just curious:  Is a trailing slash allowed here?  say for consistency?

>  	It is good practice to use a `CONFIG_` variable when assigning directory
>  	names. This allows kbuild to totally skip the directory if the
>  	corresponding `CONFIG_` option is neither 'y' nor 'm'.
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy
