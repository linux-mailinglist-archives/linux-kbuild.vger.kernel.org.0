Return-Path: <linux-kbuild+bounces-5079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E49EC3EE
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 05:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661EC16839E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 04:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85481BD017;
	Wed, 11 Dec 2024 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ8MLIR0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3042AE90;
	Wed, 11 Dec 2024 04:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733890775; cv=none; b=NB3YZpkG9IgN06We+WasJKP1cPQH1jiJ6Z6UuGEfjUVA3/JSUZzKNBtAFCV+GTzk7gdzPDiiB9cMK0gThVA53AqSKJNAoxPhPvIFBbx0kcYFwQigNArPyCMv+iZmlj6ROGuzuVhCjAIkABC1G402Aga/xg68vvXSHjGWGivCp1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733890775; c=relaxed/simple;
	bh=C32hIFQ3Gfh9PhB3jChte3FH0hDXjjDORJiNlEbV5hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4gY92cnG942iqODIKzTNAUiKRa0VY/b+LGQSut8ZAiC044d8h+pyl4vVOoySPYgDJpCDD43rS4VRTnBfb5NgcPI+cRlD+yUMgX+XtCVdKH8Q56BxLbQZ3oEKoyAbwAY5Gre/rGzq3jkefAOpdAq1kHGFBrZAcuCv+IPz5vQKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ8MLIR0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845F0C4CED2;
	Wed, 11 Dec 2024 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733890775;
	bh=C32hIFQ3Gfh9PhB3jChte3FH0hDXjjDORJiNlEbV5hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJ8MLIR0CTwqHxwJxamypw1b1Jj5WZfI7UnyPLqu6PE57z1AaQJfyNPJq6dnG6Oez
	 /YLKEJg3UvN1Q0EGkOauLQ4ug0r2VUzoWEwBIlKIJ+0V8WRuh8lhej+0pS2XUFqEpz
	 KQTygoyTSr4ykcwR2rK8f3x6umawGrG9DKr47d6DCK7w4IF1Gvh2q7XWu/zucw5VHD
	 ow/E3EKgkZRPlPPloiVWzX9MMkxI0LOE2goQUQ7yo8fhQLkS/BaIliQPUKtwCLxQz8
	 CUnw0PSLaT5/BC+Do2UpS6PkIfxPb1pPxNxlnGcKMOveD6tLziMU8EBFvpZb/stFNi
	 ZHCmzFrJ7Dbrw==
Date: Tue, 10 Dec 2024 20:19:33 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	Donald Zickus <dzickus@redhat.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
Message-ID: <Z1kS1Y8_aUQc83tb@bombadil.infradead.org>
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
 <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
 <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
 <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
 <CAK7LNATR0epWogDDDOnAvBJyypdgY-CPsi_mUehOWsvphg4LSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATR0epWogDDDOnAvBJyypdgY-CPsi_mUehOWsvphg4LSA@mail.gmail.com>

