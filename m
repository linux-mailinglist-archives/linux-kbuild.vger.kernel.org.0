Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7CA279727
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Sep 2020 07:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIZFqg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Sep 2020 01:46:36 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57713 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZFqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Sep 2020 01:46:36 -0400
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08Q5kGxS011111
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2020 14:46:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08Q5kGxS011111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601099176;
        bh=eYaTqWnbxP6wTKoUCndUOqGQC0/N3Q8BoV53MsZ84Zs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g3jFrsjBA+/HUNiXa7zllz/whbOTdDQ/fbmCT/piT+CAJUxC/4lNT02g+QnXZQe1U
         AyipnraPM3loTd00/AcT7wr2Sfl7zvZlt7hdGS+ntAJgHcl3I0ZR382J80NpoeIL/y
         EN1TfLdySuAMqhHALuDX0HzHsprpQ6ZBR/NMAW45moaqz/iaoko2sZn8+IhM64hx89
         lTyEJh+9fBit8FS0ZrzC1YIwwQFYZSnXaDBFQoHG/IN9hDZTly2M4YwkNTtnAiHHZH
         qu9/QFrmVkJ7RuBd6G3KPV7AvrGWPRmCQDigmw47C5CfA6Pj8EvoMN8YzITsAhY5Qm
         Dpg3HFOGpNMhA==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id bd2so400642plb.7
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2020 22:46:16 -0700 (PDT)
X-Gm-Message-State: AOAM530mgyKg1KWw+4Xary4NlTsKYozeKCio8FG7iVzUyCwjxP9sH4dh
        LFaShN1H9fTZVj5gXEK80rnejWb4xlXd2+U4r5A=
X-Google-Smtp-Source: ABdhPJzb0dxHu7sOjCZmss1HayAbMqiIQLL7Ek5l4Q1DKB4gCEPBEnK8qXVuA2SuL5H37uUC6L1SDkbaGfRe0ldnBjs=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr867934pjb.198.1601099175520;
 Fri, 25 Sep 2020 22:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200925222934.GA126388@localhost>
In-Reply-To: <20200925222934.GA126388@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 26 Sep 2020 14:45:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
Message-ID: <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
Subject: Re: "make bindeb-pkg" fails with CONFIG_MODULES disabled
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 26, 2020 at 7:29 AM Josh Triplett <josh@joshtriplett.org> wrote=
:
>
> With CONFIG_MODULES disabled, "make bindeb-pkg" fails in
> scripts/package/builddeb with:
>
> find: =E2=80=98Module.symvers=E2=80=99: No such file or directory
>
> The deploy_kernel_headers function in scripts/package/builddeb calls:
>
> find arch/$SRCARCH/include Module.symvers include scripts -type f
>
> But find errors out if any of its command-line arguments doesn't exist.
>
> This could be fixed by checking whether that file exists first, but if
> CONFIG_MODULES is disabled, it doesn't really make sense to build the
> linux-headers package at all. Perhaps that whole package could be
> disabled when modules are disabled?

I agree.


How about something like the following?


diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6df3c9f8b2da..8277144298a0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -202,8 +202,10 @@ EOF
 done

 if [ "$ARCH" !=3D "um" ]; then
-       deploy_kernel_headers debian/linux-headers
-       create_package linux-headers-$version debian/linux-headers
+       if is_enabled CONFIG_MODULES; then
+               deploy_kernel_headers debian/linux-headers
+               create_package linux-headers-$version debian/linux-headers
+       fi

        deploy_libc_headers debian/linux-libc-dev
        create_package linux-libc-dev debian/linux-libc-dev
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 48fbd3d0284a..88c5e25662bd 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -183,13 +183,6 @@ Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files, version: $version.

-Package: $kernel_headers_packagename
-Architecture: $debarch
-Description: Linux kernel headers for $version on $debarch
- This package provides kernel header files for $version on $debarch
- .
- This is useful for people who need to build external modules
-
 Package: linux-libc-dev
 Section: devel
 Provides: linux-kernel-headers
@@ -200,6 +193,17 @@ Description: Linux support headers for userspace
development
 Multi-Arch: same
 EOF

+if is_enabled CONFIG_MODULES; then
+cat <<EOF >> debian/control
+Package: $kernel_headers_packagename
+Architecture: $debarch
+Description: Linux kernel headers for $version on $debarch
+ This package provides kernel header files for $version on $debarch
+ .
+ This is useful for people who need to build external modules
+EOF
+fi
+
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control






--=20
Best Regards
Masahiro Yamada
