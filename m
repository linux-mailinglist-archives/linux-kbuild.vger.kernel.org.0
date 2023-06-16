Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885037337E9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 20:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjFPSLH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 14:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjFPSLG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 14:11:06 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9D430F8
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jun 2023 11:11:02 -0700 (PDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GHkaPQ011767;
        Fri, 16 Jun 2023 18:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uEphZHv7DytLY5dUPMYix+ADm7prL48OZhB6SFyXnTk=;
 b=YeIy+AKvf17bsdDG7hWTHAepsCDf78tkyB7KKBby8ihf/5jNZBoxPzAt5XY6T10OVw5m
 lnUG7xGO/wHkiQck1tlRbCpr4gEsgeaYJSStX+oXQwzMh1S5E6xANgbIqYdhmEl6UCkR
 kDmKQzKH7BnJMcPpJkyX0KTZUIXDlZ9p/udHABVxrYk/zCwEr0BvS+rVRQEWlekhhknS
 +iF5m3/xHF3pUvm7OeahbhDFhSmwB7Y23uwLu2B3cbUvBGY0X9a8DqeupuF1uMwj2xq7
 FKNPIq9p7efM2ON+9JxLRpasZGfkWJxGP+AROHgmRB9u9zuKFg3eTCJJttxw0wePlJ+f kg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8vedrk9d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 18:10:52 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GI2LQw029570;
        Fri, 16 Jun 2023 18:10:52 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8vedrk8t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 18:10:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35GFGKIp006708;
        Fri, 16 Jun 2023 18:10:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
        by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4ubuf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jun 2023 18:10:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
        by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GIAlvo35914424
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jun 2023 18:10:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0AB152004B;
        Fri, 16 Jun 2023 18:10:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD74320040;
        Fri, 16 Jun 2023 18:10:46 +0000 (GMT)
Received: from [9.171.152.49] (unknown [9.171.152.49])
        by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jun 2023 18:10:46 +0000 (GMT)
Message-ID: <c45f6e75-da4e-e496-e3c4-4fdfea29104a@linux.ibm.com>
Date:   Fri, 16 Jun 2023 20:10:44 +0200
MIME-Version: 1.0
Subject: Re: Specifying CFLAGS for a directory on the command line
Content-Language: en-US
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <ZIwDIOxq3rE/8QUV@moria.home.lan>
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <ZIwDIOxq3rE/8QUV@moria.home.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 40FWhPkjijPpQ5OfzuGyx4iBMwctSwSq
X-Proofpoint-GUID: 46_V3m81juiXm6ZscTPP26I7Rb_aSbvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306160163
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16.06.2023 08:37, Kent Overstreet wrote:
> On Thu, Jun 15, 2023 at 11:54:23AM +0200, Peter Oberparleiter wrote:
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
> 
> Agreed, feels more consistent
> 
>> 2. Define a new Makefile variable that contains $(src) with required
>>    character replacements (scripts/Kbuild.include might be a good place)
>>
>> 3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
>>    (scripts/Makefile.lib)
> 
> So this is where I was getting stuck, because we really want this to
> apply to subdirectories (e.g. GCOV_PROFILE_fs_xfs should really also
> apply to fs/xfs/libxfs).
> 
> Do we have existing code for generating a list of path prefixes for a
> given path?

Not that I know of. Here's how it could be made to work using Makefile
magic alone (as a pure programming exercise :)

This will expand a directory to a list of all parent directories:

# expand_parents(a/b/c) = a/b/c a/b a
expand_parents2 = $(if $(subst .,,$(1)),$(call expand_parents,$(1)),)
expand_parents  = $(1) $(call expand_parents2,$(patsubst %/,%,$(dir $(1))))

This list could then be turned into variable suffixes:

# flatten_dirs(a/b/c) = a_b_c a_b a
flatten_dirs = $(subst /,_,$(call expand_parents,$(1)))

And finally the resulting list of suffixed variables could be evaluated:

# eval_vars(X_,a/b/c) = $(X_a_b_c) $(X_a_b) $(X_a)
eval_vars = $(foreach var,$(call flatten_dirs,$(2)),$($(1)$(var)))

So a call like this

$(call eval_vars,GCOV_PROFILE_,a/b/c)

would evaluate to the concatenation of the contents of the following
variables:

GCOV_PROFILE_a_b_c
GCOV_PROFILE_a_b
GCOV_PROFILE_a

The first non-empty variable would then determine whether profiling
should be enabled for the associated source file or not. This would even
implement the correct order of precedence (specific to generic)

Not sure if this amount of magic is suitable for kbuild though. An
alternative, less complex approach would be to move this decision logic
to a helper script.


-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

