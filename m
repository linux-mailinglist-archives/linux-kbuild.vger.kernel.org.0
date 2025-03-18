Return-Path: <linux-kbuild+bounces-6232-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E1A66DE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 09:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29E61188C66C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 08:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF971EFFAB;
	Tue, 18 Mar 2025 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CmzPNPa8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794BF1E98F8;
	Tue, 18 Mar 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285898; cv=none; b=bkbFxOha/azGTsRj5RJ5pBkRzinqRBd3Tc5YIRnzn4qE+ukQ9zPsLEszd5cB303VaGp/aTdd8jU0H7o9BZREl5eVMrzTxF+Enxrx3flTAgdJgX7GEjkhVQBTBbI2JvPZ+8bb1Q8wjdeuzyMtcHTm+uHEQA8v3kkf98lktKmqq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285898; c=relaxed/simple;
	bh=t04MAH+UhhpC0J5z8qiHct9TTh5qM5An2PgxUxXai5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYUTvd370f+ARsZUgYFV1fJO09OOxoem0mSuKnfXqcMNVqeKWKdBl03Xz8WX2H+imYG7ivU57g3Ay9onTmjUB/4scO5FqBpr9DrclyTLQqR9SaCquFLABMepbdlrOQFUtIfUo1OHmAvhgi046YXRG3gqrBYWAib2HasJ9JGuddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CmzPNPa8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I0ZVnc022169;
	Tue, 18 Mar 2025 08:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bnc9Gc
	ntkEuPFQxxhHvkX3kp/NDGrPSgZwjvt8T+kPo=; b=CmzPNPa8bXgPdnSIy8vBa+
	l3BJHrplLjQldScjk3Hk/KnRybThKgj7hZlztyJqd0mY7cgWSHC0E8epUND2Pv+I
	3ttb0E08+19Es7Xi7A8rB3liOBK2wDQD68WEJ2HbSdRMrwDNWxaDoSeDswR9eoKA
	s8vJY/UeHUSe0S++hQo0FiCXvMSBFmCwM2hNyYFxMzCxs2lk3TrfC9EYY6YW/+w0
	zbukag+uRafgUxyABhXwmg4Q2yVrlPREh2nM0lRxd6KuByegSy6vqOkOA9oUsEoR
	Ytq2veLsormhBn0Qr8jdr0Cw+Y1h9GzDsFc9vSWMzoqgsFlAWDWhvdztCNE5+tgA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45eks9cvfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 08:18:01 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52I8B4Gs027486;
	Tue, 18 Mar 2025 08:18:00 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45eks9cvff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 08:18:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52I79v91012347;
	Tue, 18 Mar 2025 08:17:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvntsg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 08:17:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52I8HtLw55640324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 08:17:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 890132004D;
	Tue, 18 Mar 2025 08:17:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A38420043;
	Tue, 18 Mar 2025 08:17:55 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Mar 2025 08:17:55 +0000 (GMT)
Date: Tue, 18 Mar 2025 09:17:53 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, kernel test robot <lkp@intel.com>,
        Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        Ingo Molnar <mingo@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
        linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
Message-ID: <20250318081753.8448Abd-hca@linux.ibm.com>
References: <20250311110616.148682-9-ardb+git@google.com>
 <202503131715.Fb6CfjhT-lkp@intel.com>
 <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
 <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
 <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CTVFYbQKTgOn8pGuvcVrtpB-AeXhCMnM
X-Proofpoint-ORIG-GUID: t44MaBqoh1vpfI3A1JPRgvZrlaqjnX3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180056

On Thu, Mar 13, 2025 at 07:29:41PM +0900, Masahiro Yamada wrote:
> On Thu, Mar 13, 2025 at 7:18 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Thu, 13 Mar 2025 at 10:34, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> wrote:
> > > > kernel test robot noticed the following build errors:
> > > >
> > > > [auto build test ERROR on masahiroy-kbuild/for-next]
> > > > [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s390/features linus/master v6.14-rc6 next-20250312]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190926
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> > > > patch link:    https://lore.kernel.org/r/20250311110616.148682-9-ardb%2Bgit%40google.com
> > > > patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
> > > > config: x86_64-randconfig-076-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6CfjhT-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot open file `vmlinux.map' for reading: No such file or directory
> > > >
> > >
> > > Hmm it seems I missed some things in link-vmlinux.sh - I will take a look.
> >
> > We'd need something like the below applied on top - shall I send a v3?
> 
> I will insert this before you patch set.
> https://lore.kernel.org/linux-kbuild/20250313102604.1491732-1-masahiroy@kernel.org/T/#u
...
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
...
> > -vmlinux_link "${VMLINUX}"
> > +vmlinux_link "${VMLINUX}" vmlinux.map
> >
> >  # fill in BTF IDs
> >  if is_enabled CONFIG_DEBUG_INFO_BTF; then

Building linux-next breaks on s390 with DEBUG_INFO_BTF enabled because
of this; just where your addon patch ends:

  LD      vmlinux.unstripped
  BTFIDS  vmlinux
FAILED cannot open vmlinux: No such file or directory
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 255
make[2]: *** Deleting file 'vmlinux.unstripped'
make[1]: *** [/home/builder/linux-next/Makefile:1239: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I guess _something_ like below is needed to fix this (works for
me(tm)):

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4949d0c8c267..51367c2bfc21 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -286,12 +286,12 @@ vmlinux_link "${VMLINUX}"
 
 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF; then
-	info BTFIDS vmlinux
+	info BTFIDS "${VMLINUX}"
 	RESOLVE_BTFIDS_ARGS=""
 	if is_enabled CONFIG_WERROR; then
 		RESOLVE_BTFIDS_ARGS=" --fatal_warnings "
 	fi
-	${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} vmlinux
+	${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} "${VMLINUX}"
 fi
 
 mksysmap "${VMLINUX}" System.map

