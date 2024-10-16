Return-Path: <linux-kbuild+bounces-4145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30F99FE61
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 03:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60A58283540
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34726139D1B;
	Wed, 16 Oct 2024 01:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbbkXUgv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745D13AF2;
	Wed, 16 Oct 2024 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729042590; cv=none; b=d1pMqpMwsXCNbc3CePMMB90FW5l5zJSuwStTVoNqkkBxj6e2Wj6nFGnUXr5NUt8xnAMd/J+fpXM6Haem2Sn1ks/3MRbFEuLYvz03+oow/mmgHeopVtwFiUgs4F/49u/FaxOFNveG07zalhEXnO4Dh7AV3VU3lLAkldbhtb1PVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729042590; c=relaxed/simple;
	bh=EyTf8ypYJUnbA4aU4ZY+o5alByAa+yZe1C+/N3NxFes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKYNtV8uKtltP1/qhRKIaS5AlMttNZReVAOfe2BT8kQ6MDet8s2NU1EKjAVozvHJe/IvwW0tOcx2+urhOYTYCKa3laIBaFMo0N6oARRML4Ris20CKY8CP+8GA7R6fWEf7L2vKGa17zzVVnHXjXgx3rnq043au2PDdCXaypj/mlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbbkXUgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B542C4CED5;
	Wed, 16 Oct 2024 01:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729042589;
	bh=EyTf8ypYJUnbA4aU4ZY+o5alByAa+yZe1C+/N3NxFes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sbbkXUgvlJwl5fDxfRa30i3mFifxoXfGeNqhFxdx5r8P+y6eDXO4S2RBoGKawPdJQ
	 vblkrc0pVFWsv6jV6g/uCxmaWqvolQ1YV1UzLqm2W1SNyzNdHDJanqeUp/n8je5rZ1
	 ZTNa68GE03ZQijuGD0BL23Ui5njzWR99dvJXCkJF1NsBrEdtpcNM7+2r0CGRlgAayH
	 XmFZo1RGYFaqGp6GiiWLkT2VirfPChAQAhIrsOSsBz/56jR41K+ypf0ND6Qx/txbUL
	 e7qEudPzb7XRhRUIqAV+UDLFxMfjH9YRZmwM1xY0d+6I5QMQ/5hyakjd9gOu+P7GVg
	 tqYqvE7Ve9b1A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so33855691fa.1;
        Tue, 15 Oct 2024 18:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSKt7Re5CPqmkL65AXohNtP4JizhmKJS2pPsvZjMrXoxExOVgbKfmwtcPIqMMzvV/rXDrbzo6WomrtyPI=@vger.kernel.org, AJvYcCX8kDsI5l6kbrfewp51cQSmb+aDVx175exwloljf1JTGFgKdC+GEQatl30jtBXWsCeYS+xsuDlK8UQT/WAdcWo=@vger.kernel.org, AJvYcCXvVSYrwYuedLFO4Dn0GIQmvKJfiCKcVhxZfVJS43lHJ7s0R631u3SJb20uTSQ+bkPO2mrHk6oCg8uxYUuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FmPXDAQfIE9XJ+voZV/Ul41+q4QcIPCvj6NggWhK8XS8Mxnx
	21Q2JiCnSghDYmISxLDU771pzCMKeEMDepa8cmJC7i/sSei6Vk3dafyL/3Es3Cw/SaLC/uugQKG
	B2TdBY38Ngf6vFPIwHi085DADa0I=
X-Google-Smtp-Source: AGHT+IHzoVMypscy8BPsGKZUxBnSxDBZTWto2GwTo/mZ1Yq95n7GVmtr3XmzjJJCM6j6cDBCzzagpDlXMSqZjJmpefA=
X-Received: by 2002:a05:651c:b06:b0:2fb:b8a:7abb with SMTP id
 38308e7fff4ca-2fb61b6ebbemr12435461fa.21.1729042588147; Tue, 15 Oct 2024
 18:36:28 -0700 (PDT)
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
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
 <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
 <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
 <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
 <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com>
 <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com>
 <CAJ-ks9khX7Ha4iGWOkbHeXzJLPisE9r=+q54Z9HMQkojR=-a8Q@mail.gmail.com>
 <CANiq72=mUeMYvgfQVozr363juCuKmMVNx_13dj+q=3KKJ4DeHA@mail.gmail.com> <CAJ-ks9msDK9UAK5Pv2-TVWXv1-xYD3L0J=JKupN_Z5WW8VrX=g@mail.gmail.com>
In-Reply-To: <CAJ-ks9msDK9UAK5Pv2-TVWXv1-xYD3L0J=JKupN_Z5WW8VrX=g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 16 Oct 2024 10:35:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnhdshYWAHyqz9HRjTggj=7SFB_8d2Oqkr4OOupY9Lag@mail.gmail.com>
Message-ID: <CAK7LNATnhdshYWAHyqz9HRjTggj=7SFB_8d2Oqkr4OOupY9Lag@mail.gmail.com>
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

On Wed, Oct 16, 2024 at 12:53=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> On Tue, Oct 15, 2024 at 11:30=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > If a trick still requires a similar amount of changes to mainline,
> > then I think we should go for something better/more proper, i.e. the
> > idea is to minimize changes/complexity upstream, after all.
>
> In that case v5[0] is probably the way to go?
>
> On Mon, Oct 14, 2024 at 2:45=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> > This no-clean-files is meaningless and unnecessary.
> > This line exists inside the "ifdef CONFIG_RUST" ... "endif" block.
> >
> > no-clean-files is only used by scripts/Makefile.clean,
> > which does not include include/config/auto.conf.
>
> I see. Was it necessary before this patch? Looks like it came with the
> initial rust support patch.


You can just delete no-clean-files from your patch.


Files specified to $(always-y) are removed by "make clean".
That's why [0] added no-clean-files to negate it.


You are moving "always-$(CONFIG_RUST) +=3D libmacros.so"
into the "ifdef CONFIG_RUST" ... "endif" block, which is not
parsed by "make clean".




>
> [0] https://lore.kernel.org/all/20241010142833.98528-2-tamird@gmail.com/



--=20
Best Regards
Masahiro Yamada

