Return-Path: <linux-kbuild+bounces-2891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4594AD0E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDFD28152B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 15:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C83D12DD8A;
	Wed,  7 Aug 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="htepBJlS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD882D70;
	Wed,  7 Aug 2024 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723045142; cv=none; b=c5fFrTrM6yxIa0qYE1c472zMGJH2FZqixKm4f3AauuaPDaGnYMujljSIaIMxIvudTjJGFX0Dk7XMGK5eLK2vFzZm/HR8A4NYa/hTEEZEpPb2yJyen/QZkXo6YYg6p3TMU5cdFk9G7xZ/VQgY5TNrtNlKe0K4YxZTdaUCKgD9N/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723045142; c=relaxed/simple;
	bh=XXrVvazBPCVSRU5/OT0GJvBZ8iw+n2FkA749zr9ireI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9ZWOSHnBpRicYs309v/sdRrcNgHOH44Njpo8302auEOHs6pnajz+P7IMWF2U/h/gMXoUNppFDmQaKPezisxCHs3ZLCPFbc8WUSyrV0MqgdNR8UZ0MPzxdXPZ8Lt7AeZQNfaEsji9/fyFAiracW1bk9HeDb4FugtXivqykmEnpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=htepBJlS; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fGlMApxeReVSP5e96DejXHnM7BqtFE0t1NLvKtj+CC8=; b=htepBJlSv3TXweGvYd1e/IcXP9
	4aO+giJbJx58b60SZVRn3eji+s+y9amraDXY4LVEUteLM7SR02UOpc8vukAhiNM3hLIxKcJPAkmbJ
	zRZlFecOIxqHiPW1wPgHUTJDyiPHiqz5F+w354386gFDlGa0PApMHGWAbO/XXxmhZbNDLTC8xy/yx
	0Ptc+QPZL+VInnSrxKunCnIMQAB3N2fmTMC1GL0Rr7F4qPUyMPZl0hEXNUHrg640wDwe3YPXBkLV0
	bQ8Bs3liwACPMSV89v3xmItYRDrloNNvcxplq9DgWCFQGIciJiObO9xXxkqPzeBNIbBB+VjiDh915
	vni9YOpQ==;
Received: from [2001:9e8:9f8:5201:3235:adff:fed0:37e6] (port=41026 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sbikQ-009fVq-7r;
	Wed, 07 Aug 2024 17:38:46 +0200
Date: Wed, 7 Aug 2024 17:38:28 +0200
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
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
Message-ID: <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>

On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> The genheaders requires the bitsperlong.h and posix_types.h headers.
> To ensure these headers are found during compilation on macOS hosts,
> add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> adjustment allows the compiler to locate all necessary headers when they
> are not available by default on macOS.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/selinux/genheaders/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
> index 1faf7f07e8db..017149c90f8e 100644
> --- a/scripts/selinux/genheaders/Makefile
> +++ b/scripts/selinux/genheaders/Makefile
> @@ -2,4 +2,5 @@
>  hostprogs-always-y += genheaders
>  HOST_EXTRACFLAGS += \
>  	-I$(srctree)/include/uapi -I$(srctree)/include \
> -	-I$(srctree)/security/selinux/include
> +	-I$(srctree)/security/selinux/include \
> +	-I$(srctree)/usr/include

'make headers' composes the UAPI header tree in $(objtree)/usr/include.
So, if you build out-of-source, -I$(srctree)/usr/include will not match.
Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.

But I am suspecting that this break cross-building.

Kind regards,
Nicolas

