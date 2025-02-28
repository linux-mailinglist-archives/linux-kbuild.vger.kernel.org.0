Return-Path: <linux-kbuild+bounces-5934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E59A4A5A5
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2025 23:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E23D1762EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2025 22:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958FB1DED64;
	Fri, 28 Feb 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UjkH4cOW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD11DED69;
	Fri, 28 Feb 2025 22:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740780281; cv=none; b=JvQCm1YKSbodrhZhBWMJl+2QDtjuGb7rCpBi4kHSoxtawH5MYHS6WYuAbQlFEbg/Wkx3v8RBdph5ztrqqb1t+b75SDooUjhHik45Lre1/U/h/P4iVvhP2S5DSrA8/hRqxvt/brF4onyJ7UVXoFkuV3eARpoSBi/JVjyB5Xk6P9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740780281; c=relaxed/simple;
	bh=MUQDoNVnstDnVvNKgrw8EpXiQXdM6PLiArpkYlRqEQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gwJaQbEPz6Y4t2eWAEJFdRFym88I4aJzDgI1KZ5AkfkHlIns/LIZTqqI6ZLxrGS7ZPPDiwPDD9/efU+CzZFv1ZAL+MPj2h5V9JKrU8b5B1E0MkytflYTuHsNuciBHdvxOPeygNcfKow/17lMxxYmWppbfT74iWzTL+QeAnJJniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UjkH4cOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SKVQ4t013251;
	Fri, 28 Feb 2025 22:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWhfMrvpOJB0f+bCrEQzkQMytTCPf8D+9gtOL19wckY=; b=UjkH4cOWzU2ZRekg
	qmJC2+jj40zJg6wsXewkrIGcH0C/fRAVP8ey+qKiqU/P0BoCRVwKY0296mICiN4F
	+iIBGQTp9zkL03bw1mBECwt31XxJXLdRA1HQkQZ7EQOHvK4Lhn9kBeeCeuXEZZPb
	BBS7Z4YrJPsc2plgR9ge3ij0BmSGqshdeY8xljVciKjByHuRUJ1xuFbi+4RvX7XJ
	CJrPvxmPug/F9otcz+vrWzwYqpdVWepBYS58lRtlilfX7eFglek8350BoZlgwcZg
	70kHVmffrwSEidhKMRy/2eRlvWqOdEX+GomtQ/NUDjV8Xns0Btt3w2a40KEmnGBO
	DcJF6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453m8ng53q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 22:04:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SM4JFr001656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 22:04:19 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 14:04:19 -0800
Message-ID: <8bfa88b3-484e-4933-bc59-9dc12e37e691@quicinc.com>
Date: Fri, 28 Feb 2025 15:04:18 -0700
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
 <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
 <2025022057-reclusive-overreach-ac89@gregkh>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <2025022057-reclusive-overreach-ac89@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P-AYYjMP0kf1tSQwQK5iwcQT9IgwroBt
X-Proofpoint-GUID: P-AYYjMP0kf1tSQwQK5iwcQT9IgwroBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280160

On 2/20/2025 10:43 AM, Greg KH wrote:
> On Thu, Feb 20, 2025 at 10:24:32AM -0700, Jeffrey Hugo wrote:
>> On 2/20/2025 9:49 AM, Greg KH wrote:
>>> What do you need/want to parse the .config file in the first place?  Why
>>> not rely on the generated .h files instead as those can be parsed the
>>> same way as before, right?
>>
>> Two usecases -
>>
>> First when secure boot is enabled, DKMS looks for CONFIG_MODULE_SIG_HASH to
>> figure out signing the modules so that they can be loaded.  Removing .config
>> causes an error in DKMS and the module signing process will fail.  The
>> resulting modules (already compiled successfully) will fail to load.
>> Whatever the user needed those modules for will no longer work.
> 
> Shouldn't the "normal" kbuild process properly sign the module if it
> needs to be signed?  Or are you trying to do this "by hand"?
> 
>> If the user is on Ubuntu, and has built a kernel 6.12 or later, they need to
>> build upstream DKMS and use it as none of the Canonical provided DKMS builds
>> have the fix.  This feels like a situation that would make the user afraid
>> to upgrade their kernel (to your point above).
>>
>> This feels very much like an "at runtime" issue, assuming external modules
>> are supported.  I may be wrong here.
> 
> external modules can be broken at any moment in time, you know that.
> There's never a guarantee for that at all.
> 
>> Second, our usecase is that we look at the .config to tell if a particular
>> driver is included in the kernel build (config =y or =m). This driver
>> provides diagnostic information which is useful to our product, but not
>> required for operation.  It does not have headers that are exposed to the
>> rest of the kernel, so checking the generated .h files does not work.  If
>> the driver is not built, we provide a backported version that is then built
>> out of tree.
> 
> You can check the same .h files for those config options, no need to
> manually parse a .config file.  What's wrong with including
> include/generated/autoconf.h properly?  That's what the build system
> uses, right?

I can't check .h files that don't exist.

However, I think your viewpoint is coming through pretty clear - we'll 
fix up what we can in our control, and I guess anything else gets 
dropped on the floor.  Seems like I have a conclusion.

-Jeff

