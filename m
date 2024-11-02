Return-Path: <linux-kbuild+bounces-4484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00A9BA27F
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E94591F215E4
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CF814AD3F;
	Sat,  2 Nov 2024 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ggS9IAm6";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mMNXPe6H";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="4Z1kFXD6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E591ABEB4
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581929; cv=none; b=CD6BPr3cBfJsyd8sgjee8JiHKmHbHLLrw376KRe+6WTCZFYw4LUemlIZKy+Bo7CLuOomgxqThu/bkPoci3VUfTS0vmbxL8OTMvf7ck+Jj6BYctAveypP43RzDpL0oPL6v2k7vWflwVADRMuSb34y6bh8HmPSDwXJR3xDdq1fuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581929; c=relaxed/simple;
	bh=J07DlnM5y0IgSwLwOlgdAJoz6JVY1WPCt/oTAdL9wgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTOKtoXcNpA4Ux+BJ90JrYhRsU6sfwmJt8LLiuYZeD/J9oQsqkpNR7UtiiaD+S7ewH8aLx98/TvJ8wAZUp8FqXggaYNNMQ1/TqFpx7GwDH0664hbPqUexSb/CIFyVoN36bJ99gZrhti5e0w58dNEYfoLZQ7TDXPCDcmFjWHeoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ggS9IAm6 reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mMNXPe6H; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=4Z1kFXD6; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582822; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=zWaoI4SD49sleU/FrwHQLZPOqKSnr5NxHmOp5mAf5w4=; b=ggS9IAm6kqKAap+rqtKYo8vvhu
	U6RrEyUvxKSZ/bc7bT9elT/paK00Z0nn2jnaVlrDW6743+pUbwRY60OzEDJVhw8MuDrrcuEXEtstR
	2YVh+ndw1+f8IwMZvFHMcj9jdPLJFLnkHpdKBpEFSVsl0+FR+c6T8YHGzuNl6ILTYxT9WpJDFZn6K
	Pz2rOk/IDArHVoHWkQS+LLH9Tp4/Mp4/Me77/BcyCuuJdnTlkMgeXwfh8D5qCmyRHEjMGlW8qiGVc
	OZip9bVZ9hgKT3pIlUIRfcGP+qwxDo00TDxr0Nhxa0jlnNYN4GaOmYYvvko6uZ8e89l6aftxUTTJR
	SfsgfHQg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581922; h=from : subject :
 to : message-id : date;
 bh=zWaoI4SD49sleU/FrwHQLZPOqKSnr5NxHmOp5mAf5w4=;
 b=mMNXPe6HsUzFpOEJa8202WKi56F+P4GpQPSgO+bzAJEga98qH3fsthh/YNoECk1oVv0e/
 UiDbIjbEA/UZ7L6p9jE31Yf0b4T0WV/HqSq61vqX5iJDDBhGApXTSdvz2J6ynJScltVUoYd
 F3+1pGuSBFIOTa+6sJKfbb0NBpOGODTjkRDGya629Vd49m5D9Z3AhiFRitBkt7lM0vyHngL
 rxmyrLFC/2wQ+6o3Gly+7OM8cVDE7DqkAFUJh6mM28k1ezXGYA9BK2kR5UGd53BT5sfYpY2
 YHeoR2rYK9+btYknQg9o4aekRxIJDLE7oPHtLUHZbZchp4tMJwUmTSs4NjlA==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LOi-qt4D5j-CC; Sat, 02 Nov 2024 21:11:04 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LOh-FnQW0hQ0jh2-nLIy; Sat, 02 Nov 2024 21:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581863; bh=J07DlnM5y0IgSwLwOlgdAJoz6JVY1WPCt/oTAdL9wgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=4Z1kFXD6fDlw6UFcmD+MHH4viIDZhu9cPwxcbh9DQDxToKGZjKRQuFJfpqhOkDvSk
 wnCEtU6T/6YFYB4emxOw7blQWKrZIdYQBByoDwMXen+tcqlUUC5wf1kvX8D2SHSMTb
 D/gmmBfC1dAKCUo+pU/c1Qkp4iHLNqRqlSmFFavA=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 0A9753D7A0; Sat,  2 Nov 2024 22:11:03 +0100 (CET)
Date: Sat, 2 Nov 2024 22:11:02 +0100
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
Subject: Re: [RFC PATCH 06/11] kbuild: set $dry_run when running in --dry-run
 mode
Message-ID: <ZyaVZhPfiVszWhcp@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-7-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-7-vegard.nossum@oracle.com>
X-UID: 190
X-Smtpcorp-Track: oV4D3UIgizh9.FsnROLo3vsTG.PpW61wJawOn
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sZAV7eZdDs
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:03:03PM +0200 Vegard Nossum wrote:
> Add a convenience variable that allows us to use 'ifdef dry_run...endif'
> in Makefiles or '[ -v dry_run ]' in shell scripts to test whether make
> was invoked with '-n'.
> 
> See [1] for an explanation of this particular construction.
> 
> [1]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 58f3843ccfac6..953951157ec92 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -22,6 +22,11 @@ $(if $(filter __%, $(MAKECMDGOALS)), \
>  PHONY := __all
>  __all:
>  
> +# Was make invoked with --dry-run/-n? Record this in a convenience variable.
> +ifeq (n,$(findstring n,$(firstword -$(MAKEFLAGS))))
> +export dry_run := 1
> +endif

As in patch 1: 
As we still also support make v3.80 to v4.0, please use $(short-opts)
defined around line 27.

> +
>  # We are using a recursive build, so we need to do a little thinking
>  # to get the ordering right.
>  #
> -- 
> 2.34.1
> 

I will have a look at the remaining patches within a few days.

Thanks and kind regards,
Nicolas


