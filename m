Return-Path: <linux-kbuild+bounces-5539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F9A196D6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 17:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 914B63A5B64
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 16:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9872144DF;
	Wed, 22 Jan 2025 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SriPO9v5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95F213E8A;
	Wed, 22 Jan 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564605; cv=none; b=iBN5rlwhPg7lp6/lgkWna2l7VYoerV2KgiyF+sCUukmLO8BNSvzo9/vrehYzWH8dYiy3LqP4+I4imaAo25znwpkLSR00+lNRMrHutLURsgIx7aYn21VREqRNdqQZHhl8APdTssJ55SGsIKaBI1Hxuq16E/uzUGzpxsf3X689yuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564605; c=relaxed/simple;
	bh=JaJjbRIXcvMnef0lbm41UVeeML2Z8HQQANRyRqVlFS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDjqCvQbgo8VTC74+Qe5EhtI27o1SexK0vLMgcqfG9pT7LKUWwGYp/jeM+HwrAG2fN4C9p51jV7ycYc+eD3DXiqzZ6RO3oaGwOPDJojjoSF9rsxaecqbgtASogdheealPJpu/B6Lr7Y+fP5b5yiynkVHUULdhJGtBAmSt6ASfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SriPO9v5; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MF1bVw027703;
	Wed, 22 Jan 2025 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=tn6kHzxWYCuaWfhS7twBe8ajn1hW/8
	C/C+k2mgUQe44=; b=SriPO9v56pnKes5h+CCJkoPhmImRFBQgIOiNx0rRNt58LC
	HClfytDFRilfWert0SnToRYBpT9It9rDEqpjLaqeWFSUp7u7N2lBSriQtkrqEv5l
	lrqwxd/35/lwHZEOPOmQOyq6Sv+O+KggA/JkKNIClxuKd0QVf9tQvQZdlWyNMk7r
	FUyCXhKCPjYF7hZ9ZDs+uVIXYI6HdEvYQmERwVYsdqLncITdD3fW84PAv78Mg9sV
	nhcfixaSySQzd+RYHfU0sGjbQlnMEm9z/RCfYloql4JCUNoAvNYY+4yYrKHqg6NG
	uY7kxvQ1idttx2Anrtfg/6ZF99fSrWlA83jEJY9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xygjng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50MGluIn004037;
	Wed, 22 Jan 2025 16:49:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xygjne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MG6YLP021074;
	Wed, 22 Jan 2025 16:49:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1gy8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MGnsEi36962654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 16:49:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B52D020040;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7291E2004B;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Date: Wed, 22 Jan 2025 17:49:53 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
Message-ID: <Z5EhsaJOaRjjMEp4@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250113155306.1922992-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1FIFpjqDLl7j4eqDhN1i8UjGeotJiCdU
X-Proofpoint-ORIG-GUID: RYJA-gNaND7vC0TXC6i9NN-fNHfjO9zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_07,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxlogscore=720 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220121

On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:

Hi Ard,

> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
>   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> 
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> 
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.

On s390 this is before:

  [32] .relaruntime[...] RELA             0000000000000000  13b3fe20
  [34] .relaruntime[...] RELA             0000000000000000  13b3fe98

This is after:

  [ 2] .rela.text        RELA             0000000000000000  13b3fe20
  [ 4] .rela.rodata      RELA             0000000000000000  142cf588
  [ 6] .rela__ksymtab    RELA             0000000000000000  142ece08
  [ 8] .rela__ksymt[...] RELA             0000000000000000  1433f200
  [13] .rela__param      RELA             0000000000000000  14432d40
  [15] .rela__modver     RELA             0000000000000000  14436358
  [17] .rela__ex_table   RELA             0000000000000000  14436538
  [20] .rela.data..[...] RELA             0000000000000000  14446228
  [22] .rela.data.rel.ro RELA             0000000000000000  144d9240
  [25] .rela.data        RELA             0000000000000000  14559148
  [27] .rela__bug_table  RELA             0000000000000000  145b4ae0
  [29] .rela.data.rel    RELA             0000000000000000  1461aab0
  [32] .rela.amode3[...] RELA             0000000000000000  146eb280
  [34] .rela.init.text   RELA             0000000000000000  146eb430
  [36] .rela.exit.text   RELA             0000000000000000  14750c20
  [38] .rela.altins[...] RELA             0000000000000000  14753d28
  [41] .rela.nospec[...] RELA             0000000000000000  1484ca58
  [43] .rela.nospec[...] RELA             0000000000000000  1487ef90
  [46] .rela.amode3[...] RELA             0000000000000000  14a0d168
  [48] .rela.amode3[...] RELA             0000000000000000  14a0d270
  [51] .rela.init.data   RELA             0000000000000000  14a0d330
  [53] .relaruntime[...] RELA             0000000000000000  14b5d6f0
  [55] .relaruntime[...] RELA             0000000000000000  14b5d768
  [57] .rela.data..[...] RELA             0000000000000000  14b5d7e0
  [61] .rela.debug_[...] RELA             0000000000000000  14b5d918
  [63] .rela.debug_info  RELA             0000000000000000  14b80478
  [66] .rela.debug_line  RELA             0000000000000000  250ef010
  [68] .rela.debug_frame RELA             0000000000000000  25123060
  [71] .rela.debug_loc   RELA             0000000000000000  253bb1a0
  [73] .rela.debug_[...] RELA             0000000000000000  298eb5a8

Thanks!

