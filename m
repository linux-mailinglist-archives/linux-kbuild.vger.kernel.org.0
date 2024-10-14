Return-Path: <linux-kbuild+bounces-4097-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813399D49F
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 18:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB81288077
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20F01AF4EE;
	Mon, 14 Oct 2024 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUg9pbJF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BC41AC887;
	Mon, 14 Oct 2024 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728923273; cv=none; b=Fve7T2/9VTJZjKlFc3+mUr0F6Ix1KvGF7PSbOvUlyKyiTzPTQ25Kt/iKMGouvDIRAT2cunzL5BNengb8sG/d3tJSPkUbPsl840KpEBJ0BWrf8WFpGAA+zXpuES9vg1R3ritcx28KTZsIhMG7KK4QGj2/2yZy0QsofuGKWPEBCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728923273; c=relaxed/simple;
	bh=jwGpfimwWzt6q1jU1lTtwpABN94Ujy5vGGuJ89kzZ9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VeSaFXrS9QrTnz5BvsKcq2nAimL/amEkKqtsRFJNcILglba73UgFwcIQYXusuhHuLvVhFEzeeCGKDtidFHUiBHOljx/KX82k1DTXgkYirdLzoWQumZdsRXkfXcmWubxf4ALCGDlQKPUvwHXoVY7NiV1C4YBbdxsaKsw+ISqeGXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUg9pbJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28929C4CED4;
	Mon, 14 Oct 2024 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728923273;
	bh=jwGpfimwWzt6q1jU1lTtwpABN94Ujy5vGGuJ89kzZ9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lUg9pbJFApuU7+cKFC8TJT9PLCMcC+2YmqTCXR7o2JFwZ+6haPcSJ9hof8c2ABbZo
	 WrlYJpivucRzEXUrEvMn4NBP49o02nz4n53H0Vc0RfNGssziXNwAwrZ/xzuXQ54a2j
	 w2FYV9RdYIyBqKjTIFHVEoQHKlrMWGTUhLVg1hetaEFhhjaMIEnepgfJInNaSnqIh0
	 LhGTOUF0sR9vF5t+bIwSERkTh1n2U0dRpKja0+zDgs37STpHF1KY/UuJju2bERkyxV
	 H0IxvTKDoPrvqRxm6NvUcUlDinzxtM9OZJq328syP7OpBePv6hFb/YPXYsaz1ExDJH
	 mHja8eGE0PM+w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2260155e87.0;
        Mon, 14 Oct 2024 09:27:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSqKBDBH0lsBiAZcrC0t4Y3Vlj4i5Ekif78BnkjqXGwxXvFT2JY0fUYfY8oQ48Mj7dmAg/vYVq/ItYgeQY@vger.kernel.org, AJvYcCWZYOuNl8nOHuglBgmKcZBbcWXmYhxcSHddnUYwZnxu4mmOwGNvA+6q1NP+m2q1uamoJ4+UPVpXk9i73m0=@vger.kernel.org, AJvYcCXEVsugB+sj+vdGs6izRNhQcM5Hgy2hQTWU7LmLpujJRuxAhziWTSMoBZXJhyb1kDfb+cH/KW+98uARYwClTDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5+jZBeNwCPtoJlf/bEi0xWJ1zB2g7XkEUYGnt02WZuaGgrEl
	T1iYwZgw2P6cQo5TxEiCb+s6dDzwBw8R7OmibLF9L9mKcw/myv5zbAFuqRES0NFSYkjIjhzIGF2
	dfVNhkTijrEvy2QIgnKxKXN/5obg=
X-Google-Smtp-Source: AGHT+IHRF2uisuPIUJzp50NFyDqu/2E1pwV8KKK4/ZYkn1oh1Xf8Ul+foIxD0JDMpFxbu8Fe1rebinaBenD5NcvRsMQ=
X-Received: by 2002:a05:6512:32c3:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-539d6e6063amr3853452e87.14.1728923271760; Mon, 14 Oct 2024
 09:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net> <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
 <20241011130641.4a8419c1@eugeo>
In-Reply-To: <20241011130641.4a8419c1@eugeo>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 15 Oct 2024 01:27:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
Message-ID: <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 9:06=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 11 Oct 2024 13:53:47 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
> > On Fri, Oct 11, 2024 at 1:41=E2=80=AFPM Gary Guo <gary@garyguo.net> wro=
te:
> > >
> > > The invocation of rustc-version is being moved from init/Kconfig to
> > > scripts/Kconfig.include for consistency with cc-version.
> >
> > Yeah, I am ambivalent. Dropping them would minimize changes and avoid
> > introducing something only used once, which would be nice too. Happy
> > either way.
>
> Another motivation is that in my helper inline series, I need to do
> arithmetic on LLVM version (divide it by 10000 to get major verison),
> which isn't possible for config options, but will work for variables
> defiend in Kconfig.include.
>
> I didn't mention it in the commit message for this patch because this
> is not my patch series :)


I tend to agree with Muguel.
The motivation of having cc-version in scripts/Kconfig.include
is to check the presence of the supported C compiler, as C compiler
is mandatory (in contrast, Rust compiler is optional).

If you have a reason to have it in scripts/Kconfig.include
for your future works, it is OK with me, but I cannot judge it.






>
> Best,
> Gary
>
> > > +if output=3D$("$@" --version --verbose 2>/dev/null | grep LLVM); the=
n
> >
> > Similarly, I wonder if we should use '^LLVM version: ' here or similar
> > to minimize the chances the "LLVM" string appears elsewhere in the
> > future (perhaps in a custom string a vendor adds, though I would
> > expect them to add it lowercase). We are relying on having a $3 when
> > splitting anyway.
> >
> > Depending on what Masahiro prefers, I will take this one or the
> > one-invocation-only one.
> >
> > Thanks Gary!
> >
> > Cheers,
> > Miguel
>
>


--=20
Best Regards
Masahiro Yamada

