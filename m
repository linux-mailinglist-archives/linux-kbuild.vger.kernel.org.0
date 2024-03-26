Return-Path: <linux-kbuild+bounces-1348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DF88D0BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 23:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB341C636F1
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Mar 2024 22:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BA413DBB6;
	Tue, 26 Mar 2024 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BM407ZOB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A831CAAE;
	Tue, 26 Mar 2024 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491930; cv=none; b=CpZHAQhlh2PGKtkwCvEVxoSU8TFPqRGzIImoE5niFeu61+pbmePUjPVPzcCIoAMQ+FR/QJAJkZiVK1J6FTvIw/7sEH+xOHIS6XIXjjkVSs4RGq7duwMc39U9QFR5kzLhNZFoZaADM72Soh2y4mtmVuJtRCfVQynuibJYj/gVV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491930; c=relaxed/simple;
	bh=T6z6AwPpm+KI8OgvOFGvbS/h4SamOgNTVtUPc5eoySM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RxHmjYK3AgFP4P/IUHtqpiiSaY//DDH/A8HZH+2HFwcx4HnVUyGjvojOoXLtLvoYmb5uMM2RpQolZ0y03jnGCVS/XfR0ZEnKBY60BaEyaQCa5wHFySqJI4hTvxvp1BWDIB9r14agZno9s+FaP9fR7vSai32ulAI2Qs3/np2yURQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BM407ZOB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QMAVmN025990;
	Tue, 26 Mar 2024 22:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7g+6PcPKVg9dBthsg8wYq6yK5SWDqP6Bx0+pNtT+H50=; b=BM
	407ZOBQhboSAj1a4Akm7TvGzLz4gfAxQjHTudXlzl+OkanzD8jIN2itm2Dyw+wrE
	6GTG0kiOohpuh/1aV+0BQljLQPqB78yMvQ7ypWpvH3xuFRHidQtjVZuq3gHOo3EI
	+SiT2LoAp5NaFeCjPBGfvGDYACJxai5F7c4WRcq+pqwJkgsfHkL/tDASU0WJHZgv
	Wtq2i6VQ0/snowg27GYp0yHrUzeZ3vNcxBov64NCz7A0jNxDlGRpOYNu4rSheDd/
	w8kYU+yZvXx/P4osDqoy3hF2wY+TzdaUeBVJ2kx7j3l/vCMVHusCWQWj4ssuXac7
	RIlut+hHx6si85v/HyqQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3wt8hj1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 22:25:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QMPDCA016682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 22:25:13 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 15:25:10 -0700
Message-ID: <9b1d6542-0493-b735-8e8a-f60c8ddf2402@quicinc.com>
Date: Tue, 26 Mar 2024 15:25:02 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Rob Clark
	<robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
 <d2670f94-213c-bc82-7ae6-a3668f9721df@quicinc.com>
 <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprmeSqgMNVDw9Z=n4xBhmCtBzTJuSQKzLSg9NyPegYyFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ddlNfH251ZAPN48S89roi0BR3I3IZVYZ
X-Proofpoint-GUID: ddlNfH251ZAPN48S89roi0BR3I3IZVYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260160



On 3/26/2024 2:52 PM, Dmitry Baryshkov wrote:
> On Tue, 26 Mar 2024 at 23:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
>>> In order to stop patching the mdp5 headers, import definitions for the
>>> writeback blocks. This part is extracted from the old Rob's patch.
>>>
>>> Co-developed-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>
>> This is unused today right?
>>
>> Is it just being migrated now in advance as all the mesa mdp5 headers
>> are moving to kernel?
>>
> 
> Exactly. I had three options: pick up this patch, implement applying
> 'fixup' patches or drop corresponding doffests from the mdp5.xml. I've
> chosen the first option.
> 

Yes, this is fine

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
> --
> With best wishes
> Dmitry

