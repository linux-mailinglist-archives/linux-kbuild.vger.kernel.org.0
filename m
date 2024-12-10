Return-Path: <linux-kbuild+bounces-5065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EEB9EB339
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 15:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572211885E54
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 14:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3778F1AE877;
	Tue, 10 Dec 2024 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDZYVA4x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023911A9B5A;
	Tue, 10 Dec 2024 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840865; cv=none; b=OIdR928MHZlKcF9bC7W9OBvRYQ29rBAkFtPISDdeYmQv0MUvQnCwkd2I/cGNTjkz7hZwM7xgkak4xCXUGQ6nsehpol7wfYnGFbX9aRlprFXigUky8XGG0vNQ75D3/ZpLTV1QVW/s13KtrQflf462LpV6B6eJ/+IfPZTPrG4l67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840865; c=relaxed/simple;
	bh=TGFjMSOvA9OzXNs681GT0p8OCfNumj8L09HFYq/mGMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A73+PsemkVJNucAw7ajy8201uJLwos++Dit85jvrjAhQnJOWrJCHE3DnMOrgMtE4m7Xlx1ybJqDXFESDlB6pepW0Fwu3ZRllRxisaPbBfsgv/f5jteZ8oosMJG/IWCQ2r5LRpvlsf3Au1kiDr3Ult5XOwszuojQnLRMmFP8rjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDZYVA4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81323C4CEE1;
	Tue, 10 Dec 2024 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733840864;
	bh=TGFjMSOvA9OzXNs681GT0p8OCfNumj8L09HFYq/mGMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XDZYVA4xHCsq7gSS3lms86+L786ua9Fd7xsXDCm87VP0ENAHvCMnJpX3fniovmtmK
	 nInhMNhO7Dg8W/RAOoalXqvMkHVkXjkgHeU6d4LOR/TFiL3QA0EN94XJTHNj7AahHQ
	 1GEoiqb0EM4wVp4KUOZIHu0zswq/T1fswA7sfdEboX107RVtntpErUbQIwiXBWz/QX
	 WmoIWnJs553t+l1MCZRGzwgcaCJ9+ndO5H9E63eTriPv/lKzebiF42g2BICnkM/gJ6
	 V9kd8LRp361cLxIxqbcjVYF3DLuQ2j2xsUmEVoCgcu1C91mCwYN5ngwYb320cKhCrd
	 1Vjz6vbQpBFxA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30229d5b1caso17186571fa.2;
        Tue, 10 Dec 2024 06:27:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcMAqGZTaMomB3as1ZwP8lVB+DgY5o8rgdiCJJ3kw7aLI4HGx21n2E1wC47kVU1jYldVijPZV4nn+/DsIf@vger.kernel.org, AJvYcCVfIUMOqr7wd8jtYDW/vQW7Dh8t7l2HRC39o7WFnrwxmdeyVpKo1bp02G6YgGyNBgop2p753Avxdxw29gg=@vger.kernel.org, AJvYcCVfLzI68FwiBRKqyKjWFSIvDnDLn/6yLaSPWUcIKWeITrWbS1ldlCdLwHxG/TSIDIGnGEkaxu5guJjSanmqGgU=@vger.kernel.org, AJvYcCXuPAFyHamqHJk0iEkjI6cdZvDI4nfbz8TYBeQ9EP8KVDhz0CDDCoEJ2OcttGIeWdavGdt5V8ttUKABBnL2PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEYixdAY+/2wDVY4x//2cGi0d7VTCfObNQDgR+Euk7k2SbpTd
	jtlbSPZwVA3I2IxPUKB8o7wLwcSC9Oscs2qLTgClStn5CAdMAgZIw46yqeGfgSxf+8eIQX31aQw
	gUvDFBUdFlFF85FzDd78F49ox+Ts=
