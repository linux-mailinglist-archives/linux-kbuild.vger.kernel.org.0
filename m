Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE2C2F6EF2
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 00:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730776AbhANX32 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 18:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbhANX31 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 18:29:27 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59719C061757
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 15:28:47 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id o19so4097483vsn.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 15:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YNkuzh3cue5mJB344uZoSt9d7S7ZdoN0+r7iVu02sns=;
        b=T93v+xokqOUqINukDwyKMsRBhfSoHpLvOHzUZ75sCVP+oadOwz0bG/vgs1+Zl5dwUd
         zmWttY74fDpIMEcN3+9xxEITxiYMAEuXXrNtDVoYI7Kj5p4RT6Y+iRXnkl9EYL2YEZxi
         Jn20VdbZW+mfjK82ZXfBuhH4KRaxJTQ8m7OYyybjm2jCP9U39HmylE14FIRRJ7MQwXHT
         xjYCJ8B/cBA3vYwq00y309V8AYiHWyPR7VS6Ob3SpnCIPIhhWKvdQqHahC67GmuSiWYc
         ZpURGu5nrlgEJtBx5oT/i1oy9dTd555AGD4cJhCZOAYRZiJUo2YWr3E2dOL4EXHPhF3f
         3PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YNkuzh3cue5mJB344uZoSt9d7S7ZdoN0+r7iVu02sns=;
        b=lRG+H+mM0EaZ/+yRicjLbA2nu75Smbwjp5FvdRai5lXSX9Ej5jM2P3wyxttQO6rh3s
         nTWUkYC1oeOSAy/YKjxq8zQla2vd+VnubMDR2Dv3c9tidHcSkwinx3ABy5bDH/h93leg
         7Ax99MnhyT71Aim2/9hxDNJwfxZ7QfHLFWyYI2yhtomkcig71olzYu/OIXRpVwIPSRbH
         AMjoRy81c6PnUdGuNagj8FGlMTVozKqEb8QP/ouM4ks9hxfseOdPbcL0mPG9eSM/WKKm
         VOhKGC3UqGCFRtGWjy7UR7VIfs4WfTuBxqnax9m1TXW1NJXZgFwxcCMwENN6NBoh7CXL
         Ltrw==
X-Gm-Message-State: AOAM532KaF6ihDsCuGD+o7Q5+8KGn8H1uSJYuOXUCGyMCH+kAEiR3IVF
        +pagKHrRONNp3y8JRgVOftF4FXM3HEpFvZlvf+E=
X-Google-Smtp-Source: ABdhPJwXaouC7VD8NbxptzIrTvokSjLArkoU7lnJ3AJhJXIswJIhZ4NtFVrQYwZL8FQIsY6zLSKAwNrgl5GFOE8hixk=
X-Received: by 2002:a67:f550:: with SMTP id z16mr9317514vsn.20.1610666925966;
 Thu, 14 Jan 2021 15:28:45 -0800 (PST)
MIME-Version: 1.0
From:   Michel Lespinasse <walken.cr@gmail.com>
Date:   Thu, 14 Jan 2021 15:28:35 -0800
Message-ID: <CAL36u31HRhkYJ-QFjx0tCzRnj0CXSQEW2LqZeGK6fnyt7Z18Zg@mail.gmail.com>
Subject: Fast target for debian linux-image package creation
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Riku Voipio <riku.voipio@linaro.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I am looking for a fast target to build debian linux-image packages,
to be used for quickly testing things (dev/test cycle) rather than for
full proper releases.

The current bindeb-pkg almost does what I want, but not quite:
- It still creates linux-headers and linux-libc-dev packages; overall
taking about 3x the time than would be needed for just the linux-image
package;
- It places packages in .. ; I would prefer to have them in a the root
of my kernel tree or in a subdirectory thereof.

(I figure these goals are probably similar to those of the fastdeb-pkg
target that was proposed in
https://patchwork.kernel.org/project/linux-kbuild/patch/20170331130941.5250-4-riku.voipio@linaro.org/
; I am not sure if there is any ongoing discussion about that)

The following change to the builddeb script implements both of the
desired goals:
- builds only the linux-image package if NO_HEADER_PACKAGES is set;
- creates packages in $UPLOAD_DIR instead of .. if set

diff --git scripts/package/builddeb scripts/package/builddeb
index 91a502bb97e8..b83a4a09a75d 100755
--- scripts/package/builddeb
+++ scripts/package/builddeb
@@ -50,7 +50,7 @@ create_package() {

        # Create the package
        dpkg-gencontrol -p$pname -P"$pdir"
-       dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS}
--build "$pdir" ..
+       dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS}
--build "$pdir" "${UPLOAD_DIR:-..}"
 }

 deploy_kernel_headers () {
@@ -208,7 +208,7 @@ EOF
        chmod 755 "$tmpdir/DEBIAN/$script"
 done

-if [ "$ARCH" != "um" ]; then
+if [ "$ARCH" != "um" -a -z "$NO_HEADER_PACKAGES" ]; then
        if is_enabled CONFIG_MODULES; then
                deploy_kernel_headers debian/linux-headers
                create_package linux-headers-$version debian/linux-headers

Even with this, the .changes and .buildinfo files are still created in
.., though.

I am using the following target in Makefile.package to drive this:

diff --git scripts/Makefile.package scripts/Makefile.package
index f952fb64789d..304073f5fbcd 100644
--- scripts/Makefile.package
+++ scripts/Makefile.package
@@ -82,6 +82,13 @@ bindeb-pkg:
        $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
        +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat
debian/arch) $(DPKG_FLAGS) -b -nc -uc

+PHONY += bindeb-kpkg
+bindeb-kpkg:
+       KDEB_PKGVERSION=1 $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
+       @if test ! -e pkgs; then mkdir pkgs; echo "*" > pkgs/.gitignore; fi
+       +UPLOAD_DIR=pkgs NO_HEADER_PACKAGES=1 dpkg-buildpackage
-r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -b -nc -uc
--buildinfo-option=-upkgs --changes-option=-q --changes-option=-upkgs
+       @version="$(KERNELRELEASE)_1_$$(cat debian/arch)" && rm -f
"pkgs/linux-$${version}.buildinfo" "../linux-$${version}.changes" &&
ln -sf "linux-image-$${version}.deb" "pkgs/LATEST.deb"
+
 PHONY += intdeb-pkg
 intdeb-pkg:
        +$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb

This is as clean as I was able to make it, though still not perfect -
I think it would be much nicer if it was possible not to create the
.buildinfo and .changes files at all in the first place.

Would anyone have suggestions as to how to clean up those bits, and
also, would there be any interest in integrating this upstream ?

Thanks,
