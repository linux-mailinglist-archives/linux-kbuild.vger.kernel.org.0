Return-Path: <linux-kbuild+bounces-7479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF7AD73D5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 16:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57333B0F54
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 14:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61592288C6;
	Thu, 12 Jun 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XRNeFAgV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477B23D280;
	Thu, 12 Jun 2025 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738590; cv=none; b=nxhtlGPzbFQyGKLv7O68YQ1bWI6KcHsDVYFd3fbZDClTWoATnIM8VXECnyBir6TCb9DB1+XXXSqBCmZThReBMA+v0mmiIqyiDIw2kAeqrc9TJy98yLwgXmHYaoT3fMNCTHzRMYG1AAOfOO/zDLTBqGquG/uQ4rjUFxQBk1VQzdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738590; c=relaxed/simple;
	bh=2ivIe9cA+y2/A8ucogahDCpvK9L55rSf2ctW9ePpjCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeT4ohXstY+jlB1DI8q6mffDqqHpHQr9ij8sUOqUn0ZSePJhBJtRpHVYcP2xoZKx98TyZeIryyZjLQP5tC+S22/rlMATKm/9nzs/o5PfHaVWh8SHSUWUiPKB6eVtYUe8ZZwbpOf3frGbvydy4O+tp9JFrjt8NtpJ0acz2nw9i8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XRNeFAgV; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C9IVfQ002510;
	Thu, 12 Jun 2025 14:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WMotBE
	ljuZFLWU6NvngZaj3RWQ3KulBL/Jyq/MKojFo=; b=XRNeFAgVa5eWYTCOa4yz5O
	y/ZmRfu8udu/Juc3MCMbS87sCpaHFv/usq1eoiRjPwh1AFwzUoBms+QKlMl8PQXT
	ToUWxDfX8MsqYa8DqsoKgWm9MwZpVzU80una2sm/YSOn43Ozn4WHqxyOi5tK5zrP
	TJoVAvmcWAPkUR7XHf89H7BTIiOPJOBBQuBb/SUfB1YFfabCJ+a3uS3i5o2ZlLgv
	L0ag0XfxPJzLq8W9tpvo7SwNcoILDsBfeFmh7K0C4WQpyeCLEtoDrfUmbwcMs1z9
	sWvUbpN27Ri4cEe9u+WOFUDpDyJEKmbnjdiaXuzrMB2sEG6ROiWQ8mP3CI0aYlTA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x002es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 14:29:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CENf4w012834;
	Thu, 12 Jun 2025 14:29:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x002ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 14:29:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CB3w9f027928;
	Thu, 12 Jun 2025 14:29:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518mn3w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 14:29:41 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CETdBQ42205600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 14:29:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C31C92004B;
	Thu, 12 Jun 2025 14:29:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C29720040;
	Thu, 12 Jun 2025 14:29:39 +0000 (GMT)
Received: from osiris (unknown [9.87.144.171])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 14:29:39 +0000 (GMT)
Date: Thu, 12 Jun 2025 16:29:38 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sean Christopherson <seanjc@google.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
Message-ID: <20250612142938.10868H90-hca@linux.ibm.com>
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
 <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
 <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
 <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38a08452-4db2-43e0-afdc-b7d696da5454@app.fastmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MErt9JqV-ov7It4oOzL8olw2YTZJ0KBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDExMCBTYWx0ZWRfXwzJcH+x3Cc+M BF1rpnQDAb3IcvsAwm7DDCFW+0+ODC225GMrAIK5huQSH/R7VwW19k+ipaQ7P4g7UX0eDc5zp4Y L8+YvbnTdhtRMeF6ecFnZNuDeTuzPuXd/usLEJHynhCtyUAJRzlFDnxNBUfEp28tXEY6gQQFZ99
 fVF5UHsYjiWOiMvXd5P4ZTKyZGEjIYJYl94y2D90M4MYl4DfAXnzNJ6coER/Dy8QlO0iym5RKaE 5dKFXhppL9Ok0dcH3MCpVK3e2P8Xm0IirRKHgdbly2XKB0zrMcjkNG1ZytnTzNwIqwwfYpb++ld xB7gNE+7ZYpSW2SiubmQo4OkyJTuGcocWqcE5+VnsQb3PIT1+vKwBdK3jGrEkzIx7usOqBpEUL8
 6v/BdD/1A4cQ6Fmb9aE72KfM/zVgchjUI8K9KmQnycG42TfZbguGOXIdL8DrVsuebs1JT36O
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=684ae457 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=FNyBlpCuAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=1zRJjgceaNzd3rGIBQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-GUID: OTtD2y-1wGwqE0qH2ozv69aEKaioSqlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=588
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120110

On Thu, Jun 12, 2025 at 10:01:00AM +0200, Arnd Bergmann wrote:
> On Thu, Jun 12, 2025, at 03:42, Masahiro Yamada wrote:
> > On Wed, Jun 11, 2025 at 11:24 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Wed, Jun 11, 2025, at 15:32, Masahiro Yamada wrote:
> >> > On Wed, Jun 11, 2025 at 4:55 PM Heiko Carstens <hca@linux.ibm.com> wrote:
> >> I think this makes sense in general, but the output here is
> >> excessive if it leads to users no longer wanting to enable W=1.
> >>
> >> There are other warnings that I think should be enabled at the
> >> W=1 level (e.g. -Wformat-security) and eventually by default,
> >> but that are still too noisy at that level.
> >>
> >> My own cutoff would be at a few hundred warnings in allmodconfig
> >> builds if there is an effort to reduce it further, but it seems
> >> that this one is still at a few thousand, which does not seem ok.
> >
> > Then, what to do?  Downgrade to W=2?
> >
> > I think nobody cares about W=2 builds,
> 
> I think the first step would be mass-cleanup patches to get
> the initial numbers down. A lot of this can be scripted.

I'm not sure this should be separate patches which would then be sent for
review. This is way too much churn for something trivial like this. Only very
few patches have been posted yet, and discussions started:

https://lore.kernel.org/all/aEjwqtotEEH8QMHB@gondor.apana.org.au
https://lore.kernel.org/all/aEl9kO81-kp0hhw0@google.com
https://lore.kernel.org/all/CAHp75Vc7AO_sRgB1Nj6CevbseMFyv5ku8ZS3PwzAuAgysKVxNg@mail.gmail.com

This looks like the start of an immense waste of developer time.

Can't this be scripted and be addressed with a single commit shortly
after/before the next merge window closes?