X-Google-Smtp-Source: AGHT+IFJxKwaGGCANvoqcVMT71tICaABYmdvdng8GfDx3J9i3uSXTp2LoEvBJO4yzXCtIY+wnTgLfXX9E+lEm/voJI4=
X-Received: by 2002:a2e:a552:0:b0:300:3fef:a9e8 with SMTP id
 38308e7fff4ca-3003fefad37mr55935321fa.28.1733840862697; Tue, 10 Dec 2024
 06:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
 <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com>
 <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com> <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
In-Reply-To: <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2024 23:27:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATR0epWogDDDOnAvBJyypdgY-CPsi_mUehOWsvphg4LSA@mail.gmail.com>
Message-ID: <CAK7LNATR0epWogDDDOnAvBJyypdgY-CPsi_mUehOWsvphg4LSA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Neal Gompa <neal@gompa.dev>
Cc: Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 9:42=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> On Mon, Nov 25, 2024 at 10:34=E2=80=AFAM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
> >
> > On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> w=
rote:
> > > >
> > > > As my Acked-by was removed, I'm sorry to say that there is no point
> > > > for me to provide feedback since it is unwanted.
> > > >
> > > > I hope it lands soon, but I also hope the people here who decided t=
hat
> > > > a person's efforts aren't worth recording because they don't
> > > > personally know them should reflect on this too. It's a good way to
> > > > keep people from coming into the community for the long term.
> > >
> > > Hopefully this reply helps -- apologies to anyone if I am oversteppin=
g.
> > >
> > > On one side, it is true that Acked-by is typically used by people tha=
t
> > > is responsible for the code one way or another, because the tag is
> > > meant for them to acknowledge they are OK with the change going in,
> > > and so I can see the argument that restricting it for that purpose
> > > only may help avoid confusion later on reading the log.
> > >
> > > On the other hand, someone being willing to put their name on a patch
> > > is very valuable, whoever they are, and whatever the tag name is.
> > > Moreover, it is also true that, Acked-by may be used here in a "as a
> > > key user downstream, this looks reasonable and satisfies our needs"
> > > sense.
> > >
> > > Finally, sometimes new tags are invented on the fly because there is
> > > no good fit, too.
> > >
> > > Either way, I don't think anyone wanted to disregard your efforts or
> > > to be rude to you in particular, but rather wanted to keep tags usage
> > > aligned to how they view them or how they use them in their subsystem=
.
> > > The Tested-by was still wanted, so I doubt their goal was to remove
> > > you from the log or to make you feel unwelcomed.
> >
> > Thank you for putting this more eloquently than I could, Miguel. Neal,
> > I do appreciate your feedback, and I'm sorry if I didn't make it clear
> > enough in my previous emails. I would very much welcome your
> > Tested-by, or another suitable tag that's acceptable to both you and
> > Masahiro.
> >
>
> Honestly, I don't think it's worth it if my tag is going to be
> stripped simply because someone thinks I'm "unqualified". If you want
> more people participating in these things, doing stuff like that is
> definitely not the way to do it. It's not like people haven't had a
> chance to know me or even just look me up to know I'm not just blowing
> smoke. I definitely feel like I'm being disregarded. :(
>
> The sole reason I didn't give a Reviewed-by or Tested-by is that I
> didn't want to do any integration work to validate it beyond the
> basics, which would have meant dipping into the Red Hat kernel symbol
> tracking infrastructure. I don't have time for that right now. If
> someone else does, they can be my guest. I just don't feel comfortable
> giving either without *actually* going that far.


If you provided a Reviewed-by and/or Tested-by tag, they would not be strip=
ped.

I would not say you are unqualified in terms of skills or abilities.
However, this is not how the Acked-by tag is typically used.
As Miguel mentioned, "Acked-by-User" or "Acked-by: # As primary user"
could be an option, but I am not sure if they would gain
sufficient consensus.

Code reviews and tests are always appreciated.
The Reviewed-by and Tested-by tags are open to everyone.

If you are uncomfortable with a Reviewed-by or Tested-by tag,
I cannot think of any other alternatives.



--=20
Best Regards
Masahiro Yamada

