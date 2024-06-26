Return-Path: <linux-kbuild+bounces-2263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 032CE919492
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84EBE1F23224
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 19:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFAC17D365;
	Wed, 26 Jun 2024 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYhu8ugv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3F14F134;
	Wed, 26 Jun 2024 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428604; cv=none; b=emWMZ4aXansdDhBZ5LcokF6/j/9ufd8YeHGVPGUUv5cBDPqSinlJjVJCP52ZHmgOl+XaOuLY8sXfVG9MOWS035/kiKyWN/JPVTUGO+CzHFoq98WzqDn7OXOZ4YCyQxbDBbTzF2UYYLLkPYSNp1DzHvA1Ty2PSGpXGoQIXe0rH/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428604; c=relaxed/simple;
	bh=r0RBl/MX7eCDkgGpqDbpj4lvHRDgd7HUwh111mDnrQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwRjxFmr2+eKXKtQHTs27q5LkwL90a2LRrK8J1Va8speslruCvhvN7jSieO8N4q3xVAQmd44EQZer1bTtQhBeFHSNsN2gnKMCe+sc/xLADSQQr5WmnQsRrYKqoTenltlJfQHlnCN0MELkBMKlMaMgqJcJtA0q6DP2jd1+pe6fSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYhu8ugv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA47C32789;
	Wed, 26 Jun 2024 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719428604;
	bh=r0RBl/MX7eCDkgGpqDbpj4lvHRDgd7HUwh111mDnrQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KYhu8ugv1lDVteOLu3K5zuJGMbCI6Y++wm6JT7Kt09v4Yz0lVXpKIw4+qvUNauyzu
	 /xa7S7Di+2WqPzw3k2NSeOuouoitD8NxJshKB9Xp76oDvYfVCXfcHnwKTC9kRd6TlS
	 Z27ScSZbtE13NirYx/WbloEUZDKb/5Um6Qj2+ZVsEYaYt1rqet96UFzRfJoimeVvQy
	 TMJxQG+TiEoVFZeUu5hdHLdtYPOmGXM3DL2Q2VfrqdEGY4tTaDc+JLyJmi4enNO3Jg
	 FBoU3Tvkgn9/7po1MUb8quVSnA5e8zwNLztyPgJsFZjVQVK6kk2fEd3anF/zFBMPqU
	 RoCo9r7zKaqTA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso72773361fa.3;
        Wed, 26 Jun 2024 12:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYR/K3ksd8wSAOjqMJsc4e8X0GXa5Dza8OZ89KY9hyY+c1ywimvvuV6ca2J0jIFm8m89MZE4b0jsMXFe/qRFEKfEc3Kg24Zk1kL4wv
X-Gm-Message-State: AOJu0YyAOJzJelWgc8OOOvpXrL/9qVddX6PV/nxVFU9qiOQK7Cn9+utB
	dO/4qpw+Tx7m6lja+xlGSAda6g/DElsllMceUb0bSRqDrULabB9fNpL6akLVhbPFa8LxUhsUWA3
	XC4h+1my81nvloBM2xPstwHYAtco=
X-Google-Smtp-Source: AGHT+IGSiN7iSEg5GZkAIx7PlrZYOHaeo5g0dPaiFj6GytLvXzd9IBoe/lYgGO3SFJeQj/AmfFJ8kNhUGE5RRhb3UYY=
X-Received: by 2002:a05:651c:92:b0:2ec:476:7c60 with SMTP id
 38308e7fff4ca-2ec594036d5mr67486231fa.27.1719428602725; Wed, 26 Jun 2024
 12:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619062145.3967720-1-masahiroy@kernel.org> <ZnSkmmpCY2Aj5VpU@google.com>
