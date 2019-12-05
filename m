Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2971A1145AD
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 18:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbfLERSe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Dec 2019 12:18:34 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43226 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729931AbfLERSd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 12:18:33 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xB5HIQ3R020066;
        Fri, 6 Dec 2019 02:18:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xB5HIQ3R020066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575566306;
        bh=QL32G2WdF6azl/M1VG/2Usp3aoWAZyCVws/CUFl9rb4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y1FGyYwx6csO1vRVtt/Ru8/5yMZHTIZi4xAIqO3ic1JLCmnMHXJkGjuRxAvUgAUXe
         qD6swSbs2hiw+UALRJR7QfXBcusoaJvl9YR/2ggKJ9vtg9DU+ymDHb+bA4H4KLfixU
         0t3DJ/6ps5PYBdmXsIUVZCQSfadpAzRlvyqthLPmNOKzlFNWLBgWaySFh3dPHo98W3
         6OvI06elagDirlqZGCT8y/pvlJHe32A6HrJU+unQA2oMp5DcFwm239cW6U3y+ZGqw/
         MffiyYk0wZYFgbOOJaKTWYbRn7wCjwg/5tMVRN7B50z1Y66luHsjl7sG+6Zi7OT3+P
         2I7bAjm26YAFQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id t12so2891291vso.13;
        Thu, 05 Dec 2019 09:18:26 -0800 (PST)
X-Gm-Message-State: APjAAAXn8FNOdXhBKXSB2QD/D4RZXgWZiDFBY7acITju3hOIJGiHHHyQ
        h//CnSGQ8kuPYDgTlHC21hImd5ZhNW3Jo8meyP4=
X-Google-Smtp-Source: APXvYqwz6lzk87ldWLnWUzk21C9QPPg6PLsEbHUvaYKdF+V+4oRwlq5fl1MsZzBqBiG7ttamceW1FOnm7utbplCXIg4=
X-Received: by 2002:a67:f6c2:: with SMTP id v2mr6318415vso.54.1575566305236;
 Thu, 05 Dec 2019 09:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20191204025148.32101-1-masahiroy@kernel.org>
In-Reply-To: <20191204025148.32101-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Dec 2019 02:17:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3wSV6a48zMg=o2RXBz8qaijo6SqBcSyzwf0sW=dF71A@mail.gmail.com>
Message-ID: <CAK7LNAS3wSV6a48zMg=o2RXBz8qaijo6SqBcSyzwf0sW=dF71A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix 'No such file or directory' warning when cleaning
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 4, 2019 at 11:52 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> Since commit fcbb8461fd23 ("kbuild: remove header compile test"),
> 'make clean' with O=3D option in the pristine source tree emits
> 'No such file or directory' warning.
>
> $ git clean -d -f -x
> $ make O=3Dfoo clean
> make[1]: Entering directory '/home/masahiro/linux/foo'
> find: =E2=80=98usr/include=E2=80=99: No such file or directory
> make[1]: Leaving directory '/home/masahiro/linux/foo'
>
> Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 24543a30b9f0..e5895a79c45f 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -95,7 +95,7 @@ endif
>  # asm-generic/*.h is used by asm/*.h, and should not be included directl=
y
>  header-test- +=3D asm-generic/%
>
> -extra-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name =
'*.h'))
> +extra-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name =
'*.h' 2>/dev/null))
>
>  quiet_cmd_hdrtest =3D HDRTEST $<
>        cmd_hdrtest =3D \
> --
> 2.17.1
>


--=20
Best Regards
Masahiro Yamada
