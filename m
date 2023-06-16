Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2A8733662
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 18:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjFPQqC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 12:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244736AbjFPQqB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 12:46:01 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52872D5D
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jun 2023 09:45:58 -0700 (PDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GGRHJe018467;
        Fri, 16 Jun 2023 16:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DStB4zoCzvDOUiYXu8j/frZfHPez+/KybFGErSZjjLw=;
 b=F6raaFTTiF3pMQux++0vi55E6DcoYAuy0U732zracJnhMiRTd4uZ8AMYf77CzvOU3qpi
 rnDZqsqcD05Aupa7jKR1BQhbEJrIQo+EhIceLg/kJ3T/OlsKdf+cm4fkqM3pPMVEpW0Q
 qphpJXZidQGItrZOA9FR6rnx0k/mb/sf6lvHAXg5mOGBdZ6ntRZRdhaL+PkGzp5Ln4Ps
 5wR3F4o4z52bgdXVfsb6PSJQ6LdFi4wfTC4xXxDNfIahi4RhuqylPGP6XzWzffPwAl0b
 ilfjq9rFBoTiLOWjvJpe6YjsDG34Dwkd0/poldxul2+p/SCADXmnk4xRWHaHxD7wvjqm Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8u918bpj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 16:45:53 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GGbYVn013550;
        Fri, 16 Jun 2023 16:45:52 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8u918bnw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 16:45:52 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G9U2hH007026;
        Fri, 16 Jun 2023 16:45:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
        by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r4gt53aau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 16:45:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GGjmPr60424652
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jun 2023 16:45:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 453C62004E;
        Fri, 16 Jun 2023 16:45:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2CA6E2004D;
        Fri, 16 Jun 2023 16:45:48 +0000 (GMT)
Received: from [9.171.152.49] (unknown [9.171.152.49])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jun 2023 16:45:48 +0000 (GMT)
Message-ID: <625f2720-9664-4cab-a4c6-b30c4b902c54@linux.ibm.com>
Date:   Fri, 16 Jun 2023 18:45:46 +0200
MIME-Version: 1.0
Subject: Re: Specifying CFLAGS for a directory on the command line
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
Content-Language: en-US
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7U3rrhNrQFUoqu8SUPH0AHyUE2UBvGQy
X-Proofpoint-GUID: qp7oMgFIb88F8SBEM_d2INNvZHonWizM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160149
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15.06.2023 12:39, Masahiro Yamada wrote:
> On Thu, Jun 15, 2023 at 6:54 PM Peter Oberparleiter
> <oberpar@linux.ibm.com> wrote:
>>
>> On 13.06.2023 20:22, Kent Overstreet wrote:
>>> On Mon, Jun 12, 2023 at 06:18:35PM +0200, Peter Oberparleiter wrote:
>>>> I'm unaware of any kbuild support for setting GCOV_PROFILE for a
>>>> specific sub-directory from the command line, only from within the
>>>> associated Makefile. I'm not sure how this could have worked in the past
>>>> with the provide sample command line.
>>>>
>>>> Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):
>>>>
>>>> ifeq ($(CONFIG_GCOV_KERNEL),y)
>>>> _c_flags += $(if $(patsubst n%,, \
>>>> $(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)),\
>>>> $(CFLAGS_GCOV))
>>>> endif
>>>>
>>>> This bit of Makefile code determines whether to add the flags needed to
>>>> enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
>>>> current compilation unit (_c_flags) by looking at the concatenation of
>>>> the following variables:
>>>>
>>>> - GCOV_PROFILE_<target base name>.o
>>>> - GCOV_PROFILE
>>>> - CONFIG_GCOV_PROFILE_ALL
>>>>
>>>> gcov flags are only added if this concatenation does not start with an
>>>> "n", and at least one of these variables is set to a non-empty value
>>>> other than "n" ("y" typically). The "starts with" part is required to
>>>> enable precedence for the more specific variable, e.g. an "n" in
>>>> GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.
>>>>
>>>> As you can see, there is no reference to a GCOV_PROFILE variable that is
>>>> named after the sub-directory for which profiling should be enabled.
>>>
>>> I've been digging through the git history, and I would swear I
>>> hallucinated the whole thing except I have the code in ktest for driving
>>> gcov and I swear it used to work :)
>>>
>>> Anyways - any thoughts on how we might implement this? I really need a
>>> way to specify directories to enable gcov for _without_ monkey patching;
>>> that's not a viable workflow in an automated setup.
>>>
>>> It seems like if we can get a list of directory prefixes for a path
>>> (e.g. given fs/bcachefs/btree_iter.o it would return fs, fs/bcachefs) it
>>> should be possible to extend the code you referenced.
>>
>> I'll likely not be able to implement this myself, but if you or anyone
>> else wants to go that route, here are my thoughts: $(src) should have
>> the relative source code path that is needed, so here's what needs to be
>> done:
>>
>> 1. Determine how to handle non-letter/digit/underscore characters in the
>>    variable name:
>>
>>    a) GCOV_PROFILE_fs/bcachefs => supported by GNU make [1], though
>>       discouraged due to possible side-effects
>>    b) GCOV_PROFILE_fs_bcachefs => might cause overlays, e.g. a/b/c and
>>       a/b_c both have the same a_b_c suffix
>>
>>    Personally I'd prefer option b)
>>
>> 2. Define a new Makefile variable that contains $(src) with required
>>    character replacements (scripts/Kbuild.include might be a good place)
>>
>> 3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
>>    (scripts/Makefile.lib)
>>
>> 4. Document the use of this new Makefile variable in kernel/gcov/Kconfig
>>    and Documentation/dev-tools/gcov.rst
>>
[...]

> I do not think it is a sensible proposal.

Does your objection apply to the proposed implementation, or the feature
request itself? If the former, what aspect of the approach do you
consider problematic?

> Another idea could be something like
> CONFIG_GCOV_PROFILE_PATH=fs/bcachefs
> or isn't it possible to filter dynamically?

Using CONFIG symbols would be another way to specify the input list of
directories that should be instrumented for GCOV profiling. The output
would still need to be a different c_flags value for source files in
these directories though. I would assume that getting this information
from CONFIG values into c_flags would be a more intrusive change
compared to the route via a Makefile variable.

> I think ftrace can change filtering dynamically.
> I do not know if it is possible for GCOV because I do not use it.

GCOV instrumentation is a per-source file build-time decision. There's
no way to dynamically turn it on or off during run-time.

> But, the best would be to not implement it at all
> until we know that it is a wide demand.
> The upstream is not a place to cater to every feature request.

I don't feel very strongly about this specific feature - it seemed to me
that it could be implemented in a non-intrusive way and it provides
value to at least one developer.


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

