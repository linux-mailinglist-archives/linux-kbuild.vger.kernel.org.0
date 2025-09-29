Return-Path: <linux-kbuild+bounces-8981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9DBAA166
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 18:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9C0517EA7B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 16:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AFB1E8329;
	Mon, 29 Sep 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BzYxzSOq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B657610B
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759165175; cv=none; b=QO0Z/LwSMIvO7nT1tEXv2VjDULhav1acKfel6ZZIO2exLE6bsF7/9hYwZzz6Qdl1QBfMsI/7iaLmdeK9sZh+4qvQREhKelEgyKKEZU2dhb9gmviesHS/qEaUGJw58dMYIdgw66fLlivRRDRB1/o+yKp2NXPAwYyQrqCKDl9ZRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759165175; c=relaxed/simple;
	bh=NeJ5ym/nOb/hC4fXrQ52/JyA5BEvOMyorFIx4iqgk/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxhRDcld876cTsbBtchgTrwaS86PejQdUUEIwfqIS/dZ0ctgDCwFPEprBIHQcRcszbyQCoVAKWz2bC2XRQZtO4YIt+XBZxIDudQBdH0/DXyxr28rvCT1KjyU2uhuWvyFbSioz1MMNUjZHmYGb9aoeQrqPGKSfqeSs5fOaptYYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BzYxzSOq; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TGkO9b008197;
	Mon, 29 Sep 2025 16:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Is+qn6
	2PJLcdJWFczp9kQeSpWSMZ+t3WWI/4Y06fwSM=; b=BzYxzSOqJujNqFQ1plDcil
	VH+6tYxGKmfBeyudYY/gmWVpsLAEIpffD/TVRpwzI0OXs0cw+Kp+nl+n12wFiOp3
	kyGuY1nChi0h2GSUvQKJWY00dEYh7YvBm5FRjFIqJRp/RGxPIBHwUPM8PZSKf0to
	XbvXy13hNj5Ge+XvsdAbGBsTpb5GgOfQ/XVxK3AWBlJk65+1xQFkNk+mvtCON1Ko
	Gg5nTFY/NeclBYuBlSlzro6bdC9nFbZpifFLiN4VR9ZVib2/FM6EtgXyYkjV4U9v
	I2kQa78nICeuiIbnfTOkRNLlRNFxfpJcrGC0PCXZEd/QbpOQXARjaOzcdVF5LrLQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7jwbc0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:59:12 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58TGxCgn007724;
	Mon, 29 Sep 2025 16:59:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7jwbc0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:59:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TFuPDB020074;
	Mon, 29 Sep 2025 16:59:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49et8ryay0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 16:59:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58TGx7ud34406780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 16:59:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A22AC20043;
	Mon, 29 Sep 2025 16:59:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1407020040;
	Mon, 29 Sep 2025 16:59:04 +0000 (GMT)
Received: from [9.39.18.109] (unknown [9.39.18.109])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Sep 2025 16:59:03 +0000 (GMT)
Message-ID: <fd188a2a-527b-41ee-8c58-c2aea887ced8@linux.ibm.com>
Date: Mon, 29 Sep 2025 22:29:01 +0530
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, npiggin@gmail.com,
        maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        mahesh@linux.ibm.com, Sathvika Vasireddy <sv@linux.ibm.com>
References: <20250929080456.26538-1-sv@linux.ibm.com>
 <20250929080456.26538-2-sv@linux.ibm.com>
 <20250929104946.GG3289052@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20250929104946.GG3289052@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX6zUxirWWjynL
 oHRZ7gddAYI2bg3CkGDEvL+VCQLbe16KaNVNCT2DGR9LTyIeKVNwFA1vWHhlwrzcm8elP0F+4J8
 vf/ntbjbTm1Zic2MzeKpubNiHqyFzdX/Xaxny59obsCaKGEkGFO9oxLhSnjViaKEpjZoKyh8NaY
 DftO6dPgV16IvOIUzVq3OGNwnMDvSHN3uZrkso6JMP2A/ANBZLz0cmhKr3bPa6ACf2m3gH9uthI
 KkjBfegnpur3GPKeyFWiBsGyRkxuv7+djdElgo2kE7tV/BmaI7TFtB3L80inIlHL5T6x8NtNeL7
 O+GrST29McM8pntLaaXPnO0sg4FtzvV0jrst77YxraIhlqwH5MXLlSyMybbRaOaJsqVSzBX+ocY
 kOLQfXekrTJlZqjj2gn47dPmYlxuwA==
X-Proofpoint-ORIG-GUID: qsvWFftqjuz5pKbOYa65rDdPgH8148ML
X-Proofpoint-GUID: pshSXNkpfXkS350TSka97BYCVsSBie49
X-Authority-Analysis: v=2.4 cv=GdUaXAXL c=1 sm=1 tr=0 ts=68dabae0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=rIgjmdRoErpKkANuJvoA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270025

Hi Peter,

