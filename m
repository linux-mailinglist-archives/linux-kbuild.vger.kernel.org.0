Return-Path: <linux-kbuild+bounces-5835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56892A3A923
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 21:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0A8E3A93E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 20:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE611EB1B6;
	Tue, 18 Feb 2025 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KkdB3XAL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C01EB1B0;
	Tue, 18 Feb 2025 20:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910359; cv=none; b=MryMI2cCahhQN57o6k7H7YH7YVpeCLs4A/kOzLwgeGP5sbj+gpr/6SaTMC5i9jrvJhtD1463AChBzi4rLTAIePh1/9lxzteMc06g5qmiWK0UHHbLTRm91PvocSF6o8M0M5hpZRcc/qoECDjd3XESkG7K0mual5GljWK6G+kjXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910359; c=relaxed/simple;
	bh=9IUfkYYejgzYqaILdxndHszsbEAz7eKvYdVVZCcUKtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hYHfGY9Q1cSENWhYV+1MSynFG5yYGZIMJjGIiCF7mRf9H9RD2hGrcVFmyb0K9UkSu9eSCVJpWTU6h8A2WPRkvDG0zkt5jVKwv7WOZ6+UMjjg1upDFFvK9+D/E0+cDMddv4SEdMkBmBCgcKQ9fFU4KAAlrTQTA6ASymN82mutzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KkdB3XAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwLAc014993;
	Tue, 18 Feb 2025 20:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbintQ10k3gaAfsoEtml4GPxRMtrtT4KCwA9NwsAfgw=; b=KkdB3XALGA7Fv65j
	1YtvGRTvtISofMA88kCcatAXJ4lPS2qmR7MyYEd+oA1fJ4+7SReJNFSAMt9oJytj
	aVCSXEWaG2LdV8QvcRpcKudpnbyEhvPEIzZwMXTmCBfQm/sAjhMbM2UA8BN2jU4a
	hVk+baI35/OrogM7ftGk9mnrOA1y8KDB3jTXGKDtOx1xiKLJDi/GKN+XMRApMzXN
	t+7oHkR969s1VTrWMdDwcA6bzlBoFn/Po68dzWzTJsZGJVm8qqm8JOY2h0RW25db
	8kqDnqukvcJLnY6i0nZydSaoLavGhAf1NW3YQj9zDfRUwYrdv9q7XVprEDtA/L0L
	/ePqQw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy106nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 20:25:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IKPdfe002295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 20:25:39 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 12:25:39 -0800
Message-ID: <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
Date: Tue, 18 Feb 2025 13:25:38 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
        Nathan
 Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Ben
 Hutchings <ben@decadent.org.uk>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240727074526.1771247-4-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6K0e3kPgCKMQGaIOtOscn-GlU9SZ47QA
X-Proofpoint-ORIG-GUID: 6K0e3kPgCKMQGaIOtOscn-GlU9SZ47QA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_09,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 mlxlogscore=983 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502180139

On 7/27/2024 1:42 AM, Masahiro Yamada wrote:
> Exclude directories and files unnecessary for building external modules:
> 
>   - include/config/  (except include/config/auto.conf)
>   - scripts/atomic/
>   - scripts/dtc/
>   - scripts/kconfig/
>   - scripts/mod/mk_elfconfig
>   - scripts/package/
>   - scripts/unifdef
>   - .config

Please revert this (the removal of .config).

I got some strange reports that our external module install broke, and 
traced it to this change.  Our external module references the .config 
because we have different logic for the build depending on if other, 
related modules are present or not.

Also, it looks like this broke DKMS for some configurations, which not 
only impacts DKMS itself [1] but also downstream projects [2].

While DKMS may be updated going forward to avoid this issue, there are 
plenty of affected version out in the wild.

Also, I haven't surveyed every distro, but it looks like Ubuntu still 
packages the .config with their headers in their upcoming "Plucky" 
release based on 6.12.  I suspect they wouldn't do that if they didn't 
feel it was needed/useful.

-Jeff

[1]: https://github.com/dell/dkms/issues/464
[2]: https://github.com/linux-surface/linux-surface/issues/1654

