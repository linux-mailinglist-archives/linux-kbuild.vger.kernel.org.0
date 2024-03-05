Return-Path: <linux-kbuild+bounces-1176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F90872652
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 19:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C95AB256B9
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 18:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC13D268;
	Tue,  5 Mar 2024 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dOXjcMB6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F1E17BAB
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709662323; cv=none; b=kqExp5K15o0WQsnlqILan0fPy0vP3al8E/R3Jl9glN9Y1qbRHkS+7Ff7TXnWmVfPDVj+AGAg3L10yhP7tjv9H++JJW20U+OWLWmKBT+d50P/zBSzK7X7mTtcFrTtTeJ8xX8R00ZzQ200atDFEwl4lllqODB8zZ7lyZjG6szS0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709662323; c=relaxed/simple;
	bh=q00v78Eum2+9+5tw85fvYICffuiBpCY/+uXx3ZSwQ8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IogdgH5Z7CZjBIiuyfnjsEjmz8NLn41FqqbwaK4DB+5JAuqHL5Cc2nJpvJPussAIX9OKmcPFE4Pul1w7T/wLcS4QTxXRKNqFIEzmQnFTTzQCmrLezxqiFQUtRYSqF0EbGi7TprdpAbyGJvkIDqgYEW+9gwkiuyxKGyb+S200u1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dOXjcMB6; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <e2f2562e-5500-4afd-9e9d-fb92c7271758@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709662319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9Dsn2WPTt1gxnLIJd9P9kOtBBptuwiSlUTg3Plrn6E=;
	b=dOXjcMB6qf82D4brLcfIhPHiWn8Bw1227UmuP2b/HWkL3cgkTZsvr7NUqYasKtaQpYtER8
	ijTW6JOJie7DsAxXpo9h+eNM+fiZm+KAQfkGpycNGg4wMLuDBJHEd5oBWpmHgjIJiSzyel
	LHO0VWZkssF+kRIyTT+FHAhSAHPjDM0=
Date: Tue, 5 Mar 2024 10:11:47 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Disable two Clang specific enumeration warnings
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, arnd@arndb.de, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
References: <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
Content-Language: en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/5/24 9:42 AM, Nathan Chancellor wrote:
> Clang enables -Wenum-enum-conversion and -Wenum-compare-conditional
> under -Wenum-conversion. A recent change in Clang strengthened these
> warnings and they appear frequently in common builds, primarily due to
> several instances in common headers but there are quite a few drivers
> that have individual instances as well.
>
>    include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>      508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      509 |                            item];
>          |                            ~~~~
>
>    drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:955:24: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
>      955 |                 flags |= is_new_rate ? IWL_MAC_BEACON_CCK
>          |                                      ^ ~~~~~~~~~~~~~~~~~~
>      956 |                           : IWL_MAC_BEACON_CCK_V1;
>          |                             ~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:1120:21: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
>     1120 |                                                0) > 10 ?
>          |                                                        ^
>     1121 |                         IWL_MAC_BEACON_FILS :
>          |                         ~~~~~~~~~~~~~~~~~~~
>     1122 |                         IWL_MAC_BEACON_FILS_V1;
>          |                         ~~~~~~~~~~~~~~~~~~~~~~
>
> While doing arithmetic with different types of enums may be potentially
> problematic, inspecting several instances of the warning does not reveal
> any obvious problems. To silence the warnings at the source level, an
> integral cast must be added to each mismatched enum (which is incredibly
> ugly when done frequently) or the value must moved out of the enum to a
> macro, which can remove the type safety offered by enums in other
> places, such as assignments that would trigger -Wenum-conversion.
>
> As the warnings do not appear to have a high signal to noise ratio and
> the source level silencing options are not sustainable, disable the
> warnings unconditionally, as they will be enabled with -Wenum-conversion
> and are supported in all versions of clang that can build the kernel.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2002
> Link: https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the fix. LGTM.

Acked-by: Yonghong Song <yonghong.song@linux.dev>


