Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6E2AC29D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2019 00:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392552AbfIFWjQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 18:39:16 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46956 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392542AbfIFWjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 18:39:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id i8so7854495edn.13;
        Fri, 06 Sep 2019 15:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YNLqTN8803DFINNIjjxUVy15PHLGVY4/L8dez9jnCGo=;
        b=okfNRS/dbkcwoXAcUFWBTmUHQLMlnPPJTZRh52uiQo0H5Kiz66dYXEgwPJEUwyX8AI
         2xCjEpiEBizpBj/hlKX/9cSk8IxvSt58rhp/jX7T9lvDjYdihKE2hLQXpMdEWMbldZ0g
         FRAELyFjA6CI8it29Z2BDrHOu8MyPok1mYzA1EwYvJaU7gQOYTBMvub0cKlgI/T+Nnxz
         9mu/vw09M/A3ubUA/wCR5smInW2rmr+DX1IMDyzaLRHSupZfKmceKh3uUGJaSX7jlZyE
         W0DBvutUps2naG9w+Kt1yK1OKTHMQYDswSTGlyDcgwcViScQR2ks1cOkEOH6jxXIBajZ
         HgGQ==
X-Gm-Message-State: APjAAAUmVeEKdB8lD4too5u+zLcKto/L9cCWzuHXLg0BwoIEqzRWHAo/
        YHf5pz7ozRGVjuwDReTPKUfiVj+e
X-Google-Smtp-Source: APXvYqz7gLTmLHUbahLeOqR7dknkVE+aivBMARy2opxkne/AGr+ar0mOc39wS4C7xmosIlUDviq30Q==
X-Received: by 2002:a50:a5f8:: with SMTP id b53mr12284231edc.39.1567809553991;
        Fri, 06 Sep 2019 15:39:13 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id c32sm963827eda.97.2019.09.06.15.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2019 15:39:13 -0700 (PDT)
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
To:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Emil Velikov <emil.l.velikov@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        WANG Chao <chao.wang@ucloud.cn>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190906151059.1077708-1-arnd@arndb.de>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <7fc19dd4-93fb-fa15-3d36-3079cd42cf7c@linux.com>
Date:   Sat, 7 Sep 2019 01:39:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190906151059.1077708-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 06.09.2019 18:10, Arnd Bergmann wrote:
> On architectures such as ARM that have a list of symbols exported from
> assembler in a separate C file, we get a lot of new warnings:
> 
> WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
> WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
> WARNING: "__udivsi3" [vmlinux] is a static (unknown)
> WARNING: "_change_bit" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
> WARNING: "__umodsi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
> WARNING: "__muldi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
> WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
> WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
> ...
> 
> This is not helpful, as these are clearly not static symbols
> at all. Suppress the warning in a case like this.
> 

It looks very similar to this discussion https://lkml.org/lkml/2019/7/30/112

Could you please write the steps to reproduce the warnings?
Now, I'm trying to build linux-next (host Ubuntu 19.04 x86_64) with:
$ make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
But I can't get these warnings.

I would like to check the type of this asm symbols. It seems like they
are STT_NOTYPE. In this case the fix could also involve ELF_ST_TYPE check.

Thanks,
Denis

> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 76c221dd9b2b..4265dd924933 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
>  		struct symbol *s = symbolhash[n];
>  
>  		while (s) {
> -			if (s->is_static)
> +			if (s->is_static && s->export != export_unknown)
>  				warn("\"%s\" [%s] is a static %s\n",
>  				     s->name, s->module->name,
>  				     export_str(s->export));
> 
