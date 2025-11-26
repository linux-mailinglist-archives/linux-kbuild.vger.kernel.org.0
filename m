Return-Path: <linux-kbuild+bounces-9866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC186C8974A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 12:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2B03B192C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 11:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F2D2FFDDC;
	Wed, 26 Nov 2025 11:10:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43DA287506
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155429; cv=none; b=Iwym88N6glRnE8HVpiBaF6ia9t7E23KeXXORrmLEsNHtA1bc80YprHVYaU70IjHJ0JWIuWRiwQY2wOGQL5iS7zLQeCKIPwPBfh6WovXTEAMHMZ0MQ+/GVr8tRvEIlkuN1HuKapoJpELBmYgVqzGDoeD82gnFLJIQmyQNVRd55RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155429; c=relaxed/simple;
	bh=4iJt+VV0ZB5/P+i8VPiI5NNAPD0Q71WnyuBeZ6fpzDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p94i9cHyrypy4WX0mXlW94DCa0xw2vLyJbQY0ejU+kkAsiNZo5hv+AffRejESICvHWc/57lqE6rzQVzrjrDkS7VkMsFmlz8vXspTMo9MUMv9fDX1Q+YexWN0fl7et3b9jiSOX2zlTDQSSDOq0itHRGE+4NQ5dFaElAqtsXPOVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODPZ-0007b1-B5; Wed, 26 Nov 2025 12:10:13 +0100
Message-ID: <0c9e5155-f784-4656-a92c-1603f58fc4ee@pengutronix.de>
Date: Wed, 26 Nov 2025 12:10:12 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] kbuild: Split out module targets into a variable
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-6-sjg@chromium.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251119181333.991099-6-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org



On 11/19/25 7:13 PM, Simon Glass wrote:
> Add a modules-targets variable to list the targets which cause modules
> to be built, since we want to add a conditional target.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Add a new patch to split out module targets into a variable
> 
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 638bc09a546a..8cd46222fc48 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,12 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>  

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


