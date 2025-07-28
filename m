Return-Path: <linux-kbuild+bounces-8225-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FBFB13C96
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 16:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC256545085
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 14:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB02426E710;
	Mon, 28 Jul 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DoMguOze"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AE26E6F0;
	Mon, 28 Jul 2025 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711094; cv=none; b=qfZDLveDDgVe8Y0puNFf8TtehaXDW4f5UNOcMN9ETXfph5QoKqKJQwJTHVkgM5DRgw9pBgZ60xTAE16w54/GOhpbkNUQVT6x/z1ApSxTCfM2DTqW7bEUPAU6KWsp7ahKtYIrr5NCQpObP+ZX1a6bboR06kyz9Nue33agDLzXcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711094; c=relaxed/simple;
	bh=CI/yevIDyBp71uEQw3d/EL+lMntpWc+YQANa9Zs8Z2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tf+e6KUuWXjt6GxJk+neI5doRDhP04/AfQInwnV47C7CWVvxEYV08pLdQ4Ekph9ETyn3GSdRDPhuGEq69r0veWc0KFj7pQSNmMXmLcf0UghsTLhY8U195CpADa3MR0YFNg04WvQxQQfX/PkPJNcmceCyBqegJPdSrdOcQTfsM+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DoMguOze; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SBtdLN009346;
	Mon, 28 Jul 2025 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=i2U2O4RspzF14U3dm8LHYZnjN0Kqfa
	FF5JpDSOeuaNM=; b=DoMguOzefmus04p+8vNCB11gEibGhN0h4otrKiObsmOKU7
	lGmjD7wMoCkGqO30ZmmNefjEUQgetT6qyeH0D0ytxRLIsIcqkZKUlmyOHA3bU1L0
	Twl52sD1ZJN1977HZNErqvVYqaJI4s92QYm+fvxnWe5vGWesrZfXkGUPNgPH3Uhz
	kBujwKj/qtMuKGBOcG3bAVHFxjcKfUVuYM6kPWoYVGu48g7DHzBEIZJ5NM9vwvNR
	8lst+Sl+34ByEYcWo846RS+udu2ohjH2QIYNsI4sH4Ke8vYLlr5crPgblda6Vxtn
	H2JIpGRfjTwW3jeaMzwnNJkPUP5viRAmygFQkBSA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qau1cp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 13:57:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56SDhCe1028436;
	Mon, 28 Jul 2025 13:57:57 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qau1cp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 13:57:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56SB3BqF006209;
	Mon, 28 Jul 2025 13:57:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 485bjkwupr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 13:57:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56SDvsJ423200032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Jul 2025 13:57:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA59720043;
	Mon, 28 Jul 2025 13:57:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A035C20040;
	Mon, 28 Jul 2025 13:57:54 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 28 Jul 2025 13:57:54 +0000 (GMT)
Date: Mon, 28 Jul 2025 15:57:53 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 03/10] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <20250728135753.432695A72-agordeev@linux.ibm.com>
References: <cover.1753354215.git.legion@kernel.org>
 <d44055fc22d4a53b7f87758d31cb4d640c8f8cca.1753354215.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44055fc22d4a53b7f87758d31cb4d640c8f8cca.1753354215.git.legion@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Xvz6OUF9 c=1 sm=1 tr=0 ts=688781e6 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=rHYKPGy_-tya3TJrZfwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEwMSBTYWx0ZWRfX5mbUUaSe8Ze8
 CqIQvpMjpTMIa5S/g5FvUcpd84rEtS+Wm/VURZnYFFcxMdDJWnIZgnrZcQi3xzn7jy5HY7DgtDd
 WGJIzveEPG20//C76GJNMU+TcTteB86im7Q5vUYIBKxjw6uZIlFzcKhfMk8aUOQgsOq1JaO8d83
 LUF+YkHNr/r+Ux7p+PvNDPEG+cz5goSpP4yvUEsimuRalj794HbIu22sZjB7s8dKNv7KRLw3dhI
 p4au0XO3BmSF8x+VPLwH/+CN5kJVezPR5aqTMc7ec/930n8a5MJnnhFF7BKNyN8x3lGbtF+sdEp
 WZOWHcFVywW9YTanKOayG8xAetKZbzxf5AOJKVV0SfrxHA9cdmic//KZDyffrqr0L0UPbPYp6VP
 asEXGnX6v445dScb/OfWUbTdKJfrnKAKattTaXY/xEV0hD3PTLW6KcAh214I7tPuhofpwpc4
X-Proofpoint-GUID: 0RKHxx8L2cL8NZtgOlEV5ZFUPQHS2u_p
X-Proofpoint-ORIG-GUID: GwHFiBgWi0TtGlkotaFY7DAwNW6bUlc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=100 spamscore=100 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 phishscore=0 mlxlogscore=-999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280101

On Thu, Jul 24, 2025 at 03:49:40PM +0200, Alexey Gladkov wrote:

Hi Alexey, Masahiro,

> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> Keep the .modinfo section during linking, but strip it from the final
> vmlinux.
> 
> Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> 
> This change will allow the next commit to extract the .modinfo section
> from the vmlinux.unstripped intermediate.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  scripts/Makefile.vmlinux          | 2 +-
>  scripts/mksysmap                  | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index fa5f19b8d53a..1791665006f9 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  
>  /* Required sections not related to debugging. */
>  #define ELF_DETAILS							\
> +		.modinfo : { *(.modinfo) }				\

FWIW, to me .modinfo logically does not quite belong to ELF_DETAILS,
since it is not about ELF.

I would guess, that you want to make a minimal code impact to the
linker scripts, but with that you turn .modinfo the only section
among ones that do not make it to the final image:

	STABS_DEBUG
	DWARF_DEBUG
	ELF_DETAILS

That immediately breaks s390, but also is a call for trouble in
the future, as far as I am concerned.

Would it makes sense to introduce e.g MODINFO instead?

>  		.comment 0 : { *(.comment) }				\
>  		.symtab 0 : { *(.symtab) }				\
>  		.strtab 0 : { *(.strtab) }				\
> @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  	*(.discard.*)							\
>  	*(.export_symbol)						\
>  	*(.no_trim_symbol)						\
> -	*(.modinfo)							\
>  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
>  	*(.gnu.version*)						\

Thanks!