On Tue, Dec 10, 2024 at 11:27:06PM +0900, Masahiro Yamada wrote:
> On Tue, Dec 10, 2024 at 9:42 PM Neal Gompa <neal@gompa.dev> wrote:
> >
> > On Mon, Nov 25, 2024 at 10:34 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > On Mon, Nov 25, 2024 at 4:41 PM Miguel Ojeda
> > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > >
> > > > On Mon, Nov 25, 2024 at 2:29 PM Neal Gompa <neal@gompa.dev> wrote:
> > > > >
> > > > > As my Acked-by was removed, I'm sorry to say that there is no point
> > > > > for me to provide feedback since it is unwanted.
> > > > >
> > > > > I hope it lands soon, but I also hope the people here who decided that
> > > > > a person's efforts aren't worth recording because they don't
> > > > > personally know them should reflect on this too. It's a good way to
> > > > > keep people from coming into the community for the long term.
> > > >
> > > > Hopefully this reply helps -- apologies to anyone if I am overstepping.
> > > >
> > > > On one side, it is true that Acked-by is typically used by people that
> > > > is responsible for the code one way or another, because the tag is
> > > > meant for them to acknowledge they are OK with the change going in,
> > > > and so I can see the argument that restricting it for that purpose
> > > > only may help avoid confusion later on reading the log.
> > > >
> > > > On the other hand, someone being willing to put their name on a patch
> > > > is very valuable, whoever they are, and whatever the tag name is.
> > > > Moreover, it is also true that, Acked-by may be used here in a "as a
> > > > key user downstream, this looks reasonable and satisfies our needs"
> > > > sense.
> > > >
> > > > Finally, sometimes new tags are invented on the fly because there is
> > > > no good fit, too.
> > > >
> > > > Either way, I don't think anyone wanted to disregard your efforts or
> > > > to be rude to you in particular, but rather wanted to keep tags usage
> > > > aligned to how they view them or how they use them in their subsystem.
> > > > The Tested-by was still wanted, so I doubt their goal was to remove
> > > > you from the log or to make you feel unwelcomed.
> > >
> > > Thank you for putting this more eloquently than I could, Miguel. Neal,
> > > I do appreciate your feedback, and I'm sorry if I didn't make it clear
> > > enough in my previous emails. I would very much welcome your
> > > Tested-by, or another suitable tag that's acceptable to both you and
> > > Masahiro.
> > >
> >
> > Honestly, I don't think it's worth it if my tag is going to be
> > stripped simply because someone thinks I'm "unqualified". If you want
> > more people participating in these things, doing stuff like that is
> > definitely not the way to do it. It's not like people haven't had a
> > chance to know me or even just look me up to know I'm not just blowing
> > smoke. I definitely feel like I'm being disregarded. :(
> >
> > The sole reason I didn't give a Reviewed-by or Tested-by is that I
> > didn't want to do any integration work to validate it beyond the
> > basics, which would have meant dipping into the Red Hat kernel symbol
> > tracking infrastructure. I don't have time for that right now. If
> > someone else does, they can be my guest. I just don't feel comfortable
> > giving either without *actually* going that far.
> 
> 
> If you provided a Reviewed-by and/or Tested-by tag, they would not be stripped.
> 
> I would not say you are unqualified in terms of skills or abilities.
> However, this is not how the Acked-by tag is typically used.
> As Miguel mentioned, "Acked-by-User" or "Acked-by: # As primary user"
> could be an option, but I am not sure if they would gain
> sufficient consensus.
> 
> Code reviews and tests are always appreciated.
> The Reviewed-by and Tested-by tags are open to everyone.
> 
> If you are uncomfortable with a Reviewed-by or Tested-by tag,
> I cannot think of any other alternatives.

I think we just need to update docs that Acked-by is a *tool* mechanism
to help maintainers in their quest to find sanity in determining if a
patch is ready.

Clearly, if I don't know a contributor and they send an Acked-by, it
does not matter if was Donald Knuth (CS algorithmic lord), or John
Grisham (author of intense legal drama books), what really is of value
to the maintainer is the the qualitative appreciation over the
maintainer's own perception of the value of that Acked-by is going to
help the maintainer own's dreadful quest to find sanity in a review
process in answering if a patch series is ready.

An unknown developer to a maintainer, as qualified as they may be, could
provide an Acked-by, but the utlitiarian value is completely subjective
to the domain of review and so up to the maintainer's own critique. The
value in Acked-by is in helping the maintainer. There is a hidden
context of trust of behind the appreciation of maintainer's value of
a simple Acked-by.

A series of Reviewed-by tags over time on a subsystem can help a
maintainer appreciate the value of a future Acked-by by the same
developer. In fact the *more utilitrarian appreciation* for a maintainer
will be how often said reviewer is helping find *bugs* in previous patch
series, not how many Reviewed-by tags or Acked-by tags they use. The act
of finding real issues and thinking critically about the big picture
over and over of on different patchsets can help a maintainer garner
confidence in future Reviewed-by tags from the developer. Helping a
maintainer review patchsets and get authors to fix issues until it is
mind numbingly clear the patchset is ready is a way to help a maintainer
appreciate future Reviewed-by or Acked-by tags from that developer.

Since anyone can also provide a Tested-by, it does not mean that there
cannot also be subjective association to it as well. A Tested-by a reporter
of a complex regression is of most value. A Tested-by a random new developer
for the same complex regression may be meaningless to that same maintainer
unless the same original reporter also conirms the issues of a
regression are fixed.

Keeping a tag is not too important as well, we sometimes loose them even
for developers engaging daily, what is more important is *helping the
maintainer* on their quest to ensure proper state of affairs of the
patchset and to remain sane.

  Luis

