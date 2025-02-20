Return-Path: <linux-kbuild+bounces-5842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0213A3E0DB
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B919C19C5BDA
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 16:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CC11D5CDB;
	Thu, 20 Feb 2025 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="npLTdfPE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A81F9D9;
	Thu, 20 Feb 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069097; cv=none; b=L4v6aBaaNye3jmNd/P2EJfx3UZDe0u1vLWUZ2DN6RXMUv4rhKebEoiCBJW7nTuM9uudSq5De8UUdF9/ndQ8BDIYr0D4XOrgSYlYtuEh6BBenTwZwrRmSx2D73qkuBAKbr6rQxVMCApfGJwXVeBj+ybVYc+WHibKHCI1Da5i3c1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069097; c=relaxed/simple;
	bh=aO1fE6Qa4s9noNPykyl3TxCiGIfXUe06lR4yXW9Vm8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qnb73SkIlzYYJWfCB1YfSCdyF2d3qgjlZ3Xrb7i6y8i1a9qvcrKT3qMriAPfia5QQxgvInAK7WfL6tgAAT4UIcF9MoUGmMW/uLGRgxPuB7s5OTRmzhZvPqaZ1OPpOg3UOlCJyllUDrs6D5LLBo/tOxQ5A9owVqvbeZ8WIDXcT28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=npLTdfPE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6rtLU001838;
	Thu, 20 Feb 2025 16:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g66dFLA6E+ZqKUxrXVdoNn7XMXRkzvbEwqfO7iaGS5M=; b=npLTdfPEqaI3R/sJ
	JN+2q25q0XVjSxpW1O9LKesrgexioxY9/ZjqBqjC2QOFdrWkQyd7ATQPfTr6PeM0
	dKbv9bNAfpeJN3stMzNPfrxASMAWpnX4glRU0ZlKq38Xs/RY6Z0X5ibre9dpBcpm
	WFkh/1bdlefXPM8rIFcnNrmEaUrd9EwFTb6gwQzQ16EEL6KpIE6bePqJp5gfPpkm
	cpAPuu2EqUEXFXwK7CIFxW7w2LpsJFnGwVvSN70LwGMugvyekpIgzlWfM7B3MLP9
	AjVx4lsEf8Bp4T3vV3gEfgAGZa4P0ipMHL4MJ4n2PrDIGa2z9axRiyGKjxSpZCOI
	8+LIIw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2erbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 16:31:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KGVFjh029958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 16:31:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 08:31:15 -0800
Message-ID: <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
Date: Thu, 20 Feb 2025 09:31:14 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
To: Nicolas Schier <n.schier@avm.de>
CC: Masahiro Yamada <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
        Nathan
 Chancellor <nathan@kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>, <regressions@lists.linux.dev>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
 <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c4qGPsQ4j7RHV5UpELsJ9VOVJP5Dj1ov
X-Proofpoint-GUID: c4qGPsQ4j7RHV5UpELsJ9VOVJP5Dj1ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200115

On 2/20/2025 8:54 AM, Nicolas Schier wrote:
> On Thu, Feb 20, 2025 at 08:03:32AM -0700, Jeffrey Hugo wrote:
>> On 2/20/2025 3:03 AM, Nicolas Schier wrote:
>>> On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
>>>> On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
>>>>> Exclude directories and files unnecessary for building external modules:
>>>>>
>>>>>     - include/config/  (except include/config/auto.conf)
>>>>>     - scripts/atomic/
>>>>>     - scripts/dtc/
>>>>>     - scripts/kconfig/
>>>>>     - scripts/mod/mk_elfconfig
>>>>>     - scripts/package/
>>>>>     - scripts/unifdef
>>>>>     - .config
>>>>
>>>> Please revert this (the removal of .config).
>>>>
>>>> I got some strange reports that our external module install broke, and
>>>> traced it to this change.  Our external module references the .config
>>>> because we have different logic for the build depending on if other, related
>>>> modules are present or not.
>>>>
>>>> Also, it looks like this broke DKMS for some configurations, which not only
>>>> impacts DKMS itself [1] but also downstream projects [2].
>>>>
>>>> While DKMS may be updated going forward to avoid this issue, there are
>>>> plenty of affected version out in the wild.
>>>>
>>>> Also, I haven't surveyed every distro, but it looks like Ubuntu still
>>>> packages the .config with their headers in their upcoming "Plucky" release
>>>> based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
>>>> needed/useful.
>>>>
>>>> -Jeff
>>>>
>>>> [1]: https://github.com/dell/dkms/issues/464
>>>> [2]: https://github.com/linux-surface/linux-surface/issues/1654
>>>
>>> Hi Jeff,
>>>
>>> do you know the related thread [1]?  According to the last mail, DKMS
>>> has fixed its issue already in December.
>>
>> DKMS tip might be fixed, but production versions are in various distros,
>> which are not updated.  Therefore actual users are impacted by this.
>>
>> What happened to the #1 rule of kernel, that we do not break users?
> 
> I think, Masahiro already provided valid and profound reasons for
> keeping it the way it is.  Users of run-time kernel interfaces are not
> affected by the change.  Concretely reported issues were, as far as I
> know, only a matter of specific non-official way to work with .config
> for other reasons than just building external kernel modules in the way
> it is thought to work.

I'm CCing the regressions list, which I probably should have done initially.

I'm pretty sure Linus has indicated that as soon as users start doing 
something, that becomes the "official way".  I believe your response is 
not consistent with the precedent set by Linus.

Quoting from [1]:
It’s a regression if some application or practical use case running fine 
with one Linux kernel works worse or not at all with a newer version 
compiled using a similar configuration. The “no regressions” rule 
forbids this to take place; if it happens by accident, developers that 
caused it are expected to quickly fix the issue."

As far as I understand its not acceptable to force users to change (the 
DKMS fix) or update userspace to work with a new kernel.  You could make 
a change if userspace updated, and all old versions needing the previous 
behavior were phased out of use, but we have 2 reports indicating that 
is not the case.

 From the thread you pointed out, it looks like Masahiro recommends 
${kernel_source_dir}/include/config/auto.conf as a replacement for the 
.config.  Ignoring that such a suggestion seems to violate the 
regressions rule, doing a diff of that and the .config on a 6.11 build 
(before the change we are discussing), there are many changes.  It does 
not look like that is an equivalent replacement.

Are we at an impasse?  Masahiro has not chimed in, which is quite 
disappointing.  So far, I don't think your responses justify why 
breaking users is acceptable.  This is not a security fix - the only 
justification for this change is that .config is not needed, but I argue 
that has been proven false.  It seems like I am not convincing you.

-Jeff

[1]: https://docs.kernel.org/admin-guide/reporting-regressions.html

> Kind regards,
> Nicolas
> 
>> This still needs to be reverted.
>>
>> -Jeff
>>
>>>
>>> Kind regards,
>>> Nicolas
>>>
>>> [1]: https://lore.kernel.org/linux-kbuild/CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com/T/#m95f48caf46357a41c1df5e038e227a01ab89dbda
>>


