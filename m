Return-Path: <linux-kbuild+bounces-4879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F69D9C40
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 18:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D4B7B26970
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD07F1DACB4;
	Tue, 26 Nov 2024 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="YZ8Q87/T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4231DAC9A;
	Tue, 26 Nov 2024 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641179; cv=none; b=WdigovxofuqlHryRcQc3rDC1h6sYtxS+cXauwio3LpQYVr1TxupZJrVUrkmhG1Ybt0XkSbVQNUqGhpjPdVTQsRH/Dht1sHHwmDjWdZ3+fOf4aKsumN2ZtvvqvNzDvX3mvDeGFOA0iY7D/CcX4cvQkmvslOxhSAqYBJi7AKV7MQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641179; c=relaxed/simple;
	bh=vBrZ1TD6r9ZT8Aew9EMJG7ITF9PIhI0eYbRZUE9I3VA=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:
	 In-Reply-To:References:Date; b=sZDCodPgZTlxwoyez0xFjrnSrKjzZkvaRAf4VAzvbMLK4idr6XpKKDzHA7lnV1ecS3JnyQMLN8r+fznytDfE4OE1zKaGJ9o1DPJZxopHkpOuF+rGwqssGwtcKkq0cZJYbU0j+Y+PExmIUdj1V/cnUiCD7pawRi2wHz/PUV8POHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=YZ8Q87/T; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1732641150; x=1733245950; i=frank-w@public-files.de;
	bh=yNyGaumd9fBkrkwAwUTp9qtev4su6MGtuYwAhBQL1SY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YZ8Q87/T8LtKYdw9sTFOtOkTSCFwvyoo0KxHoOttWC2PZ1xZ/hpxkarZkS7zR+Yf
	 /GKa94ff7GHD7Ck03W5Vg4elV9XL6HPnGhR5tVybMlA2yrYYgre47dImXrA4/MWLR
	 nk3xx1+BVSaLQC0OWjX+5584gSysItbB/5gYsUzFDgBsumHpd0DZAikE0h9/uFrnG
	 kyq88R5XuCfVyxCC6M2kImuKExaHTeuJuIzkktxiiLK8cST9slaGbYMlh5TkQBmaW
	 GsKNjKeGphE+7P6m2Rc90DKihgMbUhEXwBM1AZuDN+dlnDafjYDqWn+BnVlfDPEQ3
	 AE1AGmXArXyoxuAgFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.83] ([217.61.149.83]) by
 trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w (via HTTP); Tue, 26 Nov 2024
 17:12:30 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-54cf8e30-52e9-4501-9160-530e5fe3bdca-1732641150465@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w>
From: Frank Wunderlich <frank-w@public-files.de>
To: masahiroy@kernel.org
Cc: re@w6rz.net, nicolas@fjasle.eu, nathan@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet
 build dependencies: libssl-dev) in 6.12
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
Importance: normal
References: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
 <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
Date: Tue, 26 Nov 2024 17:12:30 +0000
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:pJy+qtsZJf9qcerPjxpAQi2FwhzINl3YxeJdjuk15EAxMlCgHLWIn2aJah1xKenPVkJF8
 iKAw9d7SqiEX6haaBnTlhYxGLQqFBFsm5SguGr//OqAM6CZa2Kw8yFFjY1+wX21VzQouD4BpxYG4
 CYeXiLALNI1+4riIqYELDVDaRlJtcaUjjRVDqMp+xakNjkPNXyLC+hc8eWmofZOVjHgUax8YIhRO
 +BHUMfj3KCM+PwGoDEzPQwGHVv/GPrnWA9XKMjIcGozo7h7voAj/aGW64QQ8Lskp5RDcuUKBnqQ+
 ccg11i1QYS6vLjCa+WvWDrpCoyEV+fZ267J0xa6ihHHsxKbrKwTnyNdkGYfV2O5aYQ=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xb9nkZiBeVM=;7sI5w/4w9GPjEOgiN85llw0qpPu
 eJ9wfU0wPAKjGOlNbVMeuYVvQkksiB7VUJ25YrbUTdEf0eR48zBbWfMxQp/gXm5x5tZYXrzMe
 /Q9+TNC1WTO+GODXGtTYF7Q/luSEXta6Tq95X+Rso3nZMhjVXvoYP9e//ORw4A54SXzQJVdZH
 toofvXBDuG+3DT7x7hQVM0H8H4AAMvYskOd0k/0/tQorfxaCdzU4vuHQJokvuDJStK3kEDlgq
 5Kjxo6mMBFqAkricy2/a6KLpKDq88RduUDBetuU3uUQBT30teg0VQI2Yw+v6wWzpGtrtluRBC
 WeMgJZxHtBsUlkVNZ3DSm4Fp6SSeshrTRWYKVfWYWkHaHTEdPQFVMA1KWb2mu1g1vausifM37
 bjFiZXJotuEaebm7i8OIxupJKqI75lOr6k3xyN1Y9Elo3JAfGQFf+yMNbqnw1m4Zgwqa6kYZp
 CWdyv8ioSbhFdlUJXgNYjwYmDXAD4ww48+ImuHQW0cmUR9jFV1xfhzHdEs+MLBBT8lXaU8KpL
 jeYYbtmWM4M2gTp/KZgmD2ehcQExnaUolmMDK4rIFdkSJdl/8k6JmzXF1IhtoiSJeL7b0Z4Ou
 KjMsp7qb7sGbo1EekRthM5HeKGIYXKbdoWS+F4jDhUJwWCJuiytltZuQT0vsksbpcYEvoFaFZ
 7YdKlo02wqy7ty4Jxqq65QFonw7+lSwzYStcRyUvlg==

