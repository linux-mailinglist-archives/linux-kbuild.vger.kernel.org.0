Return-Path: <linux-kbuild+bounces-12703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDvMMNCn1GmkwAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12703-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 08:44:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 430633AA689
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 08:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D48F305C94B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 06:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B0B37C0E1;
	Tue,  7 Apr 2026 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iT11maqj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B0389119;
	Tue,  7 Apr 2026 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544100; cv=none; b=K7ZWq8lGhkPbPgP+EBlHT//z3QZj9LAPxLuQzp7fEGQsuE+zgWuJx3szMgaJ3MmXu+wRto3ra7SSDoZtf6tEM3mflsFr9wu4Sj92P1Fl1eRShiaoQwM9ccVUe/sa6RAFNwei40e9CfwnaNGz84VHa0T/kHCjQv1pxxrWDTn+pKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544100; c=relaxed/simple;
	bh=D9BCelmQcrtvQFlypD453B/euLQLN9dwA6K43KZVrJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G+BV23uJRYrPi5OLXNiQ2HJq9jEvTKdVUz+Pzd7cJMg38Hd1jXaioWPVc4id1me+omy/v/YeyWS+Ha1E7cWzxjhPjAreZHFc48dFV/E/fhDUZrY8q7RtIxG/MFTT+wBEwdQBxSZOdgL2fF4fwp7TMTduUl2h3Zl+LfpRSSPvERE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iT11maqj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LlngV2297436;
	Tue, 7 Apr 2026 06:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+dSSPJ
	bkm3XofuIvcl4z06KTsP6JcRiszT9bw0oLBcw=; b=iT11maqj4mhsZp/0PvmJHo
	pvjxoSX6v02x2XcyRou4brG3wMId2hjtPZO4iNWXwpSKNogbUL/MUARh+8dsbQ6K
	+xzotO/rFzAUTEp9d7Vy+LwP3fxT0qVzZVk1uwkHKvkbHuemLH3LwI73zWHfbaJe
	pfPHCmWXThIRvVGBhjAnjlcH4iJFy9pn4aRsZ3RZ1QlrNgxnNdbeJv0laqZZcIkB
	sEojryqjqLx6OE18/mne8xa+MuzeHEwhmNAyfa6I2A7Z5wx+34nmJZXMZ0FyvQ25
	GNDjJquZIw7w2sJfEnx4cKC1qyu8BvFf1e+ToWHNhuoFnS6XJR1TDyIn+lTIZQ3Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2fsbnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 06:41:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6373MxG0014345;
	Tue, 7 Apr 2026 06:41:27 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcmg4hc03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Apr 2026 06:41:27 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6376fQ7u10027524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Apr 2026 06:41:26 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F145E5805D;
	Tue,  7 Apr 2026 06:41:25 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AF5658059;
	Tue,  7 Apr 2026 06:41:23 +0000 (GMT)
Received: from [9.123.2.252] (unknown [9.123.2.252])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Apr 2026 06:41:22 +0000 (GMT)
Message-ID: <6c00b695-9e84-4dd8-abbb-306fd67d6f97@linux.ibm.com>
Date: Tue, 7 Apr 2026 12:11:21 +0530
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] char/nvram: Remove redundant nvram_mutex
From: Tellakula Yeswanth Krishna <yeswanth@linux.ibm.com>
To: linux-kernel@vger.kernel.org,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com, arnd@arndb.de,
        Christophe Leroy <chleroy@kernel.org>
References: <20260330103530.6873-1-venkat88@linux.ibm.com>
 <68e9ca6a-c53b-4f15-85b3-7ae9639f9528@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <68e9ca6a-c53b-4f15-85b3-7ae9639f9528@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KeridwYD c=1 sm=1 tr=0 ts=69d4a718 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=QJh7bQgzvTJllBY2U6YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Ku1_GqSXTU2Onkx9hfIyRKX2lmnhjZk8
