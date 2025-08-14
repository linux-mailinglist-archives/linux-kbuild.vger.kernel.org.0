Return-Path: <linux-kbuild+bounces-8472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F846B26982
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 16:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE885E151C
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5A332144B;
	Thu, 14 Aug 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dm2g8BH9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C02321429;
	Thu, 14 Aug 2025 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181043; cv=none; b=mS2sQgAUs2tqEEXbg/MGGujmxWgzD1ZmhEi8lI48qjcbdpaokwabasOaLiJNyZZvioi2iWZqhgtJoN43edIjKDB17gqry993dbImEIfmarCM8FCzMGRcSvAlwLSTrCYImTK7jCqii35FArkcKAhn8VcFq9BhogWdFoFG4pDU31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181043; c=relaxed/simple;
	bh=a5LvrdOjd61BgcujBkjsB9RX4jF3+FOqLq8LJGv2MEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GysKpjO0bchaZ9uO2je0gU00j5Vp0XDvAfjDCu5PhaYizi1n37Icj9Yjt/nOvawudD7s7EKAawfr0xwtRFENPnt39IFkP3yjQNPIU+ZvSD6Wn8Nr+G/I2MJwgC4qJbn4tJXBCEChkis0dSihii2PCctPs0XEpP1WWjaD4fcX/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dm2g8BH9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EC9eai015942;
	Thu, 14 Aug 2025 14:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xitHk/pMp/QQRbnoNBeobWtSukHr3B
	tvqIQXx8tyGSI=; b=dm2g8BH9X+VPUpX0ORW4FXmBPSt0q4HQNVvtqScKT/Y7lR
	x+ZvZBs4brlmfLxw3tfSolDHU/3qInCOIubRjpFyL59VhiT986Iau4XUhfg/vSJh
	dogiHlUowgPQl83IVumxbBflYIw0b1fYcHnEcOoE06B7GpESh//GQPxohclOx85S
	o6KgeEOdZfcBzaq71w+3iNJer4oLZnnR57inLrSu7U5y/YCl4lIRfS6ip3qcA/4C
	KF5lTrlvO+q9j0XJ4Qe6kXEZz15poLgKGciNc4fGz8OKZH3//ybm10fsMQJSNj+g
	6SVOmaTI0ur5a1ZPzwHBvSZ9SdLcCqAPmRaU5Gtw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14tges-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:17:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57EE4nZt021961;
	Thu, 14 Aug 2025 14:17:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14tgep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:17:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57EAGHus025623;
	Thu, 14 Aug 2025 14:17:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ejvmm91c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:17:05 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57EEH19N49414634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 14:17:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E12AE20043;
	Thu, 14 Aug 2025 14:17:01 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A245720040;
	Thu, 14 Aug 2025 14:17:01 +0000 (GMT)
Received: from osiris (unknown [9.152.212.133])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 14 Aug 2025 14:17:01 +0000 (GMT)
Date: Thu, 14 Aug 2025 16:16:58 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 9/9] s390: vmlinux.lds.S: Reorder sections
Message-ID: <20250814141658.7684Fd6-hca@linux.ibm.com>
References: <cover.1755170493.git.legion@kernel.org>
 <919570dc048786c4d07affaec4b761811c6c21c5.1755170493.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <919570dc048786c4d07affaec4b761811c6c21c5.1755170493.git.legion@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZUHBlsY6Q0Jh5y8HGhdRNiGKb4yCQavS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX9xH1VxH7a5Cr
 j7aQo8bnSTLGXMtUWVHu3eWBdPNq3vy8W1uvZKFn0bTkrMUJ+YG7b/dR9HCAWvAkMJwTmkKVBKM
 aEc9V5XagKrDGaD0MMKL8vfSVAk/dVUYbK/LoZ6L/PtlFgkG0rVwj5A3XoTVJx1OIyvgkFmdxZ3
 uT/2sbj4bLRuti4UGbxAu2AY39AKq8ffgpwsetpHnL6ogjNqC/joDWghtFRes7g+nQoHiqltkkt
 huuePs6oP5NLyN/4xJ/+5zyqyTRXdoGuKybPlqVjU13w7R0WY91XRDh1U90wK0tALhuI2JKgP+S
 4KHK7PAEy8FKzKDxL9frcSAlWo9Z3Y4IKayoQgZxmb+kHwWG/7EdlVhcrqJmldfXr4KD482iiqy
 xspW36pw
X-Proofpoint-GUID: jO10P_AygBVVuX9ezUhXEJ3Vyix7YA86
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689defe3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=QIhr-27iAAAA:8 a=tkzU3b79AAAA:8 a=VnNF1IyMAAAA:8 a=MT9g-S0Fkuafz34HD30A:9
 a=CjuIK1q_8ugA:10 a=cgaYBWEFosGJW4rWv5Lf:22 a=uCXMw2ptROQ0LevMJYzM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224

On Thu, Aug 14, 2025 at 03:07:17PM +0200, Alexey Gladkov wrote:
> Reorder the sections to be placed in the default segment. The
> .vmlinux.info use :NONE to override the default segment and tell the
> linker to not put the section in any segment at all.
> 
> >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
> >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
> >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment
> 
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506062053.zbkFBEnJ-lkp@intel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> ---
>  arch/s390/kernel/vmlinux.lds.S | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Is there any reason why you didn't reorder the patches?
https://lore.kernel.org/all/aIeUq0qYXoNIePwd@example.org/

