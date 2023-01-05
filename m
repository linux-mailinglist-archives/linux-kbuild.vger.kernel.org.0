Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B5865E629
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jan 2023 08:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjAEHjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Jan 2023 02:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjAEHjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2023 02:39:11 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141EA50F48;
        Wed,  4 Jan 2023 23:39:11 -0800 (PST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3057Tjor020514;
        Thu, 5 Jan 2023 07:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=6/5Aco2Nacgnq1R/RDf8a9fgyuB1yy3yqYXtlql8A2E=;
 b=ESmzlfbTHrzX7fjEFMlBQaA7/ISSFtktKkMgzLLUcP6B4egnIdNPNBHE9WfNVFpDsDkj
 9Nq5lBRl5DeVUl4pK1zQD/pQXWECNn0eXG2UQew/UntF69+HSuqeIBNzUcT4PPZi12zT
 4tcNxQRtDWLXRAn4W/twW2K0BJLu6snlZSj0DrTrlkN7Y1kUX4r+9YE9Th6Rs+XqGv58
 ouZMsrdWOrDi2h7/u6KKt10CSur9p+hKe0C1+o0U14gIGVisYls4GaGmwDXZ4yAML9BN
 6blpj21Zoc26NzyYrZXmkgtwYQgt8iRGo/9tmdUyTOXNseQPYAd/DiYsRVQLXODILKj9 xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt79g730-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:38:57 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3057WbUW029306;
        Thu, 5 Jan 2023 07:38:56 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt79g72c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:38:56 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304IU95N000322;
        Thu, 5 Jan 2023 07:33:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
        by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6vp1t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:33:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
        by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3057Xo8r50856420
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Jan 2023 07:33:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9488120040;
        Thu,  5 Jan 2023 07:33:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 531C520043;
        Thu,  5 Jan 2023 07:33:50 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu,  5 Jan 2023 07:33:50 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, linux-s390@vger.kernel.org
Subject: Re: [PATCH 11/14] s390/purgatory: Remove unused '-MD' and
 unnecessary '-c' flags
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
        <20221228-drop-qunused-arguments-v1-11-658cbc8fc592@kernel.org>
Date:   Thu, 05 Jan 2023 08:33:50 +0100
In-Reply-To: <20221228-drop-qunused-arguments-v1-11-658cbc8fc592@kernel.org>
        (Nathan Chancellor's message of "Wed, 04 Jan 2023 12:54:28 -0700")
Message-ID: <yt9d358ph1up.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d74QEH0TYv0feBi_UGwGR7t0DiRIOqb0
X-Proofpoint-ORIG-GUID: l6XZbvx7z9wXTEy2uAUv8p4SOynfEtz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 mlxlogscore=549 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050062
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan Chancellor <nathan@kernel.org> writes:

> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns while building objects in the purgatory folder:
>
>   clang-16: error: argument unused during compilation: '-MD' [-Werror,-Wunused-command-line-argument]
>
> '-MMD' is always passed to the preprocessor via c_flags, even when
> KBUILD_CFLAGS is overridden in a folder, so clang complains the addition
> of '-MD' will be unused. Remove '-MD' to clear up this warning, as it is
> unnecessary with '-MMD'.
>
> Additionally, '-c' is also unnecessary, remove it while in the area.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
