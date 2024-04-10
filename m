Return-Path: <linux-kbuild+bounces-1516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE898A014C
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 22:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137EC283A4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 20:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CFF181BA1;
	Wed, 10 Apr 2024 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DDjbQLEg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B456A180A91;
	Wed, 10 Apr 2024 20:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712780851; cv=none; b=P4Banwtl2lCokN/pH+6r1FCm/1FvE0FU9Qmdx9sXXlLj5TQHPRsTWt/1ANfQw/zrqMmoMfv4sV/LsXQxPURdbQ+HN9fd78FEogED5tWx12OWDxpF+U9ve7V8drHxXBHNFKgZiysKjqrKS0TSbLyPIykUPQ2dsnE/jsPGLMOA1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712780851; c=relaxed/simple;
	bh=9FoUnS5tczFu+PikCs3FEUU/fs4Rkn6T57lcmOfvpuw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S61ABEfpi97KHJNr2RLDP/GFys1UZz7CCl96Ozj+f43V9pE4Az29YIcio/aG+4q+X6GvxvQBpNeZOvheaACf8yMN0Plf+KjI4lLGXzt/d0J4+3wAJPNDUjGL+56Mj+JOA/wqjBgruAx7AEmJg9GtZzlRhz2gg1ttyN1Dac6nv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DDjbQLEg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJI7c4001592;
	Wed, 10 Apr 2024 20:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=MYGbdKmqy9kU+KD/l6EOX
	wmQ8zOY9jafyhTdeJYnpJQ=; b=DDjbQLEgZ0ewsnCdDOmt3RbibceKHLjMJTK5p
	i+MsyZMhphnKrGoqwACgCMNLgu2T0eZ9fxQv92qqD3/0gsMlyGZECXPmlpvsmgWj
	owG3ZlzOO9B76SyMMTRSzBne+OcmiOWyT5sAx4sJS3Srb4ny+f9UL5vVWufJ+1S0
	il3ZgWbwGXbRmZRsCmqL2R7D8W4HgF/OvWg0+NLA/mbDMMFEPY4pDv8nXXQbHkZW
	R/jI8Lkd8I+1ZcDO3wQu91CcQjuY0GcVIr7VXGBnqSlCwtnVQncZSaHR+WDaNvKX
	xV3i6MgKwmx4RkiIksS8cjWMMlhKgj1/B6H9RBwqwo5ihpxww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdskjj53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:27:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AKRH5r012568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:27:17 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 10 Apr 2024 13:27:17 -0700
Date: Wed, 10 Apr 2024 13:27:16 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Yifan Hong <elsk@google.com>
CC: Luis Chamberlain <mcgrof@kernel.org>,
        Masahiro Yamada
	<masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier
	<nicolas@fjasle.eu>, <linux-modules@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>,
        Matthias =?utf-8?Q?M=C3=A4nnich?=
	<maennich@google.com>,
        Ulises Mendez Martinez <umendez@google.com>
Subject: Re: [PATCH v2] module: allow UNUSED_KSYMS_WHITELIST to be relative
 against objtree.
Message-ID: <20240410130555876-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240410193734.29788-1-elsk@google.com>
 <20240410194802.62036-1-elsk@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240410194802.62036-1-elsk@google.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pwzNlrQ5LT3mRg2znbLFNy7syPtMpEjn
X-Proofpoint-ORIG-GUID: pwzNlrQ5LT3mRg2znbLFNy7syPtMpEjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=847 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100149

On Wed, Apr 10, 2024 at 07:48:02PM +0000, Yifan Hong wrote:
> If UNUSED_KSYMS_WHITELIST is a file generated
> before Kbuild runs, and the source tree is in
> a read-only filesystem, the developer must put
> the file somewhere and specify an absolute
> path to UNUSED_KSYMS_WHITELIST. This worked,
> but if IKCONFIG=y, an absolute path is embedded
> into .config and eventually into vmlinux, causing
> the build to be less reproducible when building
> on a different machine.
> 
> This patch makes the handling of
> UNUSED_KSYMS_WHITELIST to be similar to
> MODULE_SIG_KEY.
> 
> First, check if UNUSED_KSYMS_WHITELIST is an
> absolute path, just as before this patch. If so,
> use the path as is.
> 
> If it is a relative path, use wildcard to check
> the existence of the file below objtree first.
> If it does not exist, fall back to the original
> behavior of adding $(srctree)/ before the value.
> 
> After this patch, the developer can put the generated
> file in objtree, then use a relative path against
> objtree in .config, eradicating any absolute paths
> that may be evaluated differently on different machines.
> 
> Signed-off-by: Yifan Hong <elsk@google.com>

I wonder if we should have a macro to do it so we can have a common
macro for the other time this is done for sig-key in
scripts/Makefile.modinst?

maybe-srctree = $(if $(wildcard $1),,$(srctree)/)$1

I'd let Masahiro/others decide if it's worth it. Otherwise,

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
> V1 -> V2: properly handle absolute paths by treating
>   them as-is.
> 
>  kernel/module/Kconfig    | 2 +-
>  scripts/Makefile.modpost | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index f3e0329337f6..cb8377a18927 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -392,7 +392,7 @@ config UNUSED_KSYMS_WHITELIST
>  	  exported at all times, even in absence of in-tree users. The value to
>  	  set here is the path to a text file containing the list of symbols,
>  	  one per line. The path can be absolute, or relative to the kernel
> -	  source tree.
> +	  source or obj tree.
>  
>  config MODULES_TREE_LOOKUP
>  	def_bool y
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 739402f45509..36952638bbc6 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -94,7 +94,7 @@ targets += .vmlinux.objs
>  
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  ksym-wl := $(CONFIG_UNUSED_KSYMS_WHITELIST)
> -ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
> +ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(if $(wildcard $(ksym-wl)),,$(srctree)/))$(ksym-wl)
>  modpost-args += -t $(addprefix -u , $(ksym-wl))
>  modpost-deps += $(ksym-wl)
>  endif
> -- 
> 2.44.0.478.gd926399ef9-goog
> 
> 

