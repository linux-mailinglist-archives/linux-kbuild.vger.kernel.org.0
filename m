Return-Path: <linux-kbuild+bounces-2102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFED905C08
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 21:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322CA1F21F2B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 19:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF5B6A8DB;
	Wed, 12 Jun 2024 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="eFgF4iMw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D793A29F;
	Wed, 12 Jun 2024 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220824; cv=none; b=rEN3cyF7r7DDzML1UajAdQO487HDwmMFOhB5JxTE283JNdPboF6VdYBRkwpQjzCW5u7hDmy5uGvnJqL8ixJ+h81nz75U9sTx8eRbuLcwgQAUKo+cXl9HSlix+OiePFLAZc7SsG/A5qOyjm3EbifgipYcZd+dnSkYD6RCF/ZR4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220824; c=relaxed/simple;
	bh=Gax1/X8fKY4aRilNx+vxa7ff0//c5oRtSKW1r+ZZUwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZaqu6029278UDphr6Wum0+Wr3Jag4sVUkNwk43tpFed269uK9w8fEnEvLVGMqlgDm1juevKPFvqeK1RQhLabNWahMw4/odaT8r4X4Khz+G6f1kSDx0POW/En53SbrbmpvxxBvXiHyeu7eeqoZbm12a0nkakk8oa9fWK43WLcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=eFgF4iMw; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ak6OXrPF07tGTttAP9HDGFvaFe9ciAKjMYI3suYEzEo=; b=eFgF4iMwqL8SamlFCaLlXT9wi1
	GAheQ0ACG+IrfSit8wAxJ1clqQNzcpdPZEtlBX4eXVhxCr0DzSDpDSIz7/wXqroTylslTQrlZJjOh
	bFEe0KEEWGGizmzev+Kvl7Bz/wrQI1I6Ix7tnJ5jnm07esmyhXkG6SsCYQPbusAbx8EQpQxtzm3Xy
	ToU1kFenDeKbB/Kr3LV3iSIaKWe4ug06QM9dHEiDlkOwC6aJKImaCAJozv1ln2S/qkr0WejPlfWGl
	TY37foRlLiuRMfZHwfbo/vyHg3njCFFiihrFhi5LWkL0Mci644fhy5OD4pR6Uz0Gi/5o3PF6j0Dls
	hUwVWazQ==;
Received: from [2001:9e8:9cb:9501:3235:adff:fed0:37e6] (port=58678 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sHTiq-005QXv-Ou;
	Wed, 12 Jun 2024 21:33:28 +0200
Date: Wed, 12 Jun 2024 21:33:24 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: package: add -e and -u options to shell
 scripts
Message-ID: <20240612-innocent-acrid-husky-5a6cce@lindesnes>
References: <20240611160938.3511096-1-masahiroy@kernel.org>
 <20240611160938.3511096-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611160938.3511096-2-masahiroy@kernel.org>

On Wed, Jun 12, 2024 at 01:08:06AM +0900, Masahiro Yamada wrote:
> Set -e to make these scripts fail on the first error.
> 
> Set -u because these scripts are invoked by Makefile, and do not work
> properly without necessary variables defined.
> 
> Remove the explicit "test -n ..." from scripts/package/install-extmod-build.
> 
> Both options are described in POSIX. [1]
> 
> [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

