Return-Path: <linux-kbuild+bounces-9876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03541C8BE82
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 21:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6FAB3B777F
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 20:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5358B318135;
	Wed, 26 Nov 2025 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We4LevAm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574F16DEB0;
	Wed, 26 Nov 2025 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190151; cv=none; b=UaZTxJDfy+sU0XIgS/0MnI4PQ5cHXItK9wwl2RZQ/zc18K/ew4XaIfLeMXV/pM+0KxFca0yQK5UcNAxU4mBt6w9Yx2/wY00lYHs0UIkzx1Xkh/n6CFHIY3ME7lNusYN7hIXH0qB6NvdmPPKjq/j4bog3BD10QQncF/YPY6JgP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190151; c=relaxed/simple;
	bh=bTg0AQnVQjYRj+5AwoOjeTHstG+BtnMifdDv+GuMp30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbl5lTiuG3VWMx5bqA5SKec8UQzE8+zshgyXQjoeGKzED77m1AjzHiF/i3lx8vPcCwc10MsmwG8sTZdpKlv8q2P1apFmZpQZJhrZLUclx8J6CmdV27fmiVOWvWAXpIev9zdUMBfgJN6/u8LrMHzy8bp0PwwoIAkC6PibZxAX+VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We4LevAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89889C4CEF7;
	Wed, 26 Nov 2025 20:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764190151;
	bh=bTg0AQnVQjYRj+5AwoOjeTHstG+BtnMifdDv+GuMp30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We4LevAm6vT0xtHdJ09DrbSDHoVNv6I4HPXxld0JvAtNOAfEuY9kbMZmr4liIAvIF
	 +ENVdod5Z3B6bKWYFu91Yz4buJJAAgkIPL9NWWHIpCpQT0z0Mh4jssnqn4164rCOye
	 TbJMO+nB0d83/JeagXjw6yyGSWhLu3xbxaULQ++3Jq0Uyo8mIdt2XSKeTEJrVuxM9D
	 1H0MM0BlOcKNH5LKKVJ0WAsvPabyyi7HcS+K345OVeUR/1uJEQ/0Y7mW1Frumw1cjY
	 PTozM7FzDa5AYJbqgUPqB956vQlo1F8E/aOfDn2w19HAdMan4vGDw3GMDbxzYoJO+3
	 oJtYIYtXCULBg==
Date: Fri, 21 Nov 2025 20:56:59 +0100
From: Nicolas Schier <nsc@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Ensure .dtbo targets are applied to a base .dtb
Message-ID: <aSDEC9D87nZB5RJp@derry.ads.avm.de>
References: <20251114222759.4181152-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114222759.4181152-1-robh@kernel.org>

On Fri, Nov 14, 2025 at 04:27:58PM -0600, Rob Herring (Arm) wrote:
> It is a requirement that DT overlays in the kernel are applied at build
> time to a base DTB in order to validate they can be applied and to
> validate them against the DT schemas. DT overlays on their own may be
> incomplete and can't be validated.
> 
> Add a kbuild check so this doesn't have to be checked and fixed
> periodically.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  scripts/Makefile.dtbs | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index 2d321b813600..15473edc2589 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -10,6 +10,13 @@ real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
>  # Base DTB that overlay is applied onto
>  base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), .dtb, -dtbs))
>  
> +# Ensure that any .dtbo is applied to at least one base .dtb. Otherwise, it
> +# does not get validated.
> +applied-dtbo := $(filter %.dtbo, \
> +	$(call real-search, $(call multi-search, $(dtb-y) $(dtb-), .dtb, -dtbs), .dtb, -dtbs))
> +unapplied-dtbo := $(filter-out $(applied-dtbo),$(filter %.dtbo, $(dtb-y)))
> +$(if $(unapplied-dtbo), $(warning .dtbo is not applied to any base: $(unapplied-dtbo)))
> +
>  dtb-y           := $(addprefix $(obj)/, $(dtb-y))
>  multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
> -- 
> 2.51.0
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

Do you take this via DT tree?

Kind regards,
Nicolas

