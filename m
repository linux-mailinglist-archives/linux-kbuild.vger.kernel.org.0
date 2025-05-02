Return-Path: <linux-kbuild+bounces-6859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18191AA70AA
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B54211B66D6C
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C6D22A7F1;
	Fri,  2 May 2025 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="n4dykVL0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D59221721;
	Fri,  2 May 2025 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185667; cv=none; b=AgVE5Rrmsq/ERefuugvx+ve8pXYxPpvKmguqSLg2AIzZTzLKHQqb5TpHd3E6wjHOimT9sXQFshXnKmqyRU1yZEA4g0SuOPm9V4FSwFxiD9iNdcIn7orUSsWPCrhlKLkouNN1SoxMnHKJ8eprpekRYBqx6GELHmCxfgrziIYmrtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185667; c=relaxed/simple;
	bh=7w60J+FKjVS3g5Z95mqPgSc2nzysE8E6h9d60GXPWus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQqklomM5Ul+OK0P3z9vJwsiBEpJWGTnR0Y4YxNhRVTjU5ToLdjqFSolBLa/JIhX6hHuypHqc0ZTfbXa6srljSz3hFiOTD69uym5eNdMFufbcuv+mNSyTO+DJndNZ7/8meH9teWv26AXsbpBxusYz9vHgwaBgjghw1LRM6sZJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=n4dykVL0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541LgHKV005395;
	Fri, 2 May 2025 11:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=U/RCjn
	+HqnJhle1+I403uhVDGs5SD7lY0aQbaeLHTRw=; b=n4dykVL0IQcNXPaKnLq7cG
	3gtrD5EZzBrZum0CwK3YW1Qvr14ruooORvgAA/9uATxdkeGGekpcKHn2n8cnBGzy
	0YbG/PLkTKal/1VA7bwz0jmIU03yPeP/XrYjESIfaNwPlrigeiErhbYf00BE5vib
	y8Zq1X3hN7/mF+bmtfHY70IgjOenuGLDL/xG5gyMDjG0YR9Vmf9TFhe4AfvD7/6S
	vEup76zsqUCmiz0UcaSATsg1LfT8gpRik/3W1VC1mqiOdSDZTW0bn2Py5/tScBty
	VL56+v9D0XQ59K+k+I7AkaWpQioIA+Fe4W9diIdsCr7Wt24fS3ogA3kIlHOFZJNg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ch3vtntx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:33:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 542BG6hF001791;
	Fri, 2 May 2025 11:33:55 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469ban1hac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:33:55 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 542BXsxm25690550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:33:54 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ED9E5805E;
	Fri,  2 May 2025 11:33:54 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DED9958052;
	Fri,  2 May 2025 11:33:51 +0000 (GMT)
Received: from [9.61.121.210] (unknown [9.61.121.210])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 11:33:51 +0000 (GMT)
Message-ID: <70e065c7-8129-4c78-a7a8-72718ceea334@linux.ibm.com>
Date: Fri, 2 May 2025 13:33:37 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
To: Matthieu Baerts <matttbe@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>,
        MPTCP Linux <mptcp@lists.linux.dev>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
 <edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org>
Content-Language: en-US
From: Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z+XsHGRA c=1 sm=1 tr=0 ts=6814ada3 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=8T59DR07AAAA:8 a=VTue-mJiAAAA:8 a=hfMpdXb5uliVZ7BdCgcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nH4QB3FtVBqZfhiODIJV:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-ORIG-GUID: VvdH58BCApXO3aiQkWqM4QgzlyDnRmvp
X-Proofpoint-GUID: VvdH58BCApXO3aiQkWqM4QgzlyDnRmvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX1f1a7KAI0ak7 na6p83njbnyNC+VVxVng+drrrGEzhU5EMR1YixM06UFLGYdQhKF7UKeqD3co0hkUUbMigxkDdVB AhYRz8LCPI5dAsW7NDQ3TPicAkSmvejTnkhh8BJivZRMFVGiMjL7r/9run5wTAZqw9vF8TeYvd2
 e6cy6qrS70N3sw9aUq5I2HnHtNPutfmZt8XLSPUeohvixNlgyZU+Lt8KnwpagFVB1emdAAAiFCM mwojYIEDizFOKDi8P8h0DSCVru9bficPcX9h3j03FDYQKqFwABBGZSW94EWZlWjP2dopXYUltoR BtXiSrEGzaxjNO2uZ72ObBQiziKMdBWKcJGoqFvPAaD4tk4k9QNKRUVqc0C88Ny0Nrjlxy2fAg5
 DNPsGQjAK23Q8/z4/keto4Q3lVgbAZ42xQrkh7na7vz8p/mJYkXAgjLwwn0APIDhOf7Gis3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087

On 29.04.2025 18:12, Matthieu Baerts wrote:
> On 15/03/2025 14:20, Thomas Weißschuh wrote:
>> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
>> Other references, for example in debug information, are not affected.
>> This makes handling of file references in the compiler outputs harder to
>> use and creates problems for reproducible builds.
>>
>> Switch to -ffile-prefix map which affects all references.
>>
>> Also drop the documentation section advising manual specification of
>> -fdebug-prefix-map for reproducible builds, as it is not necessary
>> anymore.
>>
>> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
>> Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
>> Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Thank you for having worked on that!
> 
> (...)
> 
>> diff --git a/Makefile b/Makefile
>> index 5c333682dc9142b1aacfe454a5c77f5923554b7d..4f920187cee658ae4d1b807fca365f6994274828 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1067,7 +1067,7 @@ endif
>>  
>>  # change __FILE__ to the relative path to the source directory
>>  ifdef building_out_of_srctree
>> -KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
>> +KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
>>  KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
>>  endif
> 
> Today, I noticed that my CI for the MPTCP subsystem couldn't produce
> code coverage files like before: the source files are not found. A 'git
> bisect' pointed me to this patch. Reverting it seems to fix the issue.
> 
> 
> My CI is building the kernel out of the source tree, in ".virtme/build".
> Before and after this patch, GCOV seems to do its job properly.
> Capturing GCOV data with this lcov command seems OK too:
> 
>   lcov --capture --keep-going -j "${INPUT_CPUS}" \
>      --rc geninfo_unexecuted_blocks=1 \
>      --include '/net/mptcp/' \
>      --function-coverage --branch-coverage \
>      -b "${PWD}/.virtme/build" -o kernel.lcov
> 
> But after this patch, lcov complains some files are not found, e.g.
> 
>   ERROR: (source) unable to open
> ${WORKDIR}/.virtme/build/net/mptcp/ctrl.c: No such file or directory

I can confirm that the subject kernel commit breaks gcov-kernel for
out-of-srctree builds by making it impossible for a consumer of GCOV
data to determine the actual location of a source file without manually
specifying it.

Sample .gcno file content changes as seen with gcov-dump:

- cwd: /home/.../build
- /home/.../linux/kernel/workqueue.c:8049:19-8057:1
+ cwd: /home/.../build
+ kernel/workqueue.c:8049:19-8057:1

> The output file is different: the path to the source file is wrong
> because it points to the build dir. Instead of ...
> 
>   SF:${WORKDIR}/net/mptcp/ctrl.c
> 
> ... now I have ...
> 
>   SF:${WORKDIR}/.virtme/build/net/mptcp/ctrl.c
> 
> 
> Are there modifications needed on GCOV side to adapt to the behaviour
> change introduced by this patch? Or something else needed on the
> userspace side?

I don't see how this could be fixed by changes in userspace nor
gcov-kernel - the source tree directory information is missing from the
relevant data files.

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

