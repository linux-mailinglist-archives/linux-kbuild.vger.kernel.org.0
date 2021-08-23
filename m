Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2173F4FBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Aug 2021 19:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhHWRoR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Aug 2021 13:44:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20886 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231338AbhHWRoR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Aug 2021 13:44:17 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17NHZJ1B072729;
        Mon, 23 Aug 2021 13:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Gg5sFM4b+sIW7jMBhQudCGlDJg7nvd0N5gE0RA4oK8w=;
 b=ROKG/5jdL3Tec93hhRBwqHr6muqhhMLNXP3wL1dR2i/7/+trKh8PgnbJhUq7SjAQWDKW
 c/wHScjPvxiX/xu5j0XvvPVnl68GP5qnjKx9dYCzwIqKWHNXDnuX7/7+6HLWBHLtDvfH
 ErAVcS5Hl6lfWGaaOoM+w9igideYpDmJeGzT5N6fTtYGtN6J6C9/xEs2HMgLozhQ8YzL
 Dfu16xON9ZN96S6qKZnHlHY/yrqkKxfWwT7oI7GiDg+M1cPkC6siPjl/dNZLx+PzzH++
 NXONURNt5G9ZFFsi+dtQCBw3I05kVlXDWKXDL2j1aVz659gbAn14mC5CmggNM7tuYGRe 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3amamh3y9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Aug 2021 13:43:32 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NHZfK8077317;
        Mon, 23 Aug 2021 13:43:32 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3amamh3y9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Aug 2021 13:43:32 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NHhTJ8027098;
        Mon, 23 Aug 2021 17:43:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 3ajs48bnhm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Aug 2021 17:43:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 17NHdlGV53805480
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Aug 2021 17:39:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 480BBA4055;
        Mon, 23 Aug 2021 17:43:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E79ACA406B;
        Mon, 23 Aug 2021 17:43:25 +0000 (GMT)
Received: from osiris (unknown [9.145.169.88])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 23 Aug 2021 17:43:25 +0000 (GMT)
Date:   Mon, 23 Aug 2021 19:43:24 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 2/7] s390: replace cc-option-yn uses with cc-option
Message-ID: <YSPePKNwZ/znykqf@osiris>
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817002109.2736222-3-ndesaulniers@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UtT47z8QGmI0ydM34YlLL3dsbKiL0Ok9
X-Proofpoint-GUID: 83Pr5PXP8r-T7XJ19xXKk76OGBSF74gm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-23_04:2021-08-23,2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=735 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230120
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 05:21:04PM -0700, Nick Desaulniers wrote:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
> 
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
> 
> This allows us to pursue removing cc-option-yn.
> 
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/s390/Makefile | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>
