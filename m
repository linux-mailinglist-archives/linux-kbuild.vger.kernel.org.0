Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9FC65E607
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jan 2023 08:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjAEH2G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Jan 2023 02:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjAEH2F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2023 02:28:05 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938A44BD59;
        Wed,  4 Jan 2023 23:28:03 -0800 (PST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3057M9Cb016137;
        Thu, 5 Jan 2023 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=vPgl6uHLw/VLOqi4bB3zQ3ahi5Ls1wSXBqKR8b4bX5Q=;
 b=D86CAd+LPbZbPNfC84kTzwGxdlLA6Z0VAhLGhC0cIoXNlie/dnPQFfrtboYBJ6W1xqQQ
 De0S5j16cMpbQBjoAlhkoaIdo2MScYJd6my72uRw1exnRiBGaHQoVFXHxsexoRElZzFV
 AYNTdwr9Lpdn0ukDtkZ8qC4Op8A2OGBGKtetkDOUavuMoMctmRQx2ggvAqtkDp2qLxjd
 KKWkBpYELkZUi1cQkAyPj/yoXI9KBMkgWestklIjVMWRS7IgJ+37Z8UehRH/z4ckFl9n
 bos2vSZD03xpNmUQq+miPSuWusUN+pr/YfYQLUqTaVONOlPg3gFNNwq2s3lRe/Ajg/oI zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt3q02dw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:27:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3057PJiE028622;
        Thu, 5 Jan 2023 07:27:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwt3q02da-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:27:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30557dRk021827;
        Thu, 5 Jan 2023 07:27:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
        by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6ed0f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Jan 2023 07:27:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
        by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3057RiEL23396698
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 5 Jan 2023 07:27:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D33DD20043;
        Thu,  5 Jan 2023 07:27:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A567920040;
        Thu,  5 Jan 2023 07:27:44 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Thu,  5 Jan 2023 07:27:44 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, linux-s390@vger.kernel.org
Subject: Re: [PATCH 09/14] s390/vdso: Drop unused '-s' flag from
 KBUILD_AFLAGS_64
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
        <20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org>
Date:   Thu, 05 Jan 2023 08:27:44 +0100
In-Reply-To: <20221228-drop-qunused-arguments-v1-9-658cbc8fc592@kernel.org>
        (Nathan Chancellor's message of "Wed, 04 Jan 2023 12:54:26 -0700")
Message-ID: <yt9dbkndh24v.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9knDhEHCuyEBAbYP-HjbQiZByUEX-ADo
X-Proofpoint-ORIG-GUID: ce9R7N1HDmawW1JV3dY9FhbyG-RkAlj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=843 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301050058
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan Chancellor <nathan@kernel.org> writes:

> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns that KBUILD_AFLAGS_64 contains '-s', which is a linking phase
> option, so it is unused.
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> There appears to be no equivalent for '-s' in GNU as; 'as --help' on
> x86_64 notes that '-s' is ignored and 's390x-linux-gnu-as --help' makes
> no mention of it whatsoever.
>
> Just drop '-s' altogether, as it has been there since the introduction
> of the vDSO, which means it is likely uneeded, given there would likely
> have been a report by this point.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
