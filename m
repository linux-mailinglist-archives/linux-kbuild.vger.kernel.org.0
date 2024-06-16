Return-Path: <linux-kbuild+bounces-2143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216E909F50
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 20:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF50A1F22879
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 18:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9792E38F9C;
	Sun, 16 Jun 2024 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="pc5N7uHg";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Ds/Bq8Yn";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="DcetHFZZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436061B27D
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Jun 2024 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718563618; cv=none; b=ZaTpT29YBi7CJe6UccZPk8FOC140O0THCllb9K0yw6kVpiXgZKcEtJgwmPPnJvI15xFv57tx0hSEbRjtAXb+s8SkRSQsr4G96uVoV5RGHs2p5daL56pl6LzhaSd4HkSXI9vmLkM4ZVSTkY6WDAHeO034qb57ooAwHHdfpuzbUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718563618; c=relaxed/simple;
	bh=9DhZEbzas+CtNclrsBguGECeavhlLlYZQMF2NOQmRFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoEShSPw3JlBHB26qgX8BWwq4fv5ImZowsi9nNprqzk9Rgf39g8tumgR487vuEynNgvqwAP8jDoPO9qBSdis84a0SnXTcewu6HGpGMzze/4mnCa5+PQF8tirLRRGNniS66PWaALdXmW5gskMtvfakpT7ThNLjJmOxAm98ioFVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=pc5N7uHg reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Ds/Bq8Yn; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=DcetHFZZ; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1718564509; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=SfxTjcHQKIhjGOJY7W6O0kfFT22FJgcP74CYnv2HaHg=; b=pc5N7uHgubYuZP+yN1+TN11QoJ
	Rxdm9HHGMG20EYqYdo/gUrXnznZ1tSA5VlXKd3xgtEcG7sfwgYPYW4bORuVUVT5rKQM/SJJ13qby3
	StIbOmjMPzhNIY1g6bP44HEWU/UrZ0R6LwE+u91CY5ib4ymirbh+OEzdtD7sjf4VCp3Ci+xWBI6oR
	2SUr+kR1fLq1f/AvPmoMh+OB9WZzYEP6eY113qQhAbF1XMqVVwawnLnVse+am20McLUOOwrRFSVjA
	/xjHrFcLP12teDrbop0RoanbR1hD9fg5B5AXzpUsEmKlV8UfCVjUrP2IPkoPapb1JFnlB+7XqON16
	lCXYwhuw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1718563609; h=from : subject :
 to : message-id : date;
 bh=SfxTjcHQKIhjGOJY7W6O0kfFT22FJgcP74CYnv2HaHg=;
 b=Ds/Bq8YnMLwSBH3oGGeZKcfIVnSETfHq9p3NlcEmr17+My7Egslyew8EYnRO7PbM6pX8/
 PwGaDFNT3N16Wff7S7opN6Lzz4wnJMHfTeaKI9F4+Zt+9Td3U6/smPdNpdC84q/5ZVWnE8d
 7Ss2P1jepM/MouZZ5KsMNQP0Yy1YDE7nUhUCu/usu+V2lh3tz/D9DrLrU5y2Ay9Ef53HvaN
 p8gQ/CDsM6qLnbJyxH8CjasbkIUVh8swnCPI98o/8QIChCTEEpiLgSwOIHXB5I4tIZvhUmG
 g8uOO3LOpjt1oNlC3ycdsvfjzFVmC/lr7JH6gOiGQed6Vy95ieWDisalhHjg==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sIutW-TRk0om-MB; Sun, 16 Jun 2024 18:46:27 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sIutX-4o5NDgrqM61-pdec; Sun, 16 Jun 2024 18:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1718563586; bh=9DhZEbzas+CtNclrsBguGECeavhlLlYZQMF2NOQmRFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcetHFZZKDnpLDtke8vBO77xn7AGolHghr2Op8Rhn9WJi51S5K6yk3St58xWuZq5e
 sVYkeRcC/Y6JPMYxPUiPQS+MxDJkwq5twetRtX7cXqoTeTJTiKfD0WiaEdZXzcch5A
 P/IPiIHz+yMycL4CCnePlnHzprfyJloSAl7kVTG4=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id DE5203E724; Sun, 16 Jun 2024 20:46:25 +0200 (CEST)
Date: Sun, 16 Jun 2024 20:46:25 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: Explicitly define optional user-defined
 variables
Message-ID: <Zm8zAf6sQGk0QWyk@fjasle.eu>
References: <20240616-sensible-celadon-hog-0b0dea@lindesnes>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-sensible-celadon-hog-0b0dea@lindesnes>
X-Smtpcorp-Track: naZiiIQ1yYCX.9H3Fmq-yC1BG.2ZBH8QYI0uz
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sBJOJk_tte
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Jun 16, 2024 at 06:37:16PM +0200 Nicolas Schier wrote:
> mkdebian supports some optional environment variables for controlling
> the Debian package generation.  Declare those variables explicitly to
> allow enabling of 'set -u' (error on unset variables).
> 
> Use of ': "${VAR:=}"' for variable assignment is POSIX compatible [1].
> 
> [1]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#colon
> 
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  scripts/package/mkdebian | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 070149c985fe..81e81906ad07 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -6,6 +6,18 @@
>  
>  set -e
>  
> +# Optional user-specified environment variables
> +
> +# Set target Debian architecture (skip auto-detection)
> +: "${KBUILD_DEBARCH:=}"
> +
> +# Set target Debian distribution (skipping auto-detection)
> +: "${KDEB_CHANGELOG_DIST:=}"
> +
> +# Overwrite the automatically determined package version.
> +: "${KDEB_PKGVERSION:=}"
> +
> +
>  is_enabled() {
>  	grep -q "^$1=y" include/config/auto.conf
>  }
> -- 
> 2.39.2


Please ignore, cp. https://lore.kernel.org/linux-kbuild/CAK7LNARPP_OsaOhUHT+5-vi5XJ36hDs0bNsiM7pwuAmj4S+MNg@mail.gmail.com/

Sorry for the noise.

Kind regards,
Nicolas


