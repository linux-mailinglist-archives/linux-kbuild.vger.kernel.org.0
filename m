Return-Path: <linux-kbuild+bounces-4890-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9039DA59F
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 11:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FB1286499
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 10:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF56194C9D;
	Wed, 27 Nov 2024 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="Kia8lI8C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2E191F99;
	Wed, 27 Nov 2024 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702907; cv=none; b=cwJnPpgz6MkObdPvxF4higDPB7ATQ8Dwyxp3reHtKhRSppIeXvbQZhCS4QOmEsoXmzV+UEpPGej42eDMkUB5j2l2TuSXe+8bBvOzZOkYNJ178UPlc9/yayxfo40lr+e5c5FFc0SEjRAP7fDHNfgWmw8Gu1hXn5fS1y7J0n+gVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702907; c=relaxed/simple;
	bh=/zrptZSctJMXKHcZ+yt3h6yHrgFTyDyxCFBUnbWAGXo=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:
	 In-Reply-To:References:Date; b=FZqISgXBOK4bD90omDol6NBtOAP80TUwc+uvCYRvwpmHDV6/55zEOYXdbKjunwcWM8eImaiI2FbvF2uf2XPY7RI8JCQ5z4x9Ttc4M9uoQtApk0I/MR52Sh0AkUmKytnNXpMt80fvYxDVP6pJUtkIRvHheSMBdO2J89HhjQTqxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=Kia8lI8C; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1732702872; x=1733307672; i=frank-w@public-files.de;
	bh=m17TuTjvrtStjj4QCsadpmyatfALlSupsS9aI1oS2Ds=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Kia8lI8CF3GTN2Q/sYwkJ1ws0SQe+MovKCnhrmvd0AA9AbqMIS17nB5rtyp/zF5r
	 jz+KNPgAkipjE9TMF+1ap1RbqbylX/eREfk+lVJjUokJHPt6z3dclc/SPcqhMAy/0
	 0Qy9ZzAY8bMVkZy/6ESlHBr51ydPuU/rlgCQ7u5xhHiL1p8vlnD79fRFGFhvXW+nl
	 yKneLkVl4i7wREV+uUPCqDTO02tihBMvIheJoP7W7eW9vI06H7LUYdCfg0pzOxDLb
	 Vt0mEpRRmUs5+JuP1Hkw05gYpX5OdG53HZoccy859f5q9Gr9LKoHN8rfHNvtmGy25
	 9Od9RZITxAV1/elBCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.21] ([157.180.224.21]) by
 trinity-msg-rest-gmx-gmx-live-86dc4689bd-7d6hq (via HTTP); Wed, 27 Nov 2024
 10:21:12 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-91daf006-41a6-4b4f-b7ee-2870f2c262c9-1732702872483@trinity-msg-rest-gmx-gmx-live-86dc4689bd-7d6hq>
From: Frank Wunderlich <frank-w@public-files.de>
To: re@w6rz.net, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps:
 error: Unmet build dependencies: libssl-dev) in 6.12
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <e55645d9-6e50-4b1b-b413-6a0f5acb6095@w6rz.net>
Importance: normal
References: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
 <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
 <trinity-54cf8e30-52e9-4501-9160-530e5fe3bdca-1732641150465@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w>
 <e55645d9-6e50-4b1b-b413-6a0f5acb6095@w6rz.net>
