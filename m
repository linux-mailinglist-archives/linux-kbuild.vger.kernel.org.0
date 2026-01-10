Return-Path: <linux-kbuild+bounces-10479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA28D0DEF8
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 00:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F9783016996
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 23:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCDD15E8B;
	Sat, 10 Jan 2026 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxPDRCEs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18D4A0C
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 23:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768087248; cv=none; b=jVXhjFnDMobzL3JgZJQ9PP9DKUtLanXo2qG05XRsN0YChNsOGQES5ZNVz3l1U/qjMnQw+wB6pPEx7BvQMWLtEvUbiQwwD1CYpb1vP8D9FYOFJqaAhTbPO4VzxEHjch1PhANGNOjTlK/8RP1g1Jtr5TKU0D+dEAAJ3GGvzA3EfE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768087248; c=relaxed/simple;
	bh=pSR4CaJdOk+6G3UxVcHQevhDwrTvDZw905tGykCVCZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7B1yDXa9fI+k+58HCoQlW74xKlhns3skL+3E3zJ/LjAG8CMTrvWvHk6r47PO8LrsO8saNrBfnM1wRvUSW9uGrVcy/QWmYVO0NjlF1UaZwNT8dhhesH0yShyX1MaGVEBavdi+CyabNtjbhxNVpj+C5jU5G8fqaKQXNsGvoVDqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxPDRCEs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E659C4CEF1;
	Sat, 10 Jan 2026 23:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768087248;
	bh=pSR4CaJdOk+6G3UxVcHQevhDwrTvDZw905tGykCVCZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxPDRCEsvGDbNRjRFoqiuxlL4ZGbuq8C2lG2JuoQLz0wQ0mSpbiRBfxCGgAtPspu6
	 rfvBSFPhDfxxmJasR8EHriXMc5VEOdJKUI0UJ9tqpQwjDyTKW+TM9N6oGuz0TZfLOX
	 IT4noDI5fHMEd6/aiK/yCAFX5d2Qc9H4Tguoy6gW1iBMgf/8pjGa3/VrDz9FH2sdum
	 3ag3Y1mu+mEL6qCeMXL/l9hwJFhmtvMAqJC/QC09RIFpJD7gWkqNSIvsPdn3x4DDvG
	 TToe/7aiD4l5yv/uieogmePOBu/bgjRjZRjtr8KZrxj+0UbSkPzCWzB0mv0QvE4bji
	 djo/zzqEMdWAg==
Date: Sat, 10 Jan 2026 16:20:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arkadiusz Kozdra <floss@arusekk.pl>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: fix static linking of nconf
Message-ID: <20260110232043.GA90060@ax162>
References: <20260110114808.22595-1-floss@arusekk.pl>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110114808.22595-1-floss@arusekk.pl>

On Sat, Jan 10, 2026 at 12:48:08PM +0100, Arkadiusz Kozdra wrote:
> When running make nconfig with a static linking host toolchain,
> the libraries are linked in an incorrect order,
> resulting in errors similar to the following:
> 
> $ MAKEFLAGS='HOSTCC=cc\ -static' make nconfig
> /usr/bin/ld: /usr/lib64/gcc/x86_64-unknown-linux-gnu/14.2.1/../../../../lib64/libpanel.a(p_new.o): in function `new_panel':
> (.text+0x13): undefined reference to `_nc_panelhook_sp'
> /usr/bin/ld: (.text+0x6c): undefined reference to `_nc_panelhook_sp'
> 
> Fixes: 1c5af5cf9308 ("kconfig: refactor ncurses package checks for building mconf and nconf")
> Signed-off-by: Arusekk <floss@arusekk.pl>
> ---
>  scripts/kconfig/nconf-cfg.sh | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> index a20290b1a37d..fedebbd6b2c8 100755
> --- a/scripts/kconfig/nconf-cfg.sh
> +++ b/scripts/kconfig/nconf-cfg.sh
> @@ -6,8 +6,8 @@ set -eu
>  cflags=$1
>  libs=$2
>  
> -PKG="ncursesw menuw panelw"
> -PKG2="ncurses menu panel"

Is it worth a comment that the order of these packages is intentional to
support static library builds? I do not mind adding after the fact to
save you from sending a v2. I guess this situation is not too common
since 1c5af5cf9308 is over six years old at this point but if any other
dependencies become necessary in the future, it might help folks place
them in the correct order.

> +PKG="menuw panelw ncursesw"
> +PKG2="menu panel ncurses"
>  
>  if [ -n "$(command -v ${HOSTPKG_CONFIG})" ]; then
>  	if ${HOSTPKG_CONFIG} --exists $PKG; then
> @@ -28,19 +28,19 @@ fi
>  # find ncurses by pkg-config.)
>  if [ -f /usr/include/ncursesw/ncurses.h ]; then
>  	echo -D_GNU_SOURCE -I/usr/include/ncursesw > ${cflags}
> -	echo -lncursesw -lmenuw -lpanelw > ${libs}
> +	echo -lmenuw -lpanelw -lncursesw > ${libs}
>  	exit 0
>  fi
>  
>  if [ -f /usr/include/ncurses/ncurses.h ]; then
>  	echo -D_GNU_SOURCE -I/usr/include/ncurses > ${cflags}
> -	echo -lncurses -lmenu -lpanel > ${libs}
> +	echo -lmenu -lpanel -lncurses > ${libs}
>  	exit 0
>  fi
>  
>  if [ -f /usr/include/ncurses.h ]; then
>  	echo -D_GNU_SOURCE > ${cflags}
> -	echo -lncurses -lmenu -lpanel > ${libs}
> +	echo -lmenu -lpanel -lncurses > ${libs}
>  	exit 0
>  fi
>  
> -- 
> 2.51.2
> 

