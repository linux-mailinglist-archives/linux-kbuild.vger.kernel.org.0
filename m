Return-Path: <linux-kbuild+bounces-10982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPFGH/V+gWnlGgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10982-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 05:52:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6064D47EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 05:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFF7530107EE
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 04:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4951224240;
	Tue,  3 Feb 2026 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thiESWPj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A178D21146C;
	Tue,  3 Feb 2026 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770094289; cv=none; b=KUDsUnzO9ONmssedTiUpGdN8KBIh3GOeFU+NLhHTVRIuBy1gSQMBkKxmQxtiYw7iny7l90ub3Nu5s5kNGEiRCwFRpxVGe8P2ipqcIPLgneCMZVmH8ASNLIkwI7O+XkZstAqXShkuh1vNEPkRXgmmIKz9E3sSYARXku5V/jVhUYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770094289; c=relaxed/simple;
	bh=vztEDDY5I/Z2WxelwAVH4Ye7ACWYcyxoY2rW84OdqMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ9Pdr99h/yL9ZNcQDOVk5xRhYLH0/RmMNv610SGnZwwwYuigD8zCxn4vHK5TI+SyZKkM2bgNlMSCyqY2IxA2MFLiZiIKkAZKFHbPk8rdXc3gOBnhi1moxj1qG8noopW6BOnvHD9k9eg4NNt/AQYHSrTwZvhSvSMkZX+3N+27EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thiESWPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCFDC116D0;
	Tue,  3 Feb 2026 04:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770094289;
	bh=vztEDDY5I/Z2WxelwAVH4Ye7ACWYcyxoY2rW84OdqMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thiESWPjK1xf1O+EirRXINuCiZij/qOhAY6hbP9dtc/OQoQCWPhA7bgfDS87ZGjMt
	 DPJQps4Jyhhjopsw46qlZYMPIFmXJ2TC27NvSAdIpQ814JQ2RZqUIc/En3evkPs7BC
	 kIesYpLSC4/ESGLt2BtcqjVNYTPU22YYVQ/YmiE3zWpZLTtUffRWeljLO+XH65uDtm
	 fsSAEorqja6ONipyPjQl9nMsl8ZK8jSyyA+y+D8O+7ypjft5WttVrI9mw7j2T4tFMh
	 9ppHjbKsyyZUUF8MXTI0zceUmWKivjlZ0lKhNQJtAFwgXndkChnt8F/aVypzzOkT3l
	 gXhCKgoxvRD6Q==
Date: Mon, 2 Feb 2026 21:51:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Nick Terrell <terrelln@fb.com>, Nicolas Schier <nsc@kernel.org>,
	Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster
 operations
Message-ID: <20260203045123.GB3049363@ax162>
References: <20260106162738.2605574-1-sjg@chromium.org>
 <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10982-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,image.fit:url]
X-Rspamd-Queue-Id: C6064D47EA
X-Rspamd-Action: no action

Hi Simon,

On Tue, Feb 03, 2026 at 03:45:36PM +1300, Simon Glass wrote:
> On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
> >
> > This series updates 'make image.fit' to support adding a ramdisk to the
> > FIT, provided as a parameter.
> >
> > It also includes a few performance improvement, so that building a FIT
> > from ~450MB of kernel/module/devicetree files only takes a few seconds
> > on a modern machine.
> >
> > For this version I have dropped inclusion of built modules, as there is
> > still more discussion to happen in that area.
> >
> > Changes in v9:
> > - Rename the variable to FIT_EXTRA_ARGS
> >
> > Changes in v8:
> > - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
> >
> > Changes in v7:
> > - Add a note about the " -> ' change
> > - Add a new patch with the MAKE_FIT_FLAGS change
> > - Mention xz as well, in the commit message
> > - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> > - Drop patch 'kbuild: Split out module targets into a variable'
> > - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
> >
> > Changes in v6:
> > - Drop the load address for ramdisk, as it is not needed
> > - Bring back the ramdisk 'compression' property, set to 'none'
> >
> > Changes in v5:
> > - Fix 'use' typo
> >
> > Changes in v4:
> > - Update the commit message
> >
> > Changes in v3:
> > - Move the ramdisk chunk into the correct patch
> > - Add a comment at the top of the file about the -r option
> > - Count the ramdisk in the total files
> > - Update the commit message
> >
> > Changes in v2:
> > - Don't compress the ramdisk as it is already compressed
> >
> > Simon Glass (6):
> >   scripts/make_fit: Speed up operation
> >   scripts/make_fit: Support an initial ramdisk
> >   scripts/make_fit: Move dtb processing into a function
> >   kbuild: Support a FIT_EXTRA_ARGS environment variable
> >   scripts/make_fit: Support a few more parallel compressors
> >   scripts/make_fit: Compress dtbs in parallel
> >
> >  scripts/Makefile.lib |   2 +-
> >  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
> >  2 files changed, 145 insertions(+), 36 deletions(-)
> 
> Can this series be applied, please?

Who are you expecting to apply this series? It does not look like it has
gone through one tree consistently and it is not clear from the
addressees. I guess it could go through Kbuild?

Cheers,
Nathan

