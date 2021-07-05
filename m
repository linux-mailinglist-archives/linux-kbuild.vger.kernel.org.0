Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5B93BC1B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 18:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhGEQhT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 12:37:19 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19449 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhGEQhT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 12:37:19 -0400
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 165GYMEO020676
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Jul 2021 01:34:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 165GYMEO020676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625502863;
        bh=dn2GyAUPt0rdQzxHwSkjXH1a7BimxMXDHxWd8eH1Z60=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p8/mhuk/vU5ZWDhgz8n8TirJWbpv54l+M03KUv4spSH0U4/toBuDzENwxVSJ9MOLu
         5bjFeP9oXDoVcVNYd/KyMFOg5u1Y4GGBMmv8kTonoLg6PVQ1ObzgFxv0sd2wczZRWo
         nwHacwrF2fR7i0F3vcbg4kT1l10u7K/C5y40nvsEOZYim3e9/j4XEl6DePG3kurKND
         C0kcil4+GS8a/VUeeYa2SAuDlIVrBxH9n4osTCV/Rybo+LwoTJaWpiFg/aDI0m0NWJ
         OvHTPR6rhurdJhwe7qAarhwtnM3X+OD4K7SKICG8544cm3OVXU2pHKfY6iupy83ZBU
         pnsaKzDdXAxng==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id o4so7449225plg.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Jul 2021 09:34:22 -0700 (PDT)
X-Gm-Message-State: AOAM530jzVfjkDcj+tE8bdDDDPpnI8l5rvx6GYebNIdss1oik9L6nTAx
        mDclX/xfWbK0rX1GE9fNRwPWv4oCTGKCpLhQ524=
X-Google-Smtp-Source: ABdhPJxNRNOBhGiHK9e9nkF2H2EUry5QGebA/3QP8mBRjgFP4thg6bgoB4WhkQbc/AAoN71CFZ/A1ugPffTYSpceV8k=
X-Received: by 2002:a17:90b:1203:: with SMTP id gl3mr2221286pjb.153.1625502861922;
 Mon, 05 Jul 2021 09:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <YOBIRA8oXQh4Antq@localhost.localdomain>
In-Reply-To: <YOBIRA8oXQh4Antq@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Jul 2021 01:33:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnUV7i17QKAULLVmbS4=fBE1Lcm=8uH6rfwmT-CAkY2w@mail.gmail.com>
Message-ID: <CAK7LNASnUV7i17QKAULLVmbS4=fBE1Lcm=8uH6rfwmT-CAkY2w@mail.gmail.com>
Subject: Re: [PATCH] cc-can-link.sh: check for linking capability in a more
 robust way
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 3, 2021 at 8:21 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> Compiling "printf("");" doesn't necessarily check for linking capability
> as printf can be optimised for constants strings even at -O0:
>
>         0000000000401106 <main>:
>           401106:       push   rbp
>           401107:       mov    rbp,rsp
>           40110a:       mov    eax,0x0
>           40110f:       pop    rbp
>           401110:       ret
>
> Pass something from the command line to disable optimisations:
>
>         0000000000401126 <main>:
>           401126:       push   rbp
>           401127:       mov    rbp,rsp
>           40112a:       sub    rsp,0x10
>           40112e:       mov    DWORD PTR [rbp-0x4],edi
>           401131:       mov    QWORD PTR [rbp-0x10],rsi
>           401135:       mov    rax,QWORD PTR [rbp-0x10]
>           401139:       add    rax,0x8
>           40113d:       mov    rax,QWORD PTR [rax]
>           401140:       mov    rdi,rax
>           401143:       mov    eax,0x0
>           401148:  ***  call   401030 <printf@plt>
>           40114d:       mov    eax,0x0
>           401152:       leave
>           401153:       ret
>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>
>  scripts/cc-can-link.sh |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- a/scripts/cc-can-link.sh
> +++ b/scripts/cc-can-link.sh
> @@ -3,9 +3,9 @@
>
>  cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
>  #include <stdio.h>
> -int main(void)
> +int main(int argc, char *argv[])
>  {
> -       printf("");
> +       printf(argv[1]);
>         return 0;
>  }
>  END

Ah, right.

But, we should not merge a bad coding example.

argv[1] may contain '%' format string, and
recent GCC versions warn about it.



$ cat test.c
#include <stdio.h>

int main(int argc, char *argv[])
{
    printf(argv[1]);
    return 0;
}
$ gcc -c -o test.o  test.c
test.c: In function =E2=80=98main=E2=80=99:
test.c:5:5: warning: format not a string literal and no format
arguments [-Wformat-security]
    5 |     printf(argv[1]);
      |     ^~~~~~




I think replacing printf("") with printf("a")
(or any string you like)
is enough.



--=20
Best Regards
Masahiro Yamada
