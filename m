Return-Path: <linux-kbuild+bounces-4893-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED239DA792
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 13:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2FA9162619
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862461FBC92;
	Wed, 27 Nov 2024 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="lwZOurz6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A471FA251
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709835; cv=none; b=dbcKLe/9H4Zv/a6aaGj6llpWbWFWwSTms2T7RHtsn4JtS9FAxLvUjatyngo5VOXaIrFyPT1jrPkdSBVB+GBXrhYr+xx+E2mMuDttJPMHhi3S7FQnxySArFysf0F6TsOh+cQm32EtYKuR4g1yaWejrBBNyhGq/sAQrRDrF2bSkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709835; c=relaxed/simple;
	bh=RglTSagHLJlpjLLO3XN4yYHPfwT3ij0+YY9CxAXm9vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgvHwMU9qiTj74s0GawF0zxvCyE5c8rsXi5TMPzJablU68rh3nkXuWeZJK0TW5Td8vT288HNnuZFgDM8UxUyIq8EohJJCUPmTbGCr7AlKae8WixbR8nEcbriLm+tDkAAp28j5ikVufg+Wq4329VVzRNx+GZY3fnxdC8kj6FCrXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=lwZOurz6; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id GB5otUrogg2lzGGygtyUBB; Wed, 27 Nov 2024 12:17:06 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id GGyftAoiUxK8vGGyftivrI; Wed, 27 Nov 2024 12:17:05 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=67470dc1
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=7vwVE5O1G3EA:10 a=fxJcL_dCAAAA:8
 a=NEAV23lmAAAA:8 a=HaFmDPmJAAAA:8 a=VwQbUJbxAAAA:8 a=cpyHj8QvAAAA:8
 a=dFbenWJkYNu75aGOKbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=BPjOrAZP5zzvMhA9psHf:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wk49Us1i/U24R6rJa3o8MpulLEgGbuu6CfFvEf1cwZk=; b=lwZOurz6CElSEfsX3CQKd7PvCT
	JrDQ1ad14yCxQdgJSz7kXcIWrGzQxTIyjyd2LAYfUfcZRmzTIQ4yKka0HPTIIBHWqq5wc72IW/kbB
	bIceMOKIcxi8+1BWEubRkAFBSW9lnKPdwlS/oONExZBCIq8JuJgpr1OtdU7v1tgprEzu3CPd2zfo2
	JZbJMjiYQUdAp/Rl948tCPDfCBGeWLmRfTv2aW2b3eCbXO54LvXV+8ZdBdwqIZiGyGB71VS9WjMVL
	3XeTsdhjqD2w++Yd2TrsrV83uZuIIKCgf0VKzBC4jn9hOvCAHqv7kAh6IpJHzPmwj/6z9GCFCGnyt
	OuZUwfKQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:47580 helo=[10.0.1.115])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tGGye-002GRT-2N;
	Wed, 27 Nov 2024 05:17:04 -0700
Message-ID: <6a3ce531-d863-40f2-9fe5-ac6fa3c3fb6a@w6rz.net>
Date: Wed, 27 Nov 2024 04:17:03 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Aw: Re: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps:
 error: Unmet build dependencies: libssl-dev) in 6.12
To: Frank Wunderlich <frank-w@public-files.de>, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <trinity-6989b089-36ba-4f0b-a924-f175377209c3-1732208954843@trinity-msg-rest-gmx-gmx-live-86dc4689bd-wks9v>
 <CAK7LNAQuE_e2XrRA7r=o8p-Vjqi3OAii1z99E+GdacvMdw6-5w@mail.gmail.com>
 <trinity-54cf8e30-52e9-4501-9160-530e5fe3bdca-1732641150465@trinity-msg-rest-gmx-gmx-live-5cd5dd5458-76g2w>
 <e55645d9-6e50-4b1b-b413-6a0f5acb6095@w6rz.net>
 <trinity-91daf006-41a6-4b4f-b7ee-2870f2c262c9-1732702872483@trinity-msg-rest-gmx-gmx-live-86dc4689bd-7d6hq>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <trinity-91daf006-41a6-4b4f-b7ee-2870f2c262c9-1732702872483@trinity-msg-rest-gmx-gmx-live-86dc4689bd-7d6hq>
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
X-Exim-ID: 1tGGye-002GRT-2N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.115]) [73.223.253.157]:47580
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGVW97A+GM4T/ds37JowEH54XdmZzqr6OvK8Ok1fV+JvCsBa88pob4NJoTQWmv3EGZyIuZAtr726Da/frPj5luLrX5hVxmUDYwY0eA5BH09SGQDkPrgK
 gQlFCTwsYpzMMIbHqPQuQ+7927W5kaIBP4nikZaIhCeunPiYBIIgMte7lN+xiIQGS5EE2D8kB3vF6eiTT5fc+ameTJmlXDGttYY=

