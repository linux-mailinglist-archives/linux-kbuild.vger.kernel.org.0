Return-Path: <linux-kbuild+bounces-13192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NaYLABnCWr0YQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13192-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:58:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B11E55F93E
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 08:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A1F603002B10
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36C02F7F17;
	Sun, 17 May 2026 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH1eN5t4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFED2E1722;
	Sun, 17 May 2026 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779001085; cv=none; b=l1WYpquKXnakz3feDdNrzdHrbEvJ9ycEb2lNCS5AkXcaV4TBc7ZKUHaf5YtyuHvPeGlIcuJK8T5gE7GD+wrQguRQu70nXDOxDh90I5qs4TitdknvL6ie6RxXBXXHH8rKKW+sfV4+u4kfa0RwuuanDyLWQ1UN+53QO94pwLp8Dtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779001085; c=relaxed/simple;
	bh=1Eni4ZufK6V5UzBNZORjgqdT/y9J7S9wJDI+OhHDDMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPtDTu6KNORiOPt4RW3mtdvCpd+JokZ/pg67mANrJbD1WA0YwOiAGl1wi1P/YCGxvv+6GbJhp0QaBIgDKHzA6BtFx8+vo9i0uTkkKGmMfPzaw7reguBPa3X/ihRDR3jBwXlay/xyzI7uA31fX+/DgdLC7LmeYzxn3bnbY0SSYLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH1eN5t4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71C0C2BCB0;
	Sun, 17 May 2026 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779001085;
	bh=1Eni4ZufK6V5UzBNZORjgqdT/y9J7S9wJDI+OhHDDMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oH1eN5t4aydpnktLqYh3hC/58MJSgokaXz8h1C/vidGYmPxsP8gtNpHNg1/Pfxdgq
	 ra2YQMSTE8WIyf+bYoTLmv5OgwvUBx+apnDCkygmDB809Y45JnCRamaUUI62NnNtPs
	 5QN6l1fSSE2fsf96ZRcoYV/jrj7lE+lMafq8iqwJ8v9MnR1kUz9/i4PZzx1j2Oj9qd
	 KEGxD77BBgJuME8ToSkHAWiy+YLoZyStDFM58te+xG5/4/dtXzFqvQAJKdx+t//Zjo
	 IqG/J7xAj2xg93WS4CawB/AP933p3OASbeHk7Z8WHjP/k8kQsy+xDTGsP0J3ZWkxmA
	 2k6zGet6bt/Hg==
Date: Sun, 17 May 2026 08:57:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, nathan@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: Allow setting package name at build
Message-ID: <aglm3IFmnCPInJqH@levanger>
Mail-Followup-To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	mario.limonciello@amd.com, nathan@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260505152957.695641-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505152957.695641-1-superm1@kernel.org>
X-Rspamd-Queue-Id: 4B11E55F93E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13192-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 10:29:54AM -0500, Mario Limonciello (AMD) wrote:
> Users can change the source package by setting variable `KDEB_SOURCENAME`,
> but the binary package name is hardcoded.
> 
> Add support for setting binary package name by using `KDEB_PACKAGENAME`
> and let it affect both kernel image and debug image packages.
> 
> Update kbuild documentation to include defaults and mention both
> `KDEB_PACKAGENAME` and `KDEB_SOURCENAME`.
> 
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  Documentation/kbuild/kbuild.rst | 10 ++++++++++
>  scripts/package/mkdebian        |  6 ++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 5a9013bacfb75..cbdd2224c3a55 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -177,6 +177,16 @@ the UTS_MACHINE variable, and on some architectures also the kernel config.
>  The value of KBUILD_DEBARCH is assumed (not checked) to be a valid Debian
>  architecture.
>  
> +KDEB_SOURCENAME
> +----------------
> +For the deb-pkg target, allows overriding the default source package name.
> +The default package name is "linux-upstream".
> +
> +KDEB_PACKAGENAME
> +----------------
> +For the deb-pkg target, allows overriding the default binary package name.
> +The default package name is "linux-image".

Do you see a real need for that?  (We should prevent adding
complexity when it's not neccessary.)

> +
>  KDOCFLAGS
>  ---------
>  Specify extra (warning/error) flags for kernel-doc checks during the build,
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index d4b007b38a475..cbe4266fac732 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -166,7 +166,9 @@ else
>  fi
>  sourcename=${KDEB_SOURCENAME:-linux-upstream}
>  
> -if [ "$ARCH" = "um" ] ; then
> +if [ "${KDEB_PACKAGENAME:+set}" ]; then
> +	packagename=$KDEB_PACKAGENAME
> +elif [ "$ARCH" = "um" ]; then
>  	packagename=user-mode-linux
>  else
>  	packagename=linux-image
> @@ -252,7 +254,7 @@ fi
>  if is_enabled CONFIG_DEBUG_INFO; then
>  cat <<EOF >> debian/control
>  
> -Package: linux-image-${KERNELRELEASE}-dbg
> +Package: $packagename-${KERNELRELEASE}-dbg
>  Section: debug
>  Architecture: $debarch
>  Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
> -- 
> 2.53.0
> 

Did you test that patch?

These changes are not enough, as scripts/package/builddeb does not pick
up the non-standard binary package name in its final 'case', and thus,
_no_ binary package will be generated if KDEB_PACKAGENAME !=
"linux-image".

Kind regards,
Nicolas

