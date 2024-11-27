Return-Path: <linux-kbuild+bounces-4888-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC999DA47E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 10:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B039D166661
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CCB190665;
	Wed, 27 Nov 2024 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="FEulM0L5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFB13D278
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698613; cv=none; b=J9adSchj5xoV4lvzrcduKSsu+eZ1Bt9qDusK/MwCqHJ64VZfFuyqT6ctgNMAr7cvHKpq2L9aXazPOG0iY2TYw517e7MFkwVStwriec8aPA+vkHnjYNXCQW4XI2p7atPshayw0CXMetln6Msr/njHHo40gECPdlcBgDMlez7wwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698613; c=relaxed/simple;
	bh=hpDLBCdbGdTdFSY4K0Qh9jPtofesEm5a5nlLW3lbPU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9gf1AWnAo6HQij6mkEnqxO8N7f+FgbmHC1slmTlBkKCpazIX5Ph4QL+libW6frzJy7cpw0KvhyhLEQilN61c4vF/4hE1Vlhf4FVTRYzj7CzC+gX/MZWaWibpQwmndMs94nofy/9sIe2QRITjUtOo2pEPT0utAP3zEb6rgc3al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=FEulM0L5; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id GDwttKkqdrKrbGE3ltE9ac; Wed, 27 Nov 2024 09:10:09 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id GE3jt4HAFWvXpGE3ktpPJy; Wed, 27 Nov 2024 09:10:08 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=6746e1f0
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=7vwVE5O1G3EA:10 a=fxJcL_dCAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=HaFmDPmJAAAA:8 a=cpyHj8QvAAAA:8
 a=3NIWOPH5CBuVwF1X97IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=BPjOrAZP5zzvMhA9psHf:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GqtkfVVYic8rQ+D3s0qU79yYthugsmls5EFK56/2Dy4=; b=FEulM0L59Tlkdi8oez6qedCJe3
	smdPuxhpHeLrBoJN43uFgUjShNY3ep5R7MDTlub/T1Bzet5e/UcdtMwY8jtedUIpDcKHHlXBR3s4v
	nAKldR77FWUFz7C2iSkP9eA8JbFr7BmlBMHThLvMeFGhS83CwxMpgJMuY4cA2JYnullAKqRwyTh3k
	PJzl8CG0QWBNMIvxoyvM6O5bidf0MGESHvxlWS9F1uA5rWHgm0LYIJuOnFEJqVb3Ma+8ihH6TRbDh
	JNSDQERCcTaBfydHdG5+pgTUBfirlqlg2hlQqv4xDM1Ms1ZxCginQm7XIHj6hR0dfIjO13NSnGyhk
	68RiFTVg==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:40038 helo=[10.0.1.115])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tGE3j-000rwh-0o;
	Wed, 27 Nov 2024 02:10:07 -0700
Message-ID: <e55645d9-6e50-4b1b-b413-6a0f5acb6095@w6rz.net>
Date: Wed, 27 Nov 2024 01:10:05 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps: error:
 Unmet build dependencies: libssl-dev) in 6.12
To: Frank Wunderlich <frank-w@public-files.de>, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
 <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
 <trinity-54cf8e30-52e9-4501-9160-530e5fe3bdca-1732641150465@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <trinity-54cf8e30-52e9-4501-9160-530e5fe3bdca-1732641150465@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1tGE3j-000rwh-0o
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.115]) [73.223.253.157]:40038
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOJxF+1Pf70wbRiz1ri+ImysJE8Hn33y9wEeMuWE4hoQWK8pJ5i5+144bRsYSXNu7/hOre5VnXgSCINwdZ9JJbUdIGMAOAjv1Uu09cQJk6CVkLEej3O+
 HlGliKjt1gzzF3q97P9NY1JwQPqj0TU2g0Q46PvmvCZ2MgdRBKCnfJLw9gV2WO+yuRI0PkVlCWvPkX6Y0aNBb4IiPKtnsFConXM=

