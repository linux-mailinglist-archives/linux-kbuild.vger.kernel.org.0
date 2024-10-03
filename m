Return-Path: <linux-kbuild+bounces-3898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B881098F673
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 20:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781552826FA
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 18:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E7119F412;
	Thu,  3 Oct 2024 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="CAPZk2HS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059B6EB4A;
	Thu,  3 Oct 2024 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981241; cv=none; b=cOo78t7QwzlTl7DquRPB6JOFvhwBAYNmlSnTy7libH070PjeL2rYgsNprNjG1NKpZIjgaJOvkKIwj7VJk7hcN7idqExOh0AgWJWayjq/6RNMRs4D8/fOqpA7jpI7O/IBRCBBuGDR/hRxsAjB5Vbub6vkqj4WGdAdIqodcHko5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981241; c=relaxed/simple;
	bh=T9wz+87C74AUS9/08GqPgihpGyhIpa2SD6GazW5n10E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khAtCaDisoqpuQnCe1eM91+M1eY255yW/TPZ8+qH7UFMed/CVliQO+F899dIXE0KEbBbxUu8num4tYjv8SCJzIKUwXHOrOqb3aTyK4TWMaypVpO2WfwVB3aPt6RfaE9be4hAu/jEhaNFYRtphs0SM7UtIAI2Bey/ubxAxgLAMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=CAPZk2HS; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wegEXTDeqNu8qldzY9Q7ByoUaury9EFaSn0q1zTVDkw=; b=CAPZk2HSkzdnnvBYch7tMWy8z+
	hpJxtcs8dLaHzf4LOULwkPNVJCsPI63tpWGwprGiRH+IDlS1jU5OnCe3OhY8xrItcM2Y297T1MUHR
	0toiPW31MsRHqEL3kMQyfXipGBSTYjM3E/hUp3+szyQseqNtygy/FWIeHNf4VIznTb1tvyL8Ouo8A
	ViS3y8oi2Bx2NZ2lKC0/wnc9GYsWj4Evzs5ymqx8M+2BySS8F8tUqQi0lWixo5NSnBd6VS2VTUMvK
	/50nMBYJ9HRXKpyu6rBFVORwoutCJyxrjuzjY42WmhbIPI+o2X4/iixqqyJ1V5rTJ945apm7AZEEm
	Tp6wUuXg==;
Received: from [2001:9e8:9d1:b101:3235:adff:fed0:37e6] (port=58058 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swQqy-006CD5-Dh;
	Thu, 03 Oct 2024 20:47:08 +0200
Date: Thu, 3 Oct 2024 20:47:06 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 18/23] kbuild: remove extmod_prefix, MODORDER,
 MODULES_NSDEPS variables
Message-ID: <20241003-petite-mamba-of-champagne-d9e0ac@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-19-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-19-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:46PM +0900, Masahiro Yamada wrote:
> With the previous changes, $(extmod_prefix), $(MODORDER), and
> $(MODULES_NSDEPS) are constant. (empty, modules.order, and
> modules.nsdeps, respectively).
> 
> Remove these variables and hard-code their values.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile                  | 22 +++++++++-------------
>  scripts/Makefile.modfinal |  2 +-
>  scripts/Makefile.modinst  |  2 +-
>  scripts/Makefile.modpost  |  6 +++---
>  scripts/nsdeps            |  2 +-
>  5 files changed, 15 insertions(+), 19 deletions(-)

Do you want to remove these also?  I can't think of a reason to keep these
around:

$ git grep -Hrnwe extmod_prefix -e MODORDER -e MODULES_NSDEP
Makefile:1912:  $(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m:%.ko=%.o);) } > modules.order
scripts/Makefile.modfinal:33:$(extmod_prefix).module-common.o: $(srctree)/scripts/module-common.c FORCE
scripts/Makefile.modfinal:60:%.ko: %.o %.mod.o $(extmod_prefix).module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
scripts/Makefile.modfinal:66:targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) $(extmod_prefix).module-common.o
scripts/Makefile.modinst:60:modules := $(patsubst $(extmod_prefix)%.o, $(dst)/%.ko$(suffix-y), $(modules))
scripts/Makefile.modinst:120:$(dst)/%.ko: $(extmod_prefix)%.ko FORCE

W/ or w/o:

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