On 9/29/25 4:19 PM, Peter Zijlstra wrote:
> On Mon, Sep 29, 2025 at 01:34:54PM +0530, Sathvika Vasireddy wrote:
>> Implement build-time fixup of alternate feature relative addresses for
>> the out-of-line (else) patch code. Initial posting to achieve the same
>> using another tool can be found at [1]. Idea is to implement this using
>> objtool instead of introducing another tool since it already has elf
>> parsing and processing covered.
>>
>> Introduce --ftr-fixup as an option to objtool to do feature fixup at
>> build-time.
>>
>> Couple of issues and warnings encountered while implementing feature
>> fixup using objtool are as follows:
>>
>> 1. libelf is creating corrupted vmlinux file after writing necessary
>> changes to the file. Due to this, kexec is not able to load new
>> kernel.
>>
>> It gives the following error:
>>          ELF Note corrupted !
>>          Cannot determine the file type of vmlinux
>>
>> To fix this issue, after opening vmlinux file, make a call to
>> elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
>> to touch the segment and section layout. It informs the library
>> that the application will take responsibility for the layout of the
>> file and that the library should not insert any padding between
>> sections.
>>
>> 2. Fix can't find starting instruction warnings when run on vmlinux
>>
>> Objtool throws a lot of can't find starting instruction warnings
>> when run on vmlinux with --ftr-fixup option.
>>
>> These warnings are seen because find_insn() function looks for
>> instructions at offsets that are relative to the start of the section.
>> In case of individual object files (.o), there are no can't find
>> starting instruction warnings seen because the actual offset
>> associated with an instruction is itself a relative offset since the
>> sections start at offset 0x0.
>>
>> However, in case of vmlinux, find_insn() function fails to find
>> instructions at the actual offset associated with an instruction
>> since the sections in vmlinux do not start at offset 0x0. Due to
>> this, find_insn() will look for absolute offset and not the relative
>> offset. This is resulting in a lot of can't find starting instruction
>> warnings when objtool is run on vmlinux.
>>
>> To fix this, pass offset that is relative to the start of the section
>> to find_insn().
>>
>> find_insn() is also looking for symbols of size 0. But, objtool does
>> not store empty STT_NOTYPE symbols in the rbtree. Due to this,
>> for empty symbols, objtool is throwing can't find starting
>> instruction warnings. Fix this by ignoring symbols that are of
>> size 0 since objtool does not add them to the rbtree.
>>
>> 3. Objtool is throwing unannotated intra-function call warnings
>> when run on vmlinux with --ftr-fixup option.
>>
>> One such example:
>>
>> vmlinux: warning: objtool: .text+0x3d94:
>>                          unannotated intra-function call
>>
>> .text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4
>>
>> c0000000000081d4: 45 24 02 48  bl c00000000002a618
>> <system_reset_exception+0x8>
>>
>> c00000000002a610 <system_reset_exception>:
>> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>>                          c00000000002a610: R_PPC64_REL16_HA    .TOC.
>> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>>                          c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
>> c00000000002a618:       a6 02 08 7c     mflr    r0
>>
>> This is happening because we should be looking for destination
>> symbols that are at absolute offsets instead of relative offsets.
>> After fixing dest_off to point to absolute offset, there are still
>> a lot of these warnings shown.
>>
>> In the above example, objtool is computing the destination
>> offset to be c00000000002a618, which points to a completely
>> different instruction. find_call_destination() is looking for this
>> offset and failing. Instead, we should be looking for destination
>> offset c00000000002a610 which points to system_reset_exception
>> function.
>>
>> Even after fixing the way destination offset is computed, and
>> after looking for dest_off - 0x8 in cases where the original offset
>> is not found, there are still a lot of unannotated intra-function
>> call warnings generated. This is due to symbols that are not
>> properly annotated.
>>
>> So, for now, as a hack to curb these warnings, do not emit
>> unannotated intra-function call warnings when objtool is run
>> with --ftr-fixup option.
> Should not all those fixes be split out into separate patches?
Thank you for reviewing. You're right - these fixes should be split into 
separate patches.
>   Also,
> Changelog seems to have lost the bit where you explain *why* you need
> this. IIRC Nick's original tool had a description of why this is needed.

Yes, Nick's original patch has the description on why this is needed: 
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/

Currently __ftr_alt* sections must be near .text because they lack the 
executable attribute (preventing linker stubs), requiring branches to 
reach targets directly. This may cause build failures as the kernel 
grows. To solve this, the approach uses --emit-relocs to preserve 
relocation information, marks sections executable (allowing stubs), and 
fixes branch offsets at build time based on their runtime locations. 
This implementation uses objtool with the --ftr-fixup option instead of 
a new tool, since objtool already has ELF parsing and instruction 
patching infrastructure. I'll include the details of why this is needed 
in the Changelog in the next version I send.

>
> Also, please see:
>
>    https://lkml.kernel.org/r/9500b90c4182b03da59472e1a27876818610b084.1758067942.git.jpoimboe@kernel.org
>
>    https://lkml.kernel.org/r/457c2e84b81bd6515aaa60ec8e9e0cc892ed7afa.1758067942.git.jpoimboe@kernel.org

Sure, will check.

Thanks,
Sathvika


