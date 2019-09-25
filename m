Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC6FBE4EC
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2019 20:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfIYSsa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Sep 2019 14:48:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35337 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIYSsa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 14:48:30 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so6799362lji.2;
        Wed, 25 Sep 2019 11:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nKfUpHLkz9svGgGA7KdFTvOeu1Y3C/BE10QM4lr5FTY=;
        b=b1MDU6ya7eeJRozE9ILR0irVHcH0mex21bfq44VBM5u9rcp8I84A/0PVp7T0TXmMEB
         BkUvfiFkJXFWZYa6wjc+5PeQ6H05zfHAlqBMEox5dfquVzOjAERHiGD67+Kk+/ETl78Z
         6Thhc6JnQDLm7PGt2e/N9MjCmZmvwYmJWbzeZeYT/MOkPFE2DX6Wdxxxy6647dl4a5qF
         m6qpwpjFljK55k9wCV6yofyr9fuFOcwJArqvbIO/hczAVF6K7cAQ8DXt0/DbxveAu2Cb
         dT8JJJ1cyTUPOhl8dIdTeJRl5RzxgyPkcYkPGE//pjaC9CvMpvsJvULJmyc7qRc03GH9
         NqCg==
X-Gm-Message-State: APjAAAVnLttsTFIp6BNw5l4nRhnH1nK1nKnAXvE5goYqds7RSYn4HXDn
        VblR3nBxzKQsQ1IijjbQPY/ZCHLD
X-Google-Smtp-Source: APXvYqyvFUccd2zukRTEczoEsNvih3K7exRnAVR2xKzz32jUJhqlUsjPLF/Iv/mHAY8PcnWo1KdnbQ==
X-Received: by 2002:a2e:5d17:: with SMTP id r23mr7551323ljb.229.1569437307705;
        Wed, 25 Sep 2019 11:48:27 -0700 (PDT)
Received: from [10.10.124.58] (99-48-196-88.sta.estpak.ee. [88.196.48.99])
        by smtp.gmail.com with ESMTPSA id m21sm1323092lfh.39.2019.09.25.11.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 11:48:27 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Johannes Berg <johannes@sipsolutions.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
References: <20190924120740.12425-1-yamada.masahiro@socionext.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Subject: Re: [PATCH] modpost: fix static EXPORT_SYMBOL warnings for UML build
Message-ID: <e533db1a-7d68-4119-082c-75b9307f1f2a@linux.com>
Date:   Wed, 25 Sep 2019 21:48:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190924120740.12425-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 24.09.2019 15:07, Masahiro Yamada wrote:
> Johannes Berg reports lots of modpost warnings on ARCH=um builds:
> 
> WARNING: "rename" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "lseek" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "ftruncate64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "getuid" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "lseek64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "unlink" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "pwrite64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "close" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "opendir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "pread64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "syscall" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "readdir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "readdir64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "futimes" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__lxstat" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "write" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "closedir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__xstat" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "fsync" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__lxstat64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__fxstat64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "telldir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "printf" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "readlink" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__sprintf_chk" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "link" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "rmdir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "fdatasync" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "truncate" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "statfs" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__errno_location" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__xmknod" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "open64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "truncate64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "open" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "read" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "chown" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "chmod" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "utime" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "fchmod" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "seekdir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "ioctl" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "dup2" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "statfs64" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "utimes" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "mkdir" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "fchown" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__guard" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "symlink" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "access" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__stack_smash_handler" [vmlinux] is a static EXPORT_SYMBOL
> 
> When you run "make", the modpost is run twice; before linking vmlinux,
> and before building modules. All the warnings above are from the second
> modpost.
> 
> The offending symbols are defined not in vmlinux, but in the C library.
> The first modpost is run against the relocatable vmlinux.o, and those
> warnings are nicely suppressed because the SH_UNDEF entries from the
> symbol table clear the ->is_static flag.
> 
> The second modpost is run against the executable vmlinux (+ modules),
> where those symbols have been resolved, but the definitions do not
> exist.
> 
> This commit fixes it in a straight forward way. Suppress the static
> EXPORT_SYMBOL warnings from "vmlinux".
> 
> We see the same warnings twice anyway. For example, ARCH=arm64 defconfig
> shows the following warning twice:
> 
> WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_GPL
> 
> So, it is reasonable to suppress the second one.

Thanks, for fixing it. You can add my if you need
Tested-by: Denis Efremov <efremov@linux.com>

Tested on x86_64 and um arches. I've reverted the commit b08918fb3f2
"lz4: do not export static symbol" and checked for the warning. On um arch I've
tested that this fixes the false-positives.

> 
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/mod/modpost.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3961941e8e7a..442d5e2ad688 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2652,15 +2652,20 @@ int main(int argc, char **argv)
>  		fatal("modpost: Section mismatches detected.\n"
>  		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
>  	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
> -		struct symbol *s = symbolhash[n];
> +		struct symbol *s;
> +
> +		for (s = symbolhash[n]; s; s = s->next) {
> +			/*
> +			 * Do not check "vmlinux". This avoids the same warnings
> +			 * shown twice, and false-positives for ARCH=um.
> +			 */
> +			if (is_vmlinux(s->module->name) && !s->module->is_dot_o)
> +				continue;
>  
> -		while (s) {
>  			if (s->is_static)
>  				warn("\"%s\" [%s] is a static %s\n",
>  				     s->name, s->module->name,
>  				     export_str(s->export));
> -
> -			s = s->next;
>  		}
>  	}
>  
> 
