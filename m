Return-Path: <linux-kbuild+bounces-4681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D859C882F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A911F212CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D9C1F77B8;
	Thu, 14 Nov 2024 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="p+lCVVnb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F871F80B2;
	Thu, 14 Nov 2024 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581844; cv=none; b=QqzfQFQ3E/mN8dup+3dFJjGEINEYuigfh82znn0gN/PdnZvteTqSx61QAUe+4g5PboKuuxs05yYvFmTEImhllh9I+IzKmEWLnOlehOapGXWIAIYK31OCNqXdJxAY7Nd6yuCvhxR8XoA/QdXeoEVpYCAjuT0MWIZGPgOR+WD80FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581844; c=relaxed/simple;
	bh=rd90RKBu0PLF4IRiu02aDUUyKJVlKJAki6hHLm9+S3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn2uW4Kuoouwyl1LODjBF1DFA6QyLwMFpGJg0zb+fZAECRmDK0axSCg6R9GvDeTaE4x3ltYUvDcSBd8dugHsSJnk1jfvVylXIRcV2IDqdD955X/UfosbTcg/7hFiyc19VagArTVpPcBpj5EWNsVaXcYREmLS6yiVmRgobqX4nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=p+lCVVnb; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=keNupS4Gip6EVT1j1tZx12HkwQV0z2ey7QYUst9JKNE=; b=p+lCVVnbDgizNk2H7H1CZQqA1u
	lgjtSIFuUjUQA9R0YyvNLECL8cPYH2WtB1jKEpYdDFL2iVV1nE2yuvjWBqkupHI4cw0oAdwBnUlN3
	sWJcaXP8NJ4lvYBalEuj6zbkA91iiRb9wuhk7NoNrtdXGq/rEuiVTpe6WEH/qh8QziYrs57u4o56C
	e9UOx3Xrp6xWyINueVFwa1UAciY1X3IVlOmX/wYjBvCU8WvgJqiwvqaUdpwz00rpQBqvxnbJeJuhS
	m7GsBkFRqtwcHP706DmKrOKfwfYK8lrYLLNIKR8UIYMcxwVmlj8ooRo9QrFBv1BS0GvwU3WZO/cJX
	Gn34ZbOw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXXF-00ByJE-Hq;
	Thu, 14 Nov 2024 11:57:13 +0100
Date: Thu, 14 Nov 2024 11:57:11 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: remove support for single %.symtypes build
 rule
Message-ID: <20241114-mouflon-of-nonconcrete-jest-badbe0@lindesnes>
References: <20241111171753.2917697-1-masahiroy@kernel.org>
 <20241111171753.2917697-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111171753.2917697-2-masahiroy@kernel.org>

On Tue, Nov 12, 2024 at 02:17:41AM +0900, Masahiro Yamada wrote:
> This rule is unnecessary because you can generate foo/bar.symtypes
> as a side effect using:
> 
>   $ make KBUILD_SYMTYPES=1 foo/bar.o
> 
> While compiling *.o is slower than preprocessing, the impact is
> negligible. I prioritize keeping the code simpler.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile               |  2 +-
>  scripts/Makefile.build | 20 +++-----------------
>  2 files changed, 4 insertions(+), 18 deletions(-)

thanks, looks good to me.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

