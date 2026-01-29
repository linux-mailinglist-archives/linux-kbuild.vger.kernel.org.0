Return-Path: <linux-kbuild+bounces-10923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHYLH04le2nXBgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10923-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 10:15:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C0AE07C
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 10:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AF373025E74
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA6137756E;
	Thu, 29 Jan 2026 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K5fpALDr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA77372B3C;
	Thu, 29 Jan 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678073; cv=none; b=CvwjqYskfGh0A7GJkvYQKLY+8ddRpcrlyOJsxDyJX4lyuL3kUjMAelcajV+G/PgKdn3X8eJAAw5AaHAtRuYKTt/LGwfqCfeqlrsk4s0PPY3ntWcDfWc6ZJqXxrxCJlcazIZXcgES8XSZuDy6aWqRcMQ34+TZm8T+vZAb+5oMVUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678073; c=relaxed/simple;
	bh=9XywHjd/x/tbhlmtP89Y3BOISH7GC5UC6W+cuR9hkS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkcYGaC6/Bha3+KQPgHhIBHsLKfU9gfOSVGsFAz1WtdWswD8scgjEL1giZVXSherCGZi8eKu6fF1EYKdJOcJIaiuH1CWQNMGTRfjS8gRio+yk8Zn3CpwwWOvS82uTA595so3koxOB/konJqutpTvzZjSfJWSYaNn0pQqBX+yzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K5fpALDr; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60SLbE89024618;
	Thu, 29 Jan 2026 09:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t4k6sA
	P05FtKQt6RT7d1bcmR2f6giXXc5x+5wylvk8A=; b=K5fpALDraYJiDOIiffvGml
	N61jPHSHdFHdHs4KVy5wXFSddfkf35vjgeHyI5NXiJoI/Sa7abNOQVXS+xd76MX9
	9rzryribS0lMnOsRyIQL/J3Zk3s0s42flVKe8dUq25Vo+awfVmONE5JtVtxR6NYe
	2qDiT3NkHmpH8zvDLwb2nB/XVA3l3dAHjnMqkF73WFXgNn9TEgUSXACBJjKr9oCd
	OhxCDhrtoUhicX/JgAZqVRprT2fOLeHRy72zXKE+UxsJU/D1OBR2wTrruwhwVMlD
	sSgB4doPZGhwrZG/9yvaVyUkO2OVMaz1Mk+fdOBV+ecE2aMalBCtCpFZZaZ/IYhg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtqqs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 09:13:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60T7TfBM026333;
	Thu, 29 Jan 2026 09:13:08 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9wkh1y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 09:13:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60T9D4kR14680336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 09:13:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBDDE2004D;
	Thu, 29 Jan 2026 09:13:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB27720040;
	Thu, 29 Jan 2026 09:13:03 +0000 (GMT)
Received: from [9.52.200.149] (unknown [9.52.200.149])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Jan 2026 09:13:03 +0000 (GMT)
Message-ID: <7b45d196-063e-4e76-b08b-ec2bcc111328@linux.ibm.com>
Date: Thu, 29 Jan 2026 10:13:03 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Don't create sframes during build
To: Matthias Klose <doko@debian.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Binutils <binutils@sourceware.org>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
References: <20250904131835.sfcG19NV@linutronix.de>
 <b3db475e-e84d-4056-9420-bc0acc8b9fe5@debian.org>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <b3db475e-e84d-4056-9420-bc0acc8b9fe5@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pZSPDFq_2AUWUXzx3yMBtO9j_Uco_08D
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=697b24a5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=CCpqsmhAAAAA:8 a=pFDHDGNsy5mMg_oO360A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: pZSPDFq_2AUWUXzx3yMBtO9j_Uco_08D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA1NCBTYWx0ZWRfX4RlUCZjSv4eR
 EEtRhPaneP+5mhAFG8TvO44iWPoAmRdWwlVD8EeSGQu4HBwfYmpQNZfPyW1kqhPjeT2M7h/rTdK
 cWgJlcTDJMxXI4coBXPXIOInvX1LgofiUkJx2ewmdJER3Q1fBmUdGP1/AOzF380QcF+pN32ye7a
 feWpqv7s7HpKWUnW0IBF2EV3HTF9rCevakF6sXx8ASrCCl+LlkmhJBUl+jHdD7tdBx7jqY0BITn
 p7oL1WrCigwLwt4EnKaooqRAQvIglSkDfuWlrEEf21eH0uuERkZIBL49RPFHVQEJu2v6lZs6YO6
 iZdczWzTKnJtCyPDti99deB1jzzgAm56w94Sod3xpWTXa7rpXo+tfjFIquLfw4B9c++i60oXkjS
 SF3NTZhRrCyRrAXOFJ8zZfArpgry2wpVlV7lhlWNZZMnxYa4jj8/aiR5F8hMqbbyg6nie6gX2aq
 1Jy4ecS3GaTPgg5+CtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601290054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_FROM(0.00)[bounces-10923-lists,linux-kbuild=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.ibm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jremus@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E89C0AE07C
X-Rspamd-Action: no action

On 9/4/2025 4:02 PM, Matthias Klose wrote:
> [ CCing binutils@sourceware.org ]
> 
> On 9/4/25 15:18, Sebastian Andrzej Siewior wrote:
>> Hi,
>>
>> gcc in Debian, starting with 15.2.0-2, 14.3.0-6 enables sframe
>> generation. Unless options like -ffreestanding are passed. Since this
>> isn't done, there are a few warnings during compile
> 
> If there are other options when sframe shouldn't be enabled, please tell.
> 
> Gentoo chose another approach, enabling sframe unconditionally in gas,
> unless disabled by --gsframe=no.

...

>> followed by a boom
>> |   LD      .tmp_vmlinux1
>> | ld: error: unplaced orphan section `.sframe' from `vmlinux.o'
>>
>> We could drop the sframe during the final link but this does not get rid
>> of the objtool warnings so we would have to ignore them. But we don't
>> need it. So what about the following:

Instead of dropping .sframe for kernel during final link it would be
better not to generate it to save some CPU cycles and disk space.

>>
>> diff --git a/Makefile b/Makefile
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -886,6 +886,8 @@ ifdef CONFIG_CC_IS_GCC
>>   KBUILD_CFLAGS    += $(call cc-option,--param=allow-store-data-races=0)
>>   KBUILD_CFLAGS    += $(call cc-option,-fno-allow-store-data-races)
>>   endif
>> +# No sframe generation for kernel if enabled by default
>> +KBUILD_CFLAGS    += $(call cc-option,-Xassembler --gsframe=no)
>>     ifdef CONFIG_READABLE_ASM
>>   # Disable optimizations that make assembler listings hard to read.
> This is what I chose for package builds that need disablement of sframe.

What about:

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -906,6 +906,11 @@ KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
 endif

+# No .sframe generation for kernel if enabled in assembler by default
+CC_FLAGS_SFRAME	:= $(call as-option,-Wa$(comma)--gsframe=no)
+KBUILD_CFLAGS	+= $(CC_FLAGS_SFRAME)
+KBUILD_AFLAGS	+= $(CC_FLAGS_SFRAME)
+
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
 # reorder blocks reorders the control in the function

Generation of .sframe in vDSO can override that default.  If archs like
arm64 want to enable .sframe for kernel they can introduce a kernel
option (e.g. SFRAME) that changes the default.

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


