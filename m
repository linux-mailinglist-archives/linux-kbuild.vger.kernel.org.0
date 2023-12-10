Return-Path: <linux-kbuild+bounces-315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F280B9B6
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 08:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328501F20F9F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 07:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A5046AA;
	Sun, 10 Dec 2023 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="LM9bkzUA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEB7CD;
	Sat,  9 Dec 2023 23:44:44 -0800 (PST)
Received: from leknes.fjasle.eu ([94.134.18.127]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MVNEv-1qkuFq0LTD-00SP2g; Sun, 10 Dec 2023 08:38:41 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 356FC3E7DA; Sun, 10 Dec 2023 08:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1702193909; bh=DNZHZuoTVb8iiBmMv4/bDEZZmFG4g1uBd9syfZBaue0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LM9bkzUAOWbYpIUeGtl1JMcWnlsKZo6Sh00AgeYJk4PFsjKz9Hq1pBU/y8WHlaPKo
	 p3sVWBHD/hB/WTXoLCNEgqg7Bum2/E99SNQ3qYE8+8ML6jt8HlToL2sH98kxr6WpoM
	 uUcllFOk2HyU1bGfNWN4A5KGxX4Y3sgBjx7AOLRc=
Date: Sun, 10 Dec 2023 08:38:29 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	"Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] usr/Kconfig: fix typos of "its"
Message-ID: <ZXVq9Umi+E/+w+Ly@fjasle.eu>
References: <20231210053429.23146-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210053429.23146-1-rdunlap@infradead.org>
X-Provags-ID: V03:K1:XrBZkCXatTDcrdE1OEqVO7nhgSoUEfCLfP505mwNHm7kS2NPbWO
 wxVIR+JOyLPcScwBQMAh0hkTnksMOq6qtNLeCri3HQTWg0Kpz0uXmzux3Yi9666WSqQXy9q
 SrQ37f5p4NOl+QrBRKGZEbMAIksNRARPn87pNFDQorlcTTDQ3FMHnyvC1KE+IZ3hgrq7LJO
 dcDZWXhs5DUEpU67X2O3A==
UI-OutboundReport: notjunk:1;M01:P0:fqrkWfT3KjY=;1A24R0lfeMdH9UluB+ntnjcCSnu
 o0cfRwIbcQgjFwkbVR2NCJhvje8sB+e3vWpOgnRZz5/f+k87PdavDa47IbWB3uuax4PJt+NcT
 XslRocqQAj/ryC8uOu2qjkUQWcXLJPKhySO3+mrk9vW/UQiLFaUozc6QRaGqc0GLofQfl8xlW
 5IARwyHlNHJuaG0Wvsc+OMtNCUP+nM6WtUlZaa29QsddSe6YGXgxoahH9HP6PIJ2NhTxN/v4Q
 2G5Zlz0zOms+EIsgCs9AB3Vrc5jYRIE5wWG+zq/kxLkYlKtSdnC42d358Fr8yV0RzKEA1Clyc
 j/OnbagvuE0ny7MzIdrQ08fnWeMS7MlUmDxCAbKGKf1qhi9MIQnLKQVVrUIBjUJcNVgozLy93
 kmfFRAtJWr2YLz7o34MOiKzWj1eAMGtWrDEVtR1FaYBX3wfrB1i6hc2VxTgzHP8vubdMx/Xu9
 JYH7XYuXVGcJl9SfwMXN+93WrdJeizuscwJEHkBi3UGvCw3dM9rV2oeV7MiFIYPTpgh7Fd+kR
 DHZPvY9eKF7OTdzLpTtd2UhdatHvTRjse0euPqi/KE0/Bo4iV8qQqAOH4c/ZvT1W6C48cAuVx
 O3lntsXP42R9aCNAQfOFufMn8bdrwfW3MfWhfjp3QR4macFGops4XhUh9sZqHivbpYnP6MXvG
 NFkTX0hW5lvEsWgUdBDwUXrRqDNJp65Nva2MsR1vr73R0bXtLVFtsj7wlE495KnKbWstwXq6d
 t+vgIel4DWwzzexoCA5PgiVapHnO2mCfe99wjmsg3eCJNH4A9cClmN9qdFby8iFlVFmVnTrcv
 5bzd6SHCSozJszgelfH2pNUGT23wPrtJkbEakQvjuv5pGdJJdXZEYS8ekMqxYKO1iWIF84t/f
 PVqbSUfDAGjADLA==

On Sat, Dec 09, 2023 at 09:34:29PM -0800 Randy Dunlap wrote:
> Use "Its" or "its" for possessive instead of "it's" (contraction
> for "it is").
> 
> Fixes: db2aa7fd15e8 ("initramfs: allow again choice of the embedded initram compression algorithm")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: linux-kbuild@vger.kernel.org
> Cc: "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  usr/Kconfig |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff -- a/usr/Kconfig b/usr/Kconfig
> --- a/usr/Kconfig
> +++ b/usr/Kconfig
> @@ -185,9 +185,9 @@ config INITRAMFS_COMPRESSION_LZO
>  	bool "LZO"
>  	depends on RD_LZO
>  	help
> -	  It's compression ratio is the second poorest amongst the choices. The
> -	  kernel size is about 10% bigger than gzip. Despite that, it's
> -	  decompression speed is the second fastest and it's compression speed
> +	  Its compression ratio is the second poorest amongst the choices. The
> +	  kernel size is about 10% bigger than gzip. Despite that, its
> +	  decompression speed is the second fastest and its compression speed
>  	  is quite fast too.
>  
>  	  If you choose this, keep in mind that you may need to install the lzop

Thanks.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

