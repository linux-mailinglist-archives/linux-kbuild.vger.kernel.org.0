Return-Path: <linux-kbuild+bounces-1316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537A88A823
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 17:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03F94342CED
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 15:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BD1839EF;
	Mon, 25 Mar 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aq9AGLdx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65155E48;
	Mon, 25 Mar 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711373725; cv=none; b=iTlFAxZjmJ/oSKakFu/hy7ptWF064PWt6gqaz54qilui0arH5FNHG0rg0PHee1wzBO+nsi8ieyMmFp513eTG51zzK68tlbfpmMK13ew1fcm3mq7WQwd3/BEdz/JW7Pid8K5HYdzbcpXUBXaJAWST4Fg6fRNWgcgJlupmWb0pxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711373725; c=relaxed/simple;
	bh=dXaE4rXHY6N+F6xWE/cRVPPsSzA5tCrEfEWKI6CgXXU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUWylZ4JcjrTkKOjnX9BsCZ6vJQF04YQ1LWyLDZmaQytWfH9vcFybMHUQ+nU9usqUNksAM1XnHhPMZko1VZa2cmJWxMhE3LTtzdDAb5QSOK0k0L8sV1gXcJqZOpRyH37HVFTThCsd7pjZnMkxpda2ohdoYip1dqjcZCOPPSEkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aq9AGLdx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PCtmhq020396;
	Mon, 25 Mar 2024 13:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=ZeRPTDxTDApyNrea6CizG
	r2mCGKybF1zlrJX5VcsScQ=; b=aq9AGLdxWcjczvD32in+X4baufb+YY/icZ/jR
	wqiG3CqtVhtWsnylxMsccvb4uksmgj/eOrBsXSz77ye90pFfmsiELMMzPxt67Lyx
	O6/M7pMBMYYmn6GytYo8mG9ziRxWiu99uuwZdSdReUbuBatVW4YiX0zZn21PlWXS
	4XsaPxyGdHsUT6BaFsWg5IzqpB5whTsaIoSz7ZR5WnQCcqbaxiKZzd7FbdIETgaI
	y1LNTAS0d5qkvOWgYxGenavnuipEGMoXwKhSi80wRowfXvCC4+sUs4h5MPZjWVLa
	ixcx5ybAR83tS3Xg58uCBRhJQ8tUT2wWYD6FEwuK0il1tYBGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x34hsrxf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 13:35:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PDZ3r7001388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 13:35:03 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 25 Mar 2024 06:34:59 -0700
Date: Mon, 25 Mar 2024 19:04:55 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/16] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
Message-ID: <20240325133455.6kxvnwg3efvhvre2@hu-akhilpo-hyd.qualcomm.com>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org>
 <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppAsy9a0b4WzqWCaa=-fPYrKOMePo3vsAaJ4Nu3okoL7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJppAsy9a0b4WzqWCaa=-fPYrKOMePo3vsAaJ4Nu3okoL7Q@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AsyQt4ZlAvOSXVN_tF97zAY0DJyfXhYV
X-Proofpoint-GUID: AsyQt4ZlAvOSXVN_tF97zAY0DJyfXhYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=704 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250074

On Sun, Mar 24, 2024 at 01:13:55PM +0200, Dmitry Baryshkov wrote:
> On Sun, 24 Mar 2024 at 11:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Sat, Mar 23, 2024 at 12:56:56AM +0200, Dmitry Baryshkov wrote:
> > > The msm_gpummu.c implementation is used only on A2xx and it is tied to
> > > the A2xx registers. Rename the source file accordingly.
> > >
> >
> > There are very few functions in this file and a2xx_gpu.c is a relatively
> > small source file too. Shall we just move them to a2xx_gpu.c instead of
> > renaming?
> 
> I'd prefer to keep them separate, at least within this series. Let's
> leave that to Rob's discretion.

Sounds good.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> 
> > -Akhil
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                       |  2 +-
> > >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
> > >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
> > >  .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
> > >  drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
> > >  5 files changed, 31 insertions(+), 29 deletions(-)
> 
> 
> -- 
> With best wishes
> Dmitry

