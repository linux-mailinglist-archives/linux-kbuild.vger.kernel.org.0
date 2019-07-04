Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFBDA5FDC7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 22:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfGDU2r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 16:28:47 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:62709 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfGDU2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 16:28:46 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hj8LT-0004wr-Tl from Cedric_Hombourger@mentor.com ; Thu, 04 Jul 2019 13:28:43 -0700
Received: from [172.30.65.44] (137.202.0.90) by svr-ies-mbx-02.mgc.mentorg.com
 (139.181.222.2) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Thu, 4 Jul
 2019 21:28:39 +0100
Subject: Re: [PATCH v2] builddeb: generate multi-arch friendly linux-libc-dev
 package
To:     Ben Hutchings <ben@decadent.org.uk>
CC:     <yamada.masahiro@socionext.com>, <isar-users@googlegroups.com>,
        <michal.lkml@markovi.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <riku.voipio@linaro.org>
References: <0ff3202ced2b501d6045157f1c7b50810c0571e5.camel@decadent.org.uk>
 <1562269332-132-1-git-send-email-Cedric_Hombourger@mentor.com>
 <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
From:   Cedric Hombourger <cedric_hombourger@mentor.com>
Message-ID: <e0df3b8d-0e8f-2bf6-2e43-633f40fb5f55@mentor.com>
Date:   Thu, 4 Jul 2019 22:28:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Greetings,

On 7/4/2019 9:49 PM, Ben Hutchings wrote:
> On Thu, 2019-07-04 at 21:42 +0200, Cedric Hombourger wrote:
>> Debian-based distributions place libc header files in a machine
>> specific directory (/usr/include/<libc-machine>) instead of
>> /usr/include/asm to support installation of the linux-libc-dev
>> package from multiple architectures. Move headers installed by
>> "make headers_install" accordingly using Debian's tuple from
>> dpkg-architecture.
>>
>> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
>> Reviewed-by: Henning Schild <henning.schild@siemens.com>
>> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> I haven't reviewed this version of the patch.

Sorry about that. it was just an awkward way to note your contribution 
to this changeset (for the avoidance of doubt, your feedback is greatly 
appreciated). I'll remove this line for v3

> And this doesn't make a multi-arch package; you will have to add a
> field to the package's control file too.

Will do. Thanks!

Cedric

> Ben.
>
>> ---
>>   scripts/package/builddeb | 8 ++++++++
>>   scripts/package/mkdebian | 4 ++--
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index b03dd56a4782..15a034e18c37 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -132,6 +132,14 @@ fi
>>   if [ "$ARCH" != "um" ]; then
>>   	$MAKE -f $srctree/Makefile headers_check
>>   	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
>> +	if [ -n "$debarch" ]; then
>> +		# move asm headers to /usr/include/<libc-machine>/asm to match the structure
>> +		# used by Debian-based distros (to support multi-arch) but only if ARCH was
>> +		# translated to Debian's (debarch) - this is done by mkdebian
>> +		host_arch=$(dpkg-architecture -a$debarch -qDEB_HOST_MULTIARCH)
>> +		mkdir $libc_headers_dir/usr/include/$host_arch
>> +		mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$host_arch/
>> +	fi
>>   fi
>>   
>>   # Install the maintainer scripts
>> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
>> index 8351584cb24e..8ebcb7d67fd2 100755
>> --- a/scripts/package/mkdebian
>> +++ b/scripts/package/mkdebian
>> @@ -212,11 +212,11 @@ cat <<EOF > debian/rules
>>   srctree ?= .
>>   
>>   build:
>> -	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
>> +	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} debarch=${debarch} \
>>   	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile
>>   
>>   binary-arch:
>> -	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
>> +	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} debarch=${debarch} \
>>   	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
>>   
>>   clean:
