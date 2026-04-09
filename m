Return-Path: <linux-kbuild+bounces-12724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFC8EXxf12kCNAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12724-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 10:12:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D03C7918
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 10:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 836453011793
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2743391E6B;
	Thu,  9 Apr 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kEFuazMC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275B3876B3;
	Thu,  9 Apr 2026 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722361; cv=none; b=tw9+U6OCRVmuj+Fn/MV7qRH7eKiASU9ad94iVXT7ErHk8TbGsWs5V3iLutW6sPSSqUJnjlKsDTk8KCTehSpA8BY9/0OXQI6+TlCwdEQTS6ETLt6LSQ6xSsMrSVfe++ce6LWGRNB8I4o3wrt3HAX5T4IFa5ouOjEfTDDU5x/xwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722361; c=relaxed/simple;
	bh=0uTFniULCO68miH8PxlAZ/W1O7s4oE4iQH6TuJjVnv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfvxIi4A7/FK4/Gagi4kgNTpdwADF79EikVOt1fzvvRHLRBUw+lAsYUk+LGSPOfap/+XG6/OJNBDfJxuddXHi+kUSk0vE+IPaUr1cniO/bm/uvfKVSJ2OJudn4uk4OF1zuRCGe8D2Kr3j2bJgEUKvDMYR6gFNFhMo/WFmHRmYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kEFuazMC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638J3R0c2299314;
	Thu, 9 Apr 2026 08:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5BEPhw
	7hviYisru5H9lIHP+qgnLR0UD2usC3OqdQYRQ=; b=kEFuazMC5uLNujXx0aByyJ
	/azgO52p2UM+MYfFzis74O3IPeTbYATdbNmlHGA2bvhREOu1eOUinw19pFNhkbD6
	O4D8ry5iHJbsaCjn1nV4OezblOPzsJ78U1T+LDgMyJbU4VScpq0BO6R37Sl4RJBE
	Um41NXPHCUjYlvxMQTO/aJlhVpL0KnwkxaPmTnIy7nEFd1OpFcRKgQkoWvK02cqw
	/pY82yrYGcKlXmasF4yU0RPWH4qGUN6L92fmPzDpZKB1F0xm+QTl+9C3udbg/99N
	ggxcPhoYRgz4aLxK8R2uYq7xkIZrzix6ZgpD32zLBC5ooOsRz2wBTbVBL25KS9zA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2g351m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 08:12:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6397gsmv014345;
	Thu, 9 Apr 2026 08:12:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcmg4ts2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 08:12:28 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6398CRKu15663760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Apr 2026 08:12:28 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C07465804B;
	Thu,  9 Apr 2026 08:12:27 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBAAA58055;
	Thu,  9 Apr 2026 08:12:24 +0000 (GMT)
Received: from [9.111.162.78] (unknown [9.111.162.78])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Apr 2026 08:12:24 +0000 (GMT)
Message-ID: <9fba075d-9388-483f-818e-6ee3b168f18d@linux.ibm.com>
Date: Thu, 9 Apr 2026 10:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gcov: use atomic counter updates to fix concurrent access
 crashes
To: Nathan Chancellor <nathan@kernel.org>,
        Konstantin Khorenko <khorenko@virtuozzo.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        Nicolas Schier
 <nsc@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
        Jakub Kicinski <kuba@kernel.org>
References: <20260402141831.1437357-1-khorenko@virtuozzo.com>
 <20260402141831.1437357-2-khorenko@virtuozzo.com>
 <20260406193707.GB1319599@ax162>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260406193707.GB1319599@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KeridwYD c=1 sm=1 tr=0 ts=69d75f6d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=TYBLyS7eAAAA:8 a=VnNF1IyMAAAA:8 a=UcAIXzObT5Yb_fD7W4kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zvYvwCWiE4KgVXXeO06c:22
