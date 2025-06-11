Return-Path: <linux-kbuild+bounces-7442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D83AD4DB0
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 09:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A140C1708EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 07:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F28236445;
	Wed, 11 Jun 2025 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="g7rMibP0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AC2356C7;
	Wed, 11 Jun 2025 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628550; cv=none; b=a9FAwpfh5W9UxbiagKN7NLsrhtINLv/gdf9H0/y+tu7fWSDqvqR9ZJOab7BEqOog6xWh/7txRIYcyxOIZP0S3+GKiMPtChG/oCmskbCuCWdassijXpDseADWXX6CGptbLjZzFsfyaS5i+dL7v1Mr2wHPM4K6WjiIPkUzsVBJVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628550; c=relaxed/simple;
	bh=4uFcfbX4N79oywxH3f10w8cbGt3GEjQ8hikeWJcknoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVuNpukZQdTqnP3cJrS33w03uIHIOfeXlCWUjf2FlZE2ililGWh3vjPseSj8yQ7qbOZ44HUzVTq2yyZ4Q9LpNCzClsVE1aJG3jaw0Rm8FRCvcmkcThi146vDawXBU2B/F34O+l03DHHlkM0DBQqkdzmyttl0nvpfe8hnOgHsxlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=g7rMibP0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B52J04009764;
	Wed, 11 Jun 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=s/xeX/ZHC2YFdCQvG289q3fjkClIi9
	AGgxg09fdLCVg=; b=g7rMibP0MZ3FVdlNW3b2ZQseid6EtWfmh64lHnamWLN1/l
	+XeQSDqCV9FKbJYjj3YIycKGJJiVSTXGpAJe5buIt79PSkG2vRe3PHpRkbaLHTGo
	wtlMn36qJ886tcaLdoG4v7nd1XlEb4y66FocTh4qu3PM6KkHtEoW1D3t2Td8wMNM
	5k/VeBkPSkyQEoxUWZBhVw3e+ytoa0I7UjWuMVmF8N1bYzQJQcE4SnWEFa/+p287
	Iu/0xovM2eYv3R4d5PJhRbHAn7rR6XnFoR4AYs/7LLUiTkvodPU4kBFJUOE3Lb1B
	Qy9cggmdVY0IMW0LAip5+whbpu3Z6Kjb2jZlG7aA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7k1cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 07:55:37 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4NCsU021908;
	Wed, 11 Jun 2025 07:55:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47504yxstm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 07:55:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55B7tYvY54132994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 07:55:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A84E82004F;
	Wed, 11 Jun 2025 07:55:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7698D2004E;
	Wed, 11 Jun 2025 07:55:34 +0000 (GMT)
Received: from osiris (unknown [9.152.212.133])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 11 Jun 2025 07:55:34 +0000 (GMT)
Date: Wed, 11 Jun 2025 09:55:33 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
Message-ID: <20250611075533.8102A57-hca@linux.ibm.com>
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iqjTWxYcFco5o65jSEyFjkTVSdRcA3mh
X-Proofpoint-GUID: iqjTWxYcFco5o65jSEyFjkTVSdRcA3mh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA2OCBTYWx0ZWRfX8eEF7+xFBqVR N90QTYiFjwpTByJTI0dawiV8yF+xD7JP1yJayZwWpZscV0qiWkEDPvsWk2yfs977SwFKxmKy+Qp lxScm5TPHyORJrfGtDYmNxKrsQ/MOvIhk6hVHNGB/tMGqa2I/NDnvXYvYdAD31+8d8Pj1wo2cld
 Xn8aktyHspmMs/VcdrIqa1CMVWLkG3RbS9bDL0iee08/8/zeOKpAuTE+jbOsRl3W8+q0gNINs81 hpuqDWqnlFKIgD2J0oMf0zzfCJhT+ddUWEdxAcpXNZ+4guas1bgEInuIwkMO+L8IRFnkIdhMU3C FdE5U2zrhENL+5veiPCMHuqwA31jLKOn9h03+GvPJD5v2orRJHizxKHh+gxSfb5yrWG6rqgGDrb
 pGi9OqekCvF/QuwTi/XWusSUCV6EdmIZu2XGq/bJu8G8DMQmCmeh5Vkif/0Fi8MTbdx5YN0y
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=6849367a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=qGWf7Qon23mMiXRqvLsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=878 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110068

On Sun, Jun 08, 2025 at 01:41:18AM +0900, Masahiro Yamada wrote:
> Kbuild updates for v6.16
> 
>  - Add support for the EXPORT_SYMBOL_GPL_FOR_MODULES() macro, which exports a
>    symbol only to specified modules
> 
>  - Improve ABI handling in gendwarfksyms
> 
>  - Forcibly link lib-y objects to vmlinux even if CONFIG_MODULES=n
> 
>  - Add checkers for redundant or missing <linux/export.h> inclusion

As you write in commit a934a57a42f6 ("scripts/misc-check: check missing
#include <linux/export.h> when W=1") this adds now 4000+ extra warnings
for W=1 builds, which makes such builds more or less useless for me.

Also the commit only describes what you want to achieve, but not why.
I can only guess that you want to reduce header dependencies(?).

Don't get me wrong, I can address all of this trivial churn for s390, however
enforcing so many extra warnings to everyone with W=1 builds doesn't look like
the right approach to me.

