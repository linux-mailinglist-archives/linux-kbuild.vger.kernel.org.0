Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2852D5EFBB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 01:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfGCXq2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jul 2019 19:46:28 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49771 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfGCXq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 19:46:28 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x63NkMsr028613;
        Thu, 4 Jul 2019 08:46:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x63NkMsr028613
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562197583;
        bh=rJ6iT0au4ngG40wf1ctFNsLJ/Vpo/OHLwWrHUVVL5n0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pBRcwDlq9QFS40kSn8o+W7JGHIB79v1LZjAh3vvRvVw8IrJ6O2xZ/cIv0hfHjJ3lu
         BBcuNtOlojoeFW36HV75idpBRFfMseVcxkOKBmROLyZJ0pP482hPlEG4i8whHyNq6Z
         6NuKc8rQbEAF5UNrDPSJhV7Sr0TzhZV7lRirDE1dIVIj9o3+6k2/PAiqFf6FQYVBwb
         0o3oPO1SPmEtPo1/KCbwsWC9AynWROzjRkBj3g/yQUQtld2dX6rDtoczTStdnns+Ps
         WFvU00oSs4KkBeHvTrTF6xHujq2xbZE/ER0eDlnfGb2bnMPYXVLyO45/utiBaHgyqc
         5413gbq4asObg==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id r3so897047vsr.13;
        Wed, 03 Jul 2019 16:46:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWOWXuuD0GcZyguIysmxKxgOi9g0nieHWJ616ZEnifL8dJYFHvo
        hAiGNSAgQlxmFTKWYpvCs1zE7V2kBEitW1UD3lE=
X-Google-Smtp-Source: APXvYqygjbgdBLzYA0azdr6k7nnoESGst/swxhWFdByz3nqGXi0UFBizFXN+MN+2HjMPTCzfmxg0UBCFEEo0oK19Z7I=
X-Received: by 2002:a67:f495:: with SMTP id o21mr19975775vsn.54.1562197582238;
 Wed, 03 Jul 2019 16:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190627191448.110756-1-natechancellor@gmail.com>
In-Reply-To: <20190627191448.110756-1-natechancellor@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 4 Jul 2019 08:45:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATekKUTPvx4ywj_8yDLR8=Awmo6JKj5b-FBBF=EE+S-nw@mail.gmail.com>
Message-ID: <CAK7LNATekKUTPvx4ywj_8yDLR8=Awmo6JKj5b-FBBF=EE+S-nw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add ability to test Clang's integrated assembler
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 28, 2019 at 4:15 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> There are some people interested in experimenting with Clang's
> integrated assembler. To make it easy to do so without source
> modification, allow the user to specify 'AS=clang' as part of the
> make command to avoid adding '-no-integrated-as' to the {A,C}FLAGS.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/577
> Suggested-by: Dmitry Golovin <dima@golovin.in>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to linux-kbuild. Thanks.



> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 5102b2bbd224..d77481129339 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -527,7 +527,9 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> +ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
>  CLANG_FLAGS    += -no-integrated-as
> +endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> --
> 2.22.0
>


--
Best Regards
Masahiro Yamada