Date: Wed, 27 Nov 2024 10:21:12 +0000
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:0xi6RgGbQSuKU/ELfkGqE7fRbq0n8swFIVhc1H2pzRQiNdJw5twp0Y4NKUuCpXSO6hcos
 iMMwE403ZWQrmBIb0DfGstZlx1eIYc2KxuK2U53oOPrkhGB1hgGabiVUA9mYxGIbcFjsYGcXmFM1
 BdMoO6SdH4juY3Nkf1cSBX7/tcVd1Yem2+NnmSt2oUZRMRx/UpOje732nnCuQGg2un3AzA4COm1Q
 daaJZOXz9a4DjaKkSuT6vcDjgx0+lnOWDCTpaoqJGiG5jdDzwDBcob7PhqEfrZz3yU7MWp2he+bK
 Ftx8AWwpfVxpFmNMF4YibmhR8EFuYb7lbVc1WPAZZr9kKcbZIPBfVKxHSPJmlKgRoY=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NVBrXSSFO+U=;P+oQJWYz2jd2P+QvJff+/A6nt/H
 6NhawMAH7RatE6sxqJH4x/RwJVa4a7XV2drFkrbWT/yyYgaHw1GZnH1vcsJpnBPvpeJQAKBl4
 ZUcL8AM7ZeSrnXFH+9RRzbDTmRkNvlQOIeNXyx8GRF6075849PognJ/9zwtFjMDImb2XjvMaN
 3tjh9h0ffxurW/myDMcf0l75O/smXxqPQV+tnGcSYpdNvOka+mv2EkJ6jcOqnOuf51XlwP5W5
 gCeriBHF/+ICJnaLK1Lk1VBahdj7Zj2qJyamxVRa6Glk3QhZZOaUOxgPdOusmS2zgLFvtsheP
 8zf+upQtmEg6y5UuZvnAhsBmm82OI7j/dfhz3LWcaydyjOeC6y5TNrpAqmivcRcz+y32SeNTh
 Os1Db7jmkP67uiaMw2Mxpd4W6xBaEl5GQ+3n0QmSiJ8on4H/fBW5o2Gn8Ks29Nu6/umrgpjqt
 NdbViHx9wM4Zfmq5bh7UiptkE0tErbhzXpnw5M9hBIj62mz+Bnc5imGndGHFSegAllYW0bECH
 2ndPR/1d6S9KbU0uRMxU9IQzjwfDF8dV3aMOx9wyiskhwcqWiTV4XO2lScDBUiaraJtheY6h5
 XX5SAGhJWPi46m3RpldrZ+DLm3bg30iJaz/2OFoiqn8y2rduYO/+d1zJKfBEjRngOkTE/LOHx
 nEeKYM7dhXwtrzw4x37SX6RE0Kk8pTWDnMLfhS+/e2bSLC3aqByuhHl5Y0kRONsWjLPjGThp3
 NqvlYs3iXG6+qUkXDYSpu0Kejql9qu4aqzMmBBCemKonkWBL5g80BRZ6sWodjQ3LMjgq+71zV
 HpJqkUqNKiWl+uJ5vTOJHUEBhMnECfBTmO7j4qhzKcBOSEriTDqbdcAj5qhUFhSU9Jcg5jYTt
 2FE++jhFaZvJOXfFvY0HiSi7em/AMuge7rY8=

