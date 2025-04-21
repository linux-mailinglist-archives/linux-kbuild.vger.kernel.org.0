Return-Path: <linux-kbuild+bounces-6708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B487A94E2F
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 10:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4B927A4E8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 08:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36FB13C3F6;
	Mon, 21 Apr 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhU2q7K+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C820E306
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 08:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224733; cv=none; b=V5dlb+nhfwmhZ9nO0gJ4XQmjjiWT0xKtQoFjfDJPoC8p/r1JxWClwTvWOCjaDMbuQJgkxrMMcR7hGVCDmKDalN/NAOSvB1w/aTIf+NbSkXTuAm58bUbqcb97Yq6DZqQYdJXBua82thGYGJ15OTs8T2TIhU0/T9Lgwywh7X6P9EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224733; c=relaxed/simple;
	bh=km2N/aIMMbRDxvHbAp9P3zMBkknYXReMVu/F4dMDeys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doPnxekV//0oADyfs6zyonubPeQv9iLMRixQuSC2PXBlkBmVZ+oKFgwUVTnfCll/N1NYGUbOeCBErK3HWf8lXDiNC4ZSCQU31YcYjv8pEY5lPq0Vh1plE8wj0IN3ukD/wS4uhfHKApiLSYAsTOTso+uroEqipyUFxfPCTXmwMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhU2q7K+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMPNKc006750
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 08:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ax4toDTbfRew2W1ICEa9lIo8
	jWxUgyyjE5FmJLig2p4=; b=mhU2q7K+FNgdKXEFmaZ4R/muJD4mgBJpHgcj6HtW
	yCoqqxIyoqAqD+ymHBhjMkWAvhahHWO+Xa1a1D2bXFL7PUF427kMMIB6soLeYBIE
	SIWeDHdcW9yK+lVhQMo4++ZbkxcZw6SdNh1ipVilEhB5XBCM1JXyIa/QhSXKYt4z
	taZJL1NzvFnUP9IWA7XgBLE8bg8NMEafsHeorssxfU2gv8E0ZRWXnjHKsTmN3g41
	3H3wIxAVX9m43dYhnCsS6mI8IkyVuhJ3DjQuvutC4uzTwMPCtSdVTbuWM8BDr5cT
	0i42wS5GhC8Br761eEmU9xmAqONlxferBMx/CSURFAqGqw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbndu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 08:38:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso103423566d6.2
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 01:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745224730; x=1745829530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ax4toDTbfRew2W1ICEa9lIo8jWxUgyyjE5FmJLig2p4=;
        b=GLTcBMPN26TIMjMZAdRCvp6GtJFcz2A43BZAD892EiLnXMjKLLr4wOu838//yc7Lpj
         FMcc7logLu+DgWoyaEsk2j6aC2/OXu0HTxU7XXR7WSZCdMdsL8iXhMV8TOIxuwcwlnr7
         G+TD2bbnlEenwKIMJsv1noRRM+emn2CPV4xrXAoBWzmCjnVMKt43lmBC1VkwABUsXIcT
         vmaLC0bFLq+RNWE6V+50DUE8S0OTjUypBDOU+oEYOMxI88yNJ47W3OGptVI4lMnA3As+
         xmlnwv8foBv4C0gDGpI3z+LRBhy9JuHHiePpgVtuUjFIR8KnvGYkH5SD3GhKZkQfmBlv
         QxKA==
X-Forwarded-Encrypted: i=1; AJvYcCV0lsrVHz55bSFZlXVYD+zOCvZ1i5IKrS6U0Kxa6VNu66yCU/QGbBDjNz4XQBh5Xni9o4ODaCZNXmfBuUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzorsK88zQYYy7J0/KJqBCkMZnrUxL8OUNhXlwESOkQcb4kbYJ3
	ePnW0PHoPrKGcVnBTPHIqopCAy2xgTTf6w1X6d1oNaI3BsfnETDHqeVz1cTADKEMNpYD6IqYFd2
	HTwlovWf9XKSSyf/l+F1ywkRMp0DtUlCRx1J+B3lhcLeDk4QTbyDkFjDyawu+bL4=
X-Gm-Gg: ASbGncs1eCLFVU2JUGMTmSpIMsQc9V1U5mNe+1YPgVNhB0DgDeBn5krE/DeGO+tQ9Y8
	+3pZd9J5+tpcDoR+RD5Ee+7GRU0pPeQb2PPyG1mKkEwFq9CAKmDygbh1phBOJ8tL5TtissCJ4lf
	KZ3yJv7W2a/cnuKV+dJ+AdMx41BiD+q6Ved8SHtmUDEa2D6SWV8wktDfP93wclYwIgrNEP2MlBl
	T6DszIepGpQ53ZHnPAR11f2lGwc2s+vnUtXpc6cXDVFfsxjGo18ew2p62nRAm7PSKtiyBacO8WW
	PlYNLG0ApX0RKL2ZXqFnuuMcGCUpGF10MLEQ0+SPpZiWLD8boUXQkR4dvAKFcX2puaxQSVcWYiY
	=
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2c46527b9mr206777766d6.33.1745224730313;
        Mon, 21 Apr 2025 01:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF40++SY6SyUhHgwohwJQP/ezAB2infSDy3w/t56HhaTqCSHraLVTK/mrG5s/kw5dQ9HIHYIg==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2c46527b9mr206777386d6.33.1745224729825;
        Mon, 21 Apr 2025 01:38:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a68c3sm11769241fa.50.2025.04.21.01.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:38:48 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:38:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744789777.git.mchehab+huawei@kernel.org>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6806041b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=gjwTPFk3WlCVuFmdJm8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: p6Btxc8vNpptZD78IdWLFTIQjn0EBNUL
X-Proofpoint-ORIG-GUID: p6Btxc8vNpptZD78IdWLFTIQjn0EBNUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210066

On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
> 
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__. 
> 
> As one may be using O= and even having the sources on a read-only mount
> point, disable its creation during build time.

Would it be possible to properly support O= and create pyc / pycache
inside the object/output dir?

> 
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> ---
> 
> v3:
>  - changed the order of PYTHONDONTBYTECODE;
>  - patched also scripts/Makefile
> 
> Mauro Carvalho Chehab (2):
>   scripts/kernel-doc.py: don't create *.pyc files
>   .gitignore: ignore Python compiled bytecode
> 
>  .gitignore                    | 1 +
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/Makefile.build        | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  6 files changed, 6 insertions(+), 5 deletions(-)
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry

