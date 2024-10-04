Return-Path: <linux-kbuild+bounces-3911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40A990A03
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 19:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3341F24DAA
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 17:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321BC1D9A57;
	Fri,  4 Oct 2024 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiFRSEYE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F91D9A54;
	Fri,  4 Oct 2024 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728062065; cv=none; b=Lnefauei+vbS1OM+jp5SF5xVHEhfyYoC22M9AwW5v+Wnydf0+y3ypkQeI+hct6FFs1ZFiE7Pfwws3SGC99E+V2IO3DTKajMhtQoxwfDzO2jbf/0xkd271GuCaur5gKItmdmjG44O7wziSD1ETdRQ289dgKUm8tORWr6+w23ugBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728062065; c=relaxed/simple;
	bh=c+tR2k4Sw0XcX3b7P8u3lqeiL2Sgi57l1khjfQ51leM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+ylQZIKSa6FR27lJskBYcJHiDWwu7D3GBzDLLEeXGEJcofygvIcJAbqS9A7thVqrZUwcmSVJxezmmd1V33+GYtL+kWubeEo/gIKuBfcbPFq83HlzXEzmN7oONtwZV1+PoINX6J1hMz4kGqpapHCITCbve1RTmk6P2f0Apbczqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiFRSEYE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BE5C4CEC6;
	Fri,  4 Oct 2024 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728062064;
	bh=c+tR2k4Sw0XcX3b7P8u3lqeiL2Sgi57l1khjfQ51leM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiFRSEYE9+CAbXahdleSGzRuAvLRRr6OE6YXy1KnOcMkbcN/mlTIbtp7TWMRMJlIz
	 eKBY6Al+d52oYrWpDvOrJyhhnQXO/4m55EqcWBo1Ll9yFebgSa5z3nu18/18nUGwKP
	 BmQOKey8aKo6xu7uDEG/THXlYeHXLDf3o1nSZz0RIjiDRBq0OgZryh1XxtC8+V0zFK
	 Dpn8wCuMdYGbbw9aASV/0Futpe4h3wjGXqc4aSy9kPaW45RQcHbsttzoLajS7I8g8D
	 HRO4bqc6jWtdmaxythwvrA7SZcmC9oQDnpEMuYfSC4AQRlmKGIZmNRo/Ld/b38fWfV
	 CQr4xkhomt/eg==
Date: Fri, 4 Oct 2024 10:14:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Aaron Thompson <dev@aaront.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: Remove blank first line from maint
 scripts
Message-ID: <20241004171422.GA3142084@thelio-3990X>
References: <20241004075245.169046-1-dev@aaront.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004075245.169046-1-dev@aaront.org>

On Fri, Oct 04, 2024 at 07:52:45AM +0000, Aaron Thompson wrote:
> From: Aaron Thompson <dev@aaront.org>
> 
> The blank line causes execve() to fail:
> 
>   # strace ./postinst
>   execve("./postinst", ...) = -1 ENOEXEC (Exec format error)
>   strace: exec: Exec format error
>   +++ exited with 1 +++
> 
> However running the scripts via shell does work (at least with bash)
> because the shell attempts to execute the file as a shell script when
> execve() fails.
> 
> Fixes: b611daae5efc ("kbuild: deb-pkg: split image and debug objects staging out into functions")
> Signed-off-by: Aaron Thompson <dev@aaront.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/builddeb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c1757db6aa8a..404587fc71fe 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -74,7 +74,6 @@ install_linux_image () {
>  
>  		mkdir -p "${pdir}/DEBIAN"
>  		cat <<-EOF > "${pdir}/DEBIAN/${script}"
> -
>  		#!/bin/sh
>  
>  		set -e
> 
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> -- 
> 2.39.5
> 

