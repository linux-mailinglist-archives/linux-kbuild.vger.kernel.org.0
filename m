Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5830D279802
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Sep 2020 10:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIZIpZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Sep 2020 04:45:25 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:32829 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZIpZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Sep 2020 04:45:25 -0400
X-Greylist: delayed 36941 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 04:45:23 EDT
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 95E5E240002;
        Sat, 26 Sep 2020 08:45:21 +0000 (UTC)
Date:   Sat, 26 Sep 2020 01:45:19 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: "make bindeb-pkg" fails with CONFIG_MODULES disabled
Message-ID: <20200926084519.GA8344@localhost>
References: <20200925222934.GA126388@localhost>
 <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR5ArP8RGHHOXAauTvXcQgvstP=Ydh8Nc+Kv-0NYhhP2g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 26, 2020 at 02:45:38PM +0900, Masahiro Yamada wrote:
> On Sat, Sep 26, 2020 at 7:29 AM Josh Triplett <josh@joshtriplett.org> wrote:
> >
> > With CONFIG_MODULES disabled, "make bindeb-pkg" fails in
> > scripts/package/builddeb with:
> >
> > find: ‘Module.symvers’: No such file or directory
> >
> > The deploy_kernel_headers function in scripts/package/builddeb calls:
> >
> > find arch/$SRCARCH/include Module.symvers include scripts -type f
> >
> > But find errors out if any of its command-line arguments doesn't exist.
> >
> > This could be fixed by checking whether that file exists first, but if
> > CONFIG_MODULES is disabled, it doesn't really make sense to build the
> > linux-headers package at all. Perhaps that whole package could be
> > disabled when modules are disabled?
> 
> I agree.
> 
> 
> How about something like the following?

That looks good to me.

(It would be nice, as well, to have some conditional wrapped around the
linux-libc-dev package. I had a patch for that a while ago at
https://lore.kernel.org/lkml/b45738b05bb396e175a36f67b02fa01de4c7472f.1583912084.git.josh@joshtriplett.org/
, but that's probably not the ideal way to do it. I'd love to see a way
to disable that extra deb, though, as it adds time to the deb build
process for a package that most people looking to build a deb won't
need or install.)

> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6df3c9f8b2da..8277144298a0 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -202,8 +202,10 @@ EOF
>  done
> 
>  if [ "$ARCH" != "um" ]; then
> -       deploy_kernel_headers debian/linux-headers
> -       create_package linux-headers-$version debian/linux-headers
> +       if is_enabled CONFIG_MODULES; then
> +               deploy_kernel_headers debian/linux-headers
> +               create_package linux-headers-$version debian/linux-headers
> +       fi
> 
>         deploy_libc_headers debian/linux-libc-dev
>         create_package linux-libc-dev debian/linux-libc-dev
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 48fbd3d0284a..88c5e25662bd 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -183,13 +183,6 @@ Description: Linux kernel, version $version
>   This package contains the Linux kernel, modules and corresponding other
>   files, version: $version.
> 
> -Package: $kernel_headers_packagename
> -Architecture: $debarch
> -Description: Linux kernel headers for $version on $debarch
> - This package provides kernel header files for $version on $debarch
> - .
> - This is useful for people who need to build external modules
> -
>  Package: linux-libc-dev
>  Section: devel
>  Provides: linux-kernel-headers
> @@ -200,6 +193,17 @@ Description: Linux support headers for userspace
> development
>  Multi-Arch: same
>  EOF
> 
> +if is_enabled CONFIG_MODULES; then
> +cat <<EOF >> debian/control
> +Package: $kernel_headers_packagename
> +Architecture: $debarch
> +Description: Linux kernel headers for $version on $debarch
> + This package provides kernel header files for $version on $debarch
> + .
> + This is useful for people who need to build external modules
> +EOF
> +fi
> +
>  if is_enabled CONFIG_DEBUG_INFO; then
>  cat <<EOF >> debian/control
> 
> 
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
