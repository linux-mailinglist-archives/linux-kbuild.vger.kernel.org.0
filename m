Return-Path: <linux-kbuild+bounces-2265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F2919884
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 21:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8078F1F21D74
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 19:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C68191494;
	Wed, 26 Jun 2024 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="bbf0Qftf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC8BE6C;
	Wed, 26 Jun 2024 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719431397; cv=none; b=VqhjZHnAZJ7b6Va8N51OQboMYw8aGVnzOfp244IfIwS4TKnRc/VDHJ9UIU9QT8QKMTekstEWi1zk6fV3Jn16zQ12xqsTmofjwbWbp/jl1XcVoiEAZlMzmDEXjwuIZ7BDbMKtQqVXWQ9Jsdqzuh6R5i8jYHU8RLw8jYuvhO0iu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719431397; c=relaxed/simple;
	bh=JAD5NpqAScyMw0Aq0kKYE1zsri013+0aGA4PPi+n6Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeB/alXO2ds3tN5NJekCWa0cnjpRUNDoWaChpoPWzJZfg8Etjx8rxO+wD8MvQ2Z3ojFpiQsjuau9oxVHnb9lhU1sO1LWw+zp0Y94qf0tGz2RpStAuKHsCF+QwsAYkyoJ7bH7fxHimgWTE+ASEER1byhBNXsrM0ygbPMGX8ST93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=bbf0Qftf; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ejH671jgIMLpW0hCTvm7LSeaZ0xSwEqIcM9JRDwujLI=; b=bbf0QftfQykx9mJOJHmUhZr+CF
	ovEyqcOD7Fp0/MG/6TFV/uzxBeVPk4hFNIE1mleBbrmAkgf3aQFdt68wCLe3GLMqQ6wF/WmRy0rA6
	Yr70j+CKbs10202cB5AjQqe3wCGeIgYwyvmyp+tabmm8bpsBDRZFDyTFA+ykajFHWnhRgUZRlEcBg
	AoeBdwRmK/WKIrAYl7Ot8vBBli3JP0EbbFYeTcvK4CpaVit0XWa0YdZJQTeUwLIr68slK3nEsdPIu
	fmEvBXE0Luqg56J9Xh3ORPEVVxmosKPbmlWY2nXCcbKe0eK7V4j3s8j6CuDYzwlPyTDZO9gkAlSB6
	2RljYM0A==;
