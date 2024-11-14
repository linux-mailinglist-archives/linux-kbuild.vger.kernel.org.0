Return-Path: <linux-kbuild+bounces-4680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B69C882D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406E0281E4A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063061F80CC;
	Thu, 14 Nov 2024 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="eVZWWRK0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184701F76B8;
	Thu, 14 Nov 2024 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581812; cv=none; b=DRZ5HUw9GazFy4g57eFN29E6553JeRjDuT4awF+pSbaIEw99CvUiDAOzpBRp2t6KryWJRAJpog0uFkh1UyvPfrQAVqqqA628TYXenMgXpC1QO73T/XtYllsJI4h8IMvsRGR8PpEnxn+1MY5ucCwUH878E8CKl0HygnVfgfqGiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581812; c=relaxed/simple;
	bh=vwdN0vVN6KNr9XwcmB1SeVbH6UjOkmTwOagxPR3jE74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elrt0NUhho624vtIjRheL4CFEhX0uyOFQsNPk0QyXR6U0Lg01+1tUtvvcxJpZtpUlZtwERVmnPzSplbm/q+ZY8LWpEAFksUKiTgVlcOfMaiUUp8JiNOT+oEyhLwKOQUPAxmuCkR9EaKOZEMvK293xjtur+KOLApgQQBHOsF7Hkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=eVZWWRK0; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JcgWVDgrh/YLlhkESEt6S3lp2D/7irK6FLwZDYuS/jI=; b=eVZWWRK0Z8wIfBSC0Weh5lLBzj
	nA/Xx1RVotJ4taJ2mWe8IGMBwvujTQVYR4AYizhGRAJOmrJFpFwK5o/5hp8soDlq98OpvnddDLnBr
	2V8vV5vf6bhiRqi8vDW5NegPFODnCjHb8o8VXoU3+b9H5ZU7jtj09zFNnhYA+UNeIeH+CXDfhDrDa
	z5Mbs+kt+vVjUcQO0JkcTWCy/qy9TmwGaKkZnqMuNf+SzNW/Dr2Hx0RK9hJcg0Xa46Pztp7GxCjRR
	qrzyNolaFHxOccWLYO3BqlKzCqtxgoHUacSKfgfeUJE7V8wKVzOrw5grfamVat7vcbXguqRZKOt4f
	vHAbT2Hw==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXWh-00By0K-BL;
	Thu, 14 Nov 2024 11:56:39 +0100
Date: Thu, 14 Nov 2024 11:56:34 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: do not pass -r to genksyms when *.symref
 does not exist
Message-ID: <20241114-nondescript-overjoyed-cricket-52ccdb@lindesnes>
References: <20241111171753.2917697-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111171753.2917697-1-masahiroy@kernel.org>

On Tue, Nov 12, 2024 at 02:17:40AM +0900, Masahiro Yamada wrote:
> There is no need to pass '-r /dev/null', which is no-op.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8f423a1faf50..36eae845a3e3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -110,7 +110,7 @@ $(obj)/%.i: $(obj)/%.c FORCE
>  genksyms = scripts/genksyms/genksyms		\
>  	$(if $(1), -T $(2))			\
>  	$(if $(KBUILD_PRESERVE), -p)		\
> -	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
> +	$(addprefix -r , $(wildcard $(2:.symtypes=.symref)))
>  
>  # These mirror gensymtypes_S and co below, keep them in synch.
>  cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

