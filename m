Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1068229E2F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 03:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgJ1Vdk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Oct 2020 17:33:40 -0400
Received: from condef-09.nifty.com ([202.248.20.74]:33296 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgJ1Vdh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:37 -0400
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-09.nifty.com with ESMTP id 09S61Lsb004256;
        Wed, 28 Oct 2020 15:01:21 +0900
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 09S60xNs024399;
        Wed, 28 Oct 2020 15:01:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 09S60xNs024399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603864860;
        bh=lT9aShEb3t31gnYye1Wa4WVM9hnC/c+4/aQIRcL0wvk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ltVly168VyEBcPz7seTJSxcURd5B3kELJCa+EM3NQDyDEVTHeSXMmG4YX5n18e8u/
         /fFzSVK5F+49TR2OCVK+/sm9Svgl7iZuUqNHtStmN76HdLuKesJbuHstkGs2N+OE31
         D+Ic9iQZgtlYXhMjT6I7BS3Wgru+M9ecRJlYzYbRv9ebM4Ym4CgNo9sdx6PJip/yAL
         l4LEGmEPYfW9VDIF3tXEEIB39fIQByl2EzskJpONClRpmEh+isHIfbtXtjmg/VOQoV
         oghLBzbMvCi2A8wC+BQ4KrtHAZ7coqE8HqfY3FP0FrACvPCBPUqb390/DEqI0Yh0vw
         aP0s0oYQVR2uQ==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id r10so1962687plx.3;
        Tue, 27 Oct 2020 23:01:00 -0700 (PDT)
X-Gm-Message-State: AOAM530deFw0N8UqsRgyC6CjJ3WzimYWWl2j33d+RmCFv8oko2QJSc0+
        BGl5YZIqDb65HIDj02oCte9mZrXPMR7j1aKtPP8=
X-Google-Smtp-Source: ABdhPJzNt5zMQBqTtpJ50H5zzYYfT/zBi1Hp8B3XD/FVfMEkgJvsqqzlikKGfB6QeZjPtT8RiU08Va+P49/XykjEolg=
X-Received: by 2002:a17:902:c40f:b029:d6:16b5:4de with SMTP id
 k15-20020a170902c40fb02900d616b504demr5598649plk.1.1603864859258; Tue, 27 Oct
 2020 23:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201026193217.402412-1-svenjoac@gmx.de>
In-Reply-To: <20201026193217.402412-1-svenjoac@gmx.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 28 Oct 2020 15:00:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4VfYLLBZn=Fkd+D5D+3ejVd4jPFLtWu6joLxVXtxKUg@mail.gmail.com>
Message-ID: <CAK7LNAS4VfYLLBZn=Fkd+D5D+3ejVd4jPFLtWu6joLxVXtxKUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] builddeb: Fix rootless build in setuid/setgid directory
To:     Sven Joachim <svenjoac@gmx.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 27, 2020 at 4:32 AM Sven Joachim <svenjoac@gmx.de> wrote:
>
> Building 5.10-rc1 in a setgid directory failed with the following
> error:
>
> dpkg-deb: error: control directory has bad permissions 2755 (must be
> >=0755 and <=0775)
>
> When building with fakeroot, the earlier chown call would have removed
> the setgid bits, but in a rootless build they remain.
>


Applied to linux-kbuild. Thanks.

I agreed with "g-s" but was not sure about "u-s"
because nothing is explained about setuid,
and the setuid bit against directories seems to have no effect.





It was interesting to read this article:
https://superuser.com/questions/471844/why-is-setuid-ignored-on-directories



Also, it is summarized in the wikipedia
https://en.wikipedia.org/wiki/Setuid#setuid_and_setgid_on_directories

"The setuid permission set on a directory is ignored on most UNIX and
Linux systems.[citation needed] However FreeBSD can be configured to
interpret setuid in a manner similar to setgid, in which case it
forces all files and sub-directories created in a directory to be
owned by that directory's owner - a simple form of inheritance.[5]
This is generally not needed on most systems derived from BSD, since
by default directories are treated as if their setgid bit is always
set, regardless of the actual value. As is stated in open(2), "When a
new file is created it is given the group of the directory which
contains it.""


After all, I am convinced that it would not hurt to do "u-s"
although I have never tested kernel builds on FreeBSD.










> Fixes: 3e8541803624 ("builddeb: Enable rootless builds")
> Cc: Guillem Jover <guillem@hadrons.org>
> Signed-off-by: Sven Joachim <svenjoac@gmx.de>
> ---
>  scripts/package/builddeb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 1b11f8993629..91a502bb97e8 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -45,6 +45,8 @@ create_package() {
>         chmod -R go-w "$pdir"
>         # in case we are in a restrictive umask environment like 0077
>         chmod -R a+rX "$pdir"
> +       # in case we build in a setuid/setgid directory
> +       chmod -R ug-s "$pdir"
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> --
> 2.28.0
>


--
Best Regards

Masahiro Yamada
