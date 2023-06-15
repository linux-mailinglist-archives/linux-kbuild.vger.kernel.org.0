Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6F7314A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jun 2023 11:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241174AbjFOJzm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 05:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343697AbjFOJzB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 05:55:01 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1BC2964
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 02:54:34 -0700 (PDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F9mIQW026424;
        Thu, 15 Jun 2023 09:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yxSXcWQxFv7Zxxu2YWM5DrADtQ3I9tiz8ZnaaW2hsUM=;
 b=L3NOmZw7XHGiIbVBL7IR7EPAZBzH/pe1BKSRAPUtCPB/FxMAVmmhETpjsXWl1BR10UUP
 398KpLlHR79vjhUJ/HRPu4eDqsBMEURpS3gI2KfwYkRxK4NQInlze94WseyCyczj2qE1
 GywSn6xk4L3Adce/6GnRjJnr3GlINkrHtD/AkT9ZO8TnOUra9LOXllCcC1+Efc4fCv+i
 SX0RD6ILIEBn4dAsJD/wZ3okKeo1Xi+Hd3Z2Nanzt4VAcEQuo9glTz5wKZu8E6ZuQk8w
 A0V2xPig1L2UI/4EmBJGx3GhjUh0evcRNcmRk3x5w2XpQR+G09l4h/bMlbYhZ01U6vJX Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r80b4r3ny-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 09:54:29 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35F9nOHx029560;
        Thu, 15 Jun 2023 09:54:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r80b4r3na-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 09:54:29 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F2n5Hp023857;
        Thu, 15 Jun 2023 09:54:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
        by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4tjnb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jun 2023 09:54:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
        by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F9sOmE18023040
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Jun 2023 09:54:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 64CA92004B;
        Thu, 15 Jun 2023 09:54:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4336320043;
        Thu, 15 Jun 2023 09:54:24 +0000 (GMT)
Received: from [9.171.161.239] (unknown [9.171.161.239])
        by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Thu, 15 Jun 2023 09:54:24 +0000 (GMT)
Message-ID: <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
Date:   Thu, 15 Jun 2023 11:54:23 +0200
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
Content-Language: en-US
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
In-Reply-To: <ZIiz4WjIB6r8Gz4l@moria.home.lan>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V1uZWEjgB6A-Qz1lKkelMfHMsLAZDyMW
X-Proofpoint-GUID: FlAN6MjpLg0o-mKwKHFmk-t3a-dhCB3X
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150081
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 13.06.2023 20:22, Kent Overstreet wrote:
> On Mon, Jun 12, 2023 at 06:18:35PM +0200, Peter Oberparleiter wrote:
>> I'm unaware of any kbuild support for setting GCOV_PROFILE for a
>> specific sub-directory from the command line, only from within the
>> associated Makefile. I'm not sure how this could have worked in the past
>> with the provide sample command line.
>>
>> Here's how GCOV_PROFILE evaluation works (from scripts/Makefile.lib):
>>
>> ifeq ($(CONFIG_GCOV_KERNEL),y)
>> _c_flags += $(if $(patsubst n%,, \
>> $(GCOV_PROFILE_$(basetarget).o)$(GCOV_PROFILE)$(CONFIG_GCOV_PROFILE_ALL)),\
>> $(CFLAGS_GCOV))
>> endif
>>
>> This bit of Makefile code determines whether to add the flags needed to
>> enabled gcov profiling (CFLAGS_GCOV) to the compiler flags for the
>> current compilation unit (_c_flags) by looking at the concatenation of
>> the following variables:
>>
>> - GCOV_PROFILE_<target base name>.o
>> - GCOV_PROFILE
>> - CONFIG_GCOV_PROFILE_ALL
>>
>> gcov flags are only added if this concatenation does not start with an
>> "n", and at least one of these variables is set to a non-empty value
>> other than "n" ("y" typically). The "starts with" part is required to
>> enable precedence for the more specific variable, e.g. an "n" in
>> GCOV_PROFILE_filename.o overwrites a "y" in GCOV_PROFILE.
>>
>> As you can see, there is no reference to a GCOV_PROFILE variable that is
>> named after the sub-directory for which profiling should be enabled.
> 
> I've been digging through the git history, and I would swear I
> hallucinated the whole thing except I have the code in ktest for driving
> gcov and I swear it used to work :)
> 
> Anyways - any thoughts on how we might implement this? I really need a
> way to specify directories to enable gcov for _without_ monkey patching;
> that's not a viable workflow in an automated setup.
> 
> It seems like if we can get a list of directory prefixes for a path
> (e.g. given fs/bcachefs/btree_iter.o it would return fs, fs/bcachefs) it
> should be possible to extend the code you referenced.

I'll likely not be able to implement this myself, but if you or anyone
else wants to go that route, here are my thoughts: $(src) should have
the relative source code path that is needed, so here's what needs to be
done:

1. Determine how to handle non-letter/digit/underscore characters in the
   variable name:

   a) GCOV_PROFILE_fs/bcachefs => supported by GNU make [1], though
      discouraged due to possible side-effects
   b) GCOV_PROFILE_fs_bcachefs => might cause overlays, e.g. a/b/c and
      a/b_c both have the same a_b_c suffix

   Personally I'd prefer option b)

2. Define a new Makefile variable that contains $(src) with required
   character replacements (scripts/Kbuild.include might be a good place)

3. Add $(GCOV_PROFILE_$(name_of_that_new_var)) to the code quoted above
   (scripts/Makefile.lib)

4. Document the use of this new Makefile variable in kernel/gcov/Kconfig
   and Documentation/dev-tools/gcov.rst

Since this new path-suffix version would be the first
GCOV_PROFILE-variable that is primarily intended to be specified on the
make command line and not added to a Makefile, it should probably take
precedence over all other versions. To achieve that it would need to be
specified first in the $(patsubst) statement.

Once implemented, one might also consider extending this new support to
other variables like KASAN_SANITIZE or KCOV_INSTRUMENT, since all of
these are implemented the same way. I don't know whether that's useful
in all cases though.

[1] https://www.gnu.org/software/make/manual/make.html#Using-Variables

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D

