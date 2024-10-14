Return-Path: <linux-kbuild+bounces-4103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1E99D6B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 20:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD59282F19
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 18:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488BE1AA7AB;
	Mon, 14 Oct 2024 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fjs0eEmI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93E4683;
	Mon, 14 Oct 2024 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728931564; cv=none; b=SelzS97XKU2vb3DrWk7UCFoPtYIzmiFyN/B6IwdBVUBrFRDT4TLzuVNCeutUYK+f1zwcLnHTHaEp9wOSfqwjHby4/JGkCIstqwducEs3cOEvnSZNacTRCBXKb99QgML/jUKDZ0IT/U/MkC050vZLhd4Kq9o6FxPg/4P2XMkIQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728931564; c=relaxed/simple;
	bh=puq7ATK5XfMQfbCXGsdFhyoS3gVM22DNcCUXKXb3YwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dx8orJwf2t1/9nNofaPPGHYBGz6d+esaSEfCcZ3keHx0V7xi4T8IWZYcYNceZNvVNgx7+MBJnxUcI1hcNjpyIHdrroOzEcOTc3CbW6HnkFTIJ6RzWWkk+A1+Xr++LZWqPmIyAz71oVNqS8iWy2S7ZpymaGUFb/rW8IBUVF9q99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fjs0eEmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67BCC4CED7;
	Mon, 14 Oct 2024 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728931563;
	bh=puq7ATK5XfMQfbCXGsdFhyoS3gVM22DNcCUXKXb3YwU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fjs0eEmIRVfYfFezgamSy2VrPE4CpEL0ZMiQGFdoNP/J4lV8TFR8AU/fpkI5tGG2p
	 DtshpGJ4slOMZs1J3hoowiame7jYWfH4JvBJwprKT0vOWry0ucxdn0anonSnAz9Zob
	 4yF8TeF/pRIw50beHsdLTyR1LWEzgPMmWDgixTDDC8u5RaU/iOXEpUz/UiNKnveBdf
	 1aMbd7fmpjggQCfDbo/phYJYTC2Ye6hRtbrsnUOFg6byfxMhqju2U+do0thRRxbw9E
	 KLqtFrw+v6fyV6YnrHHZ9uB4fjBy6fZHKtVIbJStJj3G7UiUG5YuEHjdzcOAisw1+Q
	 gXh9mAK0W/eiw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f6fede4dso1425746e87.1;
        Mon, 14 Oct 2024 11:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/kyCYdIhrV2L9aeu7luCDHW0eMfFiIT8tYsuVCOa/TC7VAFOs1w1GOeP3pLQwee7oVE9IpUXwpZCvevTXsq4=@vger.kernel.org, AJvYcCWBjxSKdmszq9N3KI3xHZn8uMsSkQXoqjoi0EqzgwGNA4DSzDEBRLJ/IyZn/46lD74vAFc1mkoGYzYEVDg=@vger.kernel.org, AJvYcCXvF1rXB/wipVVWF4eeEjX8Hidh5f4GWucPzXpDdqBMxFIUGggIFHK8/BhdWQUDZg9h3uTiMS5GRMz6TpO/@vger.kernel.org
X-Gm-Message-State: AOJu0YwWM8SQKb6kjpHXi5VtHaRnbYy1yIEhtlADgHx1FSON9wzuOvbl
	bZY//HkNYutOrxkK+PWGiPX3ERZ4JI1qsUPveHx5P9GK/VehEx1J0xff+OuOqcJt1X5vM1/O1kg
	psRhuxuS+qiBQvPL5nBaRnT0qTrI=
X-Google-Smtp-Source: AGHT+IFy1hF0VEEuJ3e7n9t9DaXXuKV867ChAbNbjtKeaae0DuCvT7vSxpk6yDpiL8h0Wmo6PRupiX7QbdVc/ODlzUE=
X-Received: by 2002:a05:6512:2352:b0:539:f7de:df84 with SMTP id
 2adb3069b0e04-539f7dee17amr2085836e87.10.1728931562388; Mon, 14 Oct 2024
 11:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com> <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
In-Reply-To: <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 15 Oct 2024 03:45:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
Message-ID: <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Daniel Gomez <da.gomez@samsung.com>, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 8:53=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Sat, Oct 12, 2024 at 7:37=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > But before we do that, is there a way to force `rustc` to load current
> > name (or trick it to do so, say, with a symlink)? i.e. can it be
> > reasonably done out-of-tree without changes to the filename?
>
> I think the problem is that rustc produces .dylib on macOS rather than
> it _looking_ for .dylib; the path to the .so is fully specified in the
> rustc invocation of the targets that depend on it. I don't know of a way
> to control the file suffix externally.

rustc ignores --emit=3Dlink=3Drust/libmacro.so
and produces rust/libmacro.dylib.

Is this a bug in rustc?




> A symlink would possibly work (unless rustc refuses to load anything
> other than .dylib on macOS for whatever reason), but wouldn't be very
> ergonomic; you'd have to create the symlink blind or else run the build
> system until it fails, then create the symlink, and then run the build
> again.



--=20
Best Regards
Masahiro Yamada

