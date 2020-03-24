Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B509D190ACC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 11:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgCXKYz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 06:24:55 -0400
Received: from mout.gmx.net ([212.227.15.18]:48389 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgCXKYz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 06:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585045487;
        bh=uJAoBqEX6c62JjJcE/CUAta1U3jSBRP86JKMkpdSn8k=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=a+Ss4nxIc/ycJQTExz/k+aN5BrgYAIf9Ocdo1WiP9evdi+hiBZDlDS1S4Q4QrgAjG
         DXbaUZO4uzylDcKtBbZcirKJtGcUV5u1OfpJNRlgCDsBXew37G9uQY6VjBzyOW1HPd
         u9n/zei7TqEUlhP8x+jMjFOZjwo05r6Ftl9IaBIA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from apollon.localnet ([94.134.177.215]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWics-1ijd7H326K-00X0BF; Tue, 24
 Mar 2020 11:24:47 +0100
From:   Reinhard Karcher <reinhard.karcher@gmx.net>
To:     linux-kbuild@vger.kernel.org
Cc:     954778@bugs.debian.org
Subject: Patch: Suppress irrelevant warning when generating a debian package
Date:   Tue, 24 Mar 2020 11:24:47 +0100
Message-ID: <1966103.4dT7el1ifK@apollon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:brhqLIU9BSMLHiFD+CpVQWPekpURwEKb+Uht7LV1pj+wZl9q7xN
 J2mW9pFFoappqD+nGc3AWyRt+lET657Vu4ir8LO8XjPRuK1j3EDjX4Y4dR1a1yjk2rErPPl
 ryh2JHym/8efxRRF4lW1MTj3eS2R5hW39oSNb96OlLQ0b1Esda7DjOZqg+jIZwjHBMTzbuw
 CNRWYQMGcvE34lTuzj8OA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q57Wh8IZcKc=:HFSBCc4DGhEKQTF1xOsmwx
 PZarRAGtgJ1fEN5hC+/jdEVsbkww10A01cOion/2gq2vWxjJTOnGmPHkL/1ohKkQv77chdJsB
 KINAYell0R91/VMFWSuIKrhRq0yjJOP59W1RJF0EuwlAZ6IgCCBqdyRiulVB5ciB5ZzjrY/XF
 35nuYwIuP9rauqvb2rVcGrWuh95ibt6JlAUv2NUoy9o75F9CTeDsM2OUxoEbdMewEweF0lXQZ
 o4WHJO98zMmChTziQRIGrTKuaSYaDP2xzEZ4idtDJbWDz6fJEHk7fXhJyYK05tRtub3ff9KlQ
 J74de4+EbH/M1xaEJWwRblNU+eGSA5PUgZeoUbxiMJGpZDyN8WUeUo3NiPHfQmEMAyiIHzUuX
 beM6AGOOOWmTAr1AHjb7HdNVnDIhxPAl4ZtJ+FzT3SEkKHhukSZOvSBgqe2HoMkmF3979aBLT
 1ufhGRCLJ7bBAOvFs+d3cqBPaLgcfvRY/MuMf3jjpdzOEBn6Iqo5V9sZrJWVYEmp7pLHiYHPL
 +toZ3mAtfHF+Vmz5o8nsuVV2MYL/8tMTcalH6DjuTe5PPnYmm5AtoXnbMtdLHLPJEKJhoSMG2
 giuaJkgbFPKwEK+co7CkJr+l0TFzgW2B3bU0yFELO5YLTnQskYlu0e0I62KTXI6uIzG8W/PFm
 izq6tx0iU/gG0+pk97docGx4QRJIlwmILfY/zNs7LbiYISO5/yXKyd8yGoO7kVY8JDhO1PH/C
 MXMNEnr/QALF8GngSZRKGCbUVtM3rL61gkKlmOgK/z2EKd69ZZz+IYsiBuw0Oj+dHZkM5Lqjn
 kzc+LVifaqWWhDZmtpiZZh1Iw+IwshoxhivqZUjq0tLhrDo5vEzf9rxqs06NEy3KjarLCF1+l
 GKwx3A0FbjfT8/vbD4RjGbcJaGQ2Vu+Hhii6JmkygMCpB/JvavB9u1hukjXPOEEvZ6deEWnAS
 Q2MDSXbO9Wel2Bkg3YBQgKAAnZLs0cNIk5KAIJyMcCNVdJsS1BJ5gFJfxs+LpNrY9PQa/W5Eh
 96HkKsdhtKCiCPV91Bma9cR+tkHnwCQGb4BgyppYNGAFIvzc7SyzMkuZUfEBZl7a4mq5Pbddb
 AhXJFlVoLr2U5DH2y/c/nDp39028IKNMoNJGdhTpw1XAnpW0B/yA7ksW9sZDXvwBgg3usezS2
 R3OuozIHoXall40i70HJs80+rbESQXBhp2C41eD3u6NoFCbxpNHXVj01tbMwidiaorlLqMcQy
 P5SPoonAgnC73rdrU
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Creating a Debian package by compiling the kernel using make bindeb-pkg
without creating debug information creates a warning that no
debug package was created.
This patch excludes the debug package from the control file,
if no debug package is created by this configuration.

By making a contribution to this project, I certify that:
The contribution was created in whole or in part by me and I have the righ=
t to
submit it under the open source license indicated in the file.
Signed-off-by: Reinhard Karcher <reinhard.karcher@gmx.net>
=2D--
The condition to include the debug package is copied from the file
builddeb in the same directory.

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..1673b9f84804 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -198,7 +198,10 @@ Description: Linux support headers for userspace
development
  This package provides userspaces headers from the Linux kernel.  These
headers
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF

+if [ -n "$BUILD_DEBUG" ] ; then
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



