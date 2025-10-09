Return-Path: <linux-kbuild+bounces-9063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C338BC8D8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 13:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3811883357
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828D42750E1;
	Thu,  9 Oct 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="olmQBTa5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C42D3EEE;
	Thu,  9 Oct 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009846; cv=none; b=B9GMInQVAXSdsJShDuSz4/C6JcOV1mkr4xZuw+PykCB55KT3vKY/i6VcElX2hg5T5ewqXZkpu+Yci2+w79vEnE6vWqamGZuIkHsz1zgzdXiYGyfoMGrTQ0nhc+9Cu+7mY07isFKfgryE+NbDLtBowQygNwtvj40OqjtRQoLHOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009846; c=relaxed/simple;
	bh=tHuM8jsaD5Vf+lYEYjRIKQZXHz5jb6DA+cwvLZHcvCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQRUuT4L69Mygm+x4fxf73oumGkXG+7n2PNoAwSzYZVXOvZDZk1Wy1iYAxpkqm686usQMDig4d3yrQY1rJ9HXNFfo7BQhpXg2Y4bsgHP1Id8TfAGxtJs2EMDvcOto+ZqruE/1GMEraIUUTHhgrVsI9hfmWxogokjiI59SKxitm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=olmQBTa5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599545hi030584;
	Thu, 9 Oct 2025 11:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=31ZmYpEClRtkuLuBjF9iLmQpqSaV+R
	QBsTT8AnxXTSY=; b=olmQBTa5+1+a+/eZ94nUdNfOi117QJkhKc8yjuflw/ylrI
	t2/kvnluG+xii5tzNuQs48LVPWXcl+W1L3D3oCYrqjFJIvFHoG5Lfv9tWv8jq7zP
	b480n1WcFS7LmTGqGgIPgJ3kmcF4AF1SaA9zMZihEyZjsp2CxZlvEwRUpNCRhhYS
	8LggePZmwY7xy6ZXwNmO0tAc/8sXPYtH/n+8egJX0OngixCLaMjvupEQXPKsAN8m
	YSe3kKjzF2mECpXv453UQIzqVEoTmyIsbT8LG2JmmhDsLZ0hkN/wBaiMFpZYqngH
	0PbSNaAv1bp0E8IBpIzYmKjtpCtmjptmRtbZB3Bg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv81mc1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:37:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5998MNE7026019;
	Thu, 9 Oct 2025 11:37:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49nvamm8tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:37:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 599BbGP031654644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Oct 2025 11:37:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8767620169;
	Thu,  9 Oct 2025 11:37:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4178920168;
	Thu,  9 Oct 2025 11:37:16 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  9 Oct 2025 11:37:16 +0000 (GMT)
Date: Thu, 9 Oct 2025 13:37:14 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Alexey Gladkov <legion@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/3] s390/vmlinux.lds.S: Move .vmlinux.info to end of
 allocatable sections
Message-ID: <aba82b5a-c1a1-4062-bdbb-335bbcc59daf-agordeev@linux.ibm.com>
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
 <20251008-kbuild-fix-modinfo-regressions-v1-3-9fc776c5887c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-3-9fc776c5887c@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: st025u1rLTlvioFYTgOy8WlMFimg3a6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8FQsnd+vX0e5
 uX8GSmuaH5QcfL4/V2DPeU9cbV5ggSvOnTFx3pY41VjCfwOnZwT42AUAjtPQRVyGmDRGafWDfEW
 Ey65pJvaoeTHLEHBOFJ4n8+rK1AbJlr0rh5xhwUvd2OUCyKaZCe0yQr5biFZmnBYglKsEbe0qae
 upiB3lPu38LVaoCN/DJBvW+FKaZUqh39lJn4GscpLQ/hKMHK6ogbMtmHjcJm+z2AC4ofAeqcDM8
 zCh9JhGVRtZdKoIyplYf8KcMG4VJaw3giePul9jG0ahD5E9Sak+lvT/d0jdl6FHadWTD7Kz5U1W
 PRHPUvxkK0OtOyRQsvVsJEM8c7z+U8I3arzVjCOp20eQWr5kg57rbacqWaS+ZNqFj0Olney32rr
 xaqn4phjE6MNFQtx7zE59vnIv4x3IA==
X-Authority-Analysis: v=2.4 cv=cKntc1eN c=1 sm=1 tr=0 ts=68e79e71 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=tkzU3b79AAAA:8
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=CCpqsmhAAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=tqYNrcuWPW8DXwovLUEA:9 a=CjuIK1q_8ugA:10
 a=uCXMw2ptROQ0LevMJYzM:22 a=ul9cdbp4aOFLsgKbc677:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-GUID: st025u1rLTlvioFYTgOy8WlMFimg3a6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 03:46:46PM -0700, Nathan Chancellor wrote:
> When building s390 defconfig with binutils older than 2.32, there are
> several warnings during the final linking stage:
> 
>   s390-linux-ld: .tmp_vmlinux1: warning: allocated section `.got.plt' not in segment
>   s390-linux-ld: .tmp_vmlinux2: warning: allocated section `.got.plt' not in segment
>   s390-linux-ld: vmlinux.unstripped: warning: allocated section `.got.plt' not in segment
>   s390-linux-objcopy: vmlinux: warning: allocated section `.got.plt' not in segment
>   s390-linux-objcopy: st7afZyb: warning: allocated section `.got.plt' not in segment
> 
> binutils commit afca762f598 ("S/390: Improve partial relro support for
> 64 bit") [1] in 2.32 changed where .got.plt is emitted, avoiding the
> warning.
> 
> The :NONE in the .vmlinux.info output section description changes the
> segment for subsequent allocated sections. Move .vmlinux.info right
> above the discards section to place all other sections in the previously
> defined segment, .data.
> 
> Fixes: 30226853d6ec ("s390: vmlinux.lds.S: explicitly handle '.got' and '.plt' sections")
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=afca762f598d453c563f244cd3777715b1a0cb72 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/vmlinux.lds.S | 44 +++++++++++++++++++++---------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thanks!

