Return-Path: <linux-kbuild+bounces-2032-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1E9011C5
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 15:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC4D1F2138B
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 13:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3759179958;
	Sat,  8 Jun 2024 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E5fo6v7x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24061149DED;
	Sat,  8 Jun 2024 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717855118; cv=none; b=N1it5ztBi98qkk7yjxgfrVsVLD5JEeW6y5unljpbRSvq54jLodgdqnnOtbd0x42VmOeAbAx/3p7khSBWp+o6boZliK2Zf4qqevSEo2tsObiakM1ntgudfuXk2fZKdTCefcnr+xVgKzqKiIl6kINPzpbsWPRbQ+3+aqzKfGMA+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717855118; c=relaxed/simple;
	bh=WFxMcB02VPCEv826IcjjLU67OOC+xk3hVtpZWswnMlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Df7CXBYD9QVVSw+SA9Q2Pqhem7UQrq9EHkX7uyGke7CHoqrVE1sWKoztKYlvYSwYEE2nun65As9lopDvbBsO7HdyutP0o3GGbO1lYsacrLwM19pJ4CFOhhG1IkDsQjhpPdpcsidW0Ivvv7ahiyw95dXvkyuCVob2y4j38ibppSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E5fo6v7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458BrIE0027922;
	Sat, 8 Jun 2024 13:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ccuxzlz/TtSvUeRKW0fKjsascSWz6DGdpcQoNb6MR2c=; b=E5fo6v7xmjdMvdYH
	Iy6ZDMeXfmvwbqnRtNCEXJ6T9erL+yTP80vuhqUlKjDEUzo9Gl2tgR0/hF4Xk510
	Am7oQO6otqhHBlFgGzdLnukJSdY+Kt/5Dthdpy/q4dnAXd2su5eTc8TDXzoCsE+a
	XocIV3Ql/nj1NvvNTNshSeMKFqlrUqE+KUylrj5KFpinTWeR36tckDz+9ZYzKBqB
	VWeP+BgcobfwcEn3Ho9jsvLcHvE31v8WgwHhiDTRCXyuuKjkWm5Wlo1Xj710eHfq
	1rVolmiamN+fzZPClyqiVoc6iZEdEd1mvNrM5fMqwHWGkx56b5/4gXNmfQhEx2y3
	HkFfgA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp78hgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 13:58:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 458DwPsC022378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Jun 2024 13:58:25 GMT
Received: from [10.48.242.196] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Jun 2024
 06:58:24 -0700
Message-ID: <5ef75c6b-07fe-4331-bd34-3ae496e185e7@quicinc.com>
Date: Sat, 8 Jun 2024 06:58:16 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: bypass module description test on vmlinux.o
Content-Language: en-US
To: Nicolas Schier <nicolas@fjasle.eu>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240607-md-scripts-mod-v1-1-d3cd5a024f05@quicinc.com>
 <20240608-certain-potoo-of-agility-cc231c@lindesnes>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240608-certain-potoo-of-agility-cc231c@lindesnes>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t8W0ewLS1SLvBoqWSegbN-RzMygTt5iP
X-Proofpoint-ORIG-GUID: t8W0ewLS1SLvBoqWSegbN-RzMygTt5iP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_07,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=696 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406080105

On 6/8/2024 1:25 AM, Nicolas Schier wrote:
> On Fri, Jun 07, 2024 at 02:42:43PM -0700, Jeff Johnson wrote:
>> When building modules with W=1, modpost will warn if a module is
>> missing a MODULE_DESCRIPTION. Unfortunately, it also performs this
>> test on vmlinux.o:
>>
>> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>>
>> Relocate the logic so that the test is not performed on vmlinux.o.
>>
>> Fixes: 1fffe7a34c89 ("script: modpost: emit a warning when the description is missing")
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
> 
> Hi Jeff,
> 
> you're a few hours too late:
> https://lore.kernel.org/linux-kbuild/20240606183921.1128911-1-masahiroy@kernel.org/
> 

:)

