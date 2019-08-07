Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD7284282
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 04:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfHGCea (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 22:34:30 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27579 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfHGCe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 22:34:29 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x772YGBx024672;
        Wed, 7 Aug 2019 11:34:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x772YGBx024672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565145257;
        bh=+Na/oaFlPFLzhHHyEv2bDd3O81VBBu2zQfuRfwJvQXw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XR/rK36vh0u87Xwt/y65OytK2uSGxSVdUOpRXGuCh2V2j+xpQW7awgRGdu4gSypo1
         60/d4Y6AxDIZ8irZTynu/TKj018yb408S7rFHdsVYCQodsoEMmk7HxcJ3JZOwUt2r8
         dAiJHoaxI/n35llOtDwrOSh1TneMZMoGjMkL0dnZQvG+RhLVsfVNXUi8QEOEEu7d6s
         e8kMLvv1ul6FYSoEQu9S7yfPpyXFXRsYM52IaGXbnPGNeoFI9Z0IQzUbyaf5fQZmZc
         E5HJ8fIBPfcotetORay00H/2iRjNNUQDJxkVwFKYt22bU12RFXDKeY/DxBf8cpWyHL
         yvwML97GZdeJA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id 2so59635461vso.8;
        Tue, 06 Aug 2019 19:34:17 -0700 (PDT)
X-Gm-Message-State: APjAAAU0NMJ2I/hbIZ2ir17Bzj9ADmQIiU+YYT2omy1c/EehMyndnVag
        VwTehROxDwKx70FzOBbFIOLW7CW4ktvr8a6IMcQ=
X-Google-Smtp-Source: APXvYqzAR/6xcUjB+iyJ4MYJeq0ddLIXMcTvItkNUaRF8fcH9f1uEUk3gJGXDCbRVBpXpGf6GvJXKbtx565Il2UT2zw=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr4441385vsd.215.1565145256312;
 Tue, 06 Aug 2019 19:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
 <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
In-Reply-To: <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 7 Aug 2019 11:33:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyNWjwVXdbgXt0mL+3R8jTGe_cq1vEW8_VvB250P4bdg@mail.gmail.com>
Message-ID: <CAK7LNATyNWjwVXdbgXt0mL+3R8jTGe_cq1vEW8_VvB250P4bdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] s390/build: use size command to perform empty .bss check
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Currently empty .bss checks performed do not pay attention to "common
> objects" in object files which end up in .bss section eventually.
>
> The "size" tool is a part of binutils and since version 2.18 provides
> "--common" command line option, which allows to account "common objects"
> sizes in .bss section size. Utilize "size --common" to perform accurate
> check that .bss section is unused. Besides that the size tool handles
> object files without .bss section gracefully and doesn't require
> additional objdump run.
>
> The linux kernel requires binutils 2.20 since 4.13.
>
> Kbuild exports OBJSIZE to reference the right size tool.
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---
>  arch/s390/scripts/Makefile.chkbss | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/s390/scripts/Makefile.chkbss b/arch/s390/scripts/Makefile.chkbss
> index 884a9caff5fb..ba1d7a8a242f 100644
> --- a/arch/s390/scripts/Makefile.chkbss
> +++ b/arch/s390/scripts/Makefile.chkbss
> @@ -11,8 +11,7 @@ chkbss: $(addprefix $(obj)/, $(chkbss-files))
>
>  quiet_cmd_chkbss = CHKBSS  $<
>        cmd_chkbss = \
> -       if $(OBJDUMP) -h $< | grep -q "\.bss" && \
> -          ! $(OBJDUMP) -j .bss -w -h $< | awk 'END { if ($$3) exit 1 }'; then \
> +       if ! $(OBJSIZE) --common $< | awk 'END { if ($$3) exit 1 }'; then \

While you are touching this line,
you may also want to replace 'awk' with $(AWK),
which is defined in the top-level Makefile.




>                 echo "error: $< .bss section is not empty" >&2; exit 1; \
>         fi; \
>         touch $@;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
