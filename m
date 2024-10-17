Return-Path: <linux-kbuild+bounces-4170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B09A2DE2
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 21:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45E5DB20C51
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 19:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12461DED54;
	Thu, 17 Oct 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="EiLiqXY9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42240858
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193701; cv=none; b=oliPz1Z96fbE1WW2LUf/fP/gglfqGndDFGTZ36rwaz3q6W9vTFZjmzR/yPcOXESk8hzzGzHRGUXKPGXkj0Y8vmwraHXqaibdcW1ujnNVJcKgFQGw4S9L/KzpXZUPfBgqnvWisxaFu4igfWmGfUyqKN7R3XaWmFPTuhDUz0krwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193701; c=relaxed/simple;
	bh=sn+2P/tA5O6yXBIKkoQrUX8/FHV+cf5yzeqY8ZICpqo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=p/AKKkmoT0tmdDAt8IWt8pb9dRXmYYjL70t5+UA8ii3SIUvH1nw7d8lTxV4H5m8FmJYF6dGob04FqMWXjrl1EJ52XUpLaiJ2C9que7/fUdqUTYJezyphg4aEIOHoTD2XAs+04ZfmwNf9Ad0CfREnzli3aEzX40Lg+YWRbWc5AoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=EiLiqXY9; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id 1TcVtB1EunNFG1WGqt0lBg; Thu, 17 Oct 2024 19:34:52 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 1WGptlsYdGNqB1WGptoLZK; Thu, 17 Oct 2024 19:34:52 +0000
X-Authority-Analysis: v=2.4 cv=cqidkU4i c=1 sm=1 tr=0 ts=671166dc
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7vwVE5O1G3EA:10 a=xNf9USuDAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=XsbjqL5OE-XFCOJEq9cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Q3SAUjlmmjdb7sJ8Uirzeafr8zGxoG/DRwEZgVzyteU=; b=EiLiqXY9BHgH+dMPgMXWnO3qmG
	khoy+Glc5dRVRiuSLVg3ytyj3wr348Bnu1ZzrvvORZyDYAkbeuwIYyPoETupfNOYTffNN29iMzlC6
	0xrVTC2R0uMskN0uOZDOOOeDASVy/PYmwkbY+fFmfaPx5SPfOnAf05PSoz0TgdOfle8gVsMSWEJWP
	IjwbD+DPw8Xcx/1JlnU2RkVdIF20JqQXj1bpRjZoiZ5w2c48WO2WJCqrpg/aCr96ETFRv3GXj8An6
	toj6qlmTn63f8sKlA3IgE+bazGCSqe98CmykqHUT8P0aGfmw9vHdlNSHS6s1zdCEkA/cil2rUu9px
	IhUMjeYA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:48484 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1t1WGp-003J7Q-0M;
	Thu, 17 Oct 2024 13:34:51 -0600
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
 <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net> <ZxFkXyfs0jO2QzBv@fjasle.eu>
From: Ron Economos <re@w6rz.net>
Message-ID: <8e7802cc-7d76-6929-cb6e-cefc020dd8e2@w6rz.net>
Date: Thu, 17 Oct 2024 12:34:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZxFkXyfs0jO2QzBv@fjasle.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1t1WGp-003J7Q-0M
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.47]) [73.223.253.157]:48484
X-Source-Auth: re@w6rz.net
X-Email-Count: 3
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKlZLzh78kK9zIn/OdIBGPJMG2FB99FwS1bzqhiUjNR31m1zlkn8WVMjMmhuA/iLKHsTNcC0mooMMUx8F9lEVfWR3DDE0jFexCWnEPuFcIX1SKLFJfqh
 oDps5wfhA/Ow1KiyzVOW6fXk5KXXEaUvGKBkz7lW1kw7sOTCcYyUcE6dB8Y3KCQtg3kdZhJ+dtfSLCBn0WRt5LB3HCZ1+I0ouIk=

