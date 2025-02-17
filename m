Return-Path: <linux-kbuild+bounces-5798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8EA384B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 14:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF443ACD0B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 13:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657D821CC5C;
	Mon, 17 Feb 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATuXgOk4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF721CC56;
	Mon, 17 Feb 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798810; cv=none; b=rtUWDbokfXdP4dHxAzug39NrB42CdGL5uJQIkYgGbriLuFq0zsg1WiRTCk2EM7jXecfKFBwyKw7JH4socYzL0BtJN/jvksnMN116KmTR+Oz3bjIfWadOviR4nC8KxyvxweD/Kb2vpLSeS9nXxy+xvTkynhataz6fisW1UmKD70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798810; c=relaxed/simple;
	bh=EHzKZf4leLmjHBmvlpCBCg6v/lG7UQpiFdbgKnlQL/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0Ze94AIJJDWBiGb6x18Du8Zahqu5a71QV8Sz6rBzLFcOiu+I/mUECGYirgcbawvqHadFmpND3RrdyiR+gfWaTKk/EE6CWAt4gK5Of6gysrm7/ka3s3Hi/kzX5DiNcEcemkp3mshBiENZzMHFtqqQN+x72uFs3F0cTrfWv/WC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATuXgOk4; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fc288da33eso665270a91.0;
        Mon, 17 Feb 2025 05:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739798808; x=1740403608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR7k5nG10tipwHvpM393cVHbWaj6qVlWXesqpYs8m10=;
        b=ATuXgOk4PZ8erX5fYdZABAuSaQwlLkZxO1ukd0Oa73AmidMCpXFikiBYzVAQDzJb5L
         fIqTP7ueNwWt5oK9evkXsq5Q6IQSa+kAx+VitrDek1I7sgYHyaNg58stJq5cN5/h8yln
         5JGxcDm1E7kQo0ajkdYAd3vguxaEg2t+CUCHixiUCcYETpr7k3bWV1ciGnIWU6oPW+ov
         DkY3udPJ3cguKgBhZofCJVSpGgs3toTIhcjfX/o2Y7JcXrBr+iLVsSu+kbNryEUnNlUo
         cc6ypgh3biP7rCnkTSK/FSxC8PEC+wALw/RAYm0NIdVmkaDt9iLT0BOFC/ZZVigDjX+K
         geDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798808; x=1740403608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR7k5nG10tipwHvpM393cVHbWaj6qVlWXesqpYs8m10=;
        b=gFSRK7gniO+u+3BN6SI5FydG+s9Dp9TlY/8OzBblvf+sSXzV3Fs0iptcpioQp12i2E
         31dUUbPgEJDwva7G4oDSbCGCb3FaUTe0X7/QTK/QFJzIilzT9pnuMl5skGh+dtRh/LhN
         eQGG4rCALMbWZtNIox7elDHRvku1FLwjPuZw5PymojQTO6jrsJmd8JJWSdVr0iy0CkI1
         vKv9dQlaYgOYhEiLrDv33GKEGh0HdZ6nRjfF4gH5SgzZo9bcPoEAZBsstf42b01HyBZ0
         qDZUnSW/gQly5i+DQNT5UkNG5VUr8oGxJFtFKawz0gLbsqo4L+dAi7veHf0K3ydRDhwM
         DXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3zMGGbKjyW+OPbOkoLlFAw39r5aiZK+71iP0oaQerHfoVVs1aNlevWkTvdd475toi0KS6oTAHHu+/agg=@vger.kernel.org, AJvYcCWYdCosxioSmO+P/taZFPPTocOU19sc/sFnhh4iZKyAWGhd0xwVyMOqrpAY2oyzClGLxYL4tw9tyR/5Ge3tfVU=@vger.kernel.org, AJvYcCXfzrBzc4X8DGnYaCJFaGX5yrbXllz2IHye1grEGPE3O8H3rqE9yX4kdoH6UvyVl8vc1oassE+qOvNpK07Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyH9cUpLaU0Z7nMRhCzQ5/pbQscx8lL5X13BZUtno654Lc9Ta
	aPq1EiyKWpjSzm3RJnfSIpqwdpoIDvlaa4YQXmYrmTW6E2KyIfqCAMghPp1rtisxVXanxAQoWQ+
	VUMcnRghb8IE2JAhOmmNxkptSTyI=
X-Gm-Gg: ASbGnctjrM6VzH0+0ZyNCNC2uJObgcPP3ut4IjHRNd1Mf2yMdaI0K0ncgLnzU2ltxNR
	CI235zHb2t7mPEga15wCtkmUZmiuZUJLQl3BEV+MUvPaN8sOm2hYx0ULoAsemmBdq6Qvd6Pm3
X-Google-Smtp-Source: AGHT+IHAwTf3ZaITSWclTN0AOJ7zp19bRg1GYqvk5IuW9kZhs3YzSJntvXBAzBTo86T3DABMRNso6xRWe4eWzurHDTY=
X-Received: by 2002:a17:90b:3504:b0:2fc:f63:4b6a with SMTP id
 98e67ed59e1d1-2fc4078f0a1mr5960337a91.0.1739798808062; Mon, 17 Feb 2025
 05:26:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net> <CAK7LNATOgb0Wry50Mjoa=o4FkzG-Jf-5FjbKsf3DCN7dybwMgw@mail.gmail.com>
In-Reply-To: <CAK7LNATOgb0Wry50Mjoa=o4FkzG-Jf-5FjbKsf3DCN7dybwMgw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Feb 2025 14:26:34 +0100
X-Gm-Features: AWEUYZlvE9ZfUDvVbO1JvXq4gjivTybnrgtNmra_1CuiIOezCJuldznJVfM5tBE
Message-ID: <CANiq72=ZDtu0LL5uoKix8eyhvu2pcWLR-1_7it+hB8tsN=y0DA@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Masahiro Yamada <masahiroy@kernel.org>
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

On Sat, Feb 15, 2025 at 1:57=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I will apply this if Miguel gives Ack.

Thanks Masahiro -- I left some comments above.

This does remove some absolute paths for me, though not all (e.g.
`core.o` that comes from the sysroot). Since it is an improvement
already, if you want to apply it:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I leave below a diff that works for `core.o` for me -- it would do it
in all cases, not just `building_out_of_srctree`, since it is outside
the repository in all cases, which I think makes sense, e.g. in an
in-tree build I get:

    $ strings rust/core.o | grep validations.rs
    lib/rustlib/src/rust/library/core/src/str/validations.rs

Cheers,
Miguel

diff --git a/rust/Makefile b/rust/Makefile
index ea3849eb78f6..42f242472031 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -438,7 +438,7 @@ $(obj)/exports.o: private skip_gendwarfksyms =3D 1
 $(obj)/core.o: private skip_clippy =3D 1
 $(obj)/core.o: private skip_flags =3D -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy =3D $(foreach
sym,$(redirect-intrinsics),--redefine-sym $(sym)=3D__rust$(sym))
-$(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
+$(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
--remap-path-prefix=3D$(rustc_sysroot)/=3D
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
     $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
        +$(call if_changed_rule,rustc_library)

