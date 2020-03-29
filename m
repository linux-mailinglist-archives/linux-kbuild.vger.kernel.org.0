Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A67196E07
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 17:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgC2PB0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 11:01:26 -0400
Received: from mout.gmx.net ([212.227.17.21]:41871 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727888AbgC2PB0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 11:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585494081;
        bh=J8GmSQVy0g8ywhqI5CvNUMB3qMma3UpIeIjfIQ2e+Hc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dVuC3bBS3+/FgSEFhlA2ohAP3pVwiqvaRN6vhvvzj7d0/VneAqvtg3NxgDHPcSwss
         pDBmRNiCB2QPxalQNReVmkwcp0j8sYWs0hsNxWTPF4TzK8WIlO7FBOPmb9qbPVULjt
         FDL6O4ovtYbEK88faku+z9CSxu3uiRMDX68mZDeQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from apollon.localnet ([88.130.48.93]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1jAUqp3y8R-010fpR; Sun, 29
 Mar 2020 17:01:21 +0200
From:   Reinhard Karcher <reinhard.karcher@gmx.net>
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     954778@bugs.debian.org
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a debian package
Date:   Sun, 29 Mar 2020 17:01:20 +0200
Message-ID: <3026651.zccbJs9ps7@apollon>
In-Reply-To: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
References: <1966103.4dT7el1ifK@apollon> <2516578.0xqDLvIEN0@apollon> <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3391674.7T9O3n7lMA"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:dKg/kOx6+R5U9PPj1jQ719JJDcmPJpiC/ZNfMzpaac4U1oZRkU0
 7Donzj4v5zO1egQTPHKEnwKH90jh+/NeqYMRNk7brosAJ3OOgFpVSwWLdWe2bTTDM5ic+l1
 2k5O+4MbtrCcxJP7tLlZe4WK/UfukZhEyOK8W4JBGAoBVYV4EeULpRn9CaYCvlWl62Zv1Ic
 LD/ffbdbPfc8jkEX2HX+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/aWkZCHUJ6M=:o9OgtYpEqS3HWZccKEd52c
 425Bk1yfIJd4r7MeOod1l1xDzjCJyBbMuKOXi5g7xPW86wV8o5XNziAWanGInlAPPmkIk21yT
 qMPwqeq4sh2f6NYjvSfQ2+Up3nJ+AevWlJjLl+BnPJ6+cvk5pLj5IL1YImnMA++I7WqlMblav
 Mpp50wD+mGwJE02UvJQGREPooaFc+RaJMNds0EAbuPe5YNxAkDT1ZsGfd54dOrYvysw/2LPuy
 5KcdTMufIFWXCZMkD94Eo79FUH5V6K82E+8h9w15m1h97yNKAispzHREnGf9yvzXIYIRg54+g
 0EegZ4ToW1ZafzXSClEjAgtgAw4cMou+HSFdTJyeZBHO5MAVFiHDM7zDGJeiwXlk8b86CP+7J
 4iC3rPDzdz7jp6m4XWjlt6KAmYxNKHr8AN02GHJ/lmK+PuFcMLQLKfyjvF0Yws3PMw2kpuWf1
 wagaRKHUQt6JkL7VosSr1klCJNhSGbJjDCU7amlRiFtksS11RAWrBWyIPcYyv02/wOk1HofV1
 uQawm4vBwMFojFKAmT0atfc+12cTNKK9IWRgd2vPB19fBK04NCf8Tb4HqmOqWMlmeyXftL6SE
 qfkmtF+vW0+OHIRh+/6yBfMdaY5nJfeXNuY84SradDlLDLQbqDCajDC1XVku3qpDY+MibfhrN
 SetEiVEJydGd9ziBGxrgXCzFwsbLny0KAxcC0p6LbE7f2IgnxouxeYN0lBVOY9a/VLHzM8zyX
 xmoKOIbVQUBex4MMfxju9xKcS99jJmF0hOwSeOPUUXzIUl3jMC7EIdmC19TKmpB+Zb8pjVT9t
 tUimwJE3g7qhSsy71C+7UuJPM2MEElqMmw4KaY9Tags4nX7yBcV37w81COR8+7ZiEbs3UBpqs
 2/s0Twvq+QfD1RVdM2cBzkaEUb5wftkZtGhhaSZ1A+4LBVX57tsIPn9MTugg0Txe8MmOCptwA
 0KhOabqqLc7tluxmDku791rzmnz4tnRBmWmIG403e3T+VuUeoy2ItNcwjm6/Vsg6Hv6ctIWmI
 HvXU5UoLXB6bBS1usB9eSMLN8XT5Zcusz6JxiGsN/wOB1yKVVf/FR7sMBMZr2mYpKRAowURpa
 FXQ8hT+gKyi0ur86oNIGw0eIjauDtfybeRr8AQorokd+3pg9QwSqgkPuHQ+ltLp5xhuNruxYn
 goUi5QKfbgqgVjwi7gEweKf+nDXgDe74ivnHiD1PyqlQUp0gra81WcipSzzjYmWRK62kPW1+/
 eVXte0PdCBYjqFw9A
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart3391674.7T9O3n7lMA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

There was a blank line missing between the package definitions.
Sorry for late testing.

--
Best regards
Reinhard Karcher

--nextPart3391674.7T9O3n7lMA
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
index 357dc56bcf30..df1adbfb8ead 100755
=2D-- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -198,6 +198,10 @@ Description: Linux support headers for userspace deve=
lopment
  This package provides userspaces headers from the Linux kernel.  These h=
eaders
  are used by the installed headers for GNU glibc and other system librari=
es.
 Multi-Arch: same
+EOF
+
+if is_enabled CONFIG_DEBUG_INFO; then
+cat <<EOF >> debian/control

 Package: $dbg_packagename
 Section: debug
@@ -206,6 +210,7 @@ Description: Linux kernel debugging symbols for $versi=
on
  This package will come in handy if you need to debug the kernel. It prov=
ides
  all the necessary debug symbols for the kernel and its modules.
 EOF
+fi

 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f

--nextPart3391674.7T9O3n7lMA--



