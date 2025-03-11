Return-Path: <linux-kbuild+bounces-6047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA0A5BE75
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3C457A9510
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7272528E4;
	Tue, 11 Mar 2025 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QE8sz+6D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3DD250C1C;
	Tue, 11 Mar 2025 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691091; cv=none; b=ZQGZBuuOwBjtn4qnLxEuZFBaln01yD3G9pZxvKZPdh/+SYQ7M59mexM/rHLdRGrkyPmquN6HTGkRytGUQDm7EgvubHOot7XgYjswQ61LRoEmFR4LYSH9zHIG3yC5myOCYyhulWbmuA1B6x/8xbvs9FQlrF68WnWAghI1vy6TWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691091; c=relaxed/simple;
	bh=EduqDFoB7/Ty3Lwb0KMYpqH9qTqPwMVjiPlojukHZcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhcsBGLg/Or/NL46W8aSH4dCB1f293djSprstAIYN82QhH0y3UUt34a3SUVAx5n/03qt9wM9KiINVGRKSxUPQ0snY9vmCyYoE1mIaD+KAJjVrdEJ4SIgXMz2aPc0+rg79CRP9/mnWve7Tjp2yILvg+hg8pRkYmQZ5OBsrtJCPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QE8sz+6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E186C4CEEF;
	Tue, 11 Mar 2025 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741691091;
	bh=EduqDFoB7/Ty3Lwb0KMYpqH9qTqPwMVjiPlojukHZcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QE8sz+6DmWoI/hEVii7W2HoDtRQEc1XnAxt0sPbZs9lEtgoFNEUpopGZ2hjK4OhQE
	 kJ0YlTS+IEL5zNQAYCR38jwnbgzT87lhMmMrLPErEo4q2Hv5liiKo49DL3XcfLbCal
	 IZuEhkhehNdirj2sSo7lTDFe27n0lggHXsNZ/sW/xMz3FlwymKXFou6cJA5u7vz4PE
	 xoZSPg66aksuPFzs3aoy+7+utGP2FfzKLJwQAVGsqIOc/Y06Cb5ipOm24Kc1ZIZtFg
	 06srHpjqOqgsg1dPOPpXxBnelJQb6Zwktpt/YFYdjpK7O8Sn0DgUJNuS0qmht/ytex
	 U4Z/sDtnBgtYQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549946c5346so4054540e87.2;
        Tue, 11 Mar 2025 04:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHWNJza6AC8waUaq44ElnMspI+GnLHmsLUu6eFR433TybpYj/iKMLESumXQOMo+0bGwhR+89YLVgXwbik=@vger.kernel.org, AJvYcCWHARSuhUFGVpF8OxCe4yhGoP9Cc/5yGgBSpulpOuyu2J5fk5wk+GEKBy3l+WdUFuxnSHdE3e1+PDlZGp64@vger.kernel.org, AJvYcCWoReUwPyIhq3589C7d/DT7TJd5Mv88wJZX9vvfFjewr16IOlCvt4TGBHtFTfgwZXc0Aq2cdv1znjDA2/YF8RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOTOY/inB1IQVn7wgaoKykPg7ZsRZSr/o48NKq+ha2Mcj0Bnt
	NwdYLcktddgUT2DnzE42nFqcjOaFNyDewit8KNKtEvTaFoFMOjWLNWfXaHnk7sCHuKx56CjyEQd
	Jvx7/6HMDckLQCRFucozjFxFVmJA=
X-Google-Smtp-Source: AGHT+IGTyI43TFDpYdq1WDkkFDPjGyZugy120NFRjRu3rqN0KdtghBaMgeOOto5qu+EkyJS29foIaciFXLncOQhLfdk=
X-Received: by 2002:a05:6512:12c3:b0:545:109b:a9c7 with SMTP id
 2adb3069b0e04-54990eaa6a4mr5550966e87.35.1741691089853; Tue, 11 Mar 2025
 04:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CAK7LNATOgb0Wry50Mjoa=o4FkzG-Jf-5FjbKsf3DCN7dybwMgw@mail.gmail.com> <CANiq72=ZDtu0LL5uoKix8eyhvu2pcWLR-1_7it+hB8tsN=y0DA@mail.gmail.com>
In-Reply-To: <CANiq72=ZDtu0LL5uoKix8eyhvu2pcWLR-1_7it+hB8tsN=y0DA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 20:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDDvS98tZk1nb0vPq-Q+-FkQLvHVR4DgRJ1SrtcRdDTw@mail.gmail.com>
X-Gm-Features: AQ5f1JqGf6RZOC3r0lSTkjaRKgATvzZK_6OX8ChOKMne9-gqG0fP5u9deAfxSPc
Message-ID: <CAK7LNATDDvS98tZk1nb0vPq-Q+-FkQLvHVR4DgRJ1SrtcRdDTw@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 10:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Feb 15, 2025 at 1:57=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > I will apply this if Miguel gives Ack.
>
> Thanks Masahiro -- I left some comments above.
>
> This does remove some absolute paths for me, though not all (e.g.
> `core.o` that comes from the sysroot). Since it is an improvement
> already, if you want to apply it:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> I leave below a diff that works for `core.o` for me -- it would do it
> in all cases, not just `building_out_of_srctree`, since it is outside
> the repository in all cases, which I think makes sense, e.g. in an
> in-tree build I get:
>
>     $ strings rust/core.o | grep validations.rs
>     lib/rustlib/src/rust/library/core/src/str/validations.rs
>
> Cheers,
> Miguel
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ea3849eb78f6..42f242472031 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -438,7 +438,7 @@ $(obj)/exports.o: private skip_gendwarfksyms =3D 1
>  $(obj)/core.o: private skip_clippy =3D 1
>  $(obj)/core.o: private skip_flags =3D -Wunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach
> sym,$(redirect-intrinsics),--redefine-sym $(sym)=3D__rust$(sym))
> -$(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> +$(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> --remap-path-prefix=3D$(rustc_sysroot)/=3D
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>      $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
>         +$(call if_changed_rule,rustc_library)

LGTM. Thanks.


--=20
Best Regards
Masahiro Yamada

