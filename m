Return-Path: <linux-kbuild+bounces-11435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ub0IBpFon2mFbAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11435-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:24:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6314119DCC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B86E6301A3B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A6530FC12;
	Wed, 25 Feb 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiduML4D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E13009CB;
	Wed, 25 Feb 2026 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772054669; cv=none; b=q1ZIdFV3v+PBoPFnlwFKXZCO6bYEUqrjWeEuNFWXbgKDICRjTW/2SKYtwh3UHw8N4rbFCqN2Sk5bXGyXEgrZEBBylD+LgrcfQ/vyfHEjjnOOLzEviMle7F8dFpw7Fe4uqmmxMOOZssbP5+avt5H4S+iilseRBlgvCQaurO4Wpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772054669; c=relaxed/simple;
	bh=An+4PmQKCqtYEv6pK5wyR+h4nWH+oIEekzQFvdCRVOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL3Gd/u6PEx8m6Yq+AoDFO2ozRMZW5IQxjbIjmL9PmoUBzPzgfaWlthyQhu59K3glyrevpBmKfZldnE0niIkIyHD7gHLsJpZDIboGdvQiZGZh4G+Wl63Ap/TuQ3D9XAWVUDR2GriQz5M8Tlvzu0zgNwFg5ovu9dML8f55W17/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiduML4D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB80C116D0;
	Wed, 25 Feb 2026 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772054669;
	bh=An+4PmQKCqtYEv6pK5wyR+h4nWH+oIEekzQFvdCRVOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JiduML4DzPfi8sxI3NJqEdgY4tMu+eKzl9mpayo5eqJX+vjj+Hu3k4XF0tsa+XFlS
	 6CkgMStohNzvXCZTuYbxO9+K6ZO+K2fxMe5+hb6hlhMWclCluU9bfjUhATlQ833WPh
	 LkT44XM/Ix2RVn0bVZvaOVI6k/jLCgW/qIYVuMMMVSWmwihjvRzcAS3s8fojpJgDc2
	 VLYCJw+K39fte82wfc99jaqVNqH5XbuEAHCwThaal/0Rh2vsro+YAUjhHfq+K+BS6X
	 Uy1rN1yc+02Q1V8m7+wVIzqYzc7oWvQ++vy11j2Thg9eLavfl30TKYzNuiGQcY4gnd
	 mHdvT5DxPkNQw==
Date: Wed, 25 Feb 2026 14:24:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ed W <lists@wildgooses.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	masahiroy@kernel.org,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: extlinux can't boot kernel after commit "kbuild: keep .modinfo
 section in vmlinux.unstripped"
Message-ID: <20260225212425.GH2755225@ax162>
References: <587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com>
 <3ac876ca-0038-41e8-a1a0-3d5434f30473@leemhuis.info>
 <20260224204632.GA3510750@ax162>
 <4ff9d8be-ba4c-4698-abe8-31fcf2717acf@wildgooses.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ff9d8be-ba4c-4698-abe8-31fcf2717acf@wildgooses.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11435-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6314119DCC2
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:55:06AM +0000, Ed W wrote:
> Yes, your patch works fine against my 6.18.12 kernel on my AMD64 machine and booting with extlinux
> (previously not working)

Thanks a lot for verifying! I will send this as a formal patch shortly.
I will include:

  Tested-by: Ed W <lists@wildgooses.com> # x86_64

in addition to a Reported-by, if that is okay with you. Let me know if
not and I will remove it before I apply the patch but I want to make
sure you get proper credit for helping out with this process.

> I also played around a little with some variations and it seems as
> though the adding in of the .modinfo into the strip is the key, caveat
> that in my messing around (based on inspiration from the commit [1]
> that you mention), I needed to reorder the macros to get it to
> compile. Note, I'm not suggestion this as a solution, just
> illustrating some extra info:

Yup, this is definitely another option but I still think including
.modinfo in ELF_DETAILS was dubious from the beginning because it is not
really a generic ELF section, hence splitting it out.

> --- arch/x86/boot/compressed/vmlinux.lds.S.orig    2026-02-25 10:42:45.040655315 +0000
> +++ arch/x86/boot/compressed/vmlinux.lds.S    2026-02-25 11:06:32.907372114 +0000
> @@ -80,17 +80,18 @@
>      . = ALIGN(PAGE_SIZE);    /* keep ZO size page aligned */
>      _end = .;
> 
> -    STABS_DEBUG
> -    DWARF_DEBUG
> -    ELF_DETAILS
> -
>      DISCARDS
>      /DISCARD/ : {
>          *(.dynamic) *(.dynsym) *(.dynstr) *(.dynbss)
>          *(.hash) *(.gnu.hash)
>          *(.note.*)
> +        *(.modinfo)
>      }
> 
> +    STABS_DEBUG
> +    DWARF_DEBUG
> +    ELF_DETAILS
> +
>      .got.plt (INFO) : {
>          *(.got.plt)
>      }
> 
> 
> Thanks for isolating the issue!

Thanks again for reporting it and sorry that I missed it.

Cheers,
Nathan

