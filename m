Return-Path: <linux-kbuild+bounces-7468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8EAD69DF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 10:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE64179826
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC70D2D7BF;
	Thu, 12 Jun 2025 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YVJ1yLXw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3020EB;
	Thu, 12 Jun 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715400; cv=none; b=uJIUzJlFxb6LWHXOAMAtRBTyOK6XWkKDXQlIei4FVxFexcMGI5c8o1ICk8WJ2d22UCcuuxus0y48b/x6Ooz683pl9YoD1C1dHREh47F2/mLmDFYHp5xMJeVACynDD/B/GCStSU++RKdGteRdSephxvjhcH2sATW4X4Y5pBpu3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715400; c=relaxed/simple;
	bh=BzZIxkf/gMjqGm40eYcq8oQj4/cY6hweGVXl37278KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myANkjggbxhPdeKO39iK5hLuAR0+9w5PPCnQJuAeV6fa0VR2f5+HH/3m4HTr4Gb2AbFuoTqSU54VpH+pk6/OE8azI0ROhYjOR5tUQ5kP+IqPv4SU9oRyYBRHZT9k6vgXhrV6Q4g0Nisz7rq3s0DCAnpwW357zIL/tJbfNQUiYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YVJ1yLXw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C1RhtC029153;
	Thu, 12 Jun 2025 08:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=93LVtc
	FrJAfUoMaHbIwsRKHYzBH6/7uJfS8NoCra5Vg=; b=YVJ1yLXwqXIWzTD0ykZzCw
	XKNV+uHbM15UVpgKPGMpFr86k8jb+2vfZrc3HBK4Kk6iIv7bXBrIWSWgpA0tHDmF
	Y8R/KetI57uCgG6+ZJluVL7QHnBFAUh7rmW9qTGVWoaYqdnk/IaVxnRL6lZxaGCj
	baMe7DB0mGFfxJullgEArtLrTC5qQvWMZqJOqYEUrPBdknQSXvzjxg2VyllqojJ4
	eZKaCzbbaWzpmFavC28456tyaBJkzo8uLPLXLDNJUA1e+hxTUoWiz69AJTp9ujJ+
	W+TpcOa2pQXvScI95rs/LdahZp8bVJQ+GrGNfvnnRB007i4oidTiM++hv9+b41Bg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjhfx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:03:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55C6Fcj3015369;
	Thu, 12 Jun 2025 08:03:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpbr0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 08:03:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55C82waI57410042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 08:02:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1EEB2004B;
	Thu, 12 Jun 2025 08:02:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4538220043;
	Thu, 12 Jun 2025 08:02:58 +0000 (GMT)
Received: from osiris (unknown [9.87.144.171])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 08:02:58 +0000 (GMT)
Date: Thu, 12 Jun 2025 10:02:56 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.16-rc1
Message-ID: <20250612080256.10868Ace-hca@linux.ibm.com>
References: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
 <20250611075533.8102A57-hca@linux.ibm.com>
 <CAK7LNASSeuZWAXS6tDGL1T8S1N9fmg4DND616BL6uco4gnYFqA@mail.gmail.com>
 <8992766a-cc96-40bb-b8c2-60931ad0f065@app.fastmail.com>
 <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAShTuuxL6+foeQBTg4Nf581Q3vy38XGuXRk4hFvEAWjig@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jngPPxb4CPy-TX0B88n3lR3wERgqMHkn
X-Proofpoint-GUID: jngPPxb4CPy-TX0B88n3lR3wERgqMHkn
X-Authority-Analysis: v=2.4 cv=fZWty1QF c=1 sm=1 tr=0 ts=684a89b5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=LMQgCmabzUwRuwIS6ZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA1OSBTYWx0ZWRfXwlnfcAfzOI+b 96V1BkiN+y5jsCzlYoc5rqEWevixqKTTnWh8DrbDGNQIHcBM6AgLCJP0uFVeuVK8qp4B0SOjrc/ A2oOEgvhm67Nl+eBk7SgAe0sWQFVghCQtw+YDHdcJqNXHU+B4iUCypo/5q2XLC1P3P3meE/bz8/
 gIhzZstTdtSkypgdx+9U8TsLJ9EA5njivOsNWSZAYUHRT1LMWvJ8Q0k3Bb4Oig1vzcJsOsTO3+Y 4X1CKj0JKxPWrBHIKxukqUXlaTGuLlY8+Yd84ShKvV5Qidh2Rz4V3Yxena/HlCSieGAk1z6DyQj 6Y0hKcUHpLUfTAgSzsbXsmY3UN70FFpBg09RznzcSt/I/NGy72vOKqCdNjwdvv6k9jb3wP4QEG1
 Q1e6eGRjTzJ4IBALYIqjR6SaxaduN5/2l8H2EnNXWdAycr9F9UgSMuRwTNn+LQ5JYkmbllp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=563
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120059

On Thu, Jun 12, 2025 at 10:42:40AM +0900, Masahiro Yamada wrote:
> On Wed, Jun 11, 2025 at 11:24 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > I think this makes sense in general, but the output here is
> > excessive if it leads to users no longer wanting to enable W=1.
> >
> > There are other warnings that I think should be enabled at the
> > W=1 level (e.g. -Wformat-security) and eventually by default,
> > but that are still too noisy at that level.
> >
> > My own cutoff would be at a few hundred warnings in allmodconfig
> > builds if there is an effort to reduce it further, but it seems
> > that this one is still at a few thousand, which does not seem ok.
> >
> >      Arnd
> 
> Then, what to do?  Downgrade to W=2?
> 
> I think nobody cares about W=2 builds,
> and the problem of all C files including <linux/export.h>
> would remain forever.

For example you could provide a method to opt-out, similar to
RECORDMCOUNT_WARN, except that the default would be enabled.

This option would go away in the (near?) future again, as soon
as everything has been addressed.

