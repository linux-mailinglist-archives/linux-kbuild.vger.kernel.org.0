Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE5AD769
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 12:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732720AbfIIK7B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 06:59:01 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20659 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732685AbfIIK7B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 06:59:01 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x89AwnPB011937;
        Mon, 9 Sep 2019 19:58:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x89AwnPB011937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568026729;
        bh=S+MPqiiGn4LeMb/joD8lDmJPCUqMxD5aET1rbJtbA3E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NpG/2pyWxvZrR+zTCmsx5S1z9V9SvNQHOc6MhtporV0ch3YQtgPe8BWpnv6KZ3OGp
         B7b0WaBwuizVr0IwEw1SasqvU7YoxMRwsrM1bfd1yUhmQ9OpDp8sHRs6ebbSjCtSh8
         4KUp4clsAKh/gWYkdLiLp6cN7R78TqU5xyl7UDzAxttrQ3MkSxkdXWuimOtVmMrH4A
         gUXip+E7Wu2vEJK1Ed/MyHSi0ZrilDKRZfzTHEkuZpyoMwZszfQh0PPG8GD+iZriq7
         mxYLn7NOA9Y3f1oQUk6W62WfxgK+t1ADD8V0dSGsFhGlg2Vyjy5nmw9Xm/WizeGaIS
         3uVBu3uAeSBVQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id v19so3290027vsv.3;
        Mon, 09 Sep 2019 03:58:49 -0700 (PDT)
X-Gm-Message-State: APjAAAUX2zLjO/UsWBWEpC3YEPbLdluY8ntIKVmGO3R21SjXmQ/mLNm2
        1l0uPuskQnf2aMEzmuvUnOef8TdPod2YE2TijV0=
X-Google-Smtp-Source: APXvYqw9/T+rWlyR5HmLkXqTF/IEN6zmlshds9MON4ldmzxUkO3UmoG47Ucs7zKVYJiS0/WfaAffsOgfqctDPTH4egI=
X-Received: by 2002:a67:1a41:: with SMTP id a62mr12842610vsa.54.1568026728299;
 Mon, 09 Sep 2019 03:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190906151059.1077708-1-arnd@arndb.de>
In-Reply-To: <20190906151059.1077708-1-arnd@arndb.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 9 Sep 2019 19:58:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_6cQs33nOsJyVCmztw62dx=0W59KWo4WH+SoUnzOJoQ@mail.gmail.com>
Message-ID: <CAK7LNAR_6cQs33nOsJyVCmztw62dx=0W59KWo4WH+SoUnzOJoQ@mail.gmail.com>
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        WANG Chao <chao.wang@ucloud.cn>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 7, 2019 at 12:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
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
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


This patch is not root-causing the problem,
rather it is hiding it.

I posted a real fix:
https://patchwork.kernel.org/patch/11137689/



> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 76c221dd9b2b..4265dd924933 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
>                 struct symbol *s = symbolhash[n];
>
>                 while (s) {
> -                       if (s->is_static)
> +                       if (s->is_static && s->export != export_unknown)
>                                 warn("\"%s\" [%s] is a static %s\n",
>                                      s->name, s->module->name,
>                                      export_str(s->export));
> --
> 2.20.0
>


-- 
Best Regards
Masahiro Yamada
