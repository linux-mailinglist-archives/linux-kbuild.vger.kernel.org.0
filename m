Return-Path: <linux-kbuild+bounces-3914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F70990F4C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 21:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09DC928307D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 19:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734511EB9FA;
	Fri,  4 Oct 2024 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="XxQD4dDR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D01DD863;
	Fri,  4 Oct 2024 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728067624; cv=none; b=QeAFl3oDyQNYkBghtguqVW4ZFjClCv42LF2siX7WVGQg9jflnhCIhBE0uS3P/pxohgidcd3Av9ZNbYqyfyOOBMd92dPDSeTO5I3uxNIOSOh6dp8y7khqZ0PzsyA5oBFpLJRrLFgPyW5Ns2SbkhUDmSXOPkLo3DsvFKPij7ch6xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728067624; c=relaxed/simple;
	bh=xddue20JJVosrUgttbTHKBMmNPNpt18+k7Z9d2ZVQm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W186rvEuFxjt0I53YmEKy648kN1gl2Gp8QKVP741BUA2h7usi3cXft4DGqXlkuD8EhT0/dO6Y0L3Vj3EcGrAPtfXvTV/aRtiTlrj3UAoYG7G0f0pf6q39RaxeQfT5XVFjACCKzBjfJHhs1j+BKDLMGR474L7evuuQY51t8Zjqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=XxQD4dDR; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+XYXSvT60QiwXsMKvAAFrIJ3OH8NqC5cLlNbnh0tr6Y=; b=XxQD4dDRoolTy1W5oWDlKXWcDJ
	hdgpkW/9iDkzD/APy+G8r/c6cTCTPnuDbcuMr4l7HtFKEBMySYJP40dvPedUa7TIPyCE9X0B0eLAm
	bCJ1URX2wdSv4EesrgVxr4RwyTenRlW65mXLP6eMaHoCXUjIoPwN8ynOekq5JDPTXQuPVQJK7piwf
	eHVh0QNVQO0HaTLO+r6tA5Ltpr6RwN0F5FKVO5uwC8KkWgw2gVgbxaa0CZKPX/Y8X0o8TQ+cj89iP
	ngZy6pc7rSJsFv/3MZrSql18vtfq+GSQayBhV9q/5GLHE5auz8WE94op88KpG9RB4n1zAjOAy+hqh
	9LHz1FaQ==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=34676 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swnKA-00ClbX-W8;
	Fri, 04 Oct 2024 20:46:47 +0200
Date: Fri, 4 Oct 2024 20:46:41 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Aaron Thompson <dev@aaront.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: Remove blank first line from maint
 scripts
Message-ID: <20241004-discerning-hedgehog-of-education-33b0e9@lindesnes>
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

Thanks.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