X-Proofpoint-ORIG-GUID: JiPVnv-G40kAQsouZi38NuNFJ7vFsQsQ
X-Proofpoint-GUID: JiPVnv-G40kAQsouZi38NuNFJ7vFsQsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA2OCBTYWx0ZWRfXyRtYC1Htwb5j
 Hs2syt9OKD7fL9nfAKcrnLQvm/4usZgN03vB67AiDWuBk1pTf0bhU8JAStefgjuf7V+CJXW3EgU
 XlFzsnwIWm46hlhCoYCtJcb8MEiyFiaw15Ou5Da2BU/s0lXGqGnDKM6ikAxS54QdT1+8ac1ED3S
 PZ/Cn3mftrkYEmQ9nkz/Hdx9/fMutsmiu8eOaCXZGKClwfAME46ST2Ex8EJYHw+efY9bRSZrJpP
 GmO9hIMl6INMzyidL/qcqKTyzY/3D7ALJ+q7hIp62UFtuTA1AZQv/Bek6tuL1LWi2/bUtE4tfDg
 sWRFLKWMUOWTtVBgKr3mAwUsLPguOfQ5Xo9r4q0bbZ4O7AzA8T+czn1gmbBfVFXCRpZfHY0Rywt
 KASh6dIG7zKyW4WH3ysfDEsY775ChL5YyD+8WvazslmzwR75zCGQf4LSXy6dHtArar5Nnrb2sui
 OdG5Uz2o28FZawM/3Jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-12724-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,virtuozzo.com:email,linux.ibm.com:mid];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oberpar@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: AC2D03C7918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 21:37, Nathan Chancellor wrote:
> On Thu, Apr 02, 2026 at 05:18:31PM +0300, Konstantin Khorenko wrote:
>> GCC's GCOV instrumentation can merge global branch counters with loop
>> induction variables as an optimization.  In inflate_fast(), the inner
>> copy loops get transformed so that the GCOV counter value is loaded
>> multiple times to compute the loop base address, start index, and end
>> bound.  Since GCOV counters are global (not per-CPU), concurrent
>> execution on different CPUs causes the counter to change between loads,
>> producing inconsistent values and out-of-bounds memory writes.
>>
>> The crash manifests during IPComp (IP Payload Compression) processing
>> when inflate_fast() runs concurrently on multiple CPUs:
>>
>>   BUG: unable to handle page fault for address: ffffd0a3c0902ffa
>>   RIP: inflate_fast+1431
>>   Call Trace:
>>    zlib_inflate
>>    __deflate_decompress
>>    crypto_comp_decompress
>>    ipcomp_decompress [xfrm_ipcomp]
>>    ipcomp_input [xfrm_ipcomp]
>>    xfrm_input
>>
>> At the crash point, the compiler generated three loads from the same
>> global GCOV counter (__gcov0.inflate_fast+216) to compute base, start,
>> and end for an indexed loop.  Another CPU modified the counter between
>> loads, making the values inconsistent — the write went 3.4 MB past a
>> 65 KB buffer.
>>
>> Add -fprofile-update=atomic to CFLAGS_GCOV at the global level in the
>> top-level Makefile.  This tells GCC that GCOV counters may be
>> concurrently accessed, causing counter updates to use atomic
>> instructions (lock addq) instead of plain load/store.  This prevents
>> the compiler from merging counters with loop induction variables.
>>
>> Applying this globally rather than per-subsystem not only addresses the
>> observed crash in zlib but makes GCOV coverage data more consistent
>> overall, preventing similar issues in any kernel code path that may
>> execute concurrently.
>>
>> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
>> Tested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
>> Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> 
> While this is obviously a fix, what are the chances of regressions from
> this change? As this should only impact GCOV, this could go via whatever
> tree carries GCOV patches. If Kbuild is to take this change, my vote
> would be to defer it to 7.2 at this point in the development cycle so
> that it can have most of a cycle to sit in -next.

Adding Andrew since he typically integrates GCOV patches via his tree,
and for input on how to handle this patch.

To summarize the situation, this patch:
- is only effective with GCC + GCOV profiling enabled
- fixes a run-time crash
- improves overall GCOV coverage data consistency
- triggers a number of build errors due to side-effects on GCC constant
  folding and therefore depends on the associated series [1] that fixes
  these build-errors
- has a non-zero chance to trigger additional build-time errors, e.g.
  in similar macros guarded by arch/config symbols not covered by
  current testing

Given the last point, I agree with Nathan that this patch would benefit
from additional test coverage to minimize regression risks, e.g. via a
cycle in -next.

[1]
https://lore.kernel.org/lkml/20260402140558.1437002-1-khorenko@virtuozzo.com/

>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 6b1d9fb1a6b4..a55ad668d6ba 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -806,7 +806,7 @@ all: vmlinux
>>  
>>  CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
>>  ifdef CONFIG_CC_IS_GCC
>> -CFLAGS_GCOV	+= -fno-tree-loop-im
>> +CFLAGS_GCOV	+= -fno-tree-loop-im -fprofile-update=atomic
>>  endif
>>  export CFLAGS_GCOV
>>  
>> -- 
>> 2.43.5
>>


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

