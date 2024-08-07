Return-Path: <linux-kbuild+bounces-2887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65294ACC9
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3925F283A60
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DD685270;
	Wed,  7 Aug 2024 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Hgcni6Ox"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253B79949;
	Wed,  7 Aug 2024 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044263; cv=none; b=kBbNTrHRChWZynoRtcG61s4PNpS2G8vV2QcbNw88XJlflMsX5CFZ+ArSOCz1a/hx+4faUoAFC2Fn+5qY6S5se9Mk8TBJKCleHfdUBVaRpnQdUcosDOL/0hYZIaPLij6JjTgol40zP7u1Qma8H80/pXd2K5Ts/3l//ZNRjpi7oBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044263; c=relaxed/simple;
	bh=ymFPhwGI8e7n9dghkO5/gX8tfO8C7fo9qKHbVYc2iV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a39JZFSsLO7AY8o2Ckc3G668/2Hhf9lzy2OqDp94+ubYshDmJ+XY6jRkuiXYzucLLjlsdv9fMeX6AEw5QJaa5nPiDj3I5a1aaxPyvJz5WXOPCwJIaiXxfHgAsihxzJ0CzE4pm5EtGu6X3lcU4aTwgJ0wL43um56dajj3Ncvp0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Hgcni6Ox; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8p+8xkYytY0kAtRIiarGiLqc+3CeFPeAk9BYp1+Be+o=; b=Hgcni6Ox2D8FDaPA4MfcZbKN6U
	9lLSq3Q7GUU3+GllOyhCeZHbJA0tL14j23d4QDpMTl4w/aXYprIt1HdcW/FwqeS04X0pozycGo8im
	ZG7XpFmgej1m1/Wx1k4TniZ4dzo4Zke7LDpuRIaTpB7yIjPjLjTnZHh5hvzoqvtxxNPxlV14qvR9h
	6JOTX9FjdEiSNbs9g4oD/BRv04kpaHEALD2ttmeHLVEVftdyLZ6JtwnavADmeYTL2jzkNEuhkuB7A
	aHsxYe0qWQ1MMw1F3+LCEHGCE8aeFHNlPAHElLODPwPnr9hrxMTSLQUbpM7aq1d8KhP01oubv1FeU
	03Wqun1A==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=36192 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sbiW1-009bha-HL;
	Wed, 07 Aug 2024 17:23:53 +0200
Date: Wed, 7 Aug 2024 17:23:27 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org,
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org,
	llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
	gost.dev@samsung.com
Subject: Re: [PATCH 02/12] kbuild: add header_install dependency to scripts
Message-ID: <20240807-witty-warm-hummingbird-20c9a7@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-2-4cd1ded85694@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-2-4cd1ded85694@samsung.com>

On Wed, Aug 07, 2024 at 01:09:16AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> Export kernel headers necessary for the tools located in scripts/. This
> ensures kernel headers are generated before building scripts/selinux.
> 
> Kernel headers required for building are: asm/types.h, asm/bitsperlong.h
> and asm/poix_types.h.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 44c02a6f60a1..7ac079955a94 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1173,7 +1173,7 @@ include/config/kernel.release: FORCE
>  # Carefully list dependencies so we do not try to build scripts twice
>  # in parallel
>  PHONY += scripts
> -scripts: scripts_basic scripts_dtc
> +scripts: headers_install scripts_basic scripts_dtc
>  	$(Q)$(MAKE) $(build)=$(@)

Since commit 59b2bd05f5f4 ("kbuild: add 'headers' target to build up
uapi headers in usr/include", 2019-06-04), composing the user-space
header tree is separated from the actual installation to
$(INSTALL_HDR_PATH)/include.  Thus, you do not want to depend in
'headers_install' but on 'headers' instead.

Nevertheless, I am suspecting that this leads to trouble.  E.g.: if
scripts/* include $(objtree)/usr/include/asm/*.h this will probably
break cross-arch-building.

Kind regards,
Nicolas

