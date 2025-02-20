Return-Path: <linux-kbuild+bounces-5844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F3A3E262
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 18:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B88188D19D
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D98212D97;
	Thu, 20 Feb 2025 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ULt7bKc8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB1212FAB;
	Thu, 20 Feb 2025 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072295; cv=none; b=FuCpI8B7LJfKGE7JbEZGxp8b/sq3rKPtbrIAkAVna5KJ7tG5e7Z4oeOK+T/q67TPifwYx3oJn9VQSAdZ+aRoFh49f+aZ9/u8ETAEyJs6UbAJIsghj9ydfZPaYkl2hGOEZHMrzLnroQsAgjDn4lYZQuaQNvuf+53kIAMBxBpLS8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072295; c=relaxed/simple;
	bh=V3GmBcN8YE8IHVrrXD6nC9PTliXoW8/RyWlVeLRfJ6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cA2137isUjEHRzkveD9NCblX+rgcgIdEQjpS9t+CU8b1lqtFSCSIWGzpfLSLM2QW7qR9zjjZacGpIJK4gN2Wr6SOu0uBROENwDMpOlhoLahP4+haAigugt1rAf/kh+ou49tGpJlNedHIfwmJSL0urVqXvG1RrW1081T2GpY06Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ULt7bKc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KFX7E6011183;
	Thu, 20 Feb 2025 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAGKZ5JANWIeNTajjuONb7IEuwa0lhGS00SbVblForI=; b=ULt7bKc8DzLoalNy
	JdALeHPomDnBZGUSNgnwK/WUlC2Zlx75yFiwDx0+Ba4wuMkgFzbhP7AAAZjOQqkg
	tc0RP/b5uhQC4VpwPYIP4K+CYUOu8q5ti6V8RLF8xroc/oxHZu0cQPRAMCCzASFA
	kcg9BxdPz+7tw+ZkgyBipd/FeOSAnLGeWtuot4AvQ/PzNn1/EFySWYU6JRQ+K6TY
	et/tmJ4mISAHcodSja2/hx+JcumTqZiHxsxu8YQv9kCgJR6gkVEnFnjp4BwdXpb2
	jQa55ACb341hlqS1YA2vgc1P0vkIdXlWGvi6f9rrxW2Yz0ieSV7JJ1KC5ZTJD1bv
	Cry8Tg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1xxxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:24:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KHOY3P021133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:24:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 09:24:33 -0800
Message-ID: <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
Date: Thu, 20 Feb 2025 10:24:32 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
To: Greg KH <gregkh@linuxfoundation.org>
CC: Nicolas Schier <n.schier@avm.de>, Masahiro Yamada <masahiroy@kernel.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kees Cook
	<kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Ben Hutchings
	<ben@decadent.org.uk>, <regressions@lists.linux.dev>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
 <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
 <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
 <2025022020-armband-clock-69af@gregkh>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <2025022020-armband-clock-69af@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bBtmwgokvliz69lGfhsNu5aPHIGYoAnB
X-Proofpoint-ORIG-GUID: bBtmwgokvliz69lGfhsNu5aPHIGYoAnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200121

