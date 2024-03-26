Return-Path: <linux-kbuild+bounces-1345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3C88D048
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4981F81A9F
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 21:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF6413D885;
	Tue, 26 Mar 2024 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MU8ZBJWV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C61173;
	Tue, 26 Mar 2024 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711489495; cv=none; b=QRix6ivF0QxezuBuHbdNWC66nyb3FQ/BcOqnx01g+pvyQjwdkA3KPkyp3yXQmGytvrpmh3Ut0mzHoz2ndgdWt5fp3Kk3EysdtdQiFE69ttiktKqzlG9PeGEkG/bRuyGmVvzDNqfvdKgoijHniyhidNluxZ8ZkyHFlTiF9zvNAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711489495; c=relaxed/simple;
	bh=5QEmV1wRpgEdWulKSxQ7qqQ8WnqYdPhjMauVEmnhVxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cFEaL/wbuU6SSVBAbuYw0cP+1MGsH9o1rtQMVHEcK5TpYvDlN0F+sUDg487t5g9NJedraoYGhj7nqLjf1YnN1jW+VBAX+1epWzlVoGA8/NVjFH5OBNmvrdmaSv/3xG5sW2maqBKE3SBpAL7Gak9z+QC/9AA/g3w2gLd787OKLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MU8ZBJWV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QIggQP001165;
	Tue, 26 Mar 2024 21:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ibga8IhzZtvB4MdcpifkU9QjegJ9QLS82Ilvt9YFZUM=; b=MU
	8ZBJWVqbrovN4FJVwrgozhG8g58UXLmcFwqDtTv583O6oP5hzCWRETBvgW5nKVvN
	x+xXLn2nuJiEXMo1GwzYv9z5zHSiwjdIBYK92yjIVfYFrL8euNWSBDuYvT6s3hFj
	82dCR6VNg2YOQWawa2fUeagh5BHofteNQNc1hVRIETAh95OfwC9rEiGOPyEpimsf
	Gc8cbPMczNIlsflcrmANrU7ulSS6pA6s2b0VxbINIyN6dj4DYVJA2DS/JbeiWYTJ
	XT/ZkhGfqJb2bjl+fg6LqfrnyNhb9VWTaOeE7xTvvFWsNK7H7sm4YtDy3fUG9XVw
	gsm2nLyBpFngJ+8ML9jg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3w1h9njk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 21:44:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QLibsY003666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 21:44:37 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 14:44:34 -0700
Message-ID: <33ea1ad9-e1af-b3f4-66e1-d2b88566158a@quicinc.com>
Date: Tue, 26 Mar 2024 14:44:33 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 03/16] drm/msm/dsi: drop mmss_cc.xml.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Masahiro Yamada
	<masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier
	<nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-3-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-3-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8y6KAnld2D4U7a_nq30euMFjUVM0s22B
X-Proofpoint-ORIG-GUID: 8y6KAnld2D4U7a_nq30euMFjUVM0s22B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=782 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260156



On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> The mmss_cc.xml.h file describes bits of the MMSS clock controller on
> APQ8064 / MSM8960 platforms. They are not used by the driver and do not
> belong to the DRM MSM driver. Drop the file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/mmss_cc.xml.h | 131 ----------------------------------
>   1 file changed, 131 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