&gt; Gesendet: Donnerstag, 21=2E November 2024 um 23:09
&gt; Von: "Masahiro Yamada" <masahiroy@kernel=2Eorg>
&gt; An: "Frank Wunderlich" <frank-w@public-files=2Ede>
&gt; CC: re@w6rz=2Enet, nicolas@fjasle=2Eeu, nathan@kernel=2Eorg, linux-kb=
uild@vger=2Ekernel=2Eorg, linux-kernel@vger=2Ekernel=2Eorg
&gt; Betreff: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unm=
et build dependencies: libssl-dev) in 6=2E12
&gt;
&gt; On Fri, Nov 22, 2024 at 2:09=E2=80=AFAM Frank Wunderlich
&gt; <frank-w@public-files=2Ede> wrote:
&gt; &gt;
&gt; &gt; Hi,
&gt; &gt;
&gt; &gt; i noticed this issue with debian package build-system in final 6=
=2E12=2E
&gt; &gt;
&gt; &gt; LOCALVERSION=3D-main board=3Dbpi-r2 ARCH=3Darm CROSS_COMPILE=3Dc=
cache arm-linux-gnueabihf-
&gt; &gt; make[1]: Entering directory '/media/data_ext/git/kernel/build'
&gt; &gt;   GEN     debian
&gt; &gt; dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-cha=
nges -R'make -f debian/rules' -j1 -a$(cat debian/arch)
&gt; &gt; dpkg-buildpackage: info: source package linux-upstream
&gt; &gt; dpkg-buildpackage: info: source version 6=2E12=2E0-00061-g837897=
c10f69-3
&gt; &gt; dpkg-buildpackage: info: source distribution noble
&gt; &gt; dpkg-buildpackage: info: source changed by frank <frank@frank-u2=
4>
&gt; &gt; dpkg-buildpackage: info: host architecture armhf
&gt; &gt;  dpkg-source --before-build =2E
&gt; &gt; dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
&gt;=20
&gt; This error message means, you need to install "libssl-dev:armhf"
&gt;=20
&gt;=20
&gt; &gt; dpkg-buildpackage: warning: build dependencies/conflicts unsatis=
fied; aborting
&gt; &gt; dpkg-buildpackage: warning: (Use -d flag to override=2E)
&gt; &gt; make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4=2E14/scripts/M=
akefile=2Epackage:126: bindeb-pkg] Error 3
&gt; &gt;
&gt; &gt; it was ok in at least rc1 and libssl-dev is installed
&gt;=20
&gt;=20
&gt; Presumably, you already installed libssl-dev for your build machine
&gt; (i=2Ee=2E "libssl-dev:amd64" if your build machine is x86_64)=2E
&gt;=20
&gt; But, you have not installed "libssl-dev" for the architecture
&gt; your are building for (i=2Ee, "libssl-dev:armhf")

Hi

thank you for answer, why is this lib required for the arch? it makes my p=
ipeline very complex
just to add the repos for the arch=2E=2E=2Eseems the lib is not yet used, =
only checked if installed=2E

looks like ubuntu 24 seems to have changed the sources=2Elist for apt, so =
there is no single-line to
be added

this is the default apt-source in ubuntu 24:

$ cat /etc/apt/sources=2Elist=2Ed/ubuntu=2Esources
Types: deb
URIs: http://de=2Earchive=2Eubuntu=2Ecom/ubuntu/
Suites: noble noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring=2Egpg

Types: deb
URIs: http://security=2Eubuntu=2Ecom/ubuntu/
Suites: noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring=2Egpg

if i just add the arches

sudo dpkg --add-architecture armhf
sudo dpkg --add-architecture arm64

apt seems to add the repos on update, but i still cannot install the packa=
ges

$ LANG=3DC sudo apt install libssl-dev:armhf
Reading package lists=2E=2E=2E Done
Building dependency tree=2E=2E=2E Done
Reading state information=2E=2E=2E Done
E: Unable to locate package libssl-dev:armhf

$ LANG=3DC sudo apt install libssl-dev:arm64
Reading package lists=2E=2E=2E Done
Building dependency tree=2E=2E=2E Done
Reading state information=2E=2E=2E Done
E: Unable to locate package libssl-dev:arm64

if i revert the commit below, my build is successful without installing th=
e lib=2E

afaik the -dev are source-packages (headers) which should be architecture =
independ, or am i missing something?

regards Frank

&gt; &gt;
&gt; &gt; basicly i use this command after setting crosscompiler
&gt; &gt;
&gt; &gt; LOCALVERSION=3D"${gitbranch}" board=3D"$board" KDEB_COMPRESS=3Dg=
zip make bindeb-pkg
&gt; &gt;
&gt; &gt; if i Revert "kbuild: deb-pkg: add pkg=2Elinux-upstream=2Enokerne=
lheaders build profile"
&gt; &gt;
&gt; &gt; i can compile again=2E=2Eany idea why this happens? my build-sys=
tem is ubuntu 24=2E4 and github actions with ubuntu-latest=2E
&gt; &gt;
&gt; &gt; https://github=2Ecom/frank-w/BPI-Router-Linux/actions/runs/11955=
322294/job/33327423877
&gt; &gt;
&gt; &gt; regards Frank</frank@frank-u24>
&gt;=20
&gt;=20
&gt;=20
&gt; --=20
&gt; Best Regards
&gt; Masahiro Yamada
&gt; </frank-w@public-files=2Ede></frank-w@public-files=2Ede></masahiroy@k=
ernel=2Eorg>

