Return-Path: <linux-kbuild+bounces-2565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195F933DE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 15:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A8B1F21F69
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70AF180A7D;
	Wed, 17 Jul 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0xrlqQu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDB180A78;
	Wed, 17 Jul 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223901; cv=none; b=oeXVPireKGEmwNi4qo1Ldjjd9e/EBebndamcpKTnzuI4VWvfakRLzpesciLOpYjzfiZsrLmLmE5GzCvZFoKnFXN/TX5vyEiwjlj+iuJG9CDRnhwBG0A95Z9GJANkDfgsiOKV9o05htjrXWpytOr9izYhgMtbT+TlCs7CjdMLba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223901; c=relaxed/simple;
	bh=G3or0BY9GOB0yls2o2pwZmSmTfxok8bCrn0zTIC4dmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEAXVV6mMJD1Rp5+vWSAJygS62UDbpxri10wMFJKWW5oZplubwTV69ZZ42HFD2/Zaf1hsCZyejNixSTpU8PpnrJ+lP/LiovPkYNitKlKAKHS+hcqgFL4AKNc5KPSzuGUgto6OwSqDMYn22USXs7FZlTCzCiNVwLJ7o1r/AJkfrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0xrlqQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7574C2BD10;
	Wed, 17 Jul 2024 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223901;
	bh=G3or0BY9GOB0yls2o2pwZmSmTfxok8bCrn0zTIC4dmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0xrlqQuGwPH3AUlDMZJX45k3WTxSPe+8fPnnmnXJrH6iTCKbRmixrtOP/hFM4SEu
	 w/sWdYaVSb+G+/D5Ye3P0B2FU1Ml9vsh8DQNyk6NVn1WxIy4p2miICOBsBKuJ8vMz0
	 IN1k+mb/lHMslOJbj2rVSFq5X5/24obE7DmZNF1wkTh2db8Hg810wLaUrDeBCwKrsF
	 8L+CQgeYWNkznXMDLggeDp9vheMX2K2gAO+OalashI+bIH37/fhmMh226Y0hiqfHbh
	 ExaKAjocafzUMmnkQoA8SHt5C3gbyOI/q/tUdcdnPNeEFbMTWpDMn40aCv5W3IHOeF
	 7qK6Vhel2KaSA==
Date: Wed, 17 Jul 2024 06:44:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <20240717134459.GB24892@thelio-3990X>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <20240717011515.GA1230090@thelio-3990X>
 <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>

On Wed, Jul 17, 2024 at 05:34:09PM +0900, Masahiro Yamada wrote:
> On Wed, Jul 17, 2024 at 10:15 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > On Tue, Jul 16, 2024 at 07:52:14PM +0200, Thomas Weißschuh wrote:
...
> > > +     if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
> >
> > Does this reference to srctree...
> 
> 
> 'srctree' is exported by the top Makefile.

Aha, I did not realize that srctree was exported, ignore me then :)

> This is based on the assumption that we always run
> 'make pacman-pkg', and we never do 'makepkg' directly.
> 
> 
> Do you mean PKGBUILD should be self-contained
> so that 'makepkg' works from the command line?

No, just my misunderstanding. I think it is reasonable to tie the
PKGBUILD to the kernel tree in this manner.

Cheers,
Nathan

