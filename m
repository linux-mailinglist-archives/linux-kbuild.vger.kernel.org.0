Return-Path: <linux-kbuild+bounces-3624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231197CA86
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 15:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30271F21CE3
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 13:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFC019E7E2;
	Thu, 19 Sep 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="xKcqMvp1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BCA1DFF0;
	Thu, 19 Sep 2024 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726754052; cv=none; b=nMsVMXcEwPL8fIvhbsDTnNaOdwyv4p5DPrnnZTnbUOHO3bTAlQ8aiIc9W2mbxByA71NNgybh96o2fCwSDmF9OnvCGJKlFcDdPNBSmr3Zff4pEc/uedMw2rqDfJ2JVTdJTmBpf0lJfBe5B9yc0Jv1pa+Svyemf0PJIoUqKmxNcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726754052; c=relaxed/simple;
	bh=Pm+7GoSu0uiOZAWSPEjKiBQSwK16XTTxlMOeWiDzSWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMmHjtQvHpv1drL9NjsD6BXQdBwTAuZ0kci3MeFh2d3sVqRj+sGsGAroCYR0NQsI+KyymmY1tMreW5A3VF9/mozk92powbZ6E+pDyFq+6vFAO1j7Un0/2oGOXzK0z8i01q8C4Or7KjCHrg7wfS0PObKUKbqLUHwz/owbg4LwP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=xKcqMvp1; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726754048; bh=Pm+7GoSu0uiOZAWSPEjKiBQSwK16XTTxlMOeWiDzSWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xKcqMvp1Ij5AOdfEYu4rKsS6UlHI31k3vQrD3j4SsmAMTvNYZS7I4ft1pcbclgkrB
	 W18i/lfzq9dGt8KpKeZAOw+chA7EqZF3fLmgJLNPseNZSJXi0nz/JFBHyuKUKa4dKH
	 5W/mgSaWSjSJYYLA2AWjf1bwyI5VQv6KrT7HW+g4=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 19 Sep 2024 15:54:07 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 8CE7480725;
	Thu, 19 Sep 2024 15:54:07 +0200 (CEST)
Date: Thu, 19 Sep 2024 15:54:06 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 08/23] kbuild: simplify find command for rustfmt
Message-ID: <Zuws_qal2uJs0B2V@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-9-masahiroy@kernel.org>
X-purgate-ID: 149429::1726754047-225FCBF0-203D04F9/0/0
X-purgate-type: clean
X-purgate-size: 2060
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:36PM +0900, Masahiro Yamada wrote:
> The current 'find' command does not prune the rust/test directory
> itself, requiring an additional 'grep -Fv' command to exclude it.
> This is cumbersome.
> 
> The correct use of the -prune option can be seen in the 'make clean'
> rule.
> 
> [Current command]
> 
>   $ find . -type f -name '*.rs' -o -path ./rust/test -prune | wc
>        70      70    1939
>   $ find . -type f -name '*.rs' -o -path ./rust/test -prune | grep rust/test
>   ./rust/test
> 
> [Improved command]
> 
>   $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | wc
>        69      69    1927
>   $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | grep rust/test
> 
> With the improved 'find' command, the grep command is no longer needed.
> 
> There is also no need to use the absolute path, so $(abs_srctree) can be
> replaced with $(srctree).
> 
> The pruned directory rust/test must be prefixed with $(srctree) instead
> of $(objtree). Otherwise, 'make O=... rustfmt' would visit the stale
> rust/test directory remaining in the source tree.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5b16e0605a77..4992b2895dd5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1740,9 +1740,8 @@ PHONY += rustfmt rustfmtcheck
>  # when matching, which is a problem when e.g. `srctree` is `..`.
>  # We `grep` afterwards in order to remove the directory entry itself.
>  rustfmt:
> -	$(Q)find $(abs_srctree) -type f -name '*.rs' \
> -		-o -path $(abs_objtree)/rust/test -prune \
> -		| grep -Fv $(abs_objtree)/rust/test \
> +	$(Q)find $(srctree) -path $(srctree)/rust/test -prune \
> +		-o -type f -name '*.rs' -print \
>  		| grep -Fv generated \

Is there a reason for keeping the grep for generated instead of turning
it also into a find prune argument?

Reviewed-by: Nicolas Schier <n.schier@avm.de>

