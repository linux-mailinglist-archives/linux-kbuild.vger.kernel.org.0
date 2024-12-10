Return-Path: <linux-kbuild+bounces-5064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E09EB10D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 13:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4314C28756A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 12:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C982B1A4E77;
	Tue, 10 Dec 2024 12:42:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E8119CC1C;
	Tue, 10 Dec 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834550; cv=none; b=BByPiZ5mbAeMPr6RS6FCxtrwynCGe3dOxqvkGvmmw3xmltb1f1Ae7mgA26iSti8bfBBJjOnuaWTv9X2AYk8Yj8TngB7/lXTLX8n+MmLvPuTp6KaNpBfFWHf9Hffoh+DH+v+UEIK1cZQhhh9El9yFIjQrh41gAJi1uExyRbK2t1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834550; c=relaxed/simple;
	bh=wPIrwF3e71i18xK6VAGqAKif4VNxMP81ypBpG4hr5VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUtRp6+BRjxt3ZfUdDKR8W2gih17dczOhGMyw9fhvh+pbTRjz1i9FWuhUsXw7vC1LT515ZNQRRwHtFMsS51TOAkcqH9zzvDZjrcdvHgC8371WJiTrDJ02Ks21/37DE/AOdiNJen+0whMn/h/AaZTpnnMLeRZMoR9EHaeCKhrlfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa696d3901bso313214466b.1;
        Tue, 10 Dec 2024 04:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834546; x=1734439346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPIrwF3e71i18xK6VAGqAKif4VNxMP81ypBpG4hr5VA=;
        b=FN7XqSUtk41mldw95AAxce4xj2H4sxpBjJV1PHSUFXwbmUFXZRH9NEZSgqz14U41Sd
         FCOZtXoSoMPLVITMy+x4Tyhh2OjkUNrmDuv/NzQsFCEHSPDsvwiAxvCWCEEaBnFoIBRj
         If/hno7NeYiRmPZ0qeP8Nj1Hm5Jv8ByQ8ibKfQPjUX+NpS3OimOfMquO28TOwTLWDMgJ
         8JgoVLDS5qymJyQPlo0EmYWr/rK2qymGDYYi6jDUX8f/TIbwAefrGi25u/OhnFnssvWS
         WTQnVsL8vWnVtf7bHMwk8JwgstvNThkoQ/89OhQYhNtPXPvruVBsz5pwushvW2fOqQbg
         heLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSZB9yo670eQvmhRVqC4IillO+1WzA8GqqyzHoEmcJZOKRVfFivvA82bYLP2KITQs5/dNOQ8BiwJdSE2Rj+g==@vger.kernel.org, AJvYcCX/765fuk+svritWPMCcaQQ1JJt8mMlGMykiqbgtobRL6hPu+WSviEBKJyGz8oFQmYtue2LrKer3/cUmcc+@vger.kernel.org, AJvYcCX2dyv3lWjpwx79GaaEiXkK0ZHgdYQSK1Z4s42rrKxBGn1t2cam1G2wbf+3MSvE6t2Xf8US10C3R86oYVc=@vger.kernel.org, AJvYcCX3OwNcKDvS+XhfygRoYwYkoH14NSVY2M+dmpmA7r3C7qMHA2EbWP9JRQLsaPF0Mm9BnzULpQk4GyCnanT4Ic0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5MvCOvuMINRJM7OorzRYG8pOVjnoOcKHW8h4HNS5cIvAie3AV
	f/Ip3W1OGrptf2764snXg4RtPC9V+FlUpmM6xprveJBYl+SkQSr73zcrvLerDZo=
X-Gm-Gg: ASbGncv8YgfTCAN+U9D6j2HWDx/dNFN0B7Z7RojoG6TUnDe+WurvrPgXKYdAYt+5ETl
	pkQoifjTyJs6sGlSneO1JrDQxbOvwUsMWVqMUM1Qfikpz5Yj9CYhhFbFeS2zw6M7jjqPHAUY+nw
	GtCgjPFodud6dBN3MXvIOEJJdFj7uTrJdxg7HPtw4J+157rRMMvtteODe0zCgAgfdljAUQLIiZS
	HJEs8PUUMzD/MzIM//eDEqDt6D6xSEgcKRbtxeagjXAi0KIw8hbZv8LIDiyXQExp2TKWQDS0XnP
	P5kZ+2VI
