Return-Path: <linux-kbuild+bounces-4483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6D49BA27E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2339D1C20BB4
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72DB14AD3F;
	Sat,  2 Nov 2024 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="g1ZKy/MM";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="TVkRH2oi";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="1eVYB5TQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D71ABEB0
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581884; cv=none; b=E1Lq8tQ9VkTvQGweEnuOB/zGc3FZv1cJTS2sE5LDMDgia71Wlgq2QO4V0N5j0dE2/E5B8xibm6HgGzSNWaxsii1NDVD0T+fhUclck0SV+jSRR7NC4mrQKZ/XtUWjikgnPDfnH0sIKs+YtIAnrxLcgbeJ5UyrIdtpjPXByzJ/mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581884; c=relaxed/simple;
	bh=S+ftkDW+EolfF4nLXvY08UrrEM8BzHoTWikhA2a4CTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6toZJYAwPXC4ktN5OCuuf3wRClVCza57zhN5Ks1bOn97NHhcg73wSB8/08YEb29ysGma0pRYNdmMNUuNc7YOBvf73YtD7LUY19QDhSNyn0/zHd5TdJ5t7dqCHQG4NwOB4CZqied7POWYksFGJel8YDb5VJcSOA3tLeTvoJKhOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=g1ZKy/MM reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=TVkRH2oi; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=1eVYB5TQ; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582778; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=n8zANEvJLM/G1kIHRS+1DDQaAHa0Nzk9++SIxtdojWc=; b=g1ZKy/MM9Ry4v9f22AokceUKeW
	p3ZvvGyprLkETw731oqNnVAhnKGzVcZj6rgXHxWpWxxhJyKJEPhBTi/WMWihsRHLhYjoG7cx3UTDC
	62UjeZvWSLHWu3lHWQLQ7YcyKPPRdm6m3XMwRPmUTvdgKqkEB53yJ2XqEvosr9YU87pT31nwfQjSo
	VIOHUpHcF7TKctnMBGeFZb8RAFivFXbRZ8CFYFGJeNldOUyl7RPQH9s9qIk2Q6yVsnVwiAsbE8Jca
	Ozx1bf3nuC0E7hxNVWcwtaPUg4pfleVd2BtPVgtfJjT2Y/72clwRbdDyg5jhdIXDWkH7Lh7J8/JDk
	J3hv4NHg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581878; h=from : subject :
 to : message-id : date;
 bh=n8zANEvJLM/G1kIHRS+1DDQaAHa0Nzk9++SIxtdojWc=;
 b=TVkRH2oipE/e2/0jI8aXhgbX+dF+4jX4w1ZHwl6xWmjkskvXK5/bkt/87Fcx12QfON2Ci
 lXbabzGK7rrGCjpQMwicj2UsSlu2JlhKSIk+5MKfxMeuvOTt1FG96XKgZewzA6fbrecn/rP
 +wtkSV3+nZf07N7oRTpySqUnW/rLJtDRdCU/TXyPwLqVt4Gv5OmdPbtFt8Jzof1Sr709lzB
 9ugli3YctxIGYCiyzOl5vnHiDZp0A184AM4EY2/ieBTvGwqtesrUwlgoeilu0RAtFujJEbR
 vTpeCVu4ydxpCffL3+JTuZLQMidMKaDOfzxxnK+W4KI6dQDBli5o+MqqwSnA==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LNn-qt4K14-7W; Sat, 02 Nov 2024 21:10:07 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LNm-FnQW0hQ0j5X-muyZ; Sat, 02 Nov 2024 21:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581802; bh=S+ftkDW+EolfF4nLXvY08UrrEM8BzHoTWikhA2a4CTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1eVYB5TQeDufF9npVsPoeeXmKxebb162cfGGPzNiaqq0bYVD/yQSoWpmC6GQ/bBPr
 teEuctDed/3PkecGtmy382estuYal8Y5Cmn2Ms/e/kef1tJEpUOwaCNGwqMlOeJScS
 1HLq1i1yPDTQFFn+Ild6VmqnbOed4IB3EqONdhm0=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id D4B0C3D7A0; Sat,  2 Nov 2024 22:10:02 +0100 (CET)
Date: Sat, 2 Nov 2024 22:10:02 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 05/11] kbuild: execute modules.order recipe in
 --dry-run mode
Message-ID: <ZyaVKm2VaezpHWo5@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-6-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-6-vegard.nossum@oracle.com>
X-UID: 189
X-Smtpcorp-Track: twcbWUidzQmh.11N67K9zAB0A.s5wX5A46rvH
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286s-LvkLiyY-
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:03:02PM +0200 Vegard Nossum wrote:
> modules.order is read by scripts/Makefile.modfinal to determine which
> modules to build, so we need this recipe to execute if we want to be able
> to output the recipes for building modules in dry-run mode.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index efacca63c8976..34f86dced67f3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -417,7 +417,7 @@ cmd_gen_order = { $(foreach m, $(real-prereqs), \
>  	> $@
>  
>  $(obj)/modules.order: $(obj-m) FORCE
> -	$(call if_changed,gen_order)
> +	+$(call if_changed,gen_order)

As it is a bit hacky to mark an always sequential command as 'recursive' [1] in
order to circumvent the '--dry-run', I'd like to see a comment in the code,
too.

[1]: https://www.gnu.org/software/make/manual/make.html#MAKE-Variable

