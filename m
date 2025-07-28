Return-Path: <linux-kbuild+bounces-8226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9428B13C9A
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 16:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5811890F90
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 14:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36BE26B2AE;
	Mon, 28 Jul 2025 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LJ+eHBO6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F1262FF0;
	Mon, 28 Jul 2025 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711303; cv=none; b=H/qeRVls85WRh5v7iI8lvd2C14c+11/TvA3V/+/p8LIu/mnsGhdxeRP2kIhe6rJwWrXI6Fik519tCKvD48Cc4i+V21h3AUmSG56Ne3LHtDaD8i/LEcFOYEtQ2emrgNHFZF2ddpBS1AUXuJyTCLu3hPunSnfafpb3/yhYRT7GDvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711303; c=relaxed/simple;
	bh=hJSzyysV725MXCMSKkwkSQRVtfZ+yRvc1GJ3v6QkPlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/r/5Fynk79TFf4ggW9OwYaDQbnV1gHniC/79SEZdBmUcwb5Jv+Yi4c2N0FK1JU4IlHAnnjJm7OanR3AWoQ6mBoiYhoaKo3VYmxhvTspcBauIm93HAn+vipOukjlzXDJsJNuVihrDkv8pEGspfuDy96eFGdhhihNQkxN07yPjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LJ+eHBO6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S97klR012673;
	Mon, 28 Jul 2025 14:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CFik1r
	KaWQ3CDMiu0Ph73wlR8+18iGh/KaEQ3etowo4=; b=LJ+eHBO676jjwSFh6YtW+z
	Speb9aNsORV1VJs72of1o/vvLDFdniYEqSKWl11T1NYhim8ls74cUurqzraDjCQB
	N5sy2m2ycOXmCRA2/fs8dn520CFug5QX7m7UgXWauabheyDMCbP7Wcn8FtwuuWaR
	ACDyP4Q5o+A1Cxoc9FDhc+utxnrxAw9SuaXacZ3mPo5FTgLIRenp6ViffOB7HbNj
	XXNV9SpdPmEBXR1056w6TJJRIJyBcRZ4DJY5YIlSg4YI0NKQ7Qi5kFYo7L0sSyJR
	T+yepEaVsbEsxHdZJTzOHQrQQhNUV+JeO+ch5hMDHnVgVxqUQNllxppHTwgw8/nQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qemhdqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 14:01:18 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56SDlFFR022438;
	Mon, 28 Jul 2025 14:01:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qemhdq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 14:01:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAm0JD016016;
	Mon, 28 Jul 2025 14:01:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aumdy4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 14:01:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56SE1ClD55509412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Jul 2025 14:01:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E2132004E;
	Mon, 28 Jul 2025 14:01:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 488AF20040;
	Mon, 28 Jul 2025 14:01:11 +0000 (GMT)
Received: from osiris (unknown [9.111.42.157])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 28 Jul 2025 14:01:11 +0000 (GMT)
Date: Mon, 28 Jul 2025 16:01:09 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 10/10] s390: vmlinux.lds.S: Reorder sections
Message-ID: <20250728140109.7289Ae1-hca@linux.ibm.com>
References: <cover.1753354215.git.legion@kernel.org>
 <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
 <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARV+8vZPUtX8iG_hEAt8tCchRPFobK85tv9dbJwVqYgsw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BpN6t-kwEAlZRnz5ZPCv9sPjjbBLhHRh
X-Proofpoint-GUID: zxepZsb5zJ1uI0blirAJ6f0FPt0BIFI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEwMSBTYWx0ZWRfX79u1++/Y1O71
 MQRRK7Pup2EyhLxvfBbbluaYkQabYdt8qxBzET/TnrkjJ3s1dJP/cQxQ9Pt0nnxhC0Okh+lTGzY
 yfblsNfds0zRnpy7EL7zRnHO6fy0rj/ANUSgF5L5YAlEaXEZOMfRwkTGj2hfitr989RuaH177EJ
 Y5xnJ4n+U/ENBv2VESf97LWCieQb5XZWN92F7ckEwp1KwjSkF8M7RHCKrRFQintKoGmQClYQblJ
 atvw/X5lyOUTiMHCgDOXEgi679RT24VT2Aa2WgvG1paDRFgFtxfSPPR8o9UBQks1EDIjxHtAb7e
 Rkjgm4vpqJ95+pOYEkVLkHQ8mU1KKfiMPMgOjtutt8VujOY1wwcvr4lB1Kz9pTEdoAFRLbyVZcs
 ThVh2JbSqcjXrnu/kTHLfHI1yc4Vk7aEscM3fG/AQsnoqjPvxWe6f3hPb7FPGcn08+8+wF31
X-Authority-Analysis: v=2.4 cv=BJOzrEQG c=1 sm=1 tr=0 ts=688782ae cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=tkzU3b79AAAA:8
 a=VnNF1IyMAAAA:8 a=MV5UOnR8UQctMGFKOh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uCXMw2ptROQ0LevMJYzM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=292 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280101

On Sat, Jul 26, 2025 at 07:59:16PM +0900, Masahiro Yamada wrote:
> On Thu, Jul 24, 2025 at 10:50 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > Reorder the sections to be placed in the default segment. The
> > .vmlinux.info use :NONE to override the default segment and tell the
> > linker to not put the section in any segment at all.
> >
> > >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
> > >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
> > >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment
> 
> Thank you for root-causing!
> 
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> 
> Hi s390 maintainers,
> I need this patch for kbuild tree.
> Ack is appreciated.

Acked-by: Heiko Carstens <hca@linux.ibm.com>

But can you reorder the series so this patch comes before any of the
patches which introduces the above warnings, please?

Thanks!