&gt; Gesendet: Mittwoch, 27=2E November 2024 um 10:10
&gt; Von: "Ron Economos" <re@w6rz=2Enet>
&gt; An: "Frank Wunderlich" <frank-w@public-files=2Ede>, masahiroy@kernel=
=2Eorg
&gt; CC: nicolas@fjasle=2Eeu, nathan@kernel=2Eorg, linux-kbuild@vger=2Eker=
nel=2Eorg, linux-kernel@vger=2Ekernel=2Eorg
&gt; Betreff: Re: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps: er=
ror: Unmet build dependencies: libssl-dev) in 6=2E12
&gt;
&gt; On 11/26/24 09:12, Frank Wunderlich wrote:
&gt; &gt; &gt; Gesendet: Donnerstag, 21=2E November 2024 um 23:09
&gt; &gt; &gt; Von: "Masahiro Yamada" <masahiroy@kernel=2Eorg>
&gt; &gt; &gt; An: "Frank Wunderlich" <frank-w@public-files=2Ede>
&gt; &gt; &gt; CC: re@w6rz=2Enet, nicolas@fjasle=2Eeu, nathan@kernel=2Eorg=
, linux-kbuild@vger=2Ekernel=2Eorg, linux-kernel@vger=2Ekernel=2Eorg
&gt; &gt; &gt; Betreff: Re: build issue in builddeb (dpkg-checkbuilddeps: =
error: Unmet build dependencies: libssl-dev) in 6=2E12
&gt; &gt; &gt;
&gt; &gt; &gt; On Fri, Nov 22, 2024 at 2:09=E2=80=AFAM Frank Wunderlich
&gt; &gt; &gt; <frank-w@public-files=2Ede> wrote:
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; Hi,
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; i noticed this issue with debian package build-system =
in final 6=2E12=2E
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; LOCALVERSION=3D-main board=3Dbpi-r2 ARCH=3Darm CROSS_C=
OMPILE=3Dccache arm-linux-gnueabihf-
&gt; &gt; &gt; &gt; make[1]: Entering directory '/media/data_ext/git/kerne=
l/build'
&gt; &gt; &gt; &gt;   GEN     debian
&gt; &gt; &gt; &gt; dpkg-buildpackage --build=3Dbinary --no-pre-clean --un=
signed-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
&gt; &gt; &gt; &gt; dpkg-buildpackage: info: source package linux-upstream
&gt; &gt; &gt; &gt; dpkg-buildpackage: info: source version 6=2E12=2E0-000=
61-g837897c10f69-3
&gt; &gt; &gt; &gt; dpkg-buildpackage: info: source distribution noble
&gt; &gt; &gt; &gt; dpkg-buildpackage: info: source changed by frank <fran=
k@frank-u24>
&gt; &gt; &gt; &gt; dpkg-buildpackage: info: host architecture armhf
&gt; &gt; &gt; &gt;  dpkg-source --before-build =2E
&gt; &gt; &gt; &gt; dpkg-checkbuilddeps: error: Unmet build dependencies: =
libssl-dev
&gt; &gt; &gt;
&gt; &gt; &gt; This error message means, you need to install "libssl-dev:a=
rmhf"
&gt; &gt; &gt;
&gt; &gt; &gt;
&gt; &gt; &gt; &gt; dpkg-buildpackage: warning: build dependencies/conflic=
ts unsatisfied; aborting
&gt; &gt; &gt; &gt; dpkg-buildpackage: warning: (Use -d flag to override=
=2E)
&gt; &gt; &gt; &gt; make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4=2E14=
/scripts/Makefile=2Epackage:126: bindeb-pkg] Error 3
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; it was ok in at least rc1 and libssl-dev is installed
&gt; &gt; &gt;
&gt; &gt; &gt;
&gt; &gt; &gt; Presumably, you already installed libssl-dev for your build=
 machine
&gt; &gt; &gt; (i=2Ee=2E "libssl-dev:amd64" if your build machine is x86_6=
4)=2E
&gt; &gt; &gt;
&gt; &gt; &gt; But, you have not installed "libssl-dev" for the architectu=
re
&gt; &gt; &gt; your are building for (i=2Ee, "libssl-dev:armhf")
&gt; &gt;
&gt; &gt; Hi
&gt; &gt;
&gt; &gt; thank you for answer, why is this lib required for the arch? it =
makes my pipeline very complex
&gt; &gt; just to add the repos for the arch=2E=2E=2Eseems the lib is not =
yet used, only checked if installed=2E
&gt; &gt;
&gt; &gt; looks like ubuntu 24 seems to have changed the sources=2Elist fo=
r apt, so there is no single-line to
&gt; &gt; be added
&gt; &gt;
&gt; &gt; this is the default apt-source in ubuntu 24:
&gt; &gt;
&gt; &gt; $ cat /etc/apt/sources=2Elist=2Ed/ubuntu=2Esources
&gt; &gt; Types: deb
&gt; &gt; URIs: http://de=2Earchive=2Eubuntu=2Ecom/ubuntu/
&gt; &gt; Suites: noble noble-updates noble-backports
&gt; &gt; Components: main restricted universe multiverse
&gt; &gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring=2Egpg
&gt; &gt;
&gt; &gt; Types: deb
&gt; &gt; URIs: http://security=2Eubuntu=2Ecom/ubuntu/
&gt; &gt; Suites: noble-security
&gt; &gt; Components: main restricted universe multiverse
&gt; &gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring=2Egpg
&gt; &gt;
&gt; &gt; if i just add the arches
&gt; &gt;
&gt; &gt; sudo dpkg --add-architecture armhf
&gt; &gt; sudo dpkg --add-architecture arm64
&gt; &gt;
&gt; &gt; apt seems to add the repos on update, but i still cannot install=
 the packages
