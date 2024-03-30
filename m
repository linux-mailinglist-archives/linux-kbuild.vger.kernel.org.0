Return-Path: <linux-kbuild+bounces-1407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093089280E
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Mar 2024 01:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 043D7B21CFA
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Mar 2024 00:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DBC191;
	Sat, 30 Mar 2024 00:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGKIjD8i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B986181
	for <linux-kbuild@vger.kernel.org>; Sat, 30 Mar 2024 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711757776; cv=none; b=k42W+Sfffhek1958zcNMmRDXetSyLYVnFjLazjdu+9OJwQ0eao6Npjs8Wi5cToxjHL0RJFyBhxiBZOiIjavp1OXz6HvenwPWI+VANv9Szagy2byYOkWJkIjv+9ScQr6SN0Xuh9XU0nlf3N/GgaOruoGGMxFpa9CI7/W50bI4NcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711757776; c=relaxed/simple;
	bh=9YLWZwr2hzlHEKo2BTgCPatFcEwiDWXsxHfagPXE/yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaU5/pHCbsRzp1k5y56eUbDeEDdGSi/lhPaI3YClG+cDMP2iqsPO/VqkeJvLmyJ41y1UIoDjJrPD6pSiUNv3M1eG0nv1hQJDfmEVEG8+zQ3B6KjHN0tNntEohr1Pxek5t5visqaGgcZyzDqcS4AzUmKTeT53oG/XJD6n1tfjyK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGKIjD8i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711757774; x=1743293774;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9YLWZwr2hzlHEKo2BTgCPatFcEwiDWXsxHfagPXE/yU=;
  b=fGKIjD8iXEi880TT60NwADw5Kk9nA4EW28jIpN4PYUX2QVSFv/ivtvHf
   CRaNm8iG4rFZly3kW1waqWt2onhPupFhbFSrX3kx8xtMKsTTY2PgHRc83
   Eh9Dj5e1IajDwvyqGND+YgmuQZz1k9H7eeW5FNeDZW/IX41w516MMQNqE
   Tp1p+vuVRgwj5kxbyq0IDYt9qEA0HAV7k3CHqEHGK0N77tovXtP487mMR
   ol4WcJ/K5PDYpYncTPg+x8rWxlTzcc9WXdWMUp5j/w22qG/I8CqOjUG/i
   szTV52Wrylxt42lggEKVqfXbWP1BOaAVdtdbnuTZEkmodP3IvhVGyqjEZ
   A==;
X-CSE-ConnectionGUID: MTD6yNG9TXOEjf/sl4wGYQ==
X-CSE-MsgGUID: rSgipHK1R52DiT7IU0wDZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="17510263"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17510263"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 17:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17581880"
Received: from hkannan-mobl.amr.corp.intel.com (HELO [10.209.48.27]) ([10.209.48.27])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 17:16:13 -0700
Message-ID: <6e43509f-270d-4f67-9f3a-8aedaf49f76b@linux.intel.com>
Date: Fri, 29 Mar 2024 17:16:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: sev-guest: Mark driver struct with __refdata to
 prevent section mismatch
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>
Cc: linux-kbuild@vger.kernel.org, kernel@pengutronix.de
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 3/29/24 2:54 PM, Uwe Kleine-König wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
>
> 	WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section mismatch in reference: sev_guest_driver+0x10 (section: .data) -> sev_guest_remove (section: .exit.text)
>
> that triggers on an allmodconfig W=1 build.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

LGTM

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  drivers/virt/coco/sev-guest/sev-guest.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index 87f241825bc3..1af68065b3d9 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -1009,8 +1009,13 @@ static void __exit sev_guest_remove(struct platform_device *pdev)
>   * This driver is meant to be a common SEV guest interface driver and to
>   * support any SEV guest API. As such, even though it has been introduced
>   * with the SEV-SNP support, it is named "sev-guest".
> + *
> + * sev_guest_remove() lives in .exit.text. For drivers registered via
> + * module_platform_driver_probe() this is ok because they cannot get unbound at
> + * runtime. So mark the driver struct with __refdata to prevent modpost
> + * triggering a section mismatch warning.
>   */
> -static struct platform_driver sev_guest_driver = {
> +static struct platform_driver sev_guest_driver __refdata = {
>  	.remove_new	= __exit_p(sev_guest_remove),
>  	.driver		= {
>  		.name = "sev-guest",
> base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


