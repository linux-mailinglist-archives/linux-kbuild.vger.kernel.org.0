Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5998737E7F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jun 2023 11:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjFUI4y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jun 2023 04:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbjFUI4X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2023 04:56:23 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0951BFC
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2023 01:54:58 -0700 (PDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8fdsW028430;
        Wed, 21 Jun 2023 08:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z11CUdLpSzVObfmKPg9geiitQPgbVE2r44/Z3KZQBXc=;
 b=d+R1IED183dsV/y5wpT1o29sf0W4uqkFxfRixDTU3fltmCENowxvK36UIBXBMKlD9mEu
 ds4e3nXuJbb1v2rFIWKyoLXVc+daqlyqJggly69Z85Mf8TZHNUzHpBow19tCQsE89y51
 jClgHzOjQqf+6g6KB/ywol1O9hzK/riF2NyGtbsqoodQ7XqKJzFFTd/n/rssVdAIXdKr
 giwIamlMMO/s3ALybkxHB++tvjqnVTATMZ5HrvxaW7vUNx1i3u8rj00wTOsVZhinXIDU
 N/gxcDvmrXgqlzVIRJPwsqZ3N/ONmzm+hKoNTEPXW1lqZLUnQa38LjzblIqvDHX7ZTu+ Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgnh0a7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jun 2023 08:54:24 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8flOn031130;
        Wed, 21 Jun 2023 08:54:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwgnh097-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jun 2023 08:54:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35KNkmrB026253;
        Wed, 21 Jun 2023 08:54:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e2n2n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Jun 2023 08:54:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8sKTV63832506
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 21 Jun 2023 08:54:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4BA4C20040;
        Wed, 21 Jun 2023 08:54:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 20EFF2004D;
        Wed, 21 Jun 2023 08:54:20 +0000 (GMT)
Received: from [9.152.212.241] (unknown [9.152.212.241])
        by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Wed, 21 Jun 2023 08:54:20 +0000 (GMT)
Message-ID: <e773effa-29a0-0e57-36e8-9b4cba1a494f@linux.ibm.com>
Date:   Wed, 21 Jun 2023 10:54:10 +0200
MIME-Version: 1.0
Subject: Re: Specifying CFLAGS for a directory on the command line
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
 <c45f6e75-da4e-e496-e3c4-4fdfea29104a@linux.ibm.com>
 <ZIz+NFzAnyAKmV9u@moria.home.lan>
Content-Language: en-US
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <ZIz+NFzAnyAKmV9u@moria.home.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7y1ci-_y92qIgVcXThbhve_CkUFSXggK
X-Proofpoint-GUID: nC8jiQTB7n3cqaibM3ZW7wME45OJ8SPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210071
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 17.06.2023 02:28, Kent Overstreet wrote:
> On Fri, Jun 16, 2023 at 08:10:44PM +0200, Peter Oberparleiter wrote:
>> Not that I know of. Here's how it could be made to work using Makefile
>> magic alone (as a pure programming exercise :)
>>
>> This will expand a directory to a list of all parent directories:
>>
>> # expand_parents(a/b/c) = a/b/c a/b a
>> expand_parents2 = $(if $(subst .,,$(1)),$(call expand_parents,$(1)),)
>> expand_parents  = $(1) $(call expand_parents2,$(patsubst %/,%,$(dir $(1))))
>>
>> This list could then be turned into variable suffixes:
>>
>> # flatten_dirs(a/b/c) = a_b_c a_b a
>> flatten_dirs = $(subst /,_,$(call expand_parents,$(1)))
>>
>> And finally the resulting list of suffixed variables could be evaluated:
>>
>> # eval_vars(X_,a/b/c) = $(X_a_b_c) $(X_a_b) $(X_a)
>> eval_vars = $(foreach var,$(call flatten_dirs,$(2)),$($(1)$(var)))
>>
>> So a call like this
>>
>> $(call eval_vars,GCOV_PROFILE_,a/b/c)
> 
> I just hooked it up and it works perfectly - I owe you a beer :)

Glad to be of help!

>> would evaluate to the concatenation of the contents of the following
>> variables:
>>
>> GCOV_PROFILE_a_b_c
>> GCOV_PROFILE_a_b
>> GCOV_PROFILE_a
>>
>> The first non-empty variable would then determine whether profiling
>> should be enabled for the associated source file or not. This would even
>> implement the correct order of precedence (specific to generic)
>>
>> Not sure if this amount of magic is suitable for kbuild though. An
>> alternative, less complex approach would be to move this decision logic
>> to a helper script.
> 
> Now that I've spent a couple days starting to wrap my head more around
> make, it doesn't look terribly magic to me. I'd hate to have to spawn
> off a subshell for this.

Leaving the method of how this input data is processed inside kbuild
aside for a moment, I'm wondering if specifying the list of directories
via a CONFIG symbol instead of make parameters would work equally well.

Initially I thought this would be too complex to process using Makefile
functions alone, but with the logic shown above this could be relatively
simple to achieve. Also having given this some more thought, a CONFIG
symbol indeed seems like a better fit considering aspects such as
reproducibility of builds and config symbol documentation.

The CONFIG symbols could look something like:

- CONFIG_GCOV_PROFILE_INCLUDE: list of directories to include in
  profiling
- CONFIG_GCOV_PROFILE_EXCLUDE: list of directories to exclude from
  profiling

where the precedence would be: exclude list > include list >
GCOV_PROFILE_* specified in Makefiles > CONFIG_GCOV_PROFILE_ALL

Sub-directory handling could work similar to how you described it for
the make parameter, i.e. an include/exclude statement for a parent
directory would also apply to sub-directories.

What this approach work for your use case? Note that I'm not asking you
to implement this - I just want to get a better picture of how a generic
solution could look like.

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

