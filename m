Return-Path: <linux-kbuild+bounces-2031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6490102E
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 10:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D4C283418
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 08:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EF7176AAB;
	Sat,  8 Jun 2024 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="OYYyuIoT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113F17BAF;
	Sat,  8 Jun 2024 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717835119; cv=none; b=MqaEBef7Nqoss1lVwtM2wA036uPpPrsFc9UKJD5fkpCJ10Rb2slvF8X4NKmaNM2zaGvGyVgTKF6t1w8R78V0LNx0SMUXVo9x94rDmAXQ3S3RyRjH45nCbEP9fUZac+1gPa7Tb7RbdJEBZc1UJjHihmeMzm4TDPTSlSUxwlA1qxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717835119; c=relaxed/simple;
	bh=NHcCBCkVIG4S20BV+hk5Vde+bCt+RveWygaQATTN7vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7H8rgXj9ZFuK9F5WsnhmP85kCkcEizvvBAOjT9CxbYU4UkNLyoqdhcj+N1MezUm/HZEnvb9bDHMbi0hQG5gI0EvBguWhhSfCM2fWUsTOfES6GlbrJQdXZm30+R4QALZyCofqy+tPUtqo1S+ngpKZH6YG4d8B9DzGSsrHJhmiQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=OYYyuIoT; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yTLtEsPk7oLK1m4GqjGTNlGn4NBucRzN+JPW/nQ4vXA=; b=OYYyuIoTYtrYySaGH65PZyH8ot
	+gRjVqDpVMYiU0noV5X2mj2YvtIelGPFNYD160mnHDsAdRtHgSrMylySoJur+XlgmGljlERG2Dv54
	OECu9VbAQKr0xQsYnRAp57AfVqpJ0PdMnrBFy4lNJ7IQEs8HMSalXuI1m5PzpGEBhKTinS6iB+jdO
	sG237T574IpSZCVrVZa294fa8lagaXahxJXe2vOfXzoAQ8O5jhcjSnmlMTdzuKqyPfhC1XvfNBpe+
	qEVlm06PcSvZQVe9C2z5BeZDEyMH4H0yqMRBZtIHhgN8pln0gu2rZbWCRnNtxGFXrzQggPkpyHrPJ
	z599KfOw==;
Received: from [2001:9e8:9f5:cb01:3235:adff:fed0:37e6] (port=35328 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sFrNp-00CUUa-GL;
	Sat, 08 Jun 2024 10:25:05 +0200
Date: Sat, 8 Jun 2024 10:25:02 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] modpost: bypass module description test on vmlinux.o
Message-ID: <20240608-certain-potoo-of-agility-cc231c@lindesnes>
References: <20240607-md-scripts-mod-v1-1-d3cd5a024f05@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240607-md-scripts-mod-v1-1-d3cd5a024f05@quicinc.com>

On Fri, Jun 07, 2024 at 02:42:43PM -0700, Jeff Johnson wrote:
> When building modules with W=1, modpost will warn if a module is
> missing a MODULE_DESCRIPTION. Unfortunately, it also performs this
> test on vmlinux.o:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> 
> Relocate the logic so that the test is not performed on vmlinux.o.
> 
> Fixes: 1fffe7a34c89 ("script: modpost: emit a warning when the description is missing")
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---

Hi Jeff,

you're a few hours too late:
https://lore.kernel.org/linux-kbuild/20240606183921.1128911-1-masahiroy@kernel.org/

Kind regards,
Nicolas



>  scripts/mod/modpost.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 937294ff164f..f48d72d22dc2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1647,10 +1647,11 @@ static void read_symbols(const char *modname)
>  			namespace = get_next_modinfo(&info, "import_ns",
>  						     namespace);
>  		}
> +
> +		if (extra_warn && !get_modinfo(&info, "description"))
> +			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>  	}
>  
> -	if (extra_warn && !get_modinfo(&info, "description"))
> -		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>  	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
>  		symname = remove_dot(info.strtab + sym->st_name);
>  
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240607-md-scripts-mod-7f7ff091e02b
> 
> 

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

