Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16152DFB73
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 12:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgLULSv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 06:18:51 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20746 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgLULSu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 06:18:50 -0500
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BLBHpAM011060
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Dec 2020 20:17:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BLBHpAM011060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608549471;
        bh=Nzg7IyEHTIbZ1Tj2XD3KJD9gtammLYQ8UqMShvhtraQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a7pmJ9Cz2WQ0trmTvv76Hld8BZTj5pQtGA5zxyzdD8p0ziJjooU/c/MCZyN9o26Fv
         ES1Jmzqrl09sakE4wZoh5nxmjVP7umkKCof5uqn4Q877OCo6dD9xGfMR0x1S+KQbSl
         FuPAyd8+xxT1/ZI8zpNb8MjeJONc65QzMVi1wNlXPfmVWfQR74sb4bvzIQgMDUNCgg
         3WOSEJUwP55GqXZYupGO0uCo0XEwrtl2Iu5X5xNRle/RGY2G8oGWp3Spk+vNv8r2L9
         tf90W7dfmx3lc3QnS2xXYt4+XRfXQpcg5loFa/Sb0aYuXRCNJTVqkDqZMMdJRiDOQi
         aDhoA12FPwkFQ==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id v2so6277590pfm.9
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Dec 2020 03:17:51 -0800 (PST)
X-Gm-Message-State: AOAM532E1K6QlPw3hobfrKtt4/v6pjl1lUWwPTQhL9bYlDKvARYhCteV
        exAma1Hcv8cs0DCkdXu7n4gZKZ7wy+GnTi0yoHU=
X-Google-Smtp-Source: ABdhPJypUnZYnW5wJ+0FMt6OcApazXWnbLbtNRGnFecWbdUgJTgLevEV5nODHbmbbDPRMUabeoxGOp2hWORrAQmE7jw=
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id
 n25-20020a62e5190000b0290197bcec7c0cmr14766153pff.63.1608549470631; Mon, 21
 Dec 2020 03:17:50 -0800 (PST)
MIME-Version: 1.0
References: <924931182.70312.1608123482150@office.mailbox.org>
In-Reply-To: <924931182.70312.1608123482150@office.mailbox.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 20:17:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7PGyxQfUmV_nqYGLipoo4B5Kky6i300_AO4R5qNO08g@mail.gmail.com>
Message-ID: <CAK7LNAT7PGyxQfUmV_nqYGLipoo4B5Kky6i300_AO4R5qNO08g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: use smaller dictionary size for xz module compression
To:     torvic9@mailbox.org
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 16, 2020 at 9:59 PM <torvic9@mailbox.org> wrote:
>
> By default, xz without parameters uses a dictionary size of 8 MB.
> However, most modules are much smaller than that.
> The xz manpage states that 'increasing dictionary size usually improves
> compression ratio, but a dictionary bigger than the uncompressed file
> is waste of memory'.
> Use a dictionary size of 2 MB for module compression, resulting in
> slightly higher compression speed while still maintaining a good
> compression ratio.
>
> Signed-off-by: Tor Vic <torvic9@mailbox.org>
> ---

Applied to linux-kbuild. Thanks.


>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 076d4e6b9..f9a6d0a4d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,7 +1058,7 @@ ifdef CONFIG_MODULE_COMPRESS
>      mod_compress_cmd = $(KGZIP) -n -f
>    endif # CONFIG_MODULE_COMPRESS_GZIP
>    ifdef CONFIG_MODULE_COMPRESS_XZ
> -    mod_compress_cmd = $(XZ) -f
> +    mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
> --
> 2.29.2



-- 
Best Regards
Masahiro Yamada
