Return-Path: <linux-kbuild+bounces-8254-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D39B1636D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA681AA3CDD
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32552DC35C;
	Wed, 30 Jul 2025 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Qu78tWsO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60664481A3;
	Wed, 30 Jul 2025 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753888373; cv=none; b=MnKklIt7QU5ai0R+xmcLmeaIzME8OuJl9pmoMDZLBYbXScFc12vzuVRezGzfLwkK4Nhnol4ArjURlDORoiDbNSA1TZzbM92skP7pFb4dGn1U5xTEDRDBn18NZmzSScGxX8L0N+Pf6kpIlPO87/MeEjgaOEuki1x7F/Xm+IFQfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753888373; c=relaxed/simple;
	bh=g9n5riVDlfs5BXhg/BeND7TCXaVTFd6RKJnzovJDGF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hM0en1a/wvDDUglnCXAShthDO3jXAg4r1zYM/tEIAP+gl6lrRROX1STGzbTx9Ihd1nK/Qn0kmYPVlMzlCpd6rxz8LIgBWKxDspPxXo7ro8WWLzSKzAC2dNYummfSARXACKYMKfD7Nj/HnJw6QJEbhoKStoC693BY7n3rZKOggpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Qu78tWsO; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753888367; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6sT7aVW3MQBG7miFtEu5bR6UM9le1ET/SznYRdA7Jy0=;
	b=Qu78tWsOHQbez33e9srM7z5RDJiXV9q/GIG+F25B6GA/ugIFmueBOoMLwWwK2SmiZWgQlrpODCGrvcFhXiqoAj/zPrJwjlNv3a9Th6OpoinKsF2uEHjCttD1exSXKpoejikjnEkUs7A9US0ceN4IidX513h2cJbfwuMo8U6Obfs=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WkV9HNb_1753888365 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 30 Jul 2025 23:12:46 +0800
Message-ID: <d744137b-11b4-4ce9-a4c1-ba10e24adb9a@linux.alibaba.com>
Date: Wed, 30 Jul 2025 23:12:45 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: Do not select tristate symbols from bool symbols
To: Geert Uytterhoeven <geert+renesas@glider.be>, Gao Xiang
 <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale
 <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Bo Liu <liubo03@inspur.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <da1b899e511145dd43fd2d398f64b2e03c6a39e7.1753879351.git.geert+renesas@glider.be>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <da1b899e511145dd43fd2d398f64b2e03c6a39e7.1753879351.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greet,

On 2025/7/30 20:44, Geert Uytterhoeven wrote:
> The EROFS filesystem has many configurable options, controlled through
> boolean Kconfig symbols.  When enabled, these options may need to enable
> additional library functionality elsewhere.  Currently this is done by
> selecting the symbol for the additional functionality.  However, if
> EROFS_FS itself is modular, and the target symbol is a tristate symbol,
> the additional functionality is always forced built-in.
> 
> Selecting tristate symbols from a tristate symbol does keep modular
> transitivity.  Hence fix this by moving selects of tristate symbols to
> the main EROFS_FS symbol.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Triggered by noticing that commit 5e0bf36fd156b8d9 ("erofs: fix build
> error with CONFIG_EROFS_FS_ZIP_ACCEL=y") caused CONFIG_CRYPTO_DEFLATE
> and CONFIG_ZLIB_DEFLATE to change from m to y in m68k/allmodconfig.
> 
> Unfortunately Kconfig cannot be changed easily to detect this
> automatically, as it cannot distinguish between a "bool" symbol
> representing a configurable option in a module, and a driver that cannot
> be a module.
> ---

Thanks, it looks good to me, will upstream in this cycle:

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

