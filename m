Return-Path: <linux-kbuild+bounces-2106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0E905F80
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 02:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08072832BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 00:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB3438F;
	Thu, 13 Jun 2024 00:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0r43pNO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186F384;
	Thu, 13 Jun 2024 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718237010; cv=none; b=H/QN3dDgRF2OILy+7luAyDpxuigCFdUE36CKhiBKevDQp/fmwH+jgescmX1n1rInl/RM3vrgV6f0MY6OpslCVZ4cvfyy9citEaa5CnVHXY23JTVFZJH8tOxg85H/hKTAid0KtPLlBLksfptO3ZOKD5C4tFsmBch4lgys9EYhKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718237010; c=relaxed/simple;
	bh=HoGlSe0N5SWiepAaoNUfiwFL0UGEp7h7dXK2pz4uuM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuEzXHGKGURehq3+H8AIYbEJu4DRqTg96Eh4T+XMtx79Rq680uKc5L3/LzYrs6LpKmv78Gefw4wozxnFlQ++7X4U3MDDXftliJjJ09ygcQJrAOUpYpije0nEQqB015XCPZHRDxshbL3geQjLu+07JKZg/1XfGFvzxHRga0/7mq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0r43pNO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB1AC116B1;
	Thu, 13 Jun 2024 00:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718237009;
	bh=HoGlSe0N5SWiepAaoNUfiwFL0UGEp7h7dXK2pz4uuM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0r43pNO+/5I4sFv6eAE/XWds5XSaFKgPCcOlWFgPYaHsfHzcQbVZ5Ltlscd7/fZz
	 4gDObGv9vVerQziiK+vB0Rr/fuDcJCdCDquIsJky7CJpNAmzBvCOkyzWjTGkW1EnJm
	 ebEw5UvEKTaY31aMWzqiLUAaJA/e8Jd1FXXrmCUwlDjeymiCOoHJ0mXIEXMqDKPEet
	 jt+ewaEunHdVmVsI88upFJGkKAs3Yp340SPpgBWaroXxE3GUDinYkXpcS6oygoKENN
	 tU96lXTUyCeI/n3nbUMuymgfaoZDkNCR/1ZOsGu4OzJxODOI9hZdcbOSKMcSMoZosr
	 CSN4DRWoillww==
Date: Wed, 12 Jun 2024 17:03:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] modpost: Enable section warning from *driver to
 .exit.text
Message-ID: <20240613000327.GB1596562@thelio-3990X>
References: <20240611205900.2145880-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611205900.2145880-2-u.kleine-koenig@baylibre.com>

On Tue, Jun 11, 2024 at 10:59:00PM +0200, Uwe Kleine-König wrote:
> There used to be several offenders, but now that for all of them patches
> were sent and most of them were applied, enable the warning also for
> builds without W=1.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Seems reasonable to me, this is just a modpost warning, so it should not
matter too much if there are a few instances lagging behind for a bit
(but it would be good for that to get back on people's radar).

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Hello,
> 
> as of v6.10-rc2 there are two known offenders:
> 
>  - drivers/virt/coco/sev-guest/sev-guest.c
>    patch submitted in March, available at
>    https://lore.kernel.org/all/4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de
> 
>  - drivers/parport/parport_amiga.c
>    fixed in next (commit 73fedc31fed3 ("parport: amiga: Mark driver
>    struct with __refdata to prevent section mismatch"))
> 
> I tested this patch using allmodconfig builds for arm64, riscv, s390 and
> x86_64 which didn't expose further drivers with this problem.
> 
> In my eyes this is good enough to enable the warning for all builds (and
> not only with W=1).
> 
> Best regards
> Uwe
> 
>  scripts/mod/modpost.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 937294ff164f..30881d94f00e 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -965,17 +965,6 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
>  	    match(fromsym, PATTERNS("*_ops", "*_probe", "*_console")))
>  		return 0;
>  
> -	/*
> -	 * symbols in data sections must not refer to .exit.*, but there are
> -	 * quite a few offenders, so hide these unless for W=1 builds until
> -	 * these are fixed.
> -	 */
> -	if (!extra_warn &&
> -	    match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> -	    match(tosec, PATTERNS(ALL_EXIT_SECTIONS)) &&
> -	    match(fromsym, PATTERNS("*driver")))
> -		return 0;
> -
>  	/* Check for pattern 3 */
>  	if (strstarts(fromsec, ".head.text") &&
>  	    match(tosec, PATTERNS(ALL_INIT_SECTIONS)))
> 
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> prerequisite-patch-id: 7300dede00db637042647e12d558fe1dd57c20cc
> prerequisite-patch-id: 82cfe8597f709f05b9fbbd3e4eca8be35e077e2b
> -- 
> 2.43.0
> 