X-Proofpoint-GUID: JyBj8J5KI-uMVLKHg5FoI5WiOO96Z_Lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA1NiBTYWx0ZWRfX6VduUmr1Vjd0
 B1MncouLRrvl4oRAf4xW1L03KmivWqKtrutDcAyMYn+YDkjjFHKCqCsIlinUdzBVxbHoPl/xUFu
 ih71dsUGV8qj8MIGOQiA++NJHfbsId/KaQPPXJqW6Cm7kra8wFLzqN4LIdaZCzbMrv/akqIEVOW
 b2JH+NiO+/ZX5vRiGOlNYQQL5JhGbTkicJwYXBNWboxdfb0Xc0CMDRl9qkTQTavuCtDZIa4w4b4
 3x44+KlS7f1xNdzHLYO8v+Z4fP3guIv01kmeFHG7Prd20e2T7J+gOv+dpVA3tS/vSRGLOlNjQuA
 4PYTU+EXlcgMi/gXtJ4lXtv1dpTtXY6w2LUjsrPRxay1J6WB6w1KppxCzf8nVaaBe6m1G4LZN+s
 6GcluDr2CZLX3mAX7zZYlcLkO3cRMlR6OSt+Oext0euy3dxLZUlVFx+G+beT+XX7k7dZBHvlvMY
 LxvghNMSHvQkw4KUPfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,gmail.com,arndb.de,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_FROM(0.00)[bounces-12703-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yeswanth@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 430633AA689
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Please add this tag


Tested-by: yeswanth <yeswanth@linux.ibm.com>

On 02/04/26 9:33 pm, Tellakula Yeswanth Krishna wrote:
>
> On 30/03/26 4:05 pm, Venkat Rao Bagalkote wrote:
>> The global nvram_mutex in drivers/char/nvram.c is redundant and unused,
>> and this triggers compiler warnings on some configurations.
>>
>> All platform-specific nvram operations already provide their own 
>> internal
>> synchronization, meaning the wrapper-level mutex does not provide any
>> additional safety.
>>
>> Remove the nvram_mutex definition along with all remaining lock/unlock
>> users across PPC32, x86, and m68k code paths, and rely entirely on the
>> per-architecture nvram implementations for locking.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> ---
> Without Fix
> ===============
> make -j 33 -s && make modules_install && make install
> In file included from ./include/linux/seqlock.h:20,
>                  from ./include/linux/mmzone.h:17,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/umh.h:4,
>                  from ./include/linux/kmod.h:9,
>                  from ./include/linux/module.h:18,
>                  from drivers/char/nvram.c:34:
> drivers/char/nvram.c:56:21: warning: 'nvram_mutex' defined but not 
> used [-Wunused-variable]
>    56 | static DEFINE_MUTEX(nvram_mutex);
>       |                     ^~~~~~~~~~~
> ./include/linux/mutex.h:87:22: note: in definition of macro 
> 'DEFINE_MUTEX'
>    87 |         struct mutex mutexname = __MUTEX_INITIALIZER(mutexname)
>       |                      ^~~~~~~~~
>
>
>
>
> With this patch issue is fixed
>
>
> Please add below tag
>
> yeswanth <yeswanth@linux.ibm.com>
>
>
> Thanks,
>
> Yeswanth Krishna
>
>> v4:
>>    - Remove all remaining nvram_mutex call sites, completing the 
>> mutex removal
>>
>> v3:
>>    - Removed global nvram_mutex definition
>>
>>   drivers/char/nvram.c | 16 +++-------------
>>   1 file changed, 3 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
>> index 9eff426a9286..e89cc1f1c89e 100644
>> --- a/drivers/char/nvram.c
>> +++ b/drivers/char/nvram.c
>> @@ -53,7 +53,6 @@
>>   #include <asm/nvram.h>
>>   #endif
>>   -static DEFINE_MUTEX(nvram_mutex);
>>   static DEFINE_SPINLOCK(nvram_state_lock);
>>   static int nvram_open_cnt;    /* #times opened */
>>   static int nvram_open_mode;    /* special open modes */
>> @@ -310,11 +309,8 @@ static long nvram_misc_ioctl(struct file *file, 
>> unsigned int cmd,
>>           break;
>>   #ifdef CONFIG_PPC32
>>       case IOC_NVRAM_SYNC:
>> -        if (ppc_md.nvram_sync != NULL) {
>> -            mutex_lock(&nvram_mutex);
>> +        if (ppc_md.nvram_sync)
>>               ppc_md.nvram_sync();
>> -            mutex_unlock(&nvram_mutex);
>> -        }
>>           ret = 0;
>>           break;
>>   #endif
>> @@ -324,11 +320,8 @@ static long nvram_misc_ioctl(struct file *file, 
>> unsigned int cmd,
>>           if (!capable(CAP_SYS_ADMIN))
>>               return -EACCES;
>>   -        if (arch_nvram_ops.initialize != NULL) {
>> -            mutex_lock(&nvram_mutex);
>> +        if (arch_nvram_ops.initialize)
>>               ret = arch_nvram_ops.initialize();
>> -            mutex_unlock(&nvram_mutex);
>> -        }
>>           break;
>>       case NVRAM_SETCKS:
>>           /* just set checksum, contents unchanged (maybe useful after
>> @@ -336,11 +329,8 @@ static long nvram_misc_ioctl(struct file *file, 
>> unsigned int cmd,
>>           if (!capable(CAP_SYS_ADMIN))
>>               return -EACCES;
>>   -        if (arch_nvram_ops.set_checksum != NULL) {
>> -            mutex_lock(&nvram_mutex);
>> +        if (arch_nvram_ops.set_checksum)
>>               ret = arch_nvram_ops.set_checksum();
>> -            mutex_unlock(&nvram_mutex);
>> -        }
>>           break;
>>   #endif /* CONFIG_X86 || CONFIG_M68K */
>>       }

