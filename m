Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7237E3612CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 21:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbhDOTP1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 15:15:27 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32425 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234505AbhDOTP1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 15:15:27 -0400
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 13FJEoup030833;
        Fri, 16 Apr 2021 04:14:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 13FJEoup030833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618514091;
        bh=EmolGnRyn1yp9QOm5sqU5YfsZ9PFrgktuvgVHQEMoGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xZ0vPzdlN6LM3y0Ie8m4eaKJKREIAQUZFV+kISUQrg2WKr//gU4T2UVDdKFmMqNnI
         N6Ke8jkNxyUwEoT5ZTy2stBrlRZaGiWTnpiE8qpAzAC1mvQi/QayysuSeZtwaccT1B
         ee9Gl/ntvcpKrgGzRMPjkqZtxKxRYeTmeYd4WMQ9eTHbDyySI3RpHS+TGGBRrTJ+NZ
         q377GdsQwFZHs/8+8hcm/0/aJsCTLZinmqO4rCr4A0vXc4X0rYYiKXQ/uUxhWwuXh4
         zGllQtxJf29iQq4G0D4e7ZH9ky52h6QWBEmPxC2asyisxatCa+H8uEOZ/a4/amHHlY
         OZ7hu4Vuvi5Pg==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id o123so16719909pfb.4;
        Thu, 15 Apr 2021 12:14:51 -0700 (PDT)
X-Gm-Message-State: AOAM530dcUU7B5r4cVhbLYbVy7zSNBm/2SDfcMPzKOX/MPTVJqCsyeOs
        a+vNwPAFO6ABXiKp+kXEBwipeZROLLeWJlkVJqo=
X-Google-Smtp-Source: ABdhPJzmmsqgHMc7XPXnewPtYR1MgcDRqUUkEaOwsLqBWNXQ7wzzoHC0wBjhKHOLsTl2oO5F947XAoY9Ai4nl7QQ2vg=
X-Received: by 2002:a65:45cf:: with SMTP id m15mr4709604pgr.7.1618514090477;
 Thu, 15 Apr 2021 12:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210415171352.27398-1-rdunlap@infradead.org>
In-Reply-To: <20210415171352.27398-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 16 Apr 2021 04:14:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRLgRTZMwzbwnrYA96hLDpzWm8JVBMYQSHMNasXCHtdQ@mail.gmail.com>
Message-ID: <CAK7LNASRLgRTZMwzbwnrYA96hLDpzWm8JVBMYQSHMNasXCHtdQ@mail.gmail.com>
Subject: Re: [PATCH v2] uml: fix W=1 missing-include-dirs warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 2:14 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Currently when using "W=1" with UML builds, there are over 700 warnings
> like so:
>
>   CC      arch/um/drivers/stderr_console.o
> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>
> but arch/um/ does not have include/uapi/ at all, so add that
> subdir and put one Kbuild file into it (since git does not track
> empty subdirs).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> ---
> v2: use Option 4 from v1: add arch/um/include/uapi so that 'make' is
>     placated -- and just like all other arch's have.



Assuming the UML maintainer will pick up this:

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>







>  arch/um/include/uapi/asm/Kbuild |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/um/include/uapi/asm/Kbuild b/arch/um/include/uapi/asm/Kbuild
> new file mode 100644
> index 000000000000..f66554cd5c45
> --- /dev/null
> +++ b/arch/um/include/uapi/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0



-- 
Best Regards
Masahiro Yamada
