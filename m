Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5997465E623
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jan 2023 08:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjAEHcP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Jan 2023 02:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjAEHcI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2023 02:32:08 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0300544FE;
        Wed,  4 Jan 2023 23:32:01 -0800 (PST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3057I2uJ001576;
        Thu, 5 Jan 2023 07:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=p3DacVSTyqmzDWwwt294UVrAfcatpc65oXEjmfUPbnk=;
 b=o64Cp53lpDdcvuhlxgVkdlXaEzVkJbFqkuAKyapc1fJFR+MUEpyZI2ZYOylbMQiZBLTM
 e1FVAbXAQHUIyN2bH8k/+I1IDgI9Djd8EJubSG9TIf7i9XsKHmyUghKY3cNcTDUIN0b/
 YNnEOBm/on+ivi3N+tmLc/OqWmjg7I8opmVxk1rhFd1RdgaPB4e1J4SWeY68q66cQGuc
 YSZeyQqjzWvLbKKYPYH2mqSUDyeesyL9hT7qUbVzaqLGbijUKzOi8PvzUAoyl/JuGstZ
 rq2sdOcN48Jt4iKVY3bPCDSuAqMYXojN0V173Cb0quUR7iBHnzLuFdH9DIv5TTUPCVNU wg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt1h082r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:31:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3057U3uO009603;
        Thu, 5 Jan 2023 07:31:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt1h081k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:31:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304L3mZO004570;
        Thu, 5 Jan 2023 07:31:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
        by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6ed4x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:31:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
        by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3057VabH40632694
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Jan 2023 07:31:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CD4532004D;
        Thu,  5 Jan 2023 07:31:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9B49220049;
        Thu,  5 Jan 2023 07:31:36 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu,  5 Jan 2023 07:31:36 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, linux-s390@vger.kernel.org
Subject: Re: [PATCH 10/14] s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
        <20221228-drop-qunused-arguments-v1-10-658cbc8fc592@kernel.org>
Date:   Thu, 05 Jan 2023 08:31:36 +0100
In-Reply-To: <20221228-drop-qunused-arguments-v1-10-658cbc8fc592@kernel.org>
        (Nathan Chancellor's message of "Wed, 04 Jan 2023 12:54:27 -0700")
Message-ID: <yt9d7cy1h1yf.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oElCX1N-T6MB9pFO-RGMp8mk-xSpOxsw
X-Proofpoint-ORIG-GUID: gYVqnMPxMrKCoC_LRjouzt6yrDpcHcxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=644
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050062
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
> points out that there is a linking phase flag added to CFLAGS, which
> will only be used for compiling
>
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
>
> '-shared' is already present in ldflags-y so it can just be dropped.
>
> Fixes: 2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
