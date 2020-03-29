Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F564196D8E
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 14:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgC2Mz5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 08:55:57 -0400
Received: from mout.gmx.net ([212.227.15.19]:40721 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727951AbgC2Mz5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 08:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585486552;
        bh=VGBEvwNoO++VO34sPMvZVBiroDuQje9J5sTjRVbAub4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bF0zK+cEv4Y3+28qcb10IuNXEmSQ1gYZ5Fx5Hc7QLMjuyTdrtMinh0/Q/k6VAOM7p
         dMdg9mJ/yPmyzBwc8daUSWVBG3R/qHhml35t3L0t8kdelqR6nrU9w5amKUmNkB57FD
         o79/bDVZKmGhhnF7Jm7CJ8k+fiOOjhCoK6xj6wmc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from apollon.localnet ([88.130.48.93]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq2E-1j33tQ0YLg-00tFq2; Sun, 29
 Mar 2020 14:55:52 +0200
From:   Reinhard Karcher <reinhard.karcher@gmx.net>
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     954778@bugs.debian.org
Subject: Re: Patch: Suppress irrelevant warning when generating a debian package
Date:   Sun, 29 Mar 2020 14:55:51 +0200
Message-ID: <2516578.0xqDLvIEN0@apollon>
In-Reply-To: <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
References: <1966103.4dT7el1ifK@apollon> <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2088962.f1JdSLc2P8"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:AfkH8fJa/NyyVerFjw9JHBR/jD7oYAB8hKqsO/4U2C0bBfB1bir
 hVvKA2KOXsvp3G0s/yAraHTwHPyRFJd18e0sWu6wwOO6Zn0f4RsM8s3NJg2b8er+xbAjS2z
 XqfLZqrbHJhu1oTOF0BqgB3fskilw8L56c6cQI47mQL8FaDYgeO57n1eLg7U2kUdAS/9XNC
 j/9Jn4txIyOH/4sXxPs2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4MLTMQDsV24=:wu7/T5fgeAgVuiXfwjT5Zl
 kE+Ze5TxAvIHTOtddt9X9ev93/lT4uiBnCugAy07Exz24jPLRXe1bW+Q1s4ouBLQwPzMHm5cM
 y5ie00NlLrY5k/eP//6960/K+uiPbkd6TNXJWDoW+ZvfxexdZwB8Df5MSXnSidNMCr1mW2AHM
 QRKJIWM+gZ97fZ5gzZkPybDXA3hS7JVv88Upq4Fjvu5RRzjRSpVKSuX+XtdZeY9ImqmyXvQIv
 Tujp/j9lBhFRN6U2ybTnIFrzYE4UTiPt2ocqUCsOHeU+eFsSU6fIFFofQv1SrZGgQ4YPWiorU
 scHuI3XmzAoNbTzsffowb/8yOjmRdPVoRuIGwFalctfJ/Lx21bII6wcNIc0YkEgPUpxO0XdJf
 PKEV+VBLFczgeBPNroVHCDWwNunkBm/6K1bW9hWrkW032MQZ0MQ3Vc0CjPOEIKBBRDad7En9k
 Gz45UrcIuGQ3KWbITQJxyok3R3ky2+nBx/Dw3dBOWfscXDZFNHVK+gwEwwXts/yryvc0Q0Qw6
 1z55SI5JzJRvb01p+lvtCBsjwxnWT7o5McTM5r+6U9NlAphIqcgqZOktoNh0byxsCC2URVl+N
 R95Ok+w3sSHex4GuuWyltfBvjgUDZJf3HBHLWk2r9QKxCKX83S4o2St39pNN57yOQ8eVzZBbG
 HjFTA1YJKUGuCWm+/UXbnY61HeRxyDr7HNgvvldr7hyXcIh5hcInbAW9guOTLRfY8gNQ42avz
 qdR3FU90hAwbfSg9rLHwOu143vL5gBmIdp4okMo03e6xefFt5V5PvebBlaSijfva3ggb1AL+C
 3+b7BmbaD8q9D3E2VACiKvNqGZZIN2Pq0oqAv9NZIiSUGwJnbgd9CsiB21tOvieU2WyKmvDxf
 +174oNXHfTaEZHzRFptDUjFdRZlDhv0WibHa7ZMGkKYCve8b1sx1rr89XU/TdHaFKOW/QxUAW
 INZ5DEuok88m9hpa55NBfJLwwpspoMUW7Mi7is22i/S7KiTlqzWedhoM6lEbAgGlz4vn6Uz33
 h1WpBb/6MzbntSoZqyPOrIrzF7t+WuTbftBwqrRzDB/d72ngbeN3VJIiXYZE0/K8yH1p/vh13
 EGK+We6eUDkCeNNXMfTznONTjBApL5r0TXZfXUU+JYkzFdNBPsO8I3Fq1kgvJHfo1fRHm1Jem
 ViDHTG5P7J9Vuj46TtUEGMHvH/ZkRqnE3CrAmt13eVFTZ0bRVKYqZ7cP74ZUzGRWg/nUOzXfn
 HYUEN2cR5gYPiUw8n
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart2088962.f1JdSLc2P8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 29. M=C3=A4rz 2020, 14:01 schrieb Masahiro Yamada:
>=20
> > By making a contribution to this project, I certify that:
> > The contribution was created in whole or in part by me and I have the
> > right to submit it under the open source license indicated in the file.
>=20
> Please drop this.
>=20
> Signed-off-by implies this.
> No need to explain this in an individual patch.

Droped in attached new version.

> > +if [ -n "$BUILD_DEBUG" ] ; then
>=20
> This file does not define BUILD_DEBUG.
> So, this conditional is always false, isn't it?
>=20
> It should be:
>=20
> if is_enabled CONFIG_DEBUG_INFO; then
>=20

The definition of BUILD_DEBUG is copied from builddeb too.=20
See attached patch.

=2D-
Best regards
Reinhard Karcher

--nextPart2088962.f1JdSLc2P8
Content-Disposition: attachment; filename="remove_debug_warning.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="UTF-8"; name="remove_debug_warning.patch"

from Reinhard.Karcher reinhard.karcher@gmx.net

Creating a Debian package by compiling the kernel
make bindeb-pkg
without creating debug information creates a warning that no
debug package was created
This patch excludes the debug package from the control file,
if no debug package is created by this configuration

Signed-off-by:Reinhard Karcher <reinhard.karcher@gmx.net>

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..572abe5a149e 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -96,6 +96,7 @@ fi
 sourcename=3D$KDEB_SOURCENAME
 packagename=3Dlinux-image-$version
 kernel_headers_packagename=3Dlinux-headers-$version
+BUILD_DEBUG=3D$(if_enabled_echo CONFIG_DEBUG_INFO Yes)
 dbg_packagename=3D$packagename-dbg
 debarch=3D
 set_debarch
@@ -198,7 +199,10 @@ Description: Linux support headers for userspace deve=
lopment
  This package provides userspaces headers from the Linux kernel.  These h=
eaders
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if [ -n "$BUILD_DEBUG" ] ; then
+cat <<EOF >> debian/control
 Package: $dbg_packagename
 Section: debug
 Architecture: $debarch
@@ -206,6 +210,7 @@ Description: Linux kernel debugging symbols for $versi=
on
  This package will come in handy if you need to debug the kernel. It prov=
ides
  all the necessary debug symbols for the kernel and its modules.
 EOF
+fi

 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f

--nextPart2088962.f1JdSLc2P8--



