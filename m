Return-Path: <linux-kbuild+bounces-3915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13494990F5B
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 21:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB9E1C22653
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 19:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BAC1F4726;
	Fri,  4 Oct 2024 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="pHPqcg5S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EEA1B4F21;
	Fri,  4 Oct 2024 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728067915; cv=none; b=K4oLUY3w3qMISwBdgHzggAzdF7UAiROzxI8oWwcNz1ohwwKOrPLdv3WDnTWnWhOfx/PGwDIX66dX8LfhK48+smvI9TiBl+G+Bn87H8jxtOeO+h0AZF+g2mOBowocOcatdIfRxCoZYiqU5+cNXRc4NIudK5ETryQoxxEUnKJpgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728067915; c=relaxed/simple;
	bh=pWuFZrwN4wtkilryw/UMy9cLsTNLyiM1dKKnNINkga0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCYFq1w/HFHnfylmkj1EjN0yFItoHYMmtz0Sqzswwy64B5Hx25qkgcfDBbuZuhYOjnBqnhQgR6pYfSDlgqtFg6Q3fubwdnUEFQeBaG8RxlVmq5h5Egma8Jk/h6bZEU6RziDMQAP9Kr3SXlJg8GHl+GY2j40uldBfye++Nb7Glr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=pHPqcg5S; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+QJWjJSXtNottcZdqX67V05rKODxR7ykGq3H14xUESc=; b=pHPqcg5S/RCjSaVyJgnDXzKNVQ
	w3IlDkCcuHjavGSu/y90BWIaUwZI80S0uS39BULxJkGJZuSyJphiEv1UcnjYA9cSR0amvX4t5Oz5l
	niNYzpees2PCyJFOo3jjp/9vbm1aga5Xo7CTuA8AzEGVhLb9twrLYgvgHR31RTp+koSiDdH/VL8LV
	EQdyW0P3cEmk/sfj+sxxa+Inbyjra6lb8M6bZ9CTXQ1hX1z/1Q9j1Tp762M1lXS/UeUnOFIGdXLej
	WA96GF8PF30nkL74XVyY+u/pWi+9u6MVEqCpe7NIPuKgU96KbFUkg8CfzaO5PbpP/pyTCBCzm6SOw
	wFhlExdw==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=55002 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swnOw-00Cmid-Dj;
	Fri, 04 Oct 2024 20:51:42 +0200
Date: Fri, 4 Oct 2024 20:51:38 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 20/23] kbuild: support -fmacro-prefix-map for external
 modules
Message-ID: <20241004-xanthic-shrew-of-trust-0f9e1d@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-21-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-21-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:48PM +0900, Masahiro Yamada wrote:
> This commit makes -fmacro-prefix-map work for external modules built in
> a separate output directory. It improves the reproducibility of external
> modules and provides the benefits described in commit a73619a845d5
> ("kbuild: use -fmacro-prefix-map to make __FILE__ a relative path").
> 
> When VPATH is not defined (e.g., when the kernel or external module is
> built in the source directory), this option is unnecessary.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

