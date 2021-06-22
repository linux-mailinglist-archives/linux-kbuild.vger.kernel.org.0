Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E1A3B0057
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 11:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFVJgO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 05:36:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41664 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229490AbhFVJgO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 05:36:14 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15M9SEc9129533;
        Tue, 22 Jun 2021 05:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=q/kOB4NKVpOx4buNmAVOSPQSRCs7ghgBdjl2ofeD1UY=;
 b=B3rySooAldKi+TpuBkc68WvK+ISXh17O9NHym2k8b5DygnZNQyfG5uoGPhcV7MIkQA8+
 5u78W72sTaIRWNWyYeqT/4r4B7cFbEW2y6JBFz4Rqf+lYQh5vWDk0Mk4GK7cyWER+0GY
 cYPP5hv/G9YFauG5g68j+oZ+34QBz+gaJQWSrexIRf/gz7F5i76YOmnWU45FUJ6b5O66
 AJaZ5/4lrS/SWR/bwuF4lpMviOJh8PIWz0PfeWaCttWS+1zhmdxZ9YzPEiT0lNh2bQ7i
 A+SU0V4kHseHlgWfMNnrCs7gTyyWJSfznQNF/ud8V515xDb186x6FbTZP383aFP1Alk0 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39bct1h0hh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 05:33:33 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M9T655134078;
        Tue, 22 Jun 2021 05:33:32 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39bct1h0gj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 05:33:32 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M9RbTB000559;
        Tue, 22 Jun 2021 09:33:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3998789bf3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 09:33:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15M9W7Bn34603406
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 09:32:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 32B1CAE051;
        Tue, 22 Jun 2021 09:33:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0CAC4AE04D;
        Tue, 22 Jun 2021 09:33:26 +0000 (GMT)
Received: from osiris (unknown [9.145.20.128])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 22 Jun 2021 09:33:25 +0000 (GMT)
Date:   Tue, 22 Jun 2021 11:33:24 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
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
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 3/3] Kconfig: add
 ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
Message-ID: <YNGuZPl64IwQeF0/@osiris>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-4-ndesaulniers@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621231822.2848305-4-ndesaulniers@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3zDGCVJf9g2k5E222QjL_kpljCj0uR2S
X-Proofpoint-ORIG-GUID: wOSKkkZu1vnWUXVoAF3BJoqRyevFgeXb
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_05:2021-06-21,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0
 suspectscore=0 mlxlogscore=870 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220058
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 04:18:22PM -0700, Nick Desaulniers wrote:
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
> ---
> Changes V1 -> V2:
> * Add ARCH_WANTS_NO_INSTR
> * Change depdendencies to be !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
>   rather than list architectures explicitly, as per Nathan.
> * s/no_profile/no_profile_instrument_function/
> 
>  arch/Kconfig        | 7 +++++++
>  arch/arm64/Kconfig  | 1 +
>  arch/s390/Kconfig   | 1 +
>  arch/x86/Kconfig    | 1 +
>  init/Kconfig        | 3 +++
>  kernel/gcov/Kconfig | 1 +
>  kernel/pgo/Kconfig  | 3 ++-
>  7 files changed, 16 insertions(+), 1 deletion(-)

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
