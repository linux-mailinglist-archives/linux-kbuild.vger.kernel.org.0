Return-Path: <linux-kbuild+bounces-9953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F219AC9CEDC
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 21:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DA834E3AAA
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 20:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CE52DCBFD;
	Tue,  2 Dec 2025 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npMgp49a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01F2D7D42;
	Tue,  2 Dec 2025 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707667; cv=none; b=m/Qif10Rx/6iBPWIOYYSUMaT6pIEiMTXrpT/o2oes4k2cNXC42jtAwFixbHfUzMux9zX1lp5n+lMwgf1tC94TJrKjPedIuClTRotF8C7iaG66wF6DChK5HWR/Tg9WXHgT082jYKYwVH4Rt222maEWtt+6cMqTp5JU+jEpo9DylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707667; c=relaxed/simple;
	bh=AkAyUz0PTn8SKHbSCUMlzIksq5ThHhxTAa8KLK0C3ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFox8VNHZ5gAuilxCahCLVsnZj7a24La28kIGVeTAbb5XJV1aIxXxoZUPkii4Gf4FMtNUxG3eiPB/J+yBJe5PF4BFFga6vCC1onsWSJ/jyuPDtUXQFqLk/vgHOX9YzzhKpJ97+OCHLE/GD/NHXURgFsB5USU8ZwRFODPrPzw1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npMgp49a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044E5C4CEF1;
	Tue,  2 Dec 2025 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764707666;
	bh=AkAyUz0PTn8SKHbSCUMlzIksq5ThHhxTAa8KLK0C3ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npMgp49a9qIpxm6GV3Rt/JJcND2aGwM14Igyef7WNRSwpYje7a2x7sCzjra+kunw6
	 97C+WpY6udSd1RnKLe1YPkJXAEucnZU7GSngh+ystPWEhHUlmS/xqUecpwY+EX+fjF
	 tly78WihVxCf8pEtegXHnlQE8NFw1PuZHtz6DAAALxrxGUkNimbhG8tlIUcYeEtokG
	 3rGDiPRWMb6xtdSPniWCIVu3IhBWli03qGMwkAAXgvoit7u/Pg9UKiTNvlemWMu7oz
	 ZgCymmU2FA+I9l1o1HbW6VlB9mSUErZTXwrMMfuBAdBVkBNJOXofzIs93Ndvmou3w3
	 uxZ8Civj+TtFA==
Date: Tue, 2 Dec 2025 13:34:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nsc@kernel.org, gregkh@linuxfoundation.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, abhishekpandit@chromium.org,
	masahiroy@kernel.org, legion@kernel.org, hughd@google.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: Re: [PATCH v3] mcb: Add missing modpost build support
Message-ID: <20251202203421.GB1959956@ax162>
References: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>

On Tue, Dec 02, 2025 at 09:42:00AM +0100, Jose Javier Rodriguez Barbarin wrote:
> mcb bus is not prepared to autoload client drivers with the data defined on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
> 
> Add modpost build support for accessing to the mcb_table_id coded on device
> drivers' MODULE_DEVICE_TABLE.
> 
> Fixes: 3764e82e5150 ("drivers: Introduce MEN Chameleon Bus")
> Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
> ---

Acked-by: Nathan Chancellor <nathan@kernel.org>

We should be able to get this to Linus by 6.19-rc1.

>  scripts/mod/devicetable-offsets.c | 3 +++
>  scripts/mod/file2alias.c          | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index d3d00e85edf7..0470ba7c796d 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -198,6 +198,9 @@ int main(void)
>  	DEVID(cpu_feature);
>  	DEVID_FIELD(cpu_feature, feature);
>  
> +	DEVID(mcb_device_id);
> +	DEVID_FIELD(mcb_device_id, device);
> +
>  	DEVID(mei_cl_device_id);
>  	DEVID_FIELD(mei_cl_device_id, name);
>  	DEVID_FIELD(mei_cl_device_id, uuid);
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index b3333560b95e..4e99393a35f1 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1110,6 +1110,14 @@ static void do_cpu_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, "cpu:type:*:feature:*%04X*", feature);
>  }
>  
> +/* Looks like: mcb:16zN */
> +static void do_mcb_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, mcb_device_id, device);
> +
> +	module_alias_printf(mod, false, "mcb:16z%03d", device);
> +}
> +
>  /* Looks like: mei:S:uuid:N:* */
>  static void do_mei_entry(struct module *mod, void *symval)
>  {
> @@ -1444,6 +1452,7 @@ static const struct devtable devtable[] = {
>  	{"mipscdmm", SIZE_mips_cdmm_device_id, do_mips_cdmm_entry},
>  	{"x86cpu", SIZE_x86_cpu_id, do_x86cpu_entry},
>  	{"cpu", SIZE_cpu_feature, do_cpu_entry},
> +	{"mcb", SIZE_mcb_device_id, do_mcb_entry},
>  	{"mei", SIZE_mei_cl_device_id, do_mei_entry},
>  	{"rapidio", SIZE_rio_device_id, do_rio_entry},
>  	{"ulpi", SIZE_ulpi_device_id, do_ulpi_entry},
> -- 
> 2.51.1

