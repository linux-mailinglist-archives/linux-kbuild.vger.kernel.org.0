Return-Path: <linux-kbuild+bounces-6067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ED4A5CF03
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599773BA292
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81730264A6F;
	Tue, 11 Mar 2025 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy47a3LP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD93264A6D;
	Tue, 11 Mar 2025 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720109; cv=none; b=rc9bKWYhondIHTfk2amWt6AIswtUtaVtDUZ359AI71GG8Jb8A/dVcBsgdxJxgHb9BFwV235uOE9edxokO0Ico2LUwQOFORRZ6zT3L3344BJSuHrLNKhUs/5tYYBr68BeR1Qj68plI+cQGXBnmQHTnjdEFyrcBg0G4svOLzc9oMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720109; c=relaxed/simple;
	bh=Wzm78fHs/oHz31mlA1RVoZx2KHkqekACSBY76mK36dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkluqAmJM97XiMxp6AHWC3qF1eTwDLA07wae19HvDkyog7S1r+6jFlftl1kyhpFnsmUbikHhRBZasYGoFHWseWbTmBESKCd0Ub820as/3E9Iwl3yIUrBcgyJXxaC32D3mB6dMHyn42f6smQIvRNe4A2RwnkOJxDdqDfuoxTK0Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy47a3LP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A34C4CEF0;
	Tue, 11 Mar 2025 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720108;
	bh=Wzm78fHs/oHz31mlA1RVoZx2KHkqekACSBY76mK36dU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gy47a3LPPUjWj3GqzZWCoihtUpg2LQ3z1gnMkeLFkbGdMwWMUncISZ6jX84Bkc8I7
	 aQfjzXG90i7Aci+SeLh7N8iY63H0fYN7LvcCc7NcJaVvb4noM80OfJtuZEs8NhHtXV
	 bFlcglP2A5Qky37Z/hOdjzpBR/9TdZ/SSMf0Y9Ue4/9UMPcTo8fBvydIw9Pinl3RK0
	 g8nty+szWZSruNj2iT+48WbFC71DSlBQGmi4KV5IU2tLPOFAefak4+482ln5T580MC
	 /1qsMYtO63dcLIOn4zEDp8meVBNBTAnYjkJFWzxHTBnsbfB21aO969qP+Uhw7ZT4Tr
	 IlBlCpHkMYQvg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061513d353so66313011fa.2;
        Tue, 11 Mar 2025 12:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXSbVcZCXp+w0joge3X/9clToJAiHhvXnr3dgixqGX/7+9slMcLPaoZiUpnf+bOpD9r0onFw+Mwuc7iV3O@vger.kernel.org, AJvYcCVc4fvp2k5nRjTMlto0hX1Xnoxtv/WRcabPD54QPJy5Q3DnDAszfOxeRreuQ5nwtjhFYL+pSsK/55ifR9s=@vger.kernel.org, AJvYcCXkQEjMDqyTJhcfoljiYSH8uD5VxWusK2UcBcH6WjQEdQb1/7s8Seo9Pun1ckQVdnHhRnWfWSZGBdG5SOUIE2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9H6dpIHK/538gr/ve2umoLo8FWBhnMDGES8OsmRLNXNojM1/
	eCTyI3BhJkwdPaJaKpB6K5RfhDij+rs7xNtkl+IbSSIbcc6zpYwDvs2vc9SgJ+anx6hJ7xEJFsw
	42hKhU/9jgr++yOfQOT3ygmoRr88=
X-Google-Smtp-Source: AGHT+IFDNc7jWrpB/rZF0Bt1TcLbbByT/Sv9KdtGAG1l8kq+hfvXQUXCPiEP8qbm3fiB+Oyw+/aWIQnFXZeSHnvGQIU=
X-Received: by 2002:a2e:be84:0:b0:30b:fd7a:22e9 with SMTP id
 38308e7fff4ca-30bfd7a2457mr46514801fa.13.1741720107439; Tue, 11 Mar 2025
 12:08:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
 <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com> <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
In-Reply-To: <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Mar 2025 04:07:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com>
X-Gm-Features: AQ5f1JpKC9S0zb4CrC9K4lEBV4D9vZKCUco_QGJwNs8yocKoR1JVbWCsZbHaodY
Message-ID: <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 2:36=E2=80=AFAM Ben Hutchings <ben@decadent.org.uk>=
 wrote:
>
> On Tue, 2025-03-11 at 20:03 +0900, Masahiro Yamada wrote:
> > On Mon, Feb 17, 2025 at 10:23=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Mon, Feb 10, 2025 at 6:11=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@=
weissschuh.net> wrote:
> > > >
> > > > Remap source path prefixes in all output, including compiler
> > > > diagnostics, debug information, macro expansions, etc.
> > >
> > > Hmm... We don't do all the cases in the C side -- the docs ask to use
> > > `KCFLAGS` when one wants to remove them in the debug info:
> > >
> > >     https://docs.kernel.org/kbuild/reproducible-builds.html#absolute-=
filenames
> > >
> > > I am not sure if there is a reason not to cover all cases in C (Cc'in=
g Ben).
>
> I think we should use the prefix-map options by default, for both C and
> Rust code.

A patch is appreciated.
(top-level Makefile change with updates
in Documentation/kbuild/reproducible-builds.rst)

>
> The default of using absolute filenames only works when the build and
> debug systems have their sources in the same absolute directory.  For
> some developers this will always be true because they're the same
> system.  In the general case, and particularly in production, it's
> unlikely to be true.  See below.
>
> > GCC manual mentions the below about the -fdebug-prefix-map=3Dold=3Dnew
> >
> >
> > "It can also be used to change an absolute path to
> > a relative path by using . for new.
> > This can give more reproducible builds, which are location
> > independent, but may require an extra command to tell GDB
> > where to find the source files."
> >
> >
> > I guess "the extra command" might be a bit annoying.
>
> The command in question is "dir <source-root-directory>".  It's not
> particulary annoying.  It also isn't needed when invoking gdb with the
> kernel source root as its current directory.
>
> Running that command adds the directory to gdb's source search path,
> causing it to look for sources referenced in debug info by:
>
> 1. Appending the full filename to that directory
> 2. Appending the base filename to that directory
>
> (This is slightly simplified from the docuemntation at:
> <https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html#=
Source-Path>.)
>
> When the debug info has relative filenames, case 1 should always work.
>
> When the debug info has absolute filenames, case 2 can work if all
> sources are in the same directory.  But the kernel has source files
> spread across many directories, so there's no general way to make gdb
> find them all.
>
> Ben.
>
> --
> Ben Hutchings
> A free society is one where it is safe to be unpopular.
>                                                       - Adlai Stevenson



--=20
Best Regards
Masahiro Yamada