In-Reply-To: <ZnSkmmpCY2Aj5VpU@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Jun 2024 04:02:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZi3A_BzFACOvZhwByHaVon-Cd5H++uygsv4m_fhDOyQ@mail.gmail.com>
Message-ID: <CAK7LNASZi3A_BzFACOvZhwByHaVon-Cd5H++uygsv4m_fhDOyQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add comment to discourage tools/* addition for
 kernel builds
To: Brian Norris <briannorris@chromium.org>
Cc: linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:52=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Wed, Jun 19, 2024 at 03:21:42PM +0900, Masahiro Yamada wrote:
> > Kbuild provides scripts/Makefile.host to build host programs used for
> > building the kernel. Unfortunately, there are two exceptions that opt
> > out of Kbuild. The build system under tools/ is a cheesy replica, and
> > is always a disaster. I was recently poked about a problem in the tools
> > build issue, which I do not maintain (and nobody maintains). [1]
>
> (Side note: I hope I haven't placed undue burden on you; I understood
> you don't maintain tools/ and that it didn't use Kbuild. I only "poked"
> you because the original bug report I was replying to had you and
> linux-kbuild on CC already. And I appreciate your engagement, even if
> the bugs are due to intentional forking.)


I did not mean to express my complaint particularly with the previous threa=
d.

It is not the first time that the tools/ build issue arose.


I will drop the references to the threads.



> But anyway, I agree that clearer documentation and recommendations could
> be helpful here. To that end, some dumb questions below, as I'm not sure
> if this fully serves its purpose as-is:
>
> > Without a comment, somebody might believe this is the right location
> > because that is where objtool lives, even when a more robust Kbuild
> > syntax satisfies their needs. [2]
> >
> > [1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T=
/#m8ece130dd0e23c6f2395ed89070161948dee8457
> > [2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 471f2df86422..ba070596ad4e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1331,6 +1331,11 @@ prepare: tools/bpf/resolve_btfids
> >  endif
> >  endif
> >
> > +# README
> > +# The tools build system is not a part of Kbuild. Before adding yet an=
other
> > +# tools/* here, please consider if the standard "hostprogs" syntax sat=
isfies
> > +# your needs.
> > +
>
> Some clarifying questions / statements-as-questions:
>
> * nothing in tools/ uses Kbuild, right? (even stuff that uses KBUILD_*
>   names is just an imitative port, right?)


Correct.

You can build a tool from multiple directory locations.

For example, you can compile the 'perf' in multiple locations.


[1] From the top of the kernel tree

   $ make tools/perf


[2] From the tools/ directory

   $ cd tools
   $ make perf


[3] From the tools/perf/ directory

   $ cd tools/perf
   $ make



When you do [2] or [3], the top-level Makefile is not parsed.

If necessary, the tools build system copies code from Kbuild.




> * not everything in tools/ is actually promoted to a high-level target,
>   that affects this top-level Makefile. Are you only concerned about
>   stuff that pretends to be integrated in the top-level kernel Makefile?
>   (If not, then it seems like placing the README comments only in this
>   Makefile is a poor choice.)


The tool build is integrated as a pattern rule in the top Makefile.
(tools/%)


So, you can build other tools from the top Makefile.


See commit ea01fa9f63aef, which did not get Ack from any Kbuild
maintainer, and caused subsequent troubles, and the benefit
of which I still do not understand.


Supporting "make tools/perf" in addition to "make -C tools perf"
only saved a few characters to type.


So, the problem remains, unless I revert ea01fa9f63aef.

I decided to not care about it too much, as long as
such tools are not used during the kernel build.

I am really worried about objtool and resolve_btfids,
as these two are used for building the kernel.






> * is the "standard hostprogs" recommendation a general recommendation,
>   for all sorts of kept-in-the-kernel-tree host tools? Is the
>   recommendation to "use Kbuild" or to "avoid putting your tool in
>   tools/*"? Is it possible (recommended?) to plumb Kbuild stuff into
>   tools/, even if other parts won't migrate?


I do not know.

They are different build systems with different designs.

Kbuild always works in the top of the output directory.
Kbuild changes the working directory at most once if O=3D is given,
but otherwise, it never changes the working directory during the build.


The tools/ build system changes the working directory every time
it invokes a new Make, and compiles the tool in its source directory.


I do not know if all tools want to Kbuild.
(the same applied to kselftest)

I think I can convert objtool and resolve_btfids to the Kbuild way.


>
> As is, I can't tell if this is telling people to avoid adding new stuff
> to tools/ entirely, or just to only add to tools/ if you're able to
> remain completely isolated from the rest of the kernel build -- as soon
> as you want to play some part in the Kbuild-covered part of the tree,
> you need to use Kbuild.


See the code in the top Makefile.

'prepare' depends on tools/objtool and tools/bpf/resolve_btfids.

If other tools are not prerequisites of 'scripts',
Kbuild will not compile them.




>
> If I'm inferring the right answers to the above, then maybe an improved
> wording could be something like:
>
> "The tools build system is not a part of Kbuild and tends to introduce
> its own unique issues. If you need to integrate a new tool into Kbuild,
> please consider locating that tool outside the tools/ tree and using the
> standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
> here."



I am fine with this description.


Nicolas suggested a link to Documentation/kbuild/makefiles.rst

We can combine the two.


# The tools build system is not a part of Kbuild and tends to introduce
# its own unique issues. If you need to integrate a new tool into Kbuild,
# please consider locating that tool outside the tools/ tree and using the
# standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
# here. See Documentation/kbuild/makefiles.rst for details.




> It's possible I'm playing mental acrobatics here in my reading too.
>
> Either way, I think this is a good trajectory:
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> Regards,
> Brian
>
> >  PHONY +=3D resolve_btfids_clean
> >
> >  resolve_btfids_O =3D $(abspath $(objtree))/tools/bpf/resolve_btfids
> > --
> > 2.43.0
> >



--
Best Regards


Masahiro Yamada

