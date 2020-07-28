Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302E622FF28
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 03:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgG1ByX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 21:54:23 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:50595 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG1ByX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 21:54:23 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06S1rvox001453;
        Tue, 28 Jul 2020 10:53:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06S1rvox001453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595901238;
        bh=fr77uZW5pkExE/2l945ZgcVmpIWMWixWve+W0/foO0I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iZFlIy/58eaeViqw4tzUSb6HqsIPeYtY1uoDAKOV451lh6++upzFdjAL9NAG8ngdm
         ZnopSaGHNw2r5sijYo5lBsorJY9W7+vl+xhcbNP/ctAD26r9204FPybISlBNk50OKo
         ayQU6sEVqQeKr7w95ZmgH3IwN/GDtcu+rxstGGpNICYvTQz6YTOvd9NwwECpmDCIzH
         6t9PoKxmR3jtMMHZLiMtg5xz6h77SPOzOSdS3wMBIMiOogDRCuK3iwHm49jbgfa9nA
         o+/7yNbNhd+OqNOTHVWKJS2w9wPTLFU4J01rxZ/0qhUdysiV9FNoMFhWlutJZzheHc
         jTNmAE/CU0avw==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id p8so1904826vsm.12;
        Mon, 27 Jul 2020 18:53:58 -0700 (PDT)
X-Gm-Message-State: AOAM532KnrHSchEvk6yZcWJ98rSQ9u85vQlpFAfLY9pWJ8ott1LnocJN
        ZQvIMP49Xnpw+yKIE7QLR9hP9B5fDV7tfXlhASM=
X-Google-Smtp-Source: ABdhPJxovGQm4W0p9SeE2Z2xLAA4JiVFPKljNJrhoYtrwsuRJbf/sEJepBRJg+FoHlyQxIlc+CPJ9Pw5gZLX5e0Ili8=
X-Received: by 2002:a67:d908:: with SMTP id t8mr6595176vsj.215.1595901236916;
 Mon, 27 Jul 2020 18:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200727230606.906598-1-nickrterrell@gmail.com> <20200727230606.906598-8-nickrterrell@gmail.com>
In-Reply-To: <20200727230606.906598-8-nickrterrell@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 28 Jul 2020 10:53:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHBfYHXoz5=b8hc7c61JeZP6UiJjOX3r+S3WHRwnUm6g@mail.gmail.com>
Message-ID: <CAK7LNATHBfYHXoz5=b8hc7c61JeZP6UiJjOX3r+S3WHRwnUm6g@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] .gitignore: add ZSTD-compressed files
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Ingo Molnar <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 28, 2020 at 8:11 AM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Adam Borowski <kilobyte@angband.pl>
>
> For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
> will come, thus let's be consistent with all other compressors.
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index d5f4804ed07c..162bd2b67bdf 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -44,6 +44,7 @@
>  *.tab.[ch]
>  *.tar
>  *.xz
> +*.zst


If you have any chance to update this,
please remember to add '*.zst' to
Documentation/dontdiff as well.




>  Module.symvers
>  modules.builtin
>  modules.order
> --
> 2.27.0
>


--
Best Regards
Masahiro Yamada
