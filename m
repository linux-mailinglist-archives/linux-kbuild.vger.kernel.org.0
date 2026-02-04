Return-Path: <linux-kbuild+bounces-11022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMzfAUT5gmm2fwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11022-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:46:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A0E2CA6
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F7B53013878
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 07:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD152F547F;
	Wed,  4 Feb 2026 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCbH/NbW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06A19E98D;
	Wed,  4 Feb 2026 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770191162; cv=none; b=ltzsmp9MIcBZ4Ol5MvI3x46cyXyb+ZQk/TcAzHA4QepS549sh34stSmawIXaEVgW+WTaVYp9hrTpKOegXLbJTKehPnXYW5a+GX4MPk4foKuN7T+7LP9krYVdIHIcmjWEGikonQ01lzghxwGlqsbELOfMEpzSBSHCMrkoJ6DMPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770191162; c=relaxed/simple;
	bh=2HSVOgUWoNd8530sZfZvG6Ui89nn0plkwV2CCdbNwIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMGz1pfge1RKLhd0jNx8JipuoGI7v7P21GAh039FNeDnduhF1EkfXaG4HPBHwIt3BR6ofm5CAIvpRbwXRoPP4GtzySvsYbcBP3U8YnhtYx2xOyHxpm6LGxyizV00oPRjQRzySSt6p/uaLOjP/P7YYXAFCta/EznEGE2j+jSlL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCbH/NbW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4EFC4CEF7;
	Wed,  4 Feb 2026 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770191161;
	bh=2HSVOgUWoNd8530sZfZvG6Ui89nn0plkwV2CCdbNwIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCbH/NbWOlavO7OormzFtCqw1fBmFPIbdcWmMsq30V3M1hrbfqbNHZRTNJmgAYPtm
	 Dri5lG0LRnwkgavOvG3UeOfniVmowx504ckXhNxlG3dWxfgaQ9X33UGGW8Kfy9Mq8/
	 1VD7L4vhG63eW1+vySW8qnv793AKHQTuRi7gpl504mGbzLj6tsdniFgPgMq6D0SaUd
	 qj5mru/Jb7lzQi1E73dKL1o0LkXSy3BQ3abVY7UWtLdbTOd6Exps5FDfPwsJvKzBvx
	 Xlt9ZiwYIaUmz2N3E2wXD3lhHcVpU/wyOVrTP5/V4AxGYJp3ZAT7gk52OfQezNl0jL
	 jPOvDXzrmXhsg==
Date: Wed, 4 Feb 2026 00:45:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>,
	Nicolas Schier <nsc@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: dummy-tools: Add python3
Message-ID: <20260204074557.GB1632007@ax162>
References: <20260121105801.1827-1-msuchanek@suse.de>
 <176973225791.178709.17831414346066426792.b4-ty@kernel.org>
 <CAK7LNARWymjMAZZSiAcduUCB_jk7K3qPtQ7okabp6ajwT2yz-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARWymjMAZZSiAcduUCB_jk7K3qPtQ7okabp6ajwT2yz-g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11022-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C3A0E2CA6
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:10:24PM +0900, Masahiro Yamada wrote:
> On Fri, Jan 30, 2026 at 9:17 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, 21 Jan 2026 11:57:57 +0100, Michal Suchanek wrote:
> > > DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
> > > interpreter to make it possible to configure this option with dummy
> > > tools.
> > >
> > >
> >
> > Applied to
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next
> >
> > Thanks!
> >
> > [1/1] kbuild: dummy-tools: Add python3
> >       https://git.kernel.org/kbuild/c/76c73cfde7988
> >
> > Please look out for regression or issue reports or other follow up
> > comments, as they may result in the patch/series getting dropped or
> > reverted. Patches applied to an "unstable" branch are accepted pending
> > wider testing in -next and any post-commit review; they will generally
> > be moved to the main branch in a week if no issues are found.
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> 
> 
> This was unneeded because we can pass PYTHON3=true
> from the command line?

Hmmm yeah, I guess that is a fair point, I had not considered that
alternative. I had figured that some folks may add scripts/dummy-tools
to PATH like

  $ PATH=$PWD/scripts/dummy-tools:$PATH make ...

to have all relevant tools be used automatically from their default
values than having to specify

  $ make CROSS_COMPILE=scripts/dummy-tools/ PAHOLE=scripts/dummy-tools/pahole PYTHON3=true

or whatever (at least, that is probably what I would do if I was using
this).

Cheers,
Nathan

