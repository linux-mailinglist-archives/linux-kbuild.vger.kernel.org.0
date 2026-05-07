Return-Path: <linux-kbuild+bounces-13061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULNVFU6U/GmXRgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13061-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 15:31:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 606334E94AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 15:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26D1330008A7
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E6B3C5DC5;
	Thu,  7 May 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nwiQbkzg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9036C0CB;
	Thu,  7 May 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160713; cv=none; b=rUComUcWP9Z9W503RrwjhxEsgQzUPZga5JM4UJLMeSqNtw0R1G2ZPZ96iTKqsGXc3gIsWkMxeV52/1eFF0phALn5jp+Ofm+ricnMudevScD/2s4o/zBlvV9Y4oFBsShokGn3kOa0AP/MkvBj1RFxpVmU2euBjSN5jF8t1X0YV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160713; c=relaxed/simple;
	bh=tkHAlqBG6iGQNnMcaVfJtbUQLCrVdcFvOZ5NV6y/Uww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iASw4XdV5G8EzU5tNqQBri7Q94z5g96pQOyVztoq7wdzVCWYdTZhnTbSEh8rvNBJDYahS1q5GdhbGbFHhCSuQoGY43t3HIZEWH3JiZIo08e84YReGUIdcgggDfEp8F390xTFMbK47gTuyKOp7DXnHaH1evcoTYIpjQ/witNVcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nwiQbkzg; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64780ma12204349;
	Thu, 7 May 2026 13:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ldM3qn
	eMzOUis+4SypaRw9h68ZEIxmziYPipb9iBjOg=; b=nwiQbkzgmIbiQtf3yAr+R6
	9T6tvYwzZ1n3ov6AZgf8HYfOO6ZeU8vear+C1V1MZOn/ctGiStdAqB6tyag3jeek
	NSsbtPgQxG/UkDJyWrmojnchCpUm0B5dLr6uy0mjKQdDB9Wdkghu6KtQUP9tOHc5
	HEWEfSbhjZtNPHBzNw9CoMaJFAhIkXDjxkx/26b2W7JX29/r2w/iN3o+DIuTGzDz
	ZKHg+xxIeLw2oBiadnjk5mcLIcFqjHqxEH53cn82ca4If+AXQKLZjoWd/VmAW95W
	eHdWCGFyCdyuP/F5XSLNOOXvDsa51n3d+UYziRtb5OQ0MUQoT04DzYLh8wEcRj+A
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9w6nrvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 13:31:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 647DOYxQ026207;
	Thu, 7 May 2026 13:31:43 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwuywbtx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 13:31:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 647DVhii64291126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 May 2026 13:31:43 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08C3B5805A;
	Thu,  7 May 2026 13:31:43 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF70658052;
	Thu,  7 May 2026 13:31:40 +0000 (GMT)
Received: from [9.111.207.41] (unknown [9.111.207.41])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 May 2026 13:31:40 +0000 (GMT)
Message-ID: <ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com>
Date: Thu, 7 May 2026 15:31:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gcov: use atomic counter updates to fix concurrent
 access crashes
To: Arnd Bergmann <arnd@arndb.de>,
        Konstantin Khorenko <khorenko@virtuozzo.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
 <20260422125112.3583649-2-khorenko@virtuozzo.com>
 <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <3786062b-ce93-47e0-8eb1-125bac5dbb2a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XPQAjwhE c=1 sm=1 tr=0 ts=69fc9440 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=_KuLfYfupffp7DzZp0kA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hzjOT-mjMWdTowys9G6TyZGWFvpVYTQ7
