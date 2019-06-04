Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BDA33C5F
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 02:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfFDAWZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 20:22:25 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64297 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfFDAWZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 20:22:25 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x540M1mR019345;
        Tue, 4 Jun 2019 09:22:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x540M1mR019345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559607722;
        bh=vJ1cweqSdQYB054guIxhOJAaEJB/bEmHWZNFfSrSJso=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RQNoEYcTdw3NzdWYf1ffHFp6b/eZON8pzA2+Nd68byGOLDsEbmio9t9KoNClzV5cZ
         o6AI+laKDyqfZtd4b9gcjtFirSMJrj0H7iZnyG9kKkgGbXibEAqJKdC5W3zVJB7sy5
         BXvnufXZoN2F1smYQR7BlBOJcCjagP4YnWXKq+9FlyI8CNjTYi7Wc7oKL9zC4vdSzS
         ZCnx38NoqVTQds6gRPBZKcrGd/Jv6YjoXkEjSnGFx4RUCj5UPRwT9lXLIEc6Ybagpd
         p/Ngla7ODn5H6X4fhOXQ7kZYhZyzWrNHYsqoJ4Tiuq2/7y11ZxTUga5SNF5i+gnkrd
         CNE4TjDcYjTeg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id o5so12443323vsq.4;
        Mon, 03 Jun 2019 17:22:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXjRTKoioEksDDe+vgMTaZcIZc2iXMgDVa67pYtyY1kvZ0UJ5S6
        5lWZg+I6rtcLBIUgWJMAiv7UqutbELqyHNp/CFg=
X-Google-Smtp-Source: APXvYqzeH356j9negLRvi5cQExy495qSjN7QxXPNDXUQqb0o95Okzc1m2PLCBoc/s+MNiFKU9ABVlyK4jCnsoFFAlT0=
X-Received: by 2002:a67:b109:: with SMTP id w9mr3557747vsl.155.1559607720924;
 Mon, 03 Jun 2019 17:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <1559572240-18706-1-git-send-email-george_davis@mentor.com>
In-Reply-To: <1559572240-18706-1-git-send-email-george_davis@mentor.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 4 Jun 2019 09:21:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6Rfuohy8dQSnqXbFeERki-aaNTc0G0uFojCTE-4i=mg@mail.gmail.com>
Message-ID: <CAK7LNAQ6Rfuohy8dQSnqXbFeERki-aaNTc0G0uFojCTE-4i=mg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/checkstack.pl: Fix arm64 wrong or unknown architecture
To:     "George G. Davis" <george_davis@mentor.com>
Cc:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Qian Cai <cai@lca.pw>,
        Andrew Morton <akpm@linux-foundation.org>,
        Breno Leitao <leitao@debian.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 3, 2019 at 11:31 PM George G. Davis <george_davis@mentor.com> wrote:
>
> The following error occurs for the `make ARCH=arm64 checkstack` case:
>
> aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> perl ./scripts/checkstack.pl arm64
> wrong or unknown architecture "arm64"
>
> As suggested by Masahiro Yamada, fix the above error using regular
> expressions in the same way it was fixed for the `ARCH=x86` case via
> commit fda9f9903be6 ("scripts/checkstack.pl: automatically handle
> 32-bit and 64-bit mode for ARCH=x86").
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> ---

Applied to linux-kbuild/fixes. Thanks.

> v1:
> - https://patchwork.kernel.org/patch/10970393/
> v2:
> - Updates as Suggested-by: Masahiro Yamada
> - Update commit subject due to moving the fix from Makefile to
>   checkstack.pl
> ---
>  scripts/checkstack.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> index 122aef5e4e14..371bd17a4983 100755
> --- a/scripts/checkstack.pl
> +++ b/scripts/checkstack.pl
> @@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
>         $x      = "[0-9a-f]";   # hex character
>         $xs     = "[0-9a-f ]";  # hex character or space
>         $funcre = qr/^$x* <(.*)>:$/;
> -       if ($arch eq 'aarch64') {
> +       if ($arch =~ '^(aarch|arm)64$') {
>                 #ffffffc0006325cc:       a9bb7bfd        stp     x29, x30, [sp, #-80]!
>                 #a110:       d11643ff        sub     sp, sp, #0x590
>                 $re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