On 11/27/24 02:21, Frank Wunderlich wrote:
> &gt; Gesendet: Mittwoch, 27. November 2024 um 10:10
> &gt; Von: "Ron Economos" <re@w6rz.net>
> &gt; An: "Frank Wunderlich" <frank-w@public-files.de>, masahiroy@kernel.org
> &gt; CC: nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; Betreff: Re: Aw: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev) in 6.12
> &gt;
> &gt; On 11/26/24 09:12, Frank Wunderlich wrote:
> &gt; &gt; &gt; Gesendet: Donnerstag, 21. November 2024 um 23:09
> &gt; &gt; &gt; Von: "Masahiro Yamada" <masahiroy@kernel.org>
> &gt; &gt; &gt; An: "Frank Wunderlich" <frank-w@public-files.de>
> &gt; &gt; &gt; CC: re@w6rz.net, nicolas@fjasle.eu, nathan@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; &gt; &gt; Betreff: Re: build issue in builddeb (dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev) in 6.12
> &gt; &gt; &gt;
> &gt; &gt; &gt; On Fri, Nov 22, 2024 at 2:09 AM Frank Wunderlich
> &gt; &gt; &gt; <frank-w@public-files.de> wrote:
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; Hi,
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; i noticed this issue with debian package build-system in final 6.12.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; LOCALVERSION=-main board=bpi-r2 ARCH=arm CROSS_COMPILE=ccache arm-linux-gnueabihf-
> &gt; &gt; &gt; &gt; make[1]: Entering directory '/media/data_ext/git/kernel/build'
> &gt; &gt; &gt; &gt;   GEN     debian
> &gt; &gt; &gt; &gt; dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
> &gt; &gt; &gt; &gt; dpkg-buildpackage: info: source package linux-upstream
> &gt; &gt; &gt; &gt; dpkg-buildpackage: info: source version 6.12.0-00061-g837897c10f69-3
> &gt; &gt; &gt; &gt; dpkg-buildpackage: info: source distribution noble
> &gt; &gt; &gt; &gt; dpkg-buildpackage: info: source changed by frank <frank@frank-u24>
> &gt; &gt; &gt; &gt; dpkg-buildpackage: info: host architecture armhf
> &gt; &gt; &gt; &gt;  dpkg-source --before-build .
> &gt; &gt; &gt; &gt; dpkg-checkbuilddeps: error: Unmet build dependencies: libssl-dev
> &gt; &gt; &gt;
> &gt; &gt; &gt; This error message means, you need to install "libssl-dev:armhf"
> &gt; &gt; &gt;
> &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
> &gt; &gt; &gt; &gt; dpkg-buildpackage: warning: (Use -d flag to override.)
> &gt; &gt; &gt; &gt; make[3]: *** [/media/data_ext/git/kernel/BPI-R2-4.14/scripts/Makefile.package:126: bindeb-pkg] Error 3
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; it was ok in at least rc1 and libssl-dev is installed
> &gt; &gt; &gt;
> &gt; &gt; &gt;
> &gt; &gt; &gt; Presumably, you already installed libssl-dev for your build machine
> &gt; &gt; &gt; (i.e. "libssl-dev:amd64" if your build machine is x86_64).
> &gt; &gt; &gt;
> &gt; &gt; &gt; But, you have not installed "libssl-dev" for the architecture
> &gt; &gt; &gt; your are building for (i.e, "libssl-dev:armhf")
> &gt; &gt;
> &gt; &gt; Hi
> &gt; &gt;
> &gt; &gt; thank you for answer, why is this lib required for the arch? it makes my pipeline very complex
> &gt; &gt; just to add the repos for the arch...seems the lib is not yet used, only checked if installed.
> &gt; &gt;
> &gt; &gt; looks like ubuntu 24 seems to have changed the sources.list for apt, so there is no single-line to
> &gt; &gt; be added
> &gt; &gt;
> &gt; &gt; this is the default apt-source in ubuntu 24:
> &gt; &gt;
> &gt; &gt; $ cat /etc/apt/sources.list.d/ubuntu.sources
> &gt; &gt; Types: deb
> &gt; &gt; URIs: http://de.archive.ubuntu.com/ubuntu/
> &gt; &gt; Suites: noble noble-updates noble-backports
> &gt; &gt; Components: main restricted universe multiverse
> &gt; &gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
> &gt; &gt;
> &gt; &gt; Types: deb
> &gt; &gt; URIs: http://security.ubuntu.com/ubuntu/
> &gt; &gt; Suites: noble-security
> &gt; &gt; Components: main restricted universe multiverse
> &gt; &gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
> &gt; &gt;
> &gt; &gt; if i just add the arches
> &gt; &gt;
> &gt; &gt; sudo dpkg --add-architecture armhf
> &gt; &gt; sudo dpkg --add-architecture arm64
> &gt; &gt;
> &gt; &gt; apt seems to add the repos on update, but i still cannot install the packages
> &gt; &gt;
> &gt; &gt; $ LANG=C sudo apt install libssl-dev:armhf
> &gt; &gt; Reading package lists... Done
> &gt; &gt; Building dependency tree... Done
> &gt; &gt; Reading state information... Done
> &gt; &gt; E: Unable to locate package libssl-dev:armhf
> &gt; &gt;
> &gt; &gt; $ LANG=C sudo apt install libssl-dev:arm64
> &gt; &gt; Reading package lists... Done
> &gt; &gt; Building dependency tree... Done
> &gt; &gt; Reading state information... Done
> &gt; &gt; E: Unable to locate package libssl-dev:arm64
> &gt; &gt;
> &gt; &gt; if i revert the commit below, my build is successful without installing the lib.
> &gt; &gt;
> &gt; &gt; afaik the -dev are source-packages (headers) which should be architecture independ, or am i missing something?
> &gt; &gt;
> &gt; &gt; regards Frank
> &gt; &gt;
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; basicly i use this command after setting crosscompiler
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; LOCALVERSION="${gitbranch}" board="$board" KDEB_COMPRESS=gzip make bindeb-pkg
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; if i Revert "kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile"
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; i can compile again..any idea why this happens? my build-system is ubuntu 24.4 and github actions with ubuntu-latest.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; https://github.com/frank-w/BPI-Router-Linux/actions/runs/11955322294/job/33327423877
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; regards Frank</frank@frank-u24>
> &gt; &gt; &gt;
> &gt; &gt; &gt;
> &gt; &gt; &gt;
> &gt; &gt; &gt; --
> &gt; &gt; &gt; Best Regards
> &gt; &gt; &gt; Masahiro Yamada
> &gt;
> &gt; Here's what worked for me in /etc/apt/sources.list.d/ubuntu.sources for
> &gt; 24.04.
> &gt;
> &gt; Types: deb
> &gt; URIs: http://ports.ubuntu.com/ubuntu-ports
> &gt; Suites: noble noble-updates noble-backports
> &gt; Components: main universe restricted multiverse
> &gt; Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
> &gt; Architectures: riscv64
> &gt;
> thx for ubuntu 24 i have it done similar (took the whole day to get both systems to the point apt-sources to be added the right way), had to modify the ubuntu.sources to add the arch for host system (amd64) and add additional file with ports.ubuntu.com for the crosscompile-target (armhf/arm64)
>
> https://github.com/frank-w/BPI-Router-Linux/actions/runs/12047237222/job/33589357798#step:6:1
>
> tried most time to get current ubuntu-latest for github actions running which is still ubuntu-22.04, but ran into installing issues where libssl3 cannot be installed for the desired arch...if i add it manually it depends on libc for the arch and so on...
>
> example for ubuntu-latest / ubuntu-22.04
> https://github.com/frank-w/BPI-Router-Linux/actions/runs/12038757178/job/33565113600
>
> https://github.com/frank-w/BPI-Router-Linux/actions/runs/12038757178/workflow#L56
>
> &gt; The library is used here:
> &gt;
> &gt; https://github.com/torvalds/linux/blob/master/scripts/sign-file.c#L25
> &gt;
> &gt; That file is now cross-compiled.
>
> but why needs signing-file to be crosscompiled? the target files (kernel and maybe the deb-file) have to be crosscompiled, but imho
> not tools for signing them. After building kernel for target-arch and creating deb isn't it possible to sign it using a amd64 (host
> arch) openssl binary? the openssl-binary does not land on target-platform...only used as part of build-chain, or am i wrong?
>
> btw. not sure why my webmailer creates html-tags in plaintext-mails...have reported it to the vendor, but not got any response yet, so
> sorry for that (have replaced quote-chars manually, hope they stay as single chars and not reconverted to entities).
>
> regards Frank
> </frank-w@public-files.de></frank-w@public-files.de></masahiroy@kernel.org></frank-w@public-files.de></re@w6rz.net>

sign-file is a target executable. When you install the 
linux-headers-6.12.0xxx_arch.deb, it ends up in 
/usr/src/linux-headers-6.12.0/scripts on the target.

That's what this change is all about. In the past, the executables in 
/usr/src/linux-headers-xxx/scripts were being compiled for x86, not the 
target architecture.


