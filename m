Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7719D442
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 11:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389998AbgDCJq6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 05:46:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44894 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727924AbgDCJq6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 05:46:58 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0339VTWL098394
        for <linux-kbuild@vger.kernel.org>; Fri, 3 Apr 2020 05:46:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 304r51gxnv-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2020 05:46:57 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <prudo@linux.ibm.com>;
        Fri, 3 Apr 2020 10:46:35 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 3 Apr 2020 10:46:32 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0339kpuS57933880
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 3 Apr 2020 09:46:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CEAAAE051;
        Fri,  3 Apr 2020 09:46:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD1B7AE045;
        Fri,  3 Apr 2020 09:46:50 +0000 (GMT)
Received: from laptop2-ibm.local (unknown [9.145.155.48])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  3 Apr 2020 09:46:50 +0000 (GMT)
Date:   Fri, 3 Apr 2020 11:46:49 +0200
From:   Philipp Rudo <prudo@linux.ibm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jeremy Cline <jcline@redhat.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
        Michal Kubecek <mkubecek@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add dummy toolchains to enable all cc-option
 etc. in Kconfig
In-Reply-To: <20200403090224.24045-1-masahiroy@kernel.org>
References: <20200403090224.24045-1-masahiroy@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040309-0020-0000-0000-000003C0C410
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040309-0021-0000-0000-000022197373
Message-Id: <20200403114649.1c1a149f@laptop2-ibm.local>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-03_05:2020-04-02,2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=880 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030078
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Fri,  3 Apr 2020 18:02:24 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> Staring v4.18, Kconfig evaluates compiler capabilities, and hides CONFIG
> options your compiler does not support. This works well if you configure
> and build the kernel on the same host machine.
> 
> It is inconvenient if you prepare the .config that is carried to a
> different build environment (typically this happens when you package
> the kernel for distros) because using a different compiler potentially
> produces different CONFIG options than the real build environment.
> So, you probably want to make as many options visible as possible.
> In other words, you need to create a super-set of CONFIG options that
> cover any build environment. If some of the CONFIG options turned out
> to be unsupported on the build machine, they are automatically disabled
> by the nature of Kconfig.
> 
> However, it is not feasible to get a full-featured compiler for every
> arch.
> 
> This issue was discussed here:
> 
>   https://lkml.org/lkml/2019/12/9/620
> 
> Other than distros, savedefconfig is also a problem. Some arch subsytems
> periodically resync defconfig files. If you use a less-capable compiler
> for savedefconfig, options that do not meet 'depends on $(cc-option,...)'
> will be forcibly disabled. So, defconfig && savedefconfig may silently
> change the behavior.
> 
> This commit adds a set of dummy toolchains that pretend to support any
> feature.
> 
> Most of compiler features are tested by cc-option, which simply checks
> the exit code of $(CC). The dummy tools are just a shell script that
> exits with 0 in most cases. So, $(cc-option, ...) is evaluated as 'y'.
> 
> There are more complicated checks such as:
> 
>   scripts/gcc-x86_{32,64}-has-stack-protector.sh
>   scripts/gcc-plugin.sh
>   scripts/tools-support-relr.sh
> 
> I tried my best to implement the dummy scripts to pass all checks.
> 
> From the top directory of the source tree, you can do:
> 
>    $ make CROSS_COMPILE=scripts/dummy-tools/ oldconfig
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

look good to me

Reviewed-by: Philipp Rudo <prudo@linux.ibm.com>

Thanks a lot
Philipp

