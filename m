Return-Path: <linux-kbuild+bounces-4639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D89C3D71
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F4128352E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD622176FA2;
	Mon, 11 Nov 2024 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zXgH3sjw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42915A84E;
	Mon, 11 Nov 2024 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324992; cv=none; b=mD8vySOFtNUU3xg1fHhgjCwVNVdwOBw18L3lisMrPXcAom4sRIAWXfTvPh1qhr1t4TdIQq/Lt3xPSg2PrKyCzLwLH8xb4HpOVxHi7f8bD12OJxr85i9SLCdwLpFHxfJIIua/6JuehLRckOfeqpLS3V8NvvydCxx5nGSz9tm2ZwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324992; c=relaxed/simple;
	bh=EVX9DLMv9cR/2h2C8th8dhjBDMSwShUpURXz17hbnqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stvuVM4lalFXaLGjhfJe8WaJCxneegXBnUN/6pEIe5hBRaZiQeedL6f+PwsG9IZhjCNC4QwPY93EQGQ2bo1ej4CX0mQQWamg5/X0eIZ9UM0AuWVxxFwMktrEz13Wh1oAULlLtbDT4PLZSBTHVaLLMXQwWnAEOm4By3SIJ3IBWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zXgH3sjw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HnUzxhFcZn6kE+tr4QqNLO+f9GZuie6vyDRzNWD18/0=; b=zXgH3sjwzb/dNagQ47DueRd6wm
	RDKhcPB/QNlV1ujZCU7RdCgr5ZkVmKWp88bTW5aPPTVC47kQWFAelsrzQgJueEZpgmKnkuzBLPfvK
	jgCNFmblns+ceqKOf0SU9WD3L3j0K/Ye7LDqVImJisSQaR2QyErnaSuvZJmSONSZjdg+V9LNryU2Z
	j555Wxu0R4Q5AEEsLjViH/jUPVEXjjkUwJvZWlKyou6C7f9+G2A/+y5WW0IZpegXRFaIh0+36RYnm
	MphkvW4CrRbXeYmwWTNK86Rbkbjeoqc8essyFYyoGT1WTd5xwUcPqZQMReawsFsLbfK1+a9lIk54v
	wLdh2FLw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tASiX-0000000HU2o-17iX;
	Mon, 11 Nov 2024 11:36:25 +0000
Date: Mon, 11 Nov 2024 03:36:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC][PATCH 1/8] module: Prepare for script
Message-ID: <ZzHsOTLCZlUBN7iW@infradead.org>
References: <20241111105430.575636482@infradead.org>
 <20241111111816.912388412@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111111816.912388412@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Nov 11, 2024 at 11:54:31AM +0100, Peter Zijlstra wrote:
> Since sed doesn't like multi-line make sure all EXPORT_SYMBOL_NS
> things are a single line.

Eww.  Just use coccinelle or another tool not so simplistic.

> @@ -375,8 +372,7 @@ int otx2_cptlf_register_done_interrupts(
>  	otx2_cptlf_unregister_done_interrupts(lfs);
>  	return ret;
>  }
> -EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts,
> -		     CRYPTO_DEV_OCTEONTX2_CPT);
> +EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts, CRYPTO_DEV_OCTEONTX2_CPT);
>  
>  void otx2_cptlf_free_irqs_affinity(struct otx2_cptlfs_info *lfs)
>  {
> --- a/include/kunit/visibility.h
> +++ b/include/kunit/visibility.h
> @@ -24,8 +24,7 @@
>       * in test file in order to use symbols.
>       * @symbol: the symbol identifier to export
>       */
> -    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
> -	    EXPORTED_FOR_KUNIT_TESTING)
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, EXPORTED_FOR_KUNIT_TESTING)
>  #else
>      #define VISIBLE_IF_KUNIT static
>      #define EXPORT_SYMBOL_IF_KUNIT(symbol)
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -2310,8 +2310,7 @@ int tasdevice_select_tuningprm_cfg(void
>  out:
>  	return prog_status;
>  }
> -EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg,
> -	SND_SOC_TAS2781_FMWLIB);
> +EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg, SND_SOC_TAS2781_FMWLIB);
>  
>  int tasdevice_prmg_load(void *context, int prm_no)
>  {
> @@ -2392,8 +2391,7 @@ void tasdevice_tuning_switch(void *conte
>  			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
>  	}
>  }
> -EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch,
> -	SND_SOC_TAS2781_FMWLIB);
> +EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch, SND_SOC_TAS2781_FMWLIB);
>  
>  MODULE_DESCRIPTION("Texas Firmware Support");
>  MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
> 
> 
---end quoted text---

