Return-Path: <linux-kbuild+bounces-4209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEF9A5766
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 00:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A12F281D70
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Oct 2024 22:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1DC198E79;
	Sun, 20 Oct 2024 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="G30yqef8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339AF197A81
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Oct 2024 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729465056; cv=none; b=m0ihkt5aa4pFRbuudwl02cnIOem6P30+ee2AWFe+fPctu7vtOH3oltQsGS8Swh5EpgRaKuZPjpYapRHkG69CT6f59qhk4cy/ddY/9ce0QiHBGDuD3yIBVE3r4Ik2UF3iGwVz41GTh/r5eHGuzwrFtcawtoGLUaWvi8L8q45EwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729465056; c=relaxed/simple;
	bh=0+R9M0CpieGkne/gcdb/HaD48CMKqgqpHAjXV9Gr7qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9MdypWIRuHSF/6bCAVi9o5AT7Yp2u19mObglWVmFwWM4QpxU6uqb/W/l8tCpefvwukAE3sT5bArsP+O/lvnHuDbnkUi1QBGjmCV8H9iPBEBgazRnFbjPyF9+7mOkgkq/E0ZUm3zGF/kKg3uYZjUjR7G3FmVDhls3404UXpVBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=G30yqef8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1BCFC2C04C6;
	Mon, 21 Oct 2024 11:57:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729465044;
	bh=wlgnVORc8VmazlIHF0M6sTSdf4wJFTiEPBgMRnw7cOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G30yqef8372lehEvTvIqdLZT8J1VFk1wmO4MEQHfSyZy1qi36MCW0KqwebQmYmA5G
	 LD9s3yjyolxFToWOVc/VItCoRSpljqMQnTz2uYmHpCT9R8wRA60Rc3jBBS29XBhcPa
	 GpV04nqgSAcSnSG+xhMwe8PSxLv7sw/2+wxcL68as+ARfcU70/x1WmKsGXPd9tEx0y
	 J97nYI2XF/nZvFBAjOth3takGxnihayU6ke4Mz1f3lQPRedxsibgaqOUFCmGAYoJra
	 2SfUvA2SOWHZYAN8DJxXMNzJQIm3N3raRvc4/J7xxXNm5yZZGGxXTVuLsA388rWmWO
	 M6VjaY/q27V3g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67158ad40000>; Mon, 21 Oct 2024 11:57:24 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 062EC13ED7B;
	Mon, 21 Oct 2024 11:57:24 +1300 (NZDT)
Message-ID: <bca44b71-d002-4dac-8c53-6b7dd90ffce1@alliedtelesis.co.nz>
Date: Mon, 21 Oct 2024 11:57:23 +1300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] kbuild: Restore the ability to build out of tree dtbs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz>
 <CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67158ad4 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=nLVBVlUmovVwbiQ-:21 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=pVO9QfLW94fXXyuqY9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

+cc devicetree

Hi Masahiro,

On 19/10/24 00:19, Masahiro Yamada wrote:
> On Thu, Oct 17, 2024 at 4:59=E2=80=AFAM Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
>> A build pattern to handle out of tree dtbs is to copy the .dts file in=
to
>> the kernel source tree and run `make myboard.dtb`. This is supported b=
y
>> the wildcard %.dtb rule in the Makefile but recent changes to split th=
e
>> dtb handling out of scripts/Makefile.build stopped this from working.
>> Restore this functionality by looking for .dtb in $(MAKECMDGOALS) as
>> well as $(targets).
>>
>> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scrip=
ts/Makefile.dtbs")
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
> This is not a use-case in upstream.
>
> If you drop-in your downstream DT to the kernel tree,
> you need to associate it with Makefile.

I agree that this is Hyrum's Law at work.=C2=A0 I still feel that handlin=
g=20
out-of-tree dtbs is something that would be in the best interest of the=20
Linux kernel. It doesn't necessarily need to be done by allowing copying=20
arbitrary .dts files into the tree, a mechanism like the way out of tree=20
kernel modules are handled would be workable.

Often supporting a new hardware platform is just a matter of writing a=20
dts that describes the board. Particularly when that board is based on=20
an existing one. The way most dts/dtsi files are arranged in-tree=20
requires a non trivial amount of handling by the C processor. So while=20
one could produce a dtb file by invoking cc -E and dtc with the right=20
options pointing at the right paths, having the kernel build system=20
provide something that abstracts that would be beneficial for developers=20
and even end users.

>> Notes:
>>      Changes in v2:
>>      - keep $(target) and search for .dtb in $(MAKECMDGOALS)
>>
>>   scripts/Makefile.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 8f423a1faf50..78763a4bc58a 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -449,7 +449,7 @@ ifneq ($(userprogs),)
>>   include $(srctree)/scripts/Makefile.userprogs
>>   endif
>>
>> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o=
,$(targets)),)
>> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o=
,$(targets))$(filter %.dtb,$(MAKECMDGOALS)),)
>>   include $(srctree)/scripts/Makefile.dtbs
>>   endif
>>
>> --
>> 2.47.0
>>
>>
>
> --
> Best Regards
> Masahiro Yamada