On 2/20/2025 9:49 AM, Greg KH wrote:
> On Thu, Feb 20, 2025 at 09:31:14AM -0700, Jeffrey Hugo wrote:
>> On 2/20/2025 8:54 AM, Nicolas Schier wrote:
>>> On Thu, Feb 20, 2025 at 08:03:32AM -0700, Jeffrey Hugo wrote:
>>>> On 2/20/2025 3:03 AM, Nicolas Schier wrote:
>>>>> On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
>>>>>> On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
>>>>>>> Exclude directories and files unnecessary for building external modules:
>>>>>>>
>>>>>>>      - include/config/  (except include/config/auto.conf)
>>>>>>>      - scripts/atomic/
>>>>>>>      - scripts/dtc/
>>>>>>>      - scripts/kconfig/
>>>>>>>      - scripts/mod/mk_elfconfig
>>>>>>>      - scripts/package/
>>>>>>>      - scripts/unifdef
>>>>>>>      - .config
>>>>>>
>>>>>> Please revert this (the removal of .config).
>>>>>>
>>>>>> I got some strange reports that our external module install broke, and
>>>>>> traced it to this change.  Our external module references the .config
>>>>>> because we have different logic for the build depending on if other, related
>>>>>> modules are present or not.
>>>>>>
>>>>>> Also, it looks like this broke DKMS for some configurations, which not only
>>>>>> impacts DKMS itself [1] but also downstream projects [2].
>>>>>>
>>>>>> While DKMS may be updated going forward to avoid this issue, there are
>>>>>> plenty of affected version out in the wild.
>>>>>>
>>>>>> Also, I haven't surveyed every distro, but it looks like Ubuntu still
>>>>>> packages the .config with their headers in their upcoming "Plucky" release
>>>>>> based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
>>>>>> needed/useful.
>>>>>>
>>>>>> -Jeff
>>>>>>
>>>>>> [1]: https://github.com/dell/dkms/issues/464
>>>>>> [2]: https://github.com/linux-surface/linux-surface/issues/1654
>>>>>
>>>>> Hi Jeff,
>>>>>
>>>>> do you know the related thread [1]?  According to the last mail, DKMS
>>>>> has fixed its issue already in December.
>>>>
>>>> DKMS tip might be fixed, but production versions are in various distros,
>>>> which are not updated.  Therefore actual users are impacted by this.
>>>>
>>>> What happened to the #1 rule of kernel, that we do not break users?
>>>
>>> I think, Masahiro already provided valid and profound reasons for
>>> keeping it the way it is.  Users of run-time kernel interfaces are not
>>> affected by the change.  Concretely reported issues were, as far as I
>>> know, only a matter of specific non-official way to work with .config
>>> for other reasons than just building external kernel modules in the way
>>> it is thought to work.
>>
>> I'm CCing the regressions list, which I probably should have done initially.
>>
>> I'm pretty sure Linus has indicated that as soon as users start doing
>> something, that becomes the "official way".  I believe your response is not
>> consistent with the precedent set by Linus.
>>
>> Quoting from [1]:
>> It’s a regression if some application or practical use case running fine
>> with one Linux kernel works worse or not at all with a newer version
>> compiled using a similar configuration. The “no regressions” rule forbids
>> this to take place; if it happens by accident, developers that caused it are
>> expected to quickly fix the issue."
> 
> Regressions are at runtime, not with how external tools poke around in
> kernel source trees and try to make decisions.  If we were to never be
> able to change our source just because there might be an external user
> that we don't know of, that would be crazy.

As a kernel developer, I get this.  The MAX_ORDER thing from a few 
versions ago seemed to make this a grey area.  Perhaps it a case by case 
thing.  In which case, what is the harm in sharing the kernel's .config 
which has been a thing since I started kernel development back in the 
2.6.X times?

> We want users to not be afraid to upgrade their kernel, that has nothing
> to do with how the kernel build is interacted with external stuff.
 > >> As far as I understand its not acceptable to force users to change 
(the DKMS
>> fix) or update userspace to work with a new kernel.  You could make a change
>> if userspace updated, and all old versions needing the previous behavior
>> were phased out of use, but we have 2 reports indicating that is not the
>> case.
> 
> You are attempting to build kernel modules outside of the kernel tree,
> and as such, have to adapt to things when they change.  That's always
> been the case, you've had to change things many times over the years,
> right?

While true, its possible to build an external module against 6.11 and 
6.12 and still hit a failure because of this change (see below about DKMS).

> 
>>  From the thread you pointed out, it looks like Masahiro recommends
>> ${kernel_source_dir}/include/config/auto.conf as a replacement for the
>> .config.  Ignoring that such a suggestion seems to violate the regressions
>> rule, doing a diff of that and the .config on a 6.11 build (before the
>> change we are discussing), there are many changes.  It does not look like
>> that is an equivalent replacement.
> 
> What do you need/want to parse the .config file in the first place?  Why
> not rely on the generated .h files instead as those can be parsed the
> same way as before, right?

Two usecases -

First when secure boot is enabled, DKMS looks for CONFIG_MODULE_SIG_HASH 
to figure out signing the modules so that they can be loaded.  Removing 
.config causes an error in DKMS and the module signing process will 
fail.  The resulting modules (already compiled successfully) will fail 
to load.  Whatever the user needed those modules for will no longer work.

If the user is on Ubuntu, and has built a kernel 6.12 or later, they 
need to build upstream DKMS and use it as none of the Canonical provided 
DKMS builds have the fix.  This feels like a situation that would make 
the user afraid to upgrade their kernel (to your point above).

This feels very much like an "at runtime" issue, assuming external 
modules are supported.  I may be wrong here.

I'm not a DKMS developer, but I do use it, and find it extremely handy 
to take latest upstream code and apply it older kernels that customers 
seem to want to use.

Second, our usecase is that we look at the .config to tell if a 
particular driver is included in the kernel build (config =y or =m). 
This driver provides diagnostic information which is useful to our 
product, but not required for operation.  It does not have headers that 
are exposed to the rest of the kernel, so checking the generated .h 
files does not work.  If the driver is not built, we provide a 
backported version that is then built out of tree.

I can, with effort, extend the logic to first look for a .config (since 
the distros provide that), and if not, then look for the auto.conf 
(assuming that doesn't get determined to be not useful) to kick off our 
logic.  We'd still face the DKMS issue above so my preference would be a 
revert since it addresses both problems.

-Jeff




