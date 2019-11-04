Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C445ED753
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 02:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfKDBwU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Nov 2019 20:52:20 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19777 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbfKDBwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 20:52:20 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xA41qFbd025581;
        Mon, 4 Nov 2019 10:52:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xA41qFbd025581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572832336;
        bh=1jJG3p1GAqefzP7l/Yb2jRBhI70WeehHAYn/NfnOFW0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IYMvvM7iG9qRgx96sB+hOdQSgcO/lL30NssppM9FcKFoohOvFCTJwErvE9Y1GEud3
         mohYLK0FBl+fkDwvG83/IjDk+d0u25OW8YZBI6e2NoViWPLAf/UEJFR6l3VZB37KRk
         0sCDuKDJXHNC/q9Qau6NMBYmz/dbCtloCsChUCRtjzlgeMr60V38vS46CRMNgVHwmV
         x7BUgpA845elOlvasVTalz0QvaGXU1FNKV0+v6CZ5MZ0hINE+MgXYD/z8ZMhZyzbfs
         pEouanb6zUDxGMyDaB2qfmXTTpTvyZFekQ/VHfB/iSA/Ywg3wDy8/SQwF28e6rlhM2
         GFwYeuuqCHY+A==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id q21so10025455vsg.3;
        Sun, 03 Nov 2019 17:52:15 -0800 (PST)
X-Gm-Message-State: APjAAAVnLs/LhZU80Xn5BPQSJMVMSiMiDyCuoLWp3sI8b+FMyklXfRdO
        6KZrHurwUSnAr8Tm8EvqumtFi7H7YMCJZJSgYoc=
X-Google-Smtp-Source: APXvYqzL+zYVO+qZDl9B4V+c7urxIIvKSV3ZlpAzaGNC3fgXsVnpo2mkuBJpFCRucpzZuKMnxZa4JsEHJ5DXdl3Eobg=
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr11385023vsf.181.1572832334912;
 Sun, 03 Nov 2019 17:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20191009151019.13488-1-mcroce@redhat.com> <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
In-Reply-To: <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 4 Nov 2019 10:51:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcaJeBvzACMW-OxB1D24cYQYdQQwJca-OMe9sb4Q2KWw@mail.gmail.com>
Message-ID: <CAK7LNATcaJeBvzACMW-OxB1D24cYQYdQQwJca-OMe9sb4Q2KWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add make dir-pkg build option
To:     Matteo Croce <mcroce@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 4, 2019 at 12:11 AM Matteo Croce <mcroce@redhat.com> wrote:
>
> On Wed, Oct 9, 2019 at 5:10 PM Matteo Croce <mcroce@redhat.com> wrote:
> >
> > Add a 'dir-pkg' target which just creates the same directory structures
> > as in tar-pkg, but doesn't package anything.
> > Useful when the user wants to copy the kernel tree on a machine using
> > ssh, rsync or whatever.
> >
> > Signed-off-by: Matteo Croce <mcroce@redhat.com>
>
> Hi,
>
> any comment on this?
>


Sorry for the late reply.
One nit.


> @@ -133,6 +133,11 @@ if tar --owner=root --group=root --help >/dev/null 2>&1; then
>         opts="$opts --owner=root --group=root"
>  fi
>
> +if [ "${1}" = dir-pkg ]; then
> +       echo "Kernel tree successfully created in $tmpdir"
> +       exit 0
> +fi
> +

The 'opts' assignment is unneeded for dir-pkg.
You can exit before the "# Create the tarball" comment line.






-- 
Best Regards
Masahiro Yamada
