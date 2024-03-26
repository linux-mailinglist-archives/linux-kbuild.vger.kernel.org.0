Return-Path: <linux-kbuild+bounces-1347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2B88D0A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 23:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55B51C2FFA5
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE4C13DB88;
	Tue, 26 Mar 2024 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M3dwunM9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1D173;
	Tue, 26 Mar 2024 22:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491590; cv=none; b=ELmAPgzCybjoshmT5aXVDFHjpMYSbHEAzldbbzcVYqZVxN6pSZfiXHEVolie/eLNELumas6a+k0GNxOXHWC3a1rXD529oCYQhuSLCtkTjmAAfz2myIU4kPKgEJLIIQ9h0EAkXgySiLCGGB/er4jTtmdeJRJiSf+se6lA2ci33vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491590; c=relaxed/simple;
	bh=e0wXVTKPjfF8xvFP/dTcmKbPQuKDM+c6dXMdR3gPEwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mvuxpwXDdtagYzdSCkfCTk4rvklzm70l5f6K1+hx24JAwdgjmeM7zfco72aFyl/BnJ0Sh8tuxzOvIGfHaJ+yV5WDExtG8w17NnZvtJuSIcifCML/UrrQIVZpmVkheo50zJobxAJDlwXRvP2/6CvF9ZVgu01qms395/EfQ2e2XGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M3dwunM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QMBilY006721;
	Tue, 26 Mar 2024 22:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=v/h8fn+ezmmVCUczdMEJ+P7+lSq+OzxeYrR2eeze/Qs=; b=M3
	dwunM9KvVp2lUsbHhwYCRKZB+2f7urn9ON+PgFkO44rSuY17kqHSt1Bj9XO42o1K
	wVo8p52RzAGcNriQRwrxAXiE0aVQldXdXS8datCkI8U+uWyZCuI0YwBL44vFITSm
	zGeBIbDlgqCXqlEbUJ+n7C2LJCGwGua9DUDvJJ/LRmmFxDYiubgny1dEsFQRK6em
	nv+cE0oqaI557AXpj8fl4A59Zzfj9ZzeBs3pj5EkoFcvY/V6JPMYeFsi2X8AfwGQ
	XmarEDjQUk9cDiNTqUbRkRpAzvylAc1J212MGUM+i4g6z0fJC9sTZsVXcnCFSviv
	cBInGUiclI5zTaKrA5bQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3w1h9qch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 22:19:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QMJVrF011126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 22:19:31 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 15:19:28 -0700
Message-ID: <510de518-da75-f0c4-479d-c5f95c7c72b6@quicinc.com>
Date: Tue, 26 Mar 2024 15:19:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 09/16] drm/msm: import gen_header.py script from Mesa
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
 <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-9-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wT24LDR8rBdvp_3-w7Z2S5PA9O97t9hy
X-Proofpoint-ORIG-GUID: wT24LDR8rBdvp_3-w7Z2S5PA9O97t9hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260159



On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> Import the gen_headers.py script from Mesa, commit FIXME. This script
> will be used to generate MSM register files on the fly during
> compilation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py | 957 ++++++++++++++++++++++++++++
>   1 file changed, 957 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> new file mode 100644
> index 000000000000..ae39b7e6cde8
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -0,0 +1,957 @@
> +#!/usr/bin/python3
> +

We need a licence and copyright here.

Also is something like a "based on" applicable here?

<snip>

> +import xml.parsers.expat
> +import sys
> +import os
> +import collections
> +import argparse
> +import time
> +import datetime
> +
> +class Error(Exception):
> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> +http://gitlab.freedesktop.org/mesa/mesa/
> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> +
> +The rules-ng-ng source files this header was generated from are:

Is this still applicable ?

Now gen_header.py is moved to kernel.


