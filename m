Return-Path: <linux-kbuild+bounces-4441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B579B75B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 08:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A5901C21AD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311E414D708;
	Thu, 31 Oct 2024 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9hUM9xG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B613B592;
	Thu, 31 Oct 2024 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360947; cv=none; b=L//KmXl0jNKIOPk2PP3Jb9jMZKiKein542NzGgsauHHm2QPIMZVJr2vQJ6PZCfUvCy37MseqxgqKESHljXqgUKS3gyY6cwAJclfffqNPP/d4SSPPtZYz4pIxBBRdJyztpNFvUl14W8yR9UXFrgRKWJgnyzOoEz3Wdks+Pl/FXLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360947; c=relaxed/simple;
	bh=EXHWSS4logdtrwKjIzfO9t3TjGTyP1RV6tB6ogIEHgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN2x76rQnGPdy6v9gBdGzW6ncLPyff3wjhSLReKPf9CSJm3Rl4k4Cp8D5Zr2P0H13jqAPMVR/pE4LZ9U9nSAAMLVMzo6052Y6Qg7+WtnGpbRurmeE+W+zOGufj5FzDLh6IlatVAPR4QS3jMdI1mONokcGiH0gmzF/sU6R7uV+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9hUM9xG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A54C4CEC3;
	Thu, 31 Oct 2024 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360946;
	bh=EXHWSS4logdtrwKjIzfO9t3TjGTyP1RV6tB6ogIEHgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9hUM9xGJ0zGQcWn7D6lF6DXp3nsvhvg5D71xd8wf+NeK/96heOa7sPwBVgt1VqcO
	 1mWyYj2tTjsA9untrING3/jjazm1XncSIcPYushVUiwYGqcn1SYKmCi2/xBDo+/OJ1
	 DFRycFpSlEaaRQDfwJOKuMM4qsVDv3q8EBe2/nU+eUQwOrEzvEkijoUzsowb4QnaU5
	 OhIYJlvLKclpwOiBe3fORCxQjYxNVHufKvWwgWuZcde+0qIEEwiYUcYR84wK1WtAeN
	 Kp9jDhLZOmzYUKwHLYwy870NNJpWODbZrXd42m1jK6fzKc+34ahYwSoMU64m3Rbq4p
	 /vI3Gmz8ejWmQ==
Date: Thu, 31 Oct 2024 00:49:04 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
Message-ID: <ZyM2cHGaIT9vFOGq@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au>
 <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
 <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02H_RwtLpdt4E_LWKjzGvryY_7s20e4QhhA5B7N0LPxVA@mail.gmail.com>

On Wed, Oct 30, 2024 at 10:06:12PM -0700, Matthew Maurer wrote:
> On Wed, Oct 30, 2024 at 9:37 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> > > Matthew Maurer <mmaurer@google.com> writes:
> > > > Adds a new format for MODVERSIONS which stores each field in a separate
> > > > ELF section. This initially adds support for variable length names, but
> > > > could later be used to add additional fields to MODVERSIONS in a
> > > > backwards compatible way if needed. Any new fields will be ignored by
> > > > old user tooling, unlike the current format where user tooling cannot
> > > > tolerate adjustments to the format (for example making the name field
> > > > longer).
> > > >
> > > > Since PPC munges its version records to strip leading dots, we reproduce
> > > > the munging for the new format. Other architectures do not appear to
> > > > have architecture-specific usage of this information.
> > > >
> > > > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > > ---
> > > >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
> > >
> > > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > Michael, Matthew, why make everyone deal with this instead of just
> > making this an arch thing and ppc would be the only one doing it?
> >
> >   Luis
> >
> 
> I'm not sure I understand - the PPC changes are in an arch-specific
> directory, and triggered through the arch-implemented callback
> mod_frob_arch_sections. What would you like done to make it more of an
> arch-thing?

Sorry, yes, I see that now, that's what I get for late night patch
review. Nevermidn, this all looks good to me now.

  Luis

