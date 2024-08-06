Return-Path: <linux-kbuild+bounces-2837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F1948D61
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 13:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BE281C220D5
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 11:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87AE1BDA80;
	Tue,  6 Aug 2024 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="UMgsF+y4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40215143C4B;
	Tue,  6 Aug 2024 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722942155; cv=none; b=HNPGP1mw0x4p3ibI+xJHw3YrgMOkx0haX/jG/vj5mnuwuXMx1G1CuHZQyeIwB/EpdnHxuXWONMUdZ1cUXBgdNTTbLbTM0tG9qpaMhFqWmjaOZyvTyvYLrZcoWx93kioRX3nepl2f/sHRQTSIQerVUdjcatUZ/exHFrofz8MKCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722942155; c=relaxed/simple;
	bh=DOYsV/8z5t9yYBEcdSHUk1RjXxZ4JchbUzsXeVWuBjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RF987i41k5/UNhjQBZljvmHzI37i4eggGiebGUH4liYlgHyImpMktuhFHoUSnDTDqASeDo0zVFfgFEkh3RoxnNqvYAv7I6Opc+PMU9j7NWNh8ZWmS0p6QrxkTBdfiuX5jIp0NWDu32NF9X050jqmxlPvOwCBsSOwJIYnXhgs1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=UMgsF+y4; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hk/T9ysVmsPFLJyAoFtYioToK1eDSU00rOBX1C483CY=; b=UMgsF+y4r/JsqCsya/nKQ6qHJj
	AAoQ5YCm1dl0LE7opfRUn8miOVdxF70s/yz7Ptg8W5UhQ/RGCdL4XSoFZdwcs63p9ZdkOA6zB3b2d
	jWix62NIFTAr6N77Rn/HGUKT3K5FNpchhDMW3uFcnvE0w10cN/tssfnl8vfkBwFna6Mss+H9n78BZ
	qnvlHO0qVq55/DxlPXuW2ylQmH4COqvjH5iK+9ympxzWLw6MsbxJ9aNR9lRjkIosjsc06/4GHGXNm
	hdAXffB9qa9hSCxCbDAlv658HECRxsXqRgqVS062nixVEpXoi/LBdBj+l7tkAJXMieGsZpTHv316p
	9a7+IUDg==;
Received: from [2001:9e8:9d3:eb01:3235:adff:fed0:37e6] (port=54654 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sbHxE-001h0Q-M7;
	Tue, 06 Aug 2024 13:02:12 +0200
Date: Tue, 6 Aug 2024 13:02:08 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH] kbuild: modinst: remove the multithread option from zstd
 compression
Message-ID: <20240806-macho-uber-chipmunk-5ffd3e@lindesnes>
References: <20240804033309.890181-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804033309.890181-1-masahiroy@kernel.org>

On Sun, Aug 04, 2024 at 12:33:07PM +0900, Masahiro Yamada wrote:
> Parallel execution is supported by GNU Make:
> 
>   $ make -j<N> modules_install
> 
> It is questionable to enable multithreading within each zstd process
> by default.
> 
> If you still want to do it, you can use the environment variable:
> 
>   $ ZSTD_NBTHREADS=<N> make modules_install
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0afd75472679..04f5229efa6b 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -146,7 +146,7 @@ quiet_cmd_gzip = GZIP    $@
>  quiet_cmd_xz = XZ      $@
>        cmd_xz = $(XZ) --check=crc32 --lzma2=dict=1MiB -f $<
>  quiet_cmd_zstd = ZSTD    $@
> -      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
> +      cmd_zstd = $(ZSTD) --rm -f -q $<
>  
>  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>  	$(call cmd,gzip)
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


