Return-Path: <linux-kbuild+bounces-4677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4A9C8802
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 11:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6431F1F26142
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 10:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4471DE4DF;
	Thu, 14 Nov 2024 10:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="NuWojqJS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E31F76BE;
	Thu, 14 Nov 2024 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581296; cv=none; b=M5S6UzbqwW+SKZ3D8X2aEFaH8geek0h6cxI0v0Dc2fQ9e3KwgRXaJzOca60rqIdst5ejMooAO4uN7Ow4jyzkr+Cxa/ZcGVVVY4ZWl1avPEQ0j5jwYgQmcZLBJrGgpExnR8TtKhzA+YcyskNsW6wujsgsjne/rFEJ1HRWbqS7Cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581296; c=relaxed/simple;
	bh=lcbMfSx7aE7WFWHa97yg6J4hEt2aRKFAVbeD64ZteuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSky4MwDV0eiO7njdYBlVacWy7Ju8nVlOLx2TVcje+UhlBC25RxWx3acT2lgYiwgGqzyoDGVSAhP9+CjHcn7HUJaGwTEE4XAowXZvuW+dbp6EVaW7fzljHoGjRoAhk4zGX/iB8IptSovIbktnkSkHo3gPSoanEPReFz7+HSE+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=NuWojqJS; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K/YKcMGmo7nzhzqhCU6iCchuRPXRNMQRmiW8IPXq5y8=; b=NuWojqJS2Jw/djqObs+lAxhw1R
	cfOT8OF8Bm8U/VSoal8TVgiWIBooI7dNWuvK985oVrq+ndMUFsUF6V9GbqwaZVjakwkzjQ6h9WBlq
	GfHReGL1UfQeDEG6MUmOybsLgHXg/ANMGfY0USbNtnBfXBqSdxUhUiAB4auw2PsKD+rK5HXyRIArt
	vMcW3D0y+ppJP1Ye7IjDTjkhRraE4HZOTR8Is3Kr4S6oOUaM2DgLrXvNcLK4iFYTk4c2ds8d6Fpjl
	RRc/9juQlj5+76XZ5UBDiREnm2tDm0GAaGYS2AKmJthhvVV2qrvN2Upc9i0ivmhEqzUgmIwUaXCRr
	MDstYN6A==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tBXOV-00Btuj-7O;
	Thu, 14 Nov 2024 11:48:11 +0100
Date: Thu, 14 Nov 2024 11:48:07 +0100
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
Subject: Re: [RFC PATCH 09/11] kbuild: simplify commands in --dry-run mode
Message-ID: <20241114-intelligent-dexterous-dachshund-637fa9@lindesnes>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-10-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-10-vegard.nossum@oracle.com>

On Mon, Aug 19, 2024 at 06:03:06PM +0200, Vegard Nossum wrote:
> - $filechk is used to check if a file is up to date.
> 
> - $cmd includes logic for echoing commands and deleting intermediate
>   files on interrupt. Skip all of that in --dry-run mode and just execute
>   the command.
> 
> - $cmd_and_savecmd executes the command and echoes it into .<target>.cmd.
> 
> - $if_changed_dep executes the command if any dependencies have changed.
> 
> - $cmd_and_fixdep executes the command and updates .<target>.cmd.
> 
> Skip all of that in --dry-run mode and just execute the command.

Why do you want to skip these checks?  The more mechanisms we change for
--dry-run, the less the output shell script is a good way to review with
regard to security issues.  And it "fools" those who want to know what
really happens if 'make' is run w/o --dry-run.

> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/Kbuild.include | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index ed8a7493524b2..a1ef3b1828bb3 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -94,6 +94,7 @@ kecho := $($(quiet)kecho)
>  # - If no file exist it is created
>  # - If the content differ the new file is used
>  # - If they are equal no change, and no timestamp update
> +ifndef dry_run
>  define filechk
>  	$(check-FORCE)
>  	$(Q)set -e;						\
> @@ -105,6 +106,14 @@ define filechk
>  		mv -f $(tmp-target) $@;				\
>  	fi
>  endef
> +else
> +# simplify and write the output directly if we're just printing
> +# the commands
> +define filechk
> +	mkdir -p $(dir $@)
> +	{ $(filechk_$(1)); } > $@

To prevent having incomplete or broken output files of filechk, I'd like
to have at least the 'trap' here, too.  E.g.:

	(						\
		set -e;					\
		mkdir -p $(dir $@);			\
		trap "rm -f $@" EXIT;			\
		{ $(filechk_$(1)); } >$@;		\
     	)

Did you see problems with the original filechk implementation?

Kind regards,
Nicolas