On 10/17/24 12:24 PM, Nicolas Schier wrote:
> On Thu, Oct 17, 2024 at 07:45:57AM -0700 Ron Economos wrote:
>> On 7/27/24 12:42 AM, Masahiro Yamada wrote:
>>> A long standing issue in the upstream kernel packaging is that the
>>> linux-headers package is not cross-compiled.
>>>
>>> For example, you can cross-build Debian packages for arm64 by running
>>> the following command:
>>>
>>>     $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
>>>
>>> However, the generated linux-headers-*_arm64.deb is useless because the
>>> host programs in it were built for your build machine architecture
>>> (likely x86), not arm64.
>>>
>>> The Debian kernel maintains its own Makefiles to cross-compile host
>>> tools without relying on Kbuild. [1]
>>>
>>> Instead of adding such full custom Makefiles, this commit adds a small
>>> piece of code to cross-compile host programs located under the scripts/
>>> directory.
>>>
>>> A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
>>> would also cross-compile scripts/basic/fixdep, which needs to be native
>>> to process the if_changed_dep macro. (This approach may work under some
>>> circumstances; you can execute foreign architecture programs with the
>>> help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
>>> but it would require installing QEMU and libc for that architecture.)
>>>
>>> A trick is to use the external module build (KBUILD_EXTMOD=), which
>>> does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
>>> userspace programs (CONFIG_CC_CAN_LINK=y).
>>>
>>> There are known limitations:
>>>
>>>    - GCC plugins
>>>
>>>      It would possible to rebuild GCC plugins for the target architecture
>>>      by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
>>>      installed, but gcc on the installed system emits
>>>      "cc1: error: incompatible gcc/plugin versions". I did not find a
>>>      solution for this because 'gcc' on a foreign architecture is a
>>>      different compiler after all.
>>>
>>>    - objtool and resolve_btfids
>>>
>>>      These are built by the tools build system. They are not covered by
>>>      the current solution.
>>>
>>> I only tested this with Debian, but it should work for other package
>>> systems as well.
>>>
>>> [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>> ---
>>>
>>>    scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
>>>    1 file changed, 34 insertions(+)
>>>
>>> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
>>> index cc335945dfbc..0b56d3d7b48f 100755
>>> --- a/scripts/package/install-extmod-build
>>> +++ b/scripts/package/install-extmod-build
>>> @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
>>>    	fi
>>>    } | tar -c -f - -T - | tar -xf - -C "${destdir}"
>>> +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
>>> +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
>>> +# the case for package building. It does not cross-compile when CC=clang.
>>> +#
>>> +# This caters to host programs that participate in Kbuild. objtool and
>>> +# resolve_btfids are out of scope.
>>> +if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
>>> +	echo "Rebuilding host programs with ${CC}..."
>>> +
>>> +	cat <<-'EOF' >  "${destdir}/Kbuild"
>>> +	subdir-y := scripts
>>> +	EOF
>>> +
>>> +	# HOSTCXX is not overridden. The C++ compiler is used to build:
>>> +	# - scripts/kconfig/qconf, which is unneeded for external module builds
>>> +	# - GCC plugins, which will not work on the installed system even with
>>> +	#   being rebuilt.
>>> +	#
>>> +	# Use the single-target build to avoid the modpost invocation, which
>>> +	# would overwrite Module.symvers.
>>> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
>>> +
>>> +	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
>>> +	subdir-y := basic
>>> +	hostprogs-always-y := mod/modpost
>>> +	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
>>> +	EOF
>>> +
>>> +	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
>>> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
>>> +
>>> +	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
>>> +fi
>>> +
>>>    find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
>> This patch causes a build error when cross-compiling for RISC-V. I'm using
>> the cross-compiler from https://github.com/riscv-collab/riscv-gnu-toolchain.
>> When trying to build .debs with:
>>
>> make CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv INSTALL_MOD_STRIP=1
>> "KCFLAGS=-mtune=sifive-7-series" LOCALVERSION= bindeb-pkg
>>
>> I get the following error:
>>
>> Rebuilding host programs with riscv64-unknown-linux-gnu-gcc...
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms.o
>>    YACC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.[ch]
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.o
>>    LEX debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.c
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.o
>>    HOSTLD debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/genheaders/genheaders
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/mdp/mdp
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/kallsyms
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sorttable
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/asn1_compiler
>>    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file
>>
>> debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file.c:25:10:
>> fatal error: openssl/opensslv.h: No such file or directory
>>     25 | #include <openssl/opensslv.h>
>>        |          ^~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
> I guess you have openssl/opensslv.h available on your system, do you?  (In
> Debian/Ubuntu package libssl-dev or similar)
>
> Can you natively build a kernel with a similar kernel config?
>
> Kind regards,
> Nicolas

Yes, I have /usr/include/openssl/opensslv.h on my system. But that's the 
x86 version. The cross compiler can't use that.

A native build works fine.

Ron



