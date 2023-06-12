Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADC172CB5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 18:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbjFLQUT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 12:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbjFLQTt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 12:19:49 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73396173C
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 09:19:31 -0700 (PDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGFpwZ029811;
        Mon, 12 Jun 2023 16:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8xFmw/39N6IcNnrv8IU8IEPFi2wXMq7/ST7Nq1i97uU=;
 b=lcVjMpCTHFobWtBGSHVgI2Fd6e9HpFPwuOHM+1nAhPs72goGghGP0Dduz2YIDa4lcKyI
 nZbX4zXW/wh14AEb/qIR2KGwVnHZ1H8keBqpPzll5iQB/X9xMvp33cabVsPoY1E1KOdu
 rzHsPWQTZg8hqev+/kxE7BlJTr04McTj/ofHoCaTclE6huF0DW0ygiacIQ7qev8PQk7h
 E85sPI0FCEeoRA95wCv2eNrDP04IeogUUa/c2HsBo5X5R6iTVOUOVXzX09nW4JBoFCdv
 AqFdhl84Or8liZi0P9G1TKLzBRqeCIU50P8dKnAg0q91ZILu43+8eZ/ivDcVsifbFFSj ww== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r65v91h6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 16:19:24 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35CG7VUG002301;
        Mon, 12 Jun 2023 16:19:24 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r65v91h5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 16:19:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35C4xjw7014687;
        Mon, 12 Jun 2023 16:19:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt51kcj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 16:19:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35CGJK2957737576
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jun 2023 16:19:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 24C6B20049;
        Mon, 12 Jun 2023 16:19:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0252A20040;
        Mon, 12 Jun 2023 16:19:20 +0000 (GMT)
Received: from [9.171.161.156] (unknown [9.171.161.156])
        by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Mon, 12 Jun 2023 16:19:19 +0000 (GMT)
Message-ID: <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
Date:   Mon, 12 Jun 2023 18:18:35 +0200
MIME-Version: 1.0
Subject: Re: Specifying CFLAGS for a directory on the command line
To:     Kent Overstreet <kent.overstreet@linux.dev>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
Content-Language: en-US
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <ZIO3leNyqOeJw6u3@moria.home.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sKzQD_yXEufslw33tYOdkeCPmOeDgPjn
X-Proofpoint-GUID: 25rPnYaAFb1VE1PKFdKRnI6p8Yg99HRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=898 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120138
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10.06.2023 01:36, Kent Overstreet wrote:
> Adding Peter to the cc, because I just realized gcov has a maintainer :)
> 
> On Fri, Jun 09, 2023 at 04:12:56PM -0700, Nick Desaulniers wrote:
>> On Fri, Jun 9, 2023 at 4:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>>>
>>> On Fri, Jun 9, 2023 at 3:23 PM Kent Overstreet
>>> <kent.overstreet@linux.dev> wrote:
>>>>
>>>> Hello kbuild maintainers & list,
>>>>
>>>> Years ago I used to be able to specify additional CFLAGS for a specific
>>>
>>> Probably cause it's KCFLAGS ;)
>>>
>>> I used this yesterday, it works.
>>>
>>>> subdirectory on the command line, which I used for enabling gcov
>>
>> Ah, for a specific subdir? No I've not seen that, at least from the
>> command line.  Such flags can be specified via Makefile
>> `subdir-ccflags-y`.
> 
> Sorry, not CFLAGS, I misread my old code - it's just a make variable.
> 
> From Documentation/dev-tools/gcov.rst, you enable gcov on a specific
> subdirectory by editing that directory's makefile, and adding
> 
> GCOV_PROFILE := y
> 
> or, for a specific file within that directory,
> 
> GCOV_PROFILE_main.o := y
> 
> So, if appending a file to GCOV_PROFILE works, why not a path?
> 
> This used to work - my old code would pass GCOV_PROFILE_fs_bcachefs=y on
> the make command line, but doesn't anymore.

I'm unaware of any kbuild support for setting GCOV_PROFILE for a
specific sub-directory from the command line, only from within the
associated Makefile. I'm not sure how this could have worked in the past
with the provide sample command line.

Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):

ifeq ($(CONFIG_GCOV_KERNEL),y)
_c_flags += $(if $(patsubst n%,, \
$(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)),\
$(CFLAGS_GCOV))
endif

This bit of Makefile code determines whether to add the flags needed to
enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
current compilation unit (_c_flags) by looking at the concatenation of
the following variables:

- GCOV_PROFILE_<target base name>.o
- GCOV_PROFILE
- CONFIG_GCOV_PROFILE_ALL

gcov flags are only added if this concatenation does not start with an
"n", and at least one of these variables is set to a non-empty value
other than "n" ("y" typically). The "starts with" part is required to
enable precedence for the more specific variable, e.g. an "n" in
GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.

As you can see, there is no reference to a GCOV_PROFILE variable that is
named after the sub-directory for which profiling should be enabled.

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

