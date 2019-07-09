Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C5463626
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 14:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfGIMr0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 08:47:26 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:47582 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIMr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 08:47:26 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x69ClLlx023238
        for <linux-kbuild@vger.kernel.org>; Tue, 9 Jul 2019 21:47:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x69ClLlx023238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562676442;
        bh=ilu9iYTPnh++CjOouVhpFUsTznsjGmWm92jAGOk+svw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YdbU97o35RUUiZlLBY5Vbus0iLrWRzoFi7uwkuVxf8IEh7NHVjXEL9ONrUbNZxOxi
         VpnENuHrwnEPtJHCiEKqDHFPMTAI/vYPYa//NaIgZUqEcnhhBRpFAaYn/kcByO4Pxe
         MvS9946sGMSn1z5fN9FZ6H5byBXd+TnF5p7MasXBBE83/RWpB0/nSjPSSt92yXsTWz
         Do7fpYj+fHY1thZl+7LEjrg0xnjPN53/rW44i71lcr6iIHrYeAsG89Lqjz3sUknAY7
         JZdn+XSYtj2JRAcFFfj7mZuYM0gmHzmCig19WtaQzVqVAFzJIHMaq/B1ToY9MrUWGj
         9dWUfq8C0GLkw==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id g11so2831087uak.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2019 05:47:21 -0700 (PDT)
X-Gm-Message-State: APjAAAWi2GhQLqgtAP8CVhuao16+ht6v0rD+L2/kdpO6y1/RG6M+ij5D
        0LDY4VnOm6+m6vJ5o7UaARZkoPDTKhn7Ue7vAyQ=
X-Google-Smtp-Source: APXvYqwtN5S+pfI099C3QnJaHQki69j+1Nns+rP5njAxB2ZbkDODAtbyxoH75AWkiMDikP6eLG/A2xznAlpneekYWQc=
X-Received: by 2002:a9f:2265:: with SMTP id 92mr14234092uad.121.1562676440786;
 Tue, 09 Jul 2019 05:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190709105048.4608-1-hws@denx.de>
In-Reply-To: <20190709105048.4608-1-hws@denx.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 9 Jul 2019 21:46:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATg=dqbpo8PNvtLE7x8QDm0LrU=BQ_POfdFFGkJ_fU=9A@mail.gmail.com>
Message-ID: <CAK7LNATg=dqbpo8PNvtLE7x8QDm0LrU=BQ_POfdFFGkJ_fU=9A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix compression errors getting ignored
To:     Harald Seiler <hws@denx.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 9, 2019 at 7:52 PM Harald Seiler <hws@denx.de> wrote:
>
> A missing compression utility or other errors were not picked up by make
> and an empty kernel image was produced.  By removing the &&, errors will
> no longer be ignored.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Harald Seiler <hws@denx.de>
> ---

Applied to linux-kbuild. Thanks.


> Changes in v2:
>   - Use a much simpler fix for this problem
>
> Thanks!  Somehow I totally missed doing it this way ...
>
>  scripts/Makefile.lib | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f1f38c8cdc74..768e697df304 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -331,19 +331,19 @@ printf "%08x\n" $$dec_size |                                              \
>  )
>
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9 && $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
>
>  # Lzma
>  # ---------------------------------------------------------------------------
>
>  quiet_cmd_lzma = LZMA    $@
> -      cmd_lzma = { cat $(real-prereqs) | lzma -9 && $(size_append); } > $@
> +      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
>
>  quiet_cmd_lzo = LZO     $@
> -      cmd_lzo = { cat $(real-prereqs) | lzop -9 && $(size_append); } > $@
> +      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
>
>  quiet_cmd_lz4 = LZ4     $@
> -      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout && \
> +      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
>                    $(size_append); } > $@
>
>  # U-Boot mkimage
> @@ -386,7 +386,7 @@ quiet_cmd_uimage = UIMAGE  $@
>  # big dictionary would increase the memory usage too much in the multi-call
>  # decompression mode. A BCJ filter isn't used either.
>  quiet_cmd_xzkern = XZKERN  $@
> -      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh && \
> +      cmd_xzkern = { cat $(real-prereqs) | sh $(srctree)/scripts/xz_wrap.sh; \
>                       $(size_append); } > $@
>
>  quiet_cmd_xzmisc = XZMISC  $@
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
