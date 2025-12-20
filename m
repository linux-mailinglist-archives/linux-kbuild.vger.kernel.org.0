Return-Path: <linux-kbuild+bounces-10311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B48CD361F
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 20:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B3EC30006CD
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 19:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905E91E8329;
	Sat, 20 Dec 2025 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xO8CxGrq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533316DEB1;
	Sat, 20 Dec 2025 19:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766259087; cv=none; b=kJ9SB4z4yhh5KOC/54FRteyWtpIZ1FT517ikFmnROUoEL7AjZ2UBZv6ysqxUD/L8aQO+4ukprJKhcSTSipTgT6rh25mW5FmeVlnXBpG7pg8oZO0avwbyk7eXcK7080fnnySY2Hbtgub1svjKpgKbbt++lf2mXdPa+L+j+CsgEEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766259087; c=relaxed/simple;
	bh=TAeZSiDeozu8HbZpaQxcLKgCOJoumCZPmLKGxvAbC4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ry1v+tPWVLsmatjq0FQU61nrbEgeu++/gj/7CQji4nh9/YRS9Qp8fYh1lRAUwLFipTuW13z31rvz1Us+Bhw/KxTbmvE4C0RTSIQ7G7Fi8CKxGbrh/Lr7AJpb0GQUG4oh/tjJzgKHh07N4dsCP2F+yndKRPKgqkVqdZ9u7vhCjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xO8CxGrq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2jrNQwKuMaBdvMN0lpf1Chl28gyV3jOOPnOPGd2XLAc=; b=xO8CxGrqut0RrxNzKEsxZsO84F
	a3JtGD2+PJmPgblNumPNSXrqBzMfg6cIPP168kAYXEYJukXeucHAVYzah0dSEcFbK/ix37xzW2n53
	cVklph2vAw6Mgm/gJa1zx4uiehpdqPSJSPNREyRCQ5LasUenTD7jRDwFXLk7OKOTv3T3bqZOwWSQ/
	rAfLg22+miaUCVoMTo3c6Q+LvDSnJyiyeWv6tf9CS7Daa6RABDVDc9w4ljFl4uT9ik8ILaX7ZCPzK
	CoM1oAOv2+iuFMQky7psin3t/UJ0fxfAKizmBqKA/RaKhQ+TTjOF/6NGURlc1VO6IJwwIroVNxH3+
	0oLzRqtw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2fh-0000000Bqrx-0ZeC;
	Sat, 20 Dec 2025 19:31:21 +0000
Message-ID: <32779c95-697c-4930-afe0-2848541673bb@infradead.org>
Date: Sat, 20 Dec 2025 11:31:19 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kbuild: Fix typos in makefiles.rst
To: cp0613@linux.alibaba.com, nathan@kernel.org, nsc@kernel.org,
 corbet@lwn.net
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251220125434.2430-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251220125434.2430-1-cp0613@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/20/25 4:54 AM, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The correct command to generate header files is
> make headers_install.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/kbuild/makefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 8aef3650c1f3..24a4708d26e8 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1264,7 +1264,7 @@ Add prerequisites to archheaders
>  --------------------------------
>  
>  The archheaders: rule is used to generate header files that
> -may be installed into user space by ``make header_install``.
> +may be installed into user space by ``make headers_install``.
>  
>  It is run before ``make archprepare`` when run on the
>  architecture itself.

-- 
~Randy

