Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845BE3B0066
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 11:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhFVJiV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 05:38:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23226 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229656AbhFVJiV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 05:38:21 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15M9XiCf123200;
        Tue, 22 Jun 2021 05:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WC0tkA+LfSmIpYeI2CWlCZEalhUSsowt3maCuijtwfU=;
 b=Llm1esQEzn4NvOpnWxW9C1ZWzunY/St0iU1Ct7LiQ8x2RtEx0ZR6hIth3PfNu0xz6Tyd
 thCk4rtuTIKwx1Z5iqIIO6/84Aw/Vkd/7jA4Gra8bMLsi8aJAvlLJvEnKl14TzSei0xq
 Zb5TpkRBdMvENz58Gavofp5T+h/A9L5PMidd9FMIZkMrEpk+PRaMTFB9NwVnQzVSTfEF
 Omwkrlc9Z1ZkyJuw3h65I4dXTZa5hbXx018vkN0NBSeWcgjxfB3M6K0lsJrB7UBruET+
 9mkAP0KEU61AxroxHjve0dXJgAUbmdT9MSSvG4jz4P1nxMO05FpU3+cr1xC4r/OtPn/5 xA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39bahpcshc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 05:35:44 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M9Xlwq123665;
        Tue, 22 Jun 2021 05:35:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39bahpcsgf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 05:35:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M9RJYx013348;
        Tue, 22 Jun 2021 09:35:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma06ams.nl.ibm.com with ESMTP id 3997uh9bck-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 09:35:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15M9ZbLQ8126910
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 09:35:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF92852050;
        Tue, 22 Jun 2021 09:35:37 +0000 (GMT)
Received: from [9.145.95.76] (unknown [9.145.95.76])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EBB7252067;
        Tue, 22 Jun 2021 09:35:36 +0000 (GMT)
Subject: Re: [PATCH v2 3/3] Kconfig: add
 ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-4-ndesaulniers@google.com>
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
Message-ID: <78555de2-a5f7-5341-a4a0-0f39d0439939@linux.ibm.com>
Date:   Tue, 22 Jun 2021 11:35:37 +0200
In-Reply-To: <20210621231822.2848305-4-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YrLh_3Usz6N0IB0tfVCnbg5tdhsi_6et
X-Proofpoint-GUID: eIjjVl3RwxBbX08ofQ_FmyMMr_8wTQZt
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_05:2021-06-21,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0
 mlxlogscore=791 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220061
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 22.06.2021 01:18, Nick Desaulniers wrote:
> We don't want compiler instrumentation to touch noinstr functions, which
> are annotated with the no_profile_instrument_function function
> attribute. Add a Kconfig test for this and make PGO and GCOV depend on
> it.
> 
> If an architecture is using noinstr, it should denote that via this
> Kconfig value. That makes Kconfigs that depend on noinstr able to
> express dependencies in an architecturally agnostic way.
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Looks good to me - thanks for resolving this problem!

Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>


Regards,
  Peter

-- 
Peter Oberparleiter
Linux on Z Development - IBM Germany