Received: from [2001:9e8:9eb:ec01:3235:adff:fed0:37e6] (port=59144 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sMYeC-003IUV-As;
	Wed, 26 Jun 2024 21:49:40 +0200
Date: Wed, 26 Jun 2024 21:49:23 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-kbuild@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] Makefile: add comment to discourage tools/* addition for
 kernel builds
Message-ID: <20240626-tangible-steady-elephant-dbae4f@lindesnes>
References: <20240619062145.3967720-1-masahiroy@kernel.org>
 <ZnSkmmpCY2Aj5VpU@google.com>
 <CAK7LNASZi3A_BzFACOvZhwByHaVon-Cd5H++uygsv4m_fhDOyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASZi3A_BzFACOvZhwByHaVon-Cd5H++uygsv4m_fhDOyQ@mail.gmail.com>

On Thu, Jun 27, 2024 at 04:02:46AM +0900, Masahiro Yamada wrote:
> On Fri, Jun 21, 2024 at 6:52 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > On Wed, Jun 19, 2024 at 03:21:42PM +0900, Masahiro Yamada wrote:
> > > Kbuild provides scripts/Makefile.host to build host programs used for
> > > building the kernel. Unfortunately, there are two exceptions that opt
> > > out of Kbuild. The build system under tools/ is a cheesy replica, and
> > > is always a disaster. I was recently poked about a problem in the tools
> > > build issue, which I do not maintain (and nobody maintains). [1]
> >
> > (Side note: I hope I haven't placed undue burden on you; I understood
> > you don't maintain tools/ and that it didn't use Kbuild. I only "poked"
> > you because the original bug report I was replying to had you and
> > linux-kbuild on CC already. And I appreciate your engagement, even if
> > the bugs are due to intentional forking.)
> 
> 
> I did not mean to express my complaint particularly with the previous thread.
> 
> It is not the first time that the tools/ build issue arose.
> 
> 
> I will drop the references to the threads.
> 
> 
> 
> > But anyway, I agree that clearer documentation and recommendations could
> > be helpful here. To that end, some dumb questions below, as I'm not sure
> > if this fully serves its purpose as-is:
> >
> > > Without a comment, somebody might believe this is the right location
> > > because that is where objtool lives, even when a more robust Kbuild
> > > syntax satisfies their needs. [2]
> > >
> > > [1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#m8ece130dd0e23c6f2395ed89070161948dee8457
> > > [2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  Makefile | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 471f2df86422..ba070596ad4e 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1331,6 +1331,11 @@ prepare: tools/bpf/resolve_btfids
> > >  endif
> > >  endif
> > >
> > > +# README
> > > +# The tools build system is not a part of Kbuild. Before adding yet another
> > > +# tools/* here, please consider if the standard "hostprogs" syntax satisfies
> > > +# your needs.
> > > +
> >
> > Some clarifying questions / statements-as-questions:
> >
> > * nothing in tools/ uses Kbuild, right? (even stuff that uses KBUILD_*
> >   names is just an imitative port, right?)
> 
> 
> Correct.
> 
> You can build a tool from multiple directory locations.
> 
> For example, you can compile the 'perf' in multiple locations.
> 
> 
> [1] From the top of the kernel tree
> 
>    $ make tools/perf
> 
> 
> [2] From the tools/ directory
> 
>    $ cd tools
>    $ make perf
> 
> 
> [3] From the tools/perf/ directory
> 
>    $ cd tools/perf
>    $ make
> 
> 
> 
> When you do [2] or [3], the top-level Makefile is not parsed.
> 
> If necessary, the tools build system copies code from Kbuild.
> 
> 
> 
> 
> > * not everything in tools/ is actually promoted to a high-level target,
> >   that affects this top-level Makefile. Are you only concerned about
> >   stuff that pretends to be integrated in the top-level kernel Makefile?
> >   (If not, then it seems like placing the README comments only in this
> >   Makefile is a poor choice.)
> 
> 
> The tool build is integrated as a pattern rule in the top Makefile.
> (tools/%)
> 
> 
> So, you can build other tools from the top Makefile.
> 
> 
> See commit ea01fa9f63aef, which did not get Ack from any Kbuild
> maintainer, and caused subsequent troubles, and the benefit
> of which I still do not understand.
> 
> 
> Supporting "make tools/perf" in addition to "make -C tools perf"
> only saved a few characters to type.
> 
> 
> So, the problem remains, unless I revert ea01fa9f63aef.
> 
> I decided to not care about it too much, as long as
> such tools are not used during the kernel build.
> 
> I am really worried about objtool and resolve_btfids,
> as these two are used for building the kernel.
> 
> 
> 
> 
> 
> 
> > * is the "standard hostprogs" recommendation a general recommendation,
> >   for all sorts of kept-in-the-kernel-tree host tools? Is the
> >   recommendation to "use Kbuild" or to "avoid putting your tool in
> >   tools/*"? Is it possible (recommended?) to plumb Kbuild stuff into
> >   tools/, even if other parts won't migrate?
> 
> 
> I do not know.
> 
> They are different build systems with different designs.
> 
> Kbuild always works in the top of the output directory.
> Kbuild changes the working directory at most once if O= is given,
> but otherwise, it never changes the working directory during the build.
> 
> 
> The tools/ build system changes the working directory every time
> it invokes a new Make, and compiles the tool in its source directory.
> 
> 
> I do not know if all tools want to Kbuild.
> (the same applied to kselftest)
> 
> I think I can convert objtool and resolve_btfids to the Kbuild way.
> 
> 
> >
> > As is, I can't tell if this is telling people to avoid adding new stuff
> > to tools/ entirely, or just to only add to tools/ if you're able to
> > remain completely isolated from the rest of the kernel build -- as soon
> > as you want to play some part in the Kbuild-covered part of the tree,
> > you need to use Kbuild.
> 
> 
> See the code in the top Makefile.
> 
> 'prepare' depends on tools/objtool and tools/bpf/resolve_btfids.
> 
> If other tools are not prerequisites of 'scripts',
> Kbuild will not compile them.
> 
> 
> 
> 
> >
> > If I'm inferring the right answers to the above, then maybe an improved
> > wording could be something like:
> >
> > "The tools build system is not a part of Kbuild and tends to introduce
> > its own unique issues. If you need to integrate a new tool into Kbuild,
> > please consider locating that tool outside the tools/ tree and using the
> > standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
> > here."
> 
> 
> 
> I am fine with this description.
> 
> 
> Nicolas suggested a link to Documentation/kbuild/makefiles.rst
> 
> We can combine the two.
> 
> 
> # The tools build system is not a part of Kbuild and tends to introduce
> # its own unique issues. If you need to integrate a new tool into Kbuild,
> # please consider locating that tool outside the tools/ tree and using the
> # standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
> # here. See Documentation/kbuild/makefiles.rst for details.

yeah, thanks. Sounds good to me, too.

Kind regards,
Nicolas

