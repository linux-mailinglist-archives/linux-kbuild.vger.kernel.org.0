Return-Path: <linux-kbuild+bounces-8745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E35B45E11
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 18:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27A2188C6A0
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 16:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C647D306B1C;
	Fri,  5 Sep 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjyvTC4r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283B1F61C;
	Fri,  5 Sep 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089483; cv=none; b=ibZHLA0FuF945CyODAN0LQOwASB1/3Tpok3w23Wt9OKDIipCej2GiFKVTIjydyT6l+QWPIoQ0CYPGGjeQ5J2vODt+LtfH2ElbzDjNzkqwKE4n5u/wRpyycXO7zgqVgoDa1U3Yr1IdpzFzTX+krdRkgGNXH4LN48umGruPz00tp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089483; c=relaxed/simple;
	bh=RC1Pffwa1OxcNnbVPqhWoqVwAryGyPeS0l0/vSql3J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zde5P8VA3gYhCEUNf81q2vGy1Km9+Epft5Ot8fAkOCBWCaymfK7a/kWJgbGxyDDbPBSEV0n1wVbFAfNti/2WwkEaZSgcNxFflKLz/updc7ArTeReoxHCfxwcL+PtC6fUB3I/qGLW70qBhdtk8tfcksXMREevKiVAfHhm2VOhOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjyvTC4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D174C4CEF1;
	Fri,  5 Sep 2025 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757089483;
	bh=RC1Pffwa1OxcNnbVPqhWoqVwAryGyPeS0l0/vSql3J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjyvTC4rktQ2MyRDuB5bI1wPYHRjy+Zk7cDDH410eEhoty1YHOBZIRffC3/uwcLZd
	 BdVbLWaOF3Ngz7msISwbLii/tZRUhMO2DdV3NffMmu3fhmxDA3HaGQOdgX1s22Cc3C
	 ptTjIM/A1/Ij4hcduLvREjvpCNgCRnyz8FiVNcCKgLNiVUyhr/EN0cnDVFMZEeSSl3
	 8rMGtHhUZrIB2SZSRMqGVpyPeCVmE5HziD8BTPh7wPY+lqPbyMRc7avON3E3+/Ol7t
	 oSk30wAvtcZ/8VUsNvZ4wFVtpp2eAwEDWm9hFy8eW5O5RaZq+enQgxZ7y8niy1OWQ8
	 RE2f3ae5N3dRw==
Date: Fri, 5 Sep 2025 09:24:42 -0700
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <202509050923.28C878FFA1@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
 <202509031949.375138FB13@keescook>
 <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
 <18c2c59e-edae-4281-ac7c-8524d9cde1c5@oracle.com>
 <2bf12be7-7fd5-41e2-a0a2-da82903d0ccd@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bf12be7-7fd5-41e2-a0a2-da82903d0ccd@oracle.com>

On Fri, Sep 05, 2025 at 11:41:18AM +0200, Vegard Nossum wrote:
> 
> On 04/09/2025 19:10, Vegard Nossum wrote:
> > On 04/09/2025 19:03, Vegard Nossum wrote:
> > > @@ -214,6 +214,11 @@ static void sym_calc_visibility(struct symbol *sym)
> > >          struct property *prop;
> > >          tristate tri;
> > > 
> > > +       if (sym->flags & SYMBOL_HIDDEN) {
> > > +               sym->visible = yes;
> > 
> > ...I just saw the irony here after having already pressed "Send".
> > 
> > Let me explain:
> > 
> > SYMBOL_HIDDEN is your new flag that indicates that somebody used
> > "transitional" on the config entry.
> > 
> > sym->visible is tristate value that gives you the condition for whether
> > a symbol can take on a value -- y/m means the option is visible to the
> > user (hence the name) and thus eligible to have a value assigned to it.
> 
> Another small clarification: Replace "is visible to the user" by "can be
> set by .config".
> 
> Actual user visibility is controlled by menu_is_visible(), not
> sym->visible, so my patch still doesn't show transitional symbols to the
> user in menuconfig. AFAICT, menu_is_visible() is completely independent
> of sym->visible.

Yeah, and I think this is another very good reason to rename stuff.

> I tested menuconfig/mconf and oldconfig/conf --oldconfig with scripts/
> kconfig/tests/transitional/Kconfig and my patch and it looks correct
> (only the new options are displayed).

Great! Thank you for looking at this. :)

-- 
Kees Cook

