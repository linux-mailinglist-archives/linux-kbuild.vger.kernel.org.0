Return-Path: <linux-kbuild+bounces-2764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147EE94377A
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 23:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63F0283E87
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2024 21:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6103E4E1B3;
	Wed, 31 Jul 2024 21:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="g2PwaoY9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136771A270;
	Wed, 31 Jul 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722459705; cv=none; b=fObfZV8ixm85V5USPMsrAvsbcNJE+lVoN9SwYx/RGphRFsszn9vf4zeRWwkFa6RlMiSL1v47k7rjmdaXvpnv66Ln6btfN8uoiTljUj2BIuUhHEjq9ZSDqjUWbsO9kAOtfz+MmcrZaHlalEAVnLApPy/gZEX0pZYu7eoWTwVu6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722459705; c=relaxed/simple;
	bh=6Vxh3SBrYAtxdL/OKrkk51hWH6YsXZOAFyq3vwA/xKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfTwy/cuaKIGaVAbAAIvCYrtzpcfvcOYdwQ3X95bcJF1oI2BafB27WrSH2PFiWPsvQ8A2kxbDM+ZdA5vX1DoAIMrHPTzAH51WFJm04CPPiq4hGL2rWvxAx65k1pQWns+WZBY+mm6WO8zO/VB/POAKJhPxN/ZcRLqm5xA+nC9pKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=g2PwaoY9; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G7i8IsCNsbxalJ27SsujhFj30+XZeFDYtj71lANOu0s=; b=g2PwaoY90y6/x5iqnZuSVpjZgB
	7LcI8mdLiji2/dfPn7fZGas0Al+NnbTjfky8zQowlJL0JT1Vbe66m0/dGrj4vzRqE5vhgx0sKmBYF
	o17UXeTW6JTC+4sFS9YWGNS05UscRsyfs3zWbnWY9uiEMU2Up0K3iJRgJzkxVYSWNGjPZ4LB4HHGk
	rWlwjSdgmmZvpDxXIzXQ30eLhUezN4xRwwMyGU1yqJVY3PdRfNNHsmJzINT6EXbLmJHPLqvTURqZq
	wN4tvgZNHiXbHFmodWkvJ6hJlQUHjvBrf7ITcEHwwiwI01QNldP/oczvMcfOUhGmEvl0ue/4zSy04
	oVNQuosA==;
Received: from [2001:9e8:9fa:4501:3235:adff:fed0:37e6] (port=36588 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sZGRv-009HY3-Jj;
	Wed, 31 Jul 2024 23:01:31 +0200
Date: Wed, 31 Jul 2024 23:01:26 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <20240731-light-overjoyed-tuatara-bbdc2f@lindesnes>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-4-masahiroy@kernel.org>

On Sat, Jul 27, 2024 at 04:42:03PM +0900, Masahiro Yamada wrote:
> Exclude directories and files unnecessary for building external modules:
> 
>  - include/config/  (except include/config/auto.conf)
>  - scripts/atomic/
>  - scripts/dtc/
>  - scripts/kconfig/
>  - scripts/mod/mk_elfconfig
>  - scripts/package/
>  - scripts/unifdef
>  - .config
>  - *.o
>  - .*.cmd
> 
> Avoid copying files twice for the following directories:
> 
>  - include/generated/
>  - arch/*/include/generated/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

nice.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

