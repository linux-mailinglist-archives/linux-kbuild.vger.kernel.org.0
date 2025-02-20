Return-Path: <linux-kbuild+bounces-5840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 797ADA3DDC2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 16:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877AA19C439E
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 15:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A011FE46F;
	Thu, 20 Feb 2025 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SKkVy39R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D211FE46E;
	Thu, 20 Feb 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063839; cv=none; b=FLDHHizseJ8UgJC7QiMItz3tL9OeSFVFMDceDZ4ybUrM8B61WRWTcuF89lWoH8+X6lT19Vixm3wyYvRtv0wQ69y1TvOphlhPoTVu7b+GJCzaKAIx5q4T6Djid/ChqHYbo3NrC654hCD7rbWoPQ/SLSY5p2odC12lRJZlP1bjz3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063839; c=relaxed/simple;
	bh=cfCaXEt/74qT6EZUMBQvgQi08gwx7VLMhdHsBd9X+cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=McrYyvtid7TZlWccyGYbHcyVToUPeb+N07MTMjfvQwOZ6a+I3a4EEf0JNUY7F1HPRGzr0OR9iYcxCubaTpXPCEOkYMrBmBnXqgnyOXxFxEfyCxNVhnUY8RnFWXZrJlfxF0m+8FlODh1xr1m2WUXqlUZbAzWT1D/vluoNHKQuMhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SKkVy39R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7DOI7011714;
	Thu, 20 Feb 2025 15:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kt5qUh08tZEmrDWMdnJaEppHvBHOU5mlUNBrOzRVQg=; b=SKkVy39Ra6w80qUo
	2o1JrbHXx4pZvEvdFiPyLvmfQwIovs84sH2p1aiN5CUIygdi21zZdtHtqnjyRhDA
	EnJA+14krzEa+JnjujlY0OXW3sB+irrJ+Byug/nG6h+B829TRmAKCGxCLUJGlpQm
	TdgRGZC/NY1WxXiEEeBTWVwIkZCBmazNKCvZoIBIuxtINZEhbsieOO2z4Vb+LHdD
	HSLApbdcz8BHgmI9uYqDFalJIqDPI35VJlQt+v+QmGmiD1KXcno/fzdDqTN63MrQ
	RR5aVQtRN978OKMWaoNLskClwDB6CWLZ3Fnd6XX9CG+W7PpleJchaq/a3M06Yz8B
	f+v8zQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3pesd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:03:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KF3YZh032712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:03:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Feb
 2025 07:03:33 -0800
Message-ID: <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
Date: Thu, 20 Feb 2025 08:03:32 -0700
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
        Nicolas Schier <nicolas@fjasle.eu>,
        Ben
 Hutchings <ben@decadent.org.uk>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5BWmlVKLXkZL_GwcHt84WJzQPjy6p-81
X-Proofpoint-GUID: 5BWmlVKLXkZL_GwcHt84WJzQPjy6p-81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200108

On 2/20/2025 3:03 AM, Nicolas Schier wrote:
> On Tue, Feb 18, 2025 at 01:25:38PM -0700, Jeffrey Hugo wrote:
>> On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
>>> Exclude directories and files unnecessary for building external modules:
>>>
>>>    - include/config/  (except include/config/auto.conf)
>>>    - scripts/atomic/
>>>    - scripts/dtc/
>>>    - scripts/kconfig/
>>>    - scripts/mod/mk_elfconfig
>>>    - scripts/package/
>>>    - scripts/unifdef
>>>    - .config
>>
>> Please revert this (the removal of .config).
>>
>> I got some strange reports that our external module install broke, and
>> traced it to this change.  Our external module references the .config
>> because we have different logic for the build depending on if other, related
>> modules are present or not.
>>
>> Also, it looks like this broke DKMS for some configurations, which not only
>> impacts DKMS itself [1] but also downstream projects [2].
>>
>> While DKMS may be updated going forward to avoid this issue, there are
>> plenty of affected version out in the wild.
>>
>> Also, I haven't surveyed every distro, but it looks like Ubuntu still
>> packages the .config with their headers in their upcoming "Plucky" release
>> based on 6.12.  I suspect they wouldn't do that if they didn't feel it was
>> needed/useful.
>>
>> -Jeff
>>
>> [1]: https://github.com/dell/dkms/issues/464
>> [2]: https://github.com/linux-surface/linux-surface/issues/1654
> 
> Hi Jeff,
> 
> do you know the related thread [1]?  According to the last mail, DKMS
> has fixed its issue already in December.

DKMS tip might be fixed, but production versions are in various distros, 
which are not updated.  Therefore actual users are impacted by this.

What happened to the #1 rule of kernel, that we do not break users?

This still needs to be reverted.

-Jeff

> 
> Kind regards,
> Nicolas
> 
> [1]: https://lore.kernel.org/linux-kbuild/CAK7LNARqEOVOzP5vdUVF0KxQBNb9xtYs-COSXXWDMpBzGaLGow@mail.gmail.com/T/#m95f48caf46357a41c1df5e038e227a01ab89dbda