&gt; &gt;
&gt; &gt; $ LANG=3DC sudo apt install libssl-dev:armhf
&gt; &gt; Reading package lists=2E=2E=2E Done
&gt; &gt; Building dependency tree=2E=2E=2E Done
&gt; &gt; Reading state information=2E=2E=2E Done
&gt; &gt; E: Unable to locate package libssl-dev:armhf
&gt; &gt;
&gt; &gt; $ LANG=3DC sudo apt install libssl-dev:arm64
&gt; &gt; Reading package lists=2E=2E=2E Done
&gt; &gt; Building dependency tree=2E=2E=2E Done
&gt; &gt; Reading state information=2E=2E=2E Done
&gt; &gt; E: Unable to locate package libssl-dev:arm64
&gt; &gt;
&gt; &gt; if i revert the commit below, my build is successful without ins=
talling the lib=2E
&gt; &gt;
&gt; &gt; afaik the -dev are source-packages (headers) which should be arc=
hitecture independ, or am i missing something?
&gt; &gt;
&gt; &gt; regards Frank
&gt; &gt;
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; basicly i use this command after setting crosscompiler
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; LOCALVERSION=3D"${gitbranch}" board=3D"$board" KDEB_CO=
MPRESS=3Dgzip make bindeb-pkg
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; if i Revert "kbuild: deb-pkg: add pkg=2Elinux-upstream=
=2Enokernelheaders build profile"
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; i can compile again=2E=2Eany idea why this happens? my=
 build-system is ubuntu 24=2E4 and github actions with ubuntu-latest=2E
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; https://github=2Ecom/frank-w/BPI-Router-Linux/actions/=
runs/11955322294/job/33327423877
&gt; &gt; &gt; &gt;
&gt; &gt; &gt; &gt; regards Frank</frank@frank-u24>
&gt; &gt; &gt;
&gt; &gt; &gt;
&gt; &gt; &gt;
&gt; &gt; &gt; --
&gt; &gt; &gt; Best Regards
&gt; &gt; &gt; Masahiro Yamada
&gt;=20
&gt; Here's what worked for me in /etc/apt/sources=2Elist=2Ed/ubuntu=2Esou=
rces for=20
&gt; 24=2E04=2E
&gt;=20
&gt; Types: deb
&gt; URIs: http://ports=2Eubuntu=2Ecom/ubuntu-ports
&gt; Suites: noble noble-updates noble-backports
&gt; Components: main universe restricted multiverse
&gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring=2Egpg
&gt; Architectures: riscv64
&gt;=20
thx for ubuntu 24 i have it done similar (took the whole day to get both s=
ystems to the point apt-sources to be added the right way), had to modify t=
he ubuntu=2Esources to add the arch for host system (amd64) and add additio=
nal file with ports=2Eubuntu=2Ecom for the crosscompile-target (armhf/arm64=
)

https://github=2Ecom/frank-w/BPI-Router-Linux/actions/runs/12047237222/job=
/33589357798#step:6:1

tried most time to get current ubuntu-latest for github actions running wh=
ich is still ubuntu-22=2E04, but ran into installing issues where libssl3 c=
annot be installed for the desired arch=2E=2E=2Eif i add it manually it dep=
ends on libc for the arch and so on=2E=2E=2E

example for ubuntu-latest / ubuntu-22=2E04
https://github=2Ecom/frank-w/BPI-Router-Linux/actions/runs/12038757178/job=
/33565113600

https://github=2Ecom/frank-w/BPI-Router-Linux/actions/runs/12038757178/wor=
kflow#L56

&gt; The library is used here:
&gt;=20
&gt; https://github=2Ecom/torvalds/linux/blob/master/scripts/sign-file=2Ec=
#L25
&gt;=20
&gt; That file is now cross-compiled=2E

but why needs signing-file to be crosscompiled? the target files (kernel a=
nd maybe the deb-file) have to be crosscompiled, but imho
not tools for signing them=2E After building kernel for target-arch and cr=
eating deb isn't it possible to sign it using a amd64 (host
arch) openssl binary? the openssl-binary does not land on target-platform=
=2E=2E=2Eonly used as part of build-chain, or am i wrong?

btw=2E not sure why my webmailer creates html-tags in plaintext-mails=2E=
=2E=2Ehave reported it to the vendor, but not got any response yet, so=20
sorry for that (have replaced quote-chars manually, hope they stay as sing=
le chars and not reconverted to entities)=2E

regards Frank
</frank-w@public-files=2Ede></frank-w@public-files=2Ede></masahiroy@kernel=
=2Eorg></frank-w@public-files=2Ede></re@w6rz=2Enet>

