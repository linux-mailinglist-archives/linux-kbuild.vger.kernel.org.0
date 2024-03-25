Return-Path: <linux-kbuild+bounces-1315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A588A7E8
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 16:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8F11C3D9B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Mar 2024 15:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEAF83A01;
	Mon, 25 Mar 2024 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cH3mMgMQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A882D8A;
	Mon, 25 Mar 2024 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711373609; cv=none; b=BZEuUItvyVecEfydJXSpnEq6iNXkZrU+0sLoMCRrp6pxsiGXfgbYjAMkEq7sNFgF8qaV4IKosvFwvDjo8502xkOfNHBW20FPjlEZxdRBzzExU+Pk0d1jHk893ZFrvK0rvajeqH9ChlRzpR61M+ESkPE73ekVKOu1pphjCpt+f7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711373609; c=relaxed/simple;
	bh=V/kyFJ8NcTPTFW9BDc2foTnvuue5KqLvfoEDgzOqDhM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2Gbb6UzGeA4bQgYfYHTKeXNxtICekZteTanP9bHlykevfGkwoXL4tgV30g5qk0aqv2LREFw7moDRMD2WHU9Lzt1qEAU+vnfHZrqzh+JaTZyt02uF/asbwPoekWLtxshNNEfgy9OJPFc5WBjbsKv+55jVWy/bpelYAm0YM2IJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cH3mMgMQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42P7F2LV012133;
	Mon, 25 Mar 2024 13:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=C+wcSeJUTDn6txkO609OE
	Lb51ua2+5zzjz8MVJ3794k=; b=cH3mMgMQuTdN77AXN8FgjgPtN+zJ7AidqjRKw
	fEFkyU0xT0mmGxSZG9RhwJ3nNbuSg/kMMav9gUq6fn5NkEkdDU8ULmAD8ybrDNiS
	Y3fqAQG0FIxA1ax/2v4JyewBMyWG9bo2A6d48UhCJicSszh8NFZ5op2cUzpA9MQ6
	82HI5FpOZ2wfCFlUFMHNnd8M6H81Hb3rKB8YKdyzvJ7Bm21FUgOPS/kk4QwNqzxf
	Q2Zn1s1YrvSMOaUSF3/S9Lf/ZJICB5gQ32EN9mgvH9Pj1wkilUxL8bfzD0O2rryo
	eBOPd30hAHoCSjWgM/TkICzWp1r5VIZatd+iYZ0Ch/dIGbW9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x31wss5u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 13:33:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PDX01u018993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 13:33:00 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 25 Mar 2024 06:32:55 -0700
Date: Mon, 25 Mar 2024 19:02:52 +0530
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
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
Message-ID: <20240325133252.o6taik5ezrsqtl7g@hu-akhilpo-hyd.qualcomm.com>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <20240324102936.6eojmk3k2qabtasq@hu-akhilpo-hyd.qualcomm.com>
 <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJppO8zMq5R7hBPG04Zsr9c3-Z9mqpnJQ88Dbjv3uYDbrUQ@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6pWp4QfDmAqWgXgBBCPu1LkLSQWiu4dK
X-Proofpoint-ORIG-GUID: 6pWp4QfDmAqWgXgBBCPu1LkLSQWiu4dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_09,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=922 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250075

On Sun, Mar 24, 2024 at 12:57:43PM +0200, Dmitry Baryshkov wrote:
> On Sun, 24 Mar 2024 at 12:30, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Sat, Mar 23, 2024 at 12:57:02AM +0200, Dmitry Baryshkov wrote:
> > > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > > need to push register changes to Mesa with the following manual
> > > synchronization step. Existing headers will be removed in the following
> > > commits (split away to ease reviews).
> >
> > Is this approach common in upstream kernel? Isn't it a bit awkward from
> > legal perspective to rely on a source file outside of kernel during
> > compilation?
> 
> As long as the source file for that file is available. For examples of
> non-trivial generated files see
> arch/arm64/include/generated/sysreg-defs.h and
> arch/arm64/include/generated/cpucap-defs.h

I see that the xml files import a GPL compatible license, so I guess 
those are fine. The gen_header.py script doesn't include any license.
Shouldn't it have one?

-Akhil.

> 
> -- 
> With best wishes
> Dmitry