X-Google-Smtp-Source: AGHT+IEjrww550h6+9ARtnHsxMV+l4ipX6EajgcDEdPIFZc/tsffRdVj8uW3pZ9aWEyGeJonRDYJkQ==
X-Received: by 2002:a17:906:32d9:b0:aa6:93c4:c68f with SMTP id a640c23a62f3a-aa693c4c88fmr595546966b.21.1733834546398;
        Tue, 10 Dec 2024 04:42:26 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa651cf4a83sm538888666b.62.2024.12.10.04.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 04:42:25 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa670ffe302so447792266b.2;
        Tue, 10 Dec 2024 04:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURXDWzsz9I0HX36Cf6mDPG5NeqoWbl3lpTpUioJkzQW1DAs12sqFtpFPQmhcVfD4aP5s7FlQp3Xe/KldY=@vger.kernel.org, AJvYcCVU1HBnB8gHKW9by9wX+dP48rDyNvKmBxTzHmTLE0zCd0Gz0qVC+xW3rtzvdPLSXMuBbmDKqmLjoJsHu4JWZQ==@vger.kernel.org, AJvYcCVxdqwea3Qb1vniEDGLlZP+3fJjAaN7pnEAsGH+kpN/EXG3RDcvOXTOPlUlwCAiLOGeNyXLyU3ylyxyOO/b@vger.kernel.org, AJvYcCXvPtiAdR/h3qLzN8Z6h0Udk6YZDDQPEAEctsGxn3IVEaybaGZsqF6fyuHFO1ymsa5/vOcvjGWbhYhFj09sgaI=@vger.kernel.org
X-Received: by 2002:a17:907:9548:b0:aa6:61b7:938f with SMTP id
 a640c23a62f3a-aa661b794bbmr1006237866b.6.1733834545197; Tue, 10 Dec 2024
 04:42:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
 <CANiq72m4fea15Z0fFZauz8N2madkBJ0G7Dc094OwoajnXmROOA@mail.gmail.com> <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
In-Reply-To: <CABCJKudozEhZXLZVxVixsO5YuZg0nOEmgo3=vMyhcrEw+6Xo5w@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 10 Dec 2024 07:41:48 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
Message-ID: <CAEg-Je-58WxKXOFEDBWmZDpt8E+SaRq+kK7ZnfMER2qtnKUD=w@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Mon, Nov 25, 2024 at 10:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Mon, Nov 25, 2024 at 4:41=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Nov 25, 2024 at 2:29=E2=80=AFPM Neal Gompa <neal@gompa.dev> wro=
te:
> > >
> > > As my Acked-by was removed, I'm sorry to say that there is no point
> > > for me to provide feedback since it is unwanted.
> > >
> > > I hope it lands soon, but I also hope the people here who decided tha=
t
> > > a person's efforts aren't worth recording because they don't
> > > personally know them should reflect on this too. It's a good way to
> > > keep people from coming into the community for the long term.
> >
> > Hopefully this reply helps -- apologies to anyone if I am overstepping.
> >
> > On one side, it is true that Acked-by is typically used by people that
> > is responsible for the code one way or another, because the tag is
> > meant for them to acknowledge they are OK with the change going in,
> > and so I can see the argument that restricting it for that purpose
> > only may help avoid confusion later on reading the log.
> >
> > On the other hand, someone being willing to put their name on a patch
> > is very valuable, whoever they are, and whatever the tag name is.
> > Moreover, it is also true that, Acked-by may be used here in a "as a
> > key user downstream, this looks reasonable and satisfies our needs"
> > sense.
> >
> > Finally, sometimes new tags are invented on the fly because there is
> > no good fit, too.
> >
> > Either way, I don't think anyone wanted to disregard your efforts or
> > to be rude to you in particular, but rather wanted to keep tags usage
> > aligned to how they view them or how they use them in their subsystem.
> > The Tested-by was still wanted, so I doubt their goal was to remove
> > you from the log or to make you feel unwelcomed.
>
> Thank you for putting this more eloquently than I could, Miguel. Neal,
> I do appreciate your feedback, and I'm sorry if I didn't make it clear
> enough in my previous emails. I would very much welcome your
> Tested-by, or another suitable tag that's acceptable to both you and
> Masahiro.
>

Honestly, I don't think it's worth it if my tag is going to be
stripped simply because someone thinks I'm "unqualified". If you want
more people participating in these things, doing stuff like that is
definitely not the way to do it. It's not like people haven't had a
chance to know me or even just look me up to know I'm not just blowing
smoke. I definitely feel like I'm being disregarded. :(

The sole reason I didn't give a Reviewed-by or Tested-by is that I
didn't want to do any integration work to validate it beyond the
basics, which would have meant dipping into the Red Hat kernel symbol
tracking infrastructure. I don't have time for that right now. If
someone else does, they can be my guest. I just don't feel comfortable
giving either without *actually* going that far.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

