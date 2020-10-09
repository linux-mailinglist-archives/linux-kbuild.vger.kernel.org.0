Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC9A288C00
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389054AbgJIPAA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 11:00:00 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48784 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388835AbgJIO77 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 10:59:59 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 099ExY3A029815;
        Fri, 9 Oct 2020 23:59:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 099ExY3A029815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602255574;
        bh=Fm531zIcbKwcXtpzpDAbPai1cXfOsq3Ga2UE5xKGxH8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ubEkmihxBq0YW+QKbvgWAL5adLP/k7amTpuF0HYgAD6Uge8YBLtFJmRiVUH/DALNc
         E/WjK8+RzVwvUWK1UprNTuslaMXmMsjGsQze/xS4I/mf/r38OFHt8lmeL23rRdzV9Z
         nQbELgYl0/P+nSnJ6KIbjqbbiqCpLPfVqXBnt2RYwq6ni+AxMB/UOAlSnKyamTWPuM
         GFpUPRLuzHb5Hk+aiAPQ4WcGXGMFzFHeTB/8QO/dlYzFdTQ04Hj78PwJUG/p2Rhorb
         Qow3rimgH/nM7UZEQS0vmVNBGqFRMKMF4sQ5lDQAASv3m8sSHh0su/+4S4KF7IqSR5
         WgtxC0Q+wOPzQ==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id k8so7101826pfk.2;
        Fri, 09 Oct 2020 07:59:34 -0700 (PDT)
X-Gm-Message-State: AOAM531GoKhaw1w+Uai6N+kkGgyOq6GagYV5rV6kfG7y8TTD5f+wUPdI
        /PuNdZbRFHIMzjz1McYQl5n9qMKXtVHdUbR8z+o=
X-Google-Smtp-Source: ABdhPJxA4RrFCPywXbRhiwzCWKX072cyaPepvpUxwdFs6DhVh1ER3FJL+YIyBSlaQ6bGE1YGWHq9e4YVQBvDeqkNwdM=
X-Received: by 2002:a63:778f:: with SMTP id s137mr3611476pgc.7.1602255573681;
 Fri, 09 Oct 2020 07:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200920222556.10002-1-guillem@hadrons.org> <20200920222556.10002-2-guillem@hadrons.org>
In-Reply-To: <20200920222556.10002-2-guillem@hadrons.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 9 Oct 2020 23:58:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_3EOYMcS-cMnEZVED_JUQa+rZottbqwD4fppC7ZXdmg@mail.gmail.com>
Message-ID: <CAK7LNAS_3EOYMcS-cMnEZVED_JUQa+rZottbqwD4fppC7ZXdmg@mail.gmail.com>
Subject: Re: [PATCH 1/7] builddeb: Pass -n to gzip for reproducible packages
To:     Guillem Jover <guillem@hadrons.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 21, 2020 at 7:48 AM Guillem Jover <guillem@hadrons.org> wrote:
>
> We should not be encoding the timestamp, otherwise we end up generating
> unreproducible files that cascade into unreproducible packages.
>
> Signed-off-by: Guillem Jover <guillem@hadrons.org>


Applied to linux-kbuild.
Thanks.

> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6df3c9f8b2da..b14abbe5afbb 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -31,7 +31,7 @@ create_package() {
>         mkdir -p "$pdir/usr/share/doc/$pname"
>         cp debian/copyright "$pdir/usr/share/doc/$pname/"
>         cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
> -       gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
> +       gzip -n -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
>         sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
>                 | xargs -r0 md5sum > DEBIAN/md5sums"
>
> --
> 2.28.0.297.g1956fa8f8d
>


-- 
Best Regards
Masahiro Yamada
