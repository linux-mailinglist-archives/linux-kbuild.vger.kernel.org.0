Return-Path: <linux-kbuild+bounces-4765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE739D514C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 18:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 478751F211C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 17:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F725189F37;
	Thu, 21 Nov 2024 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="DcD0S9IR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE713C807;
	Thu, 21 Nov 2024 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208982; cv=none; b=HztWJRF+5tpMVLyeKm2Hrczw+2vw6vrzciHuj9DVlZXa1ohMIYWydO/J4Z5UR1RTTgcO6t2fc4xYSze96GDrUX9gTDgFPQKpixUyoB6Rkt1P8x55/ndZf5JaOvC7xh/TVAVvEhxIrhu47CGqmFaiDWH2wFfWQdjwKFLYFM7lAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208982; c=relaxed/simple;
	bh=Ienun4VW9O2FwBJVBtm5qXYcp2e+U7uSxedKmhxnwIc=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date; b=aNl8dsg5lz+R6WGeWc+kJ7tqROAUchPymjF3I0V/2ixFekXwNEMQ7Kp4jh2W5lC8p3tTKrZt+a/C/RniMMVAxnMSJlJVWl9WJhCZztoFDrPT7acAQxFipb7EPCKFwo5iVRbUBqMMtGYkjmqHD8HeHU2AF23YIZyThNT8aKlpaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=DcD0S9IR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1732208955; x=1732813755; i=frank-w@public-files.de;
	bh=oyBAAp+TqWN3ylwr2/elXUCc8cfY3vbibyis40Z1YhA=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=DcD0S9IRXU0bRBfFckR7wHFQ3Vm9392bxWKI2aNJuDsVQMZRWTlepo2jMwCY86OY
	 lZaR+hRz1DhBcdG9RXPZ4nTTIWQOCt0o2GmXddBxitmp7uqhxIgx6+3zKbT5GKCeW
	 NX2pnFwDZzz1hOor8xOY7ugBjFYM+kO0Wv+2cMxaQjof7gtQSbCnh/Q/3lv6CYZ4T
	 49HULGrPbAm6u/AGfZVieaPi+dmAkbVAwJU0MhPuWSUZJMSXqwTdYkMrlHl0xrtLe
	 SOCaX9TEouy8YouK4KNhhFQ2RJACxmqmCQgn79CjrcjeiqRDSpeeHNUvm1Tv6hGVb
	 gM/R5gUKfryvwkSNOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.185] ([217.61.158.185]) by
 trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v (via HTTP); Thu, 21 Nov 2024
 17:09:14 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
From: Frank Wunderlich <frank-w@public-files.de>
To: re@w6rz.net, masahiroy@kernel.org, nicolas@fjasle.eu, nathan@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: frank-w@public-files.de
Subject: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet build
 dependencies: libssl-dev) in 6.12
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Nov 2024 17:09:14 +0000
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:CR3pPsPrqTyHSSZfgC7YZ/KmPokO0bYav0vvq7+zAPbH0mEPnAwvsr+RRVU/vxHylHYOV
 6I4C/RO6iep78jMKE6wyeLfLIZHrtYOxjl0uOtdzntBqLvttN9rSBDYxVVJ99t2gc8jrgmyZwPi6
 aIDGuHy4RwQ8HnRO/w9vkGf9XPcfGcRXcVaD5iq+6JrKX8nZDmqUZ/UOs9JqsyPW3+rC8Oq9N5qc
 nihArLLK+N+PEFRx6AkH6HFXr/uYrrFb8YUHO+nS9pBvK8VmWaLqnPbvTtH30TggDtdifnkQAbHa
 lsdqAzI+o3GkLv8YVmPahHg13V6ZFh+F8wslGj/Ja1HCagG5ssFEUWhIh+Ce7b15p0=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y5qjbmLrqlI=;j2x73XkjWDdDsvpLqjwg2QXJrae
 iu4l4MGikK/AuqXrEhQdC9Iqxd5eQY40rV6iq/d+6mEUvK5Iqsgwav5sK0MYMA3e5gdBMPO92
 uL/CABA9J+j/dFKV2JL4RjV38f4YP2RgBrGZ8jMCoSLLvQdBpFX/sgkfWmxOVGQO0NTEET8LY
 k4z3T6+MFq88MRZBaWhSFwoGe4lasJ/hmecYnCismWKEJEOloMxFT75K7oJfRPBKQeg1VZhHR
 6d5HKQQz3r4I8njckZUFUxuUPhqBhJyqp1bHEr6izZIQKohbPpSsFHttVjn/a2T/PWXpyqroa
 k997BcYLW9rt/pVyGpc8VjvyVrrFxNQtQjn0kUJ6HWHlZ21pbyvbUmh6sD1Qr1NoTo/7k28qV
 MkYENkS/TGmSLVKv7LNvqa7Q9XgZo3JEygqryb7afAfblHlDeiEov668/g62fQV3OAKsh2z2A
 YL2QxmNlAvIOL3srw2Tsxwm8xZHksEBFNxU6+oDIShZ+eHosB0UYj/4C3cDyba1tUQd4zY31s
 VcFmT5CDNUbZth7tHbA/urUeAdMKxtY3GLz13lHPutMmikl+merDlm7ODWaxZaYWXi8s+jCSh
 GEkJvWef7K2gdC2kytMrmonhMC5kK6HqJTLfVOoBIB4AzUUAGIK8eS9Yb8MdJlaOaFmGDZ915
 aulZJnIhPTMDVZ4LkOTJPkiVznhaB0JCdBN6OlQti/jo8q2DDYkw41UsCDMKmByWQnq9i1o/O
 yEOD7SHrMYaobs2xTjya5hxilceaiTmGlER53k2f7Rh0eSR1lZXQZQ2oFZZCPw2SPXJBRsmor
 wN17gau2eDwpoKKVBOkXbLYBy9sSzD6Vj/F6WNK4VAzX7jQ/kXMrSiYjnURWcwBmj1qMjTVZ1
 o1BSI1rIj7RU1ZQxsQyc10iGbeC0tD57oG0c=

Hi,

i noticed this issue with debian package build-system in final 6.12.

LOCALVERSION=-main board=bpi-r2 ARCH=arm CROSS_COMPILE=ccache arm-linux-gnueabihf-
make[1]: Entering directory '/media/data_ext/git/kernel/build'
  GEN     debian
dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
dpkg-buildpackage: info: source package linux-upstream
dpkg-buildpackage: info: source version 6.12.0-00061-g837897c10f69-3
dpkg-buildpackage: info: source distribution noble
dpkg-buildpackage: info: source changed by frank <frank@frank-u24>
dpkg-buildpackage: info: host architecture armhf
 dpkg-source --before-build .
dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
dpkg-buildpackage: warning: (Use -d flag to override.)
make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4.14/scripts/Makefile.package:126: bindeb-pkg] Error 3

it was ok in at least rc1 and libssl-dev is installed

basicly i use this command after setting crosscompiler

LOCALVERSION="${gitbranch}" board="$board" KDEB_COMPRESS=gzip make bindeb-pkg

if i Revert "kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile"

i can compile again..any idea why this happens? my build-system is ubuntu 24.4 and github actions with ubuntu-latest.

https://github.com/frank-w/BPI-Router-Linux/actions/runs/11955322294/job/33327423877

regards Frank</frank@frank-u24>