On 11/26/24 09:12, Frank Wunderlich wrote:
> &gt; Gesendet: Donnerstag, 21. November 2024 um 23:09
> &gt; Von: "Masahiro Yamada" <masahiroy@kernel.org>
> &gt; An: "Frank Wunderlich" <frank-w@public-files.de>
> &gt; CC: re@w6rz.net, nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; Betreff: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev) in 6.12
> &gt;
> &gt; On Fri, Nov 22, 2024 at 2:09 AM Frank Wunderlich
> &gt; <frank-w@public-files.de> wrote:
> &gt; &gt;
> &gt; &gt; Hi,
> &gt; &gt;
> &gt; &gt; i noticed this issue with debian package build-system in final 6.12.
> &gt; &gt;
> &gt; &gt; LOCALVERSION=-main board=bpi-r2 ARCH=arm CROSS_COMPILE=ccache arm-linux-gnueabihf-
> &gt; &gt; make[1]: Entering directory '/media/data_ext/git/kernel/build'
> &gt; &gt;   GEN     debian
> &gt; &gt; dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
> &gt; &gt; dpkg-buildpackage: info: source package linux-upstream
> &gt; &gt; dpkg-buildpackage: info: source version 6.12.0-00061-g837897c10f69-3
> &gt; &gt; dpkg-buildpackage: info: source distribution noble
> &gt; &gt; dpkg-buildpackage: info: source changed by frank <frank@frank-u24>
> &gt; &gt; dpkg-buildpackage: info: host architecture armhf
> &gt; &gt;  dpkg-source --before-build .
> &gt; &gt; dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
> &gt;
> &gt; This error message means, you need to install "libssl-dev:armhf"
> &gt;
> &gt;
> &gt; &gt; dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
> &gt; &gt; dpkg-buildpackage: warning: (Use -d flag to override.)
> &gt; &gt; make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4.14/scripts/Makefile.package:126: bindeb-pkg] Error 3
> &gt; &gt;
> &gt; &gt; it was ok in at least rc1 and libssl-dev is installed
> &gt;
> &gt;
> &gt; Presumably, you already installed libssl-dev for your build machine
> &gt; (i.e. "libssl-dev:amd64" if your build machine is x86_64).
> &gt;
> &gt; But, you have not installed "libssl-dev" for the architecture
> &gt; your are building for (i.e, "libssl-dev:armhf")
>
> Hi
>
> thank you for answer, why is this lib required for the arch? it makes my pipeline very complex
> just to add the repos for the arch...seems the lib is not yet used, only checked if installed.
>
> looks like ubuntu 24 seems to have changed the sources.list for apt, so there is no single-line to
> be added
>
> this is the default apt-source in ubuntu 24:
>
> $ cat /etc/apt/sources.list.d/ubuntu.sources
> Types: deb
> URIs: http://de.archive.ubuntu.com/ubuntu/
> Suites: noble noble-updates noble-backports
> Components: main restricted universe multiverse
> Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
>
> Types: deb
> URIs: http://security.ubuntu.com/ubuntu/
> Suites: noble-security
> Components: main restricted universe multiverse
> Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
>
> if i just add the arches
>
> sudo dpkg --add-architecture armhf
> sudo dpkg --add-architecture arm64
>
> apt seems to add the repos on update, but i still cannot install the packages
>
> $ LANG=C sudo apt install libssl-dev:armhf
> Reading package lists... Done
> Building dependency tree... Done
> Reading state information... Done
> E: Unable to locate package libssl-dev:armhf
>
> $ LANG=C sudo apt install libssl-dev:arm64
> Reading package lists... Done
> Building dependency tree... Done
> Reading state information... Done
> E: Unable to locate package libssl-dev:arm64
>
> if i revert the commit below, my build is successful without installing the lib.
>
> afaik the -dev are source-packages (headers) which should be architecture independ, or am i missing something?
>
> regards Frank
>
> &gt; &gt;
> &gt; &gt; basicly i use this command after setting crosscompiler
> &gt; &gt;
> &gt; &gt; LOCALVERSION="${gitbranch}" board="$board" KDEB_COMPRESS=gzip make bindeb-pkg
> &gt; &gt;
> &gt; &gt; if i Revert "kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile"
> &gt; &gt;
> &gt; &gt; i can compile again..any idea why this happens? my build-system is ubuntu 24.4 and github actions with ubuntu-latest.
> &gt; &gt;
> &gt; &gt; https://github.com/frank-w/BPI-Router-Linux/actions/runs/11955322294/job/33327423877
> &gt; &gt;
> &gt; &gt; regards Frank</frank@frank-u24>
> &gt;
> &gt;
> &gt;
> &gt; --
> &gt; Best Regards
> &gt; Masahiro Yamada
> &gt; </frank-w@public-files.de></frank-w@public-files.de></masahiroy@kernel.org>

Here's what worked for me in /etc/apt/sources.list.d/ubuntu.sources for 
24.04.

Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports
Suites: noble noble-updates noble-backports
Components: main universe restricted multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
Architectures: riscv64

The library is used here:

https://github.com/torvalds/linux/blob/master/scripts/sign-file.c#L25

That file is now cross-compiled.


