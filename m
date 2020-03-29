Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778E5196DE9
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 16:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgC2O2u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 10:28:50 -0400
Received: from mout.gmx.net ([212.227.17.22]:52601 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727488AbgC2O2u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 10:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585492124;
        bh=wICjkSaWdczrZ0KJwIvw7ssIGDSLRj4VFrjqv52axZU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TY2/IhRxDWQQEfkzHd+QQOXeoHodREw/+4+aQIHmdUwDuN80FY9qp8nZq0LQ+Anks
         jKlu6Al0q0dqgVe3jacPQvD1SKj0iy20/TNQodaYlpUW3ud3+YrSClTCet4ATvze35
         jD09djZ2DJL+HFXHraqXyzP1DwuwlZUAkMT87r74=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from apollon.localnet ([88.130.48.93]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1jUurx2u9l-00CRJy; Sun, 29
 Mar 2020 16:28:44 +0200
From:   Reinhard Karcher <reinhard.karcher@gmx.net>
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     954778@bugs.debian.org
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a debian package
Date:   Sun, 29 Mar 2020 16:28:44 +0200
Message-ID: <3046032.1AMzvzNrTs@apollon>
In-Reply-To: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
References: <1966103.4dT7el1ifK@apollon> <2516578.0xqDLvIEN0@apollon> <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart53114204.YFjIEDjTXD"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:zJw5c+joMmMANWnD9v24Xoajq5nDhTf+BmZX6iclAHakiYcljE6
 F/ofOx9DZXBecr5M17wqC+KuBUJoAOjWWNx6bciaFA06ZygSt3k+LdYOrnJBuzB+iwNGWIe
 lsjUArdGV12YFukiDlVYquGDtfIW3TOgV9h7EkOSJfAmvhs20zUWg0UP2uDVGfbwgsHhI/d
 m3giXSAS3Yg1LeV1r0gjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LHUZJWBglSQ=:N0gbxMzU8xprGMWX6JjYMC
 oBVX1NUqUXLl3rbsTFE1D8zhkrThgUtznwHmNvCwzOUBnph7gwwEzY2lWcQ2MQpZf0V3UCuY/
 0Igl5mw+h/27Op0UdVrrElGSb4UbAhFrCKkAxhdckYhlzI6NHDlQ1FAxLm+Py7zF8mSe3ELN8
 QzRl0wrIImh7oPX4zUrdYBKq2sEae8N2ALk7TiESEV68vFFqL8XWsycXbQHxFGLknu6zXMb/6
 alDJkZtpOcSvwmpc2Sv4K0CAE07JZDTrOk5KYwM25Jw4wBbuLekrpYYjBGclW5UV3+6fmdQxX
 sG+b8w2HMOhvW4mi+geo9o/dcg5bWylphyBrq/+3ZCXYbCOHT1p4uuYwH3pyRvwWCXZsCjMP7
 O1+2BS3qORuSuz36zB7a+EwNfct1xruZdSlAeON+TP3yGiCkEj1ryqVlBZhqJWuZEABcm4ZPu
 1bB9d86MM/N0ffre3Teme2cTFCriDfs0YpX9l2IA8r7uVd3kg1+YRtWidblUpux3BmCe2FxGr
 yK1bzjj6qCWYBFdPUlYILfVk5BKIS9n1IXiSDQn6lUh/6GdGipZycg/JWhFqBdujUaNgLLEAO
 cIGYjFKpndy86MTRJ5K1T1Lw4+OtxfHY01UmZ4py3Z/+eEjKu+WfT54LMxF+W3ZVa89OlgKz9
 WpTxVO4XpXAUFwUD+W9LhO57Oqa8vsEdqtSqgnvOpfqQm+viySeKSbtHh3czM8/aAyFu3V/uo
 ggz+6Db5Om0IRqvJB1nwogFipNAKsHUxw/oajlU88hKvLVyWfIX3LYIk5VAB0GZBYfVPrjzQv
 ufI1fGnA+0CVuK8Uz13n1KtNpPg5gYhAObsU0dJeXTTF8BrtS6BnxAb6zoDTaNUsSjtl+/epu
 Kx/PFxg0IqYABDppikE9LMmhGXcFaMbF7bJYdtANXsFRRgq4SW5Kb69IH2eHL/n9U6/TqUnF2
 EdY0LYEG6zMaNAklb16KEWsnLaFyMypBYx+2Up8e7NUsaKt2ovh/CSOsN7SZSjem1g2WlUzzt
 exvpSkGGrMxBvWuV6182udev9dMF8bky2HTZDr+vwB6keYVYvxctSmbPSpM+oXqTT6z/CaZkS
 0g/6umqjoMO5sET9V1dsOGwfMsNpyaPGRL0Hj686IVIDt6JaAWvT4T+cvKzotR/W/aVvYtkGp
 x/+PcE++H05hfYSEUVRSu6Rzg4kwp/3zMTw7bQg6ZWhtyagz1KqUDL7kDboQOl+nd3d9Nmj0l
 CpzKdMzS0TBcDAwYI
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart53114204.YFjIEDjTXD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 29. M=C3=A4rz 2020, 15:30 schrieb Masahiro Yamada:
>=20
> I want you to directly use
>=20
> if is_enabled CONFIG_DEBUG_INFO; then
> ...
> fi
>=20

Corrected patch attached

=2D-
Best regards
Reinhard Karcher

--nextPart53114204.YFjIEDjTXD
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
index 357dc56bcf30..327ea3c2a785 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -198,7 +198,10 @@ Description: Linux support headers for userspace deve=
lopment
  This package provides userspaces headers from the Linux kernel.  These h=
eaders
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if is_enabled CONFIG_DEBUG_INFO; then
+cat <<EOF >> debian/control
 Package: $dbg_packagename
 Section: debug
 Architecture: $debarch
@@ -206,6 +209,7 @@ Description: Linux kernel debugging symbols for $versi=
on
  This package will come in handy if you need to debug the kernel. It prov=
ides
  all the necessary debug symbols for the kernel and its modules.
 EOF
+fi

 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f

--nextPart53114204.YFjIEDjTXD--



