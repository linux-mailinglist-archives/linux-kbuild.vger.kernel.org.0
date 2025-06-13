Return-Path: <linux-kbuild+bounces-7493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E842AD843E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 09:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77084189BB66
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 07:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5997F2D1929;
	Fri, 13 Jun 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dCQa5UPj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C282D1905;
	Fri, 13 Jun 2025 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800092; cv=none; b=eYrpWxK974+PQ/vE5SIgM+jv/WdGoZbUxpEC+BEW79U+FzLpXVOt4kY4ynA1uDx9dvQFVRNCZksAQ/lBegfPYQAhNqYnMg8ITPPUZadjEKlpymBokqnrKTIGKt7g+l0ela7scTe8EZR2eXoysy9WrWHpr++TYKsKMaqqJjckq60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800092; c=relaxed/simple;
	bh=jMtJU2pTkz50zel0ZVOXCLZvoKCyvMzdYg3aVYdyDDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tI/mTxg6UT4G6XGGrnseTLLjwpRi+QwOy/Kkqk/e3xAYZwGPOCY+qujOzFs0rFyCZE7txwTcMGy5uNcvu+RjHyoI9lRAAZl5cHBL9ubghJ7BstzwJYZ1oeeEjhEi4D3IxlCnH3JMjyMXOo6N/mBKmvBKEE5kSYpne33yRcz8bQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dCQa5UPj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2w0lh016526;
	Fri, 13 Jun 2025 07:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Q+00UsnK9QNmHyLDUgqm5Z0yCuP4tR
	RAbOGJlESRpPw=; b=dCQa5UPjfC9CVBahw231jons1CFvs70D/96M0foymRk61/
	LDUyLt/U77moLVGxdNpBs1JZ/LPRjGq5fKwnk/kgz9PcwdJHAn+NAidX5DN3CtdQ
	cc5M85VaJX1iLFoIJ4G426Af/Mn0TGS8u/fIO7sn9UdXvma4zQVQkfsjOS7vjLVZ
	2dom03hKSztypC8Sx7JUlowHAmbp+t9e1zRbNq7Dqo238xBJdE8r78J4K1XVrRAM
	lv1ky0Kx8p9MvLtm3Ym5og/hJFsB8xQWIF5+mMgFWPu69VqX/kbuTy4W0hUwQKfw
	tLwl1K3li39jpKpdTiuwj/mHb1gpswYw/QhOkvFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguxqh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 07:34:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55D7Fh6R017417;
	Fri, 13 Jun 2025 07:34:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguxqgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 07:34:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6g9dG014948;
	Fri, 13 Jun 2025 07:34:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpgykn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 07:34:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55D7YZNM53477794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 07:34:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A0612004B;
	Fri, 13 Jun 2025 07:34:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48C9420040;
	Fri, 13 Jun 2025 07:34:35 +0000 (GMT)
Received: from osiris (unknown [9.111.44.220])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Jun 2025 07:34:35 +0000 (GMT)
Date: Fri, 13 Jun 2025 09:34:33 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Sean Christopherson <seanjc@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: move warnings about linux/export.h from W=1 to
 W=2
Message-ID: <20250613073433.26153A91-hca@linux.ibm.com>
References: <20250612160850.3007038-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612160850.3007038-1-masahiroy@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=684bd48e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=wWeqQ2MroeA1i1D5eWMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: df9pBC3O6aQCIuOUUZyNihkLjICkB9kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MyBTYWx0ZWRfX9IIhdGcfxnKz +gmJ8zY2Mrj8pvuDF7Q1ovi7wbSP3z18gPdFm+ADGlN/MinPGJt9mn+6XiQQjY1wtpsnK5Ne8DI x/ADuyMd1PhIWKPMxPibq7/3MqErKPHeT9h1dyD3AmFkIdQqY9/ONAsJjH9dqT4BaCxnX9hW1nd
 khLGJ1BwjhremFkfegIidog5AKsBjhP8GtRAj8dR4XQdbvukxNOqWK3R4b5ObXwVaPRycWs/oVm pfSs3XkXYLpGwcu/6dYv22iHbjAEZIhV5IwBsqWnev8iZhV8dfzUucltrMBUGIA5K9/aOKN+IxC EGZMNVbpsJdEKsVQkia+fCHM+L2BKv36VPzKue2AFe0oNBJioviEoFN2fTlQlYP/eFHYaNgnEvm
 jfdxDVQOyPq8EiJtYobcoEF8VDL68JnK66J/v5sm/WZdu/j3FWDAGmOZX5xWedgVAcXdRHfv
X-Proofpoint-ORIG-GUID: LnzqN63bkSsWR0S-YWzC821bvjD_P3_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=780
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130053

On Fri, Jun 13, 2025 at 01:08:48AM +0900, Masahiro Yamada wrote:
> This hides excessive warnings, as nobody builds with W=2.
> 
> Fixes: a934a57a42f6 ("scripts/misc-check: check missing #include <linux/export.h> when W=1")
> Fixes: 7d95680d64ac ("scripts/misc-check: check unnecessary #include <linux/export.h> when W=1")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile           |  3 ---
>  scripts/misc-check | 15 ++++++++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)

Thank you!

Acked-by: Heiko Carstens <hca@linux.ibm.com>

