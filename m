Return-Path: <linux-kbuild+bounces-13131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD5eAxFCBGokGQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13131-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 11:19:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E4530841
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 11:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFF4B307B00A
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 09:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6041A3C4547;
	Wed, 13 May 2026 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aYr9aNPM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D1389E07;
	Wed, 13 May 2026 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663754; cv=none; b=mpE1PpkSdV7WdYYFkzhIm8D2El671KwhPswCH0jyLbu1p9bmdk1r1puCae0Cn2adJ/4fYTtSVnCB1Efsm/xv/ct9KZHMwYLi5JtsaTTMzbNAjyRTnqT8xjrTXmP+wRs3UX6MK1C9utesm54v3KVJ91SqqnGaK4iNFulWk2DhyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663754; c=relaxed/simple;
	bh=Zob/ZVh0EqJF5W0DBd9LEJF5fZQwlD42B38jkiUFsVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4/ZF7dW14PPRIikT+f/2QGQ/uG4WJk1zR5s3TbZTI0uH5SMn0QVrf5q9b5G4tGnUsqTBKx+tIy2caFo9ptpsoJiKh98BFXuN3I187eJHrriVKLQKC6tTduRyl2oxlFhkhvoNRYJbCMqvKIFPp9syLSA/bMkQBUSzRFJ+/kbVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aYr9aNPM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D2N3q73179980;
	Wed, 13 May 2026 09:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kk36+f
	gEBQ7rHjSimofKd2riklZPX2CvaqPakLj8Zx0=; b=aYr9aNPMJcOaBOQ2hwtp1n
	B62mkP7Qmn7dt5EB4KNSJljzfO2jTNEtGJCp3y9406TFQ3dDPaltnCG/YjQI/YFS
	4QDbODtGHmfM7x0sMYFlImiUjvib7BUKPL7KROz1GirOrQ3o6/9DJ/4d+D68/B/1
	gcrcGw+wXKCtKGBhqq2/Bh4HC1K5MNyJCXpIhYPHFWDd3E1jrZBhmkzdi9ja8Rb4
	0jI1PbEcR0yXI/uB6Yd2Nmt5ty5hrChjjmJaLWuHcvgWzD805y8Ll/zQBgC+PRD9
	DzgJvV1taCPdkqjSKYju063A61SW5mNSTddcbtin3yP924X4cd+sJ8CiSaVg7zgw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e3nv6pn86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 09:15:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64D99PZY014253;
	Wed, 13 May 2026 09:15:45 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e3nfgq348-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 09:15:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64D9FjG117498816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 May 2026 09:15:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 764CE58056;
	Wed, 13 May 2026 09:15:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F4FA58052;
	Wed, 13 May 2026 09:15:43 +0000 (GMT)
Received: from [9.52.199.152] (unknown [9.52.199.152])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 May 2026 09:15:43 +0000 (GMT)
Message-ID: <e1b6e768-51af-468b-a729-0ed3fceef2f1@linux.ibm.com>
Date: Wed, 13 May 2026 11:15:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] gcov: use atomic counter updates to fix concurrent
 access crashes
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Miguel Ojeda <ojeda@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
        Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260511105052.417187-1-khorenko@virtuozzo.com>
 <20260511105052.417187-2-khorenko@virtuozzo.com>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260511105052.417187-2-khorenko@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Us1T8ewB c=1 sm=1 tr=0 ts=6a044142 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=TYBLyS7eAAAA:8
 a=VnNF1IyMAAAA:8 a=TlsCT6sbnaxOVF7KE00A:9 a=QEXdDO2ut3YA:10
 a=zvYvwCWiE4KgVXXeO06c:22
X-Proofpoint-GUID: J1-znIgON5oemFBWut_-BPToU5N-qRyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA5NCBTYWx0ZWRfX66+WovZr15ns
 aoTBZQ1Uh/2SuDbSUE3kK4iOqvGn8FF5g7Un3NZdtITUBRI+yJPDQ+Ld5uVLSiCAIowjVXlcF7L
 BpAupG2JyDIQNVOu4OhlfXi3na0mN7PatQrHS5qedsqTazqNd4VQV+Z3a6U66wLS1MfagZJhKgj
 B1qohILkb4MDSCVS5OUCKg66h3EhJJ8r+XY9BDJI5OjtkLgTSOK5sWbv/hAV9/k2KLoE7Bbb6D2
 ibh1gMl6RYTdmlOPNB1nVw2IjbOvV2BzFUrssvI/XPpcaiPps1iQnq6+tmbrtgRzn+GNHGwD9s2
 VC26SUAOAascIvCTsSKKfwnVv0VIl7if0datElffgmwNKghLmvl3icPdlCGJ5rfjdjFlRjlQgs+
 p4KIqqlA2AmyCqqsLsnP7k052LvSguLvzTJIyspsd4CheHZl8H7zU06SWHX7RZor80wSrOvgisO
 B59+Ue90i+9CvsKcwZg==