X-Proofpoint-GUID: hzjOT-mjMWdTowys9G6TyZGWFvpVYTQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfX8p88ilzF+3AX
 Yd1vfvph8/Oq3f/U2n8b1GnLfKGmIvrGl7axTI9z5JmKpdmrlG7SdysYgr46rtq/6LGt1OrabuD
 1thQ4xDtSR8ZI292PDlnEqQvYdVbEWqlecrYUuIqyQx94UhE/T5duGtbV65Viy8QkObqLBEgZo+
 UrgqZ+ujMv3k8XBWbLrtwk4NEmWYbAarowUS9OT0Jd1aAg/LCXVcGo1eOtHlkpHD9U0zvY3y82C
 eJ8TUIyaIXtf3LlTXELVXIaM7AMx5mwBNMnJGWcmwuI7R/WL4FaZGrc3svNvK/91tQ7Gi9dGUsK
 aG0i6M75b/zrZaDgx9cPdOL5faZ9h/kG1ti23pTWX+TdYeg8d1nCUmY1+YigteqZEfIUIzZWHr1
 ZlES09hf+bEJwpggcf7/pSYJNRXeIqMaIZNjBnJMn4yWaVANOnBEM+57zgGRO1W4kPI2BGYeZ0z
 ZIZsivuOSXPHjLDI09A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131
X-Rspamd-Queue-Id: 606334E94AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-13061-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oberpar@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On 28.04.2026 22:56, Arnd Bergmann wrote:
> On Wed, Apr 22, 2026, at 14:51, Konstantin Khorenko wrote:
>> @@ -824,7 +824,7 @@ all: vmlinux
>>
>>  CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
>>  ifdef CONFIG_CC_IS_GCC
>> -CFLAGS_GCOV	+= -fno-tree-loop-im
>> +CFLAGS_GCOV	+= -fno-tree-loop-im -fprofile-update=prefer-atomic
>>  endif
>>  export CFLAGS_GCOV
> 
> Unfortunately, this causes link failures in a few files that
> end up trying to use the libgcc atomic function calls. From
> my randconfig builds with gcc-16, I have so far seen:
> 
> x86_64-linux-ld: io_uring/io_uring.o: in function `io_uring_fill_params':
> io_uring.c:(.text+0x40): undefined reference to `__atomic_fetch_add_8'
> 
> aarch64-linux-ld: io_uring/io_uring.o: in function `io_req_sqe_copy':
> io_uring.c:(.text+0x2c): undefined reference to `__aarch64_ldadd8_relax'
> 
> aarch64-linux-ld: kernel/trace/trace_selftest_dynamic.o: in function `trace_selftest_dynamic_test_func':
> trace_selftest_dynamic.c:(.text.trace_selftest_dynamic_test_func+0x24): undefined reference to `__aarch64_ldadd8_relax'
> 
> aarch64-linux-ld: trace_clock.c:(.text.trace_clock_global+0x3c): undefined reference to `__aarch64_ldadd8_relax'
> 
> ERROR: modpost: "__atomic_fetch_add_8" [kernel/trace/ring_buffer_benchmark.ko] undefined!
> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/preemptirq_delay_test.ko] undefined!
> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/synth_event_gen_test.ko] undefined!
> ERROR: modpost: "__aarch64_ldadd8_relax" [kernel/trace/remote_test.ko] undefined!
> 
> ERROR: modpost: "__aarch64_ldadd8_relax" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> 
> Since I build only with CONFIG_COMPILE_TEST=y, it looks like these
> are the files that explictly enable GCOV, and likely all others
> would run into the same issue.

So the use of -fprofile-update=prefer-atomic in the kernel causes link
errors on systems for which GCC does not support built-in atomic ops for
the 64 bit profiling data type. Your test triggers this due to
CONFIG_COMPILE_TEST but as you stated this would hit all GCOV users on
such systems.

I can see multiple approaches to address this issue:

1. Drop the patch
   => not preferred - crash would still remain, and the consistency
   improvements would be lost
2. Make -fprofile-update dependent on !COMPILE_TEST
   => would enable randconfig compiles with COMPILE_TEST=y
3. Make -fprofile-update dependent on the result of a test-compile of a
   user space test program (not sure if there is an easier way to
   determine whether built-in atomic ops are available for the gcov
   type)
   => would enable fix + improvements for all environments, where
   they are supported, but requires slightly more complex changes in
   linux/Makefile
4. Provide wrappers for GCC libatomic => kernel atomic functions
   => would enable fix + improvements for GCOV users on all systems
   But: bigger change + linker errors mentioned above suggest that
   GCC libatomic function names may be arch specific which makes this
   approach more complex

I tend towards option 3 or 2, but I'm also open for other ideas.

@Konstantin Khorenko: would you be willing to work on this as the author
of the original fix?


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

