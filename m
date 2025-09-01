Return-Path: <linux-kbuild+bounces-8688-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1159AB3EDE4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 20:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CCAB1A883DC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2E321B195;
	Mon,  1 Sep 2025 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlhxISV+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046810FD;
	Mon,  1 Sep 2025 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751488; cv=none; b=mEwD4y4fpFc8JnRDqEk+piUevrU/EXYi5X0yNMx18WBx8qDodtm05huiq/bvwzQSvgquz070XUyhyZmveTQoCjyqhz18BXbXpGAW0KoSIsEQI1hboLp0dYiEPxAfrNaLseZrdu0HCVjX7uwNmmA4OutrGcQeBaCy3Iksj7V4ox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751488; c=relaxed/simple;
	bh=pXtfi1ZkzOUO0EvJfw/NLRrBKdRrBqz8G01t4pFGeWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KT2zSPXatWKBEdBdg4b3l4flklTRzSxuFnozSZLkQ7RL6sx7c+UzLXqppguImycKWXZCcnOe2UXBFbNufGSP5t7N2gauEc+x3HivOWV1xWwy4mJeBFb1iAt0oVLaahEvZNPBPyAZZP0X6A53PRaMqe3JrmmqsXWHG2ilJu9r63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlhxISV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EB4C4CEF0;
	Mon,  1 Sep 2025 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756751487;
	bh=pXtfi1ZkzOUO0EvJfw/NLRrBKdRrBqz8G01t4pFGeWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlhxISV+C2bFL3Ur+Gc1AolquH0MXqaxT0OdmZ0Qk6EiT6R3vfjTAyECGYpQMgdHG
	 PrnKFo79cAwqBwAbvK7uEuzuOIJuGlvxQtBAAjblxOy2UPcZWm9ZKN/aMwtGNJ4rxI
	 bzd9q+xf1P+xlVeEJbLWNAz0ojOwb+UpXr6sYxPryWLdLzjlWH4PFyM4GCmxmK+8gD
	 q8we3bVGX8A9yXkgqGeHWjK4t7YQffHon6UPCx56okONzxj7A2LhJeG5Bap69Hl1ft
	 3PR9sRLueMNBKY3viTDw+VJih4naUlHe2XZGCwJZidephQiiAut8dAryrdBbm2cZft
	 RuDUQbl1wQT2w==
Date: Mon, 1 Sep 2025 11:31:27 -0700
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
Message-ID: <202509011125.5879901C@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>

On Mon, Sep 01, 2025 at 08:20:18PM +0200, Vegard Nossum wrote:
> 
> On 01/09/2025 18:56, Kees Cook wrote:
> > > > @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
> > > >    			sym_calc_choice(choice_menu);
> > > >    			newval.tri = sym->curr.tri;
> > > >    		} else {
> > > > -			if (sym->visible != no) {
> > > > +			if (sym->usable) {
> > > >    				/* if the symbol is visible use the user value
> > > >    				 * if available, otherwise try the default value
> > > >    				 */
> > > >    				if (sym_has_value(sym)) {
> > > > +					tristate value = sym->transitional ?
> > > > +						sym->def[S_DEF_USER].tri : sym->visible;
> > > >    					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
> > > > -							      sym->visible);
> > > > +							      value);
> > > This looks a bit odd to me. Just thinking out loud: your new logic is
> > > there to be able to use a value even though it's not visible. In the
> > > case where it's transitional you use the .config value instead of the
> > > condition that makes it visible.
> > > 
> > > Could you simply change sym_calc_visibility() instead to always return
> > > 'yes' when the symbol is transitional? Wouldn't that simplify everything
> > > in sym_calc_value()?
> > It's a tristate, so "m" is also possible besides "y". (sym->visible is
> > also a tristate. 🙂
> 
> That would be fine, right?
> 
> We'd pass the if (sym->visible != no) check... we'd do the
> 
> newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);
> 
> EXPR_AND() is basically min() (with n=0, m=1, y=2), so effectively it
> would end up doing
> 
> newval.tri = min(sym->def[S_DEF_USER].tri, 2);
> 
> which is the same as
> 
> newval.tri = sym->def[S_DEF_USER].tri;
> 
> That's what your code is currently doing too, but in a much more
> roundabout way.

Right, it was this:

    newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);

But I made it effectively:

  if (sym->transitional)
    newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->def[S_DEF_USER].tri);
  else
    newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);

That first "if" is kind of pointless. I just sent the v3 before I saw
this email. :P

I was trying to avoid yet more indentation, but I could change it to:

		if (sym->transitional)
			newval.tri = sym->def[S_DEF_USER].tri;
		else
			newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
					      sym->visible);

?

-- 
Kees Cook