X-Proofpoint-ORIG-GUID: J1-znIgON5oemFBWut_-BPToU5N-qRyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130094
X-Rspamd-Queue-Id: 9D7E4530841
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-13131-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,virtuozzo.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oberpar@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On 11.05.2026 12:50, Konstantin Khorenko wrote:
> GCC's GCOV instrumentation can merge global branch counters with loop
> induction variables as an optimization.  In inflate_fast(), the inner
> copy loops get transformed so that the GCOV counter value is loaded
> multiple times to compute the loop base address, start index, and end
> bound.  Since GCOV counters are global (not per-CPU), concurrent
> execution on different CPUs causes the counter to change between loads,
> producing inconsistent values and out-of-bounds memory writes.
> 
> The crash manifests during IPComp (IP Payload Compression) processing
> when inflate_fast() runs concurrently on multiple CPUs:
> 
>   BUG: unable to handle page fault for address: ffffd0a3c0902ffa
>   RIP: inflate_fast+1431
>   Call Trace:
>    zlib_inflate
>    __deflate_decompress
>    crypto_comp_decompress
>    ipcomp_decompress [xfrm_ipcomp]
>    ipcomp_input [xfrm_ipcomp]
>    xfrm_input
> 
> At the crash point, the compiler generated three loads from the same
> global GCOV counter (__gcov0.inflate_fast+216) to compute base, start,
> and end for an indexed loop.  Another CPU modified the counter between
> loads, making the values inconsistent - the write went 3.4 MB past a
> 65 KB buffer.
> 
> Add -fprofile-update=prefer-atomic to CFLAGS_GCOV at the global level in
> the top-level Makefile, guarded by a try-run compile test.  The test
> compiles a minimal program with and without -fprofile-update=prefer-atomic
> using the full KBUILD_CFLAGS, then compares undefined symbols in the
> resulting object files.  If prefer-atomic introduces new undefined
> references (such as __atomic_fetch_add_8 on i386 or
> __aarch64_ldadd8_relax on arm64 with outline-atomics), the flag is not
> added -- the kernel does not link against libatomic.
> 
> On architectures where GCC inlines 64-bit atomic counter updates
> (x86_64, s390, ...) the test passes and the flag is enabled, preventing
> the compiler from merging counters with loop induction variables and
> fixing the observed concurrent-access crash.
> 
> On architectures where the flag would introduce libatomic dependencies,
> it is silently omitted and behaviour is no worse than before this patch.
> 
> Move the CFLAGS_GCOV block from its original position (before the arch
> Makefile include) to after the core KBUILD_CFLAGS assignments but before
> the scripts/Makefile.gcc-plugins include.
> This placement ensures the try-run test sees arch-specific flags
> (-m32, -march=, -mno-outline-atomics) while avoiding GCC plugin flags
> (-fplugin=) that would break the test on clean builds when plugin shared
> objects do not yet exist.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

Thank you for providing this updated fix - I greatly appreciate you
working on this.

I tested this patch successfully on s390 with GCC 15.2 and GCC 16.1.

Tested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>

That said, I found some stylistic details where the patch could be
improved that I've described below for consideration/comments. But I
don't want to delay the fix any longer than necessary, therefore I'm
fine with this patch, even when not including my suggestions.

> ---
>  Makefile | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9f88dcaae382..2b352ad22d06 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -824,12 +824,6 @@ endif # KBUILD_EXTMOD
>  # Defaults to vmlinux, but the arch makefile usually adds further targets
>  all: vmlinux
>  
> -CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
> -ifdef CONFIG_CC_IS_GCC
> -CFLAGS_GCOV	+= -fno-tree-loop-im
> -endif
> -export CFLAGS_GCOV
> -
>  # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
>  ifdef CONFIG_FUNCTION_TRACER
>    CC_FLAGS_FTRACE := -pg
> @@ -1147,6 +1141,27 @@ endif
>  # Ensure compilers do not transform certain loops into calls to wcslen()
>  KBUILD_CFLAGS += -fno-builtin-wcslen
>  
> +CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
> +ifdef CONFIG_CC_IS_GCC
> +CFLAGS_GCOV	+= -fno-tree-loop-im
> +# Use atomic counter updates to avoid concurrent-access crashes in GCOV.
> +# Only enable if -fprofile-update=prefer-atomic does not introduce new
> +# undefined symbols (e.g. libatomic calls that the kernel cannot link).
> +CFLAGS_GCOV	+= $(call try-run,\
> +	echo 'long long x; void f(void){x++;}' | \
> +	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
> +	-ftest-coverage -x c - -c -o "$$TMP.base" && \
> +	echo 'long long x; void f(void){x++;}' | \
> +	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
> +	-ftest-coverage -fprofile-update=prefer-atomic \

Using $(CFLAGS_GCOV) instead of listing -fprofile-arcs -ftest-coverage
separately would reduce duplication, automatically account for potential
future changes in the list of flags used for GCOV profiling, as well as
cover any side-effects that the third flag -fno-tree-loop-im might
have/get in the future.

> +	-x c - -c -o "$$TMP" && \
> +	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
> +	$(NM) "$$TMP" | grep ' U ' > "$$TMP.utest" || true ; \
> +	cmp -s "$$TMP.ubase" "$$TMP.utest",\
> +	-fprofile-update=prefer-atomic)
> +endif
> +export CFLAGS_GCOV
> +

Not directly related with the functional aspects of this patch, but
since all GCOV-related Makefile portions are touched/moved this would be
a good opportunity to follow the pattern of other instrumentation
mechanisms like KCOV, KASAN, etc., that is:

- split out the CFLAGS_GCOV chunk above into a new scripts/Makefile.gcov
  file
- include this file depending on the value of CONFIG_GCOV_KERNEL via
  include-$(CONFIG_GCOV_KERNEL) += scripts/Makefile.gcov
  in the "additional Makefile" section that follows after this
  Makefile position


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

