Return-Path: <linux-kbuild+bounces-4675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511499C8800
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14321287A5A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC001D95A1;
	Thu, 14 Nov 2024 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="TQJxiW7n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583861F76B8;
	Thu, 14 Nov 2024 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581290; cv=none; b=johsOJ/YPJxcHug/f7dNt2A5SdZ1xVpYgo19+n8+/p/oLuVLwMTLvzCfpF/pb2keI2+AHuEf5DkXRZ/HK6+GVkMDbnho1dmeNlxM+T3SzCQZuNEu3V91UymywfocPDL82dLWIuSCYyVtHl9b1l/nKX90l32gC4QVWnTysCD1JWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581290; c=relaxed/simple;
	bh=sxFCjEjqiaVuRTJFeBLhDKcIDp/DrktOoKUbtAJM1b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTq8WmP7EI4S3xIcqRj2fouUtJpv7agi9oVqsOUVetzw+Zl+B8oP6Kdmds6mCloN6f8W5MBz0QaSnLo0Ikp0Iy8FpYVevrTTtrB86A4nkqGzIdcrBU2gdW6TITbXkblqKiOEBVxFY8i0MaAxGY8ka04cWXStGzxTm3WLnoAJLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=TQJxiW7n; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+clkKLM9jFYoiKFyLl80aCtm2jH4qz50H0X1WLkg5Cc=; b=TQJxiW7n2poCzKoA8e/zsin+Nt
	ORlHSM10otIc+Llv+K/BK9SPO7qjT+oyxfZEMOYVxToI1pBTzsHcq9YbfhqNY+Mr9WoofaHBDIOVe
	0B/qMswH4jU9pmZsLWSTQo8upK81l6WX/BIzk21yuxL5qPUKSCY0PLwNMjqJpwjlIFk5NbPSpHlXa
	QuK18Ge1ouGmnnFPeZMuI0LsNjmSnxUM75hGu2tyt13WfxqdIBJSI0TTc8biv2j4O+9Yn5d/PgDpU
	oMFbxLamrNJ1lqd0ZLmOGl1Dxy3q3rgqOQPa4LdNt0aDnKzoXMpRHVscPU2SrryQkJdxHPl2KVe7L
	IL2VuFPQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXOC-00Btir-QP;
	Thu, 14 Nov 2024 11:47:52 +0100
Date: Thu, 14 Nov 2024 11:47:45 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Morten Linderud <morten@linderud.pw>,
	Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 07/11] kbuild: define 'make' as a no-op in --dry-run
 mode
Message-ID: <20241112-original-agile-zebra-fcefbe@lindesnes>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-8-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-8-vegard.nossum@oracle.com>

On Mon, Aug 19, 2024 at 06:03:04PM +0200, Vegard Nossum wrote:
> Output 'make() { :; }' at the start of the script in order to make
> all 'make' invocations in the resulting build script no-ops (GNU Make
> will actually execute -- and print -- all recipe lines that include
> $(MAKE), even when invoked with -n).
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

