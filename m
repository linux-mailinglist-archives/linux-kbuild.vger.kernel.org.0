Return-Path: <linux-kbuild+bounces-11291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLEwMkUAjmm0+AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11291-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 17:31:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113712F734
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 17:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 499A1302E920
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 16:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902F3342CB1;
	Thu, 12 Feb 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJvHvBYQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32135C18D
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913607; cv=none; b=L5wUQdqQDFeRFssPGe/NLRQOfeIPgXmpUif2qMRr31hjazo3AvZFByK5vK5NEib0oNgdtCkn+vAESa8L9DPzS0/seIQ8YjrKeGrNzjxSu+VW1LHMF1jQEy3T/x9vnzhCbRD0I6g9M+Dk5A/9nCGtkFVhDf64W9nMvox/xJVpIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913607; c=relaxed/simple;
	bh=yNqsU7BqsPq36H9rsV187QJZXqol22Xrk2dQGyEbFGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwcOiQ37b+2LkkfXBiyZtFNmJpBjOUhNoXrtnjL9DWczepOWllM23vS7Oy5iG9m3qWCivl/ub5NDKdRHWbwdHH06nJiRqN+o4oZa6ka3Xc5pmbY3D7dx5/X/BBAcxJtuGQ+x0ucelbRYLKMHLQFUCWRWKuvGiBtRUXXpW3ou6JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJvHvBYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D27C19421;
	Thu, 12 Feb 2026 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770913607;
	bh=yNqsU7BqsPq36H9rsV187QJZXqol22Xrk2dQGyEbFGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJvHvBYQ6gDks/PdJ2yESiR6V3vw82Qb3eqXpGo8HXT2KnYICyMHIyMYvD8DdKYlC
	 km3s87waTWUo4O2KfBzgXcxn5o6SepLxYLKKilbxE5dlwFUwcamx+z/V4GWqLkY/Lc
	 JzcbwKbboxIQW15WmWqSfFfATGnoXCVIEMu0fiqeamywux6nOgWaMmXbUk74k5D+wK
	 9EAV6OHYOwDfq60kjwZqwV+20sKnRAdIhN9+U01v2vttHOB+ZYqWjhRqvZdwaeTBHS
	 RmbV7OxFBXBZd3r1xSvR5VE4wFPC49dMadSxrCYFrjcFJ9r9rst+WJcd1VZsUBbswu
	 MARP5cJv0WTRw==
Date: Thu, 12 Feb 2026 11:26:43 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Lukas Herbolt <lukas@herbolt.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix generating debuginfo manually.
Message-ID: <20260212162643.GB802926@ax162>
References: <20260212135855.147906-2-lukas@herbolt.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212135855.147906-2-lukas@herbolt.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11291-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,herbolt.com:email,p:email]
X-Rspamd-Queue-Id: 2113712F734
X-Rspamd-Action: no action

Hi Lukas,

Thanks for the patch!

On Thu, Feb 12, 2026 at 02:58:56PM +0100, Lukas Herbolt wrote:
> The ${OBJCOPY} and ${READELF} are not expanded into path to readelf
> and objcopy binary so just use the binary name with the %{_bindir}
> makro.
> 
> Signed-off-by: Lukas Herbolt <lukas@herbolt.com>
> ---
>  scripts/package/kernel.spec | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 0f1c8de1bd95..d032f6aff91b 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -109,11 +109,11 @@ echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginf
>  while read -r mod; do
>  	mod="${mod%.o}.ko"
>  	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
> -	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
> +	buildid=$(%{_bindir}/eu-readelf -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')

When using the binrpm-pkg target within Kbuild, I do see these expanded
to their Kbuild value:

  ++ .../toolchains/gcc/15.2.0/bin/x86_64-linux-readelf -n net/ipv6/netfilter/nf_reject_ipv6.ko
  ++ sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p'

but I guess use of the spec file is not limited to being within Kbuild?
How are you using it? I guess using the srcrpm-pkg and building it
manually?

I would prefer to keep use of these variables so that the user's choice
of toolchain is properly respected. The proper way to fix this is likely
using a fallback only when the variable is not defined. Does this work
for your usecase?

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 0f1c8de1bd95..c23ff98f63ed 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -109,11 +109,11 @@ echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginf
 while read -r mod; do
 	mod="${mod%.o}.ko"
 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
-	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+	buildid=$("${READELF:-readelf}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 	link="%{buildroot}/usr/lib/debug/.build-id/${buildid}.debug"
 
 	mkdir -p "${dbg%/*}" "${link%/*}"
-	"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
+	"${OBJCOPY:-objcopy}" --only-keep-debug "${mod}" "${dbg}"
 	ln -sf --relative "${dbg}" "${link}"
 
 	echo "${dbg#%{buildroot}}" >> %{buildroot}/debuginfo.list

