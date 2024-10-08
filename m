Return-Path: <linux-kbuild+bounces-3981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CA99584C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3721C213AE
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7D0213ED6;
	Tue,  8 Oct 2024 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUgqDT2z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C271E104B;
	Tue,  8 Oct 2024 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418916; cv=none; b=cnrpMHkrqzlPW9B1XqxPafawO52dNnRcX27PMBNFklkv3Bu8G/10hL2FU1cs/ojv3Q/07S8wwVepfkF25dwbmkKjBVn+PVGxxfzHrDs9YSIv8LbriqsKWMk4TvQ5zSmrE/z7LShlFAAv36lqehYe3+hKPcj5TlLvN98cxvBpaAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418916; c=relaxed/simple;
	bh=2DsQ7SQOH3j7P3k9UFZPQ7BRKfN2aKs3Cae77opK1d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7wjTvmgCZWiDSzPICibj5klyA9zlNXzziGqoIXlFufysSl7evkiKCFhv8kRTz8/rEjppAjGfrM/UXAk8lLByuYThZUGCCn+yCLcEeGkdcmD1FVorrrG//qm+dpyMY3XoOo+HUgA6MXqPsgQkV44DhtuJGN8ivVWg/2svZNdcKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUgqDT2z; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e18b65fbeso66730b3a.1;
        Tue, 08 Oct 2024 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728418914; x=1729023714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ypgle67Ewfjbh+G8tSPNEpIJi18q3EcYQ2MRF3FEmk=;
        b=PUgqDT2z82IL5fn8U82KvrnTOsdNQADZkxl70WhroXQkeBHS33YR8I9oIOExMiHPcr
         KRgeLlkz+k80gsBT6oD3CekjyKU0kYW/u9HWeulirtOA/ee2efKaRWFcOtTmGQOCkyQP
         X7Ce9ywb6Gfl7p6gyTMJnpmT8oFaLV5POFEHdOd9Fy6BB9Or5QtJPKs6zd0jfzsN2FP2
         uQnxBDmHyikSuDZ9RN3AJRewQe9z/hGXqLBdtN0LbmhGBy2u7G9FIvPkzpGp6Wovs1dg
         B93nB51Tr6kt2LGGeQivLyIP9U8qLDlOEBdTT2X8HuHszcVj+90b4p3RFJ1JHtapZumM
         VTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418914; x=1729023714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ypgle67Ewfjbh+G8tSPNEpIJi18q3EcYQ2MRF3FEmk=;
        b=O9iwf7Z7kIQZDY4OO6CUrylhyLG95l9NmXP+v9un2ftbaHgjxSkqsjmTzcO1NUYzB6
         xa1FPYt/2JS78k6MQvlAkNwdG6okTuhVukpc6ThIAnkPiSZjAtY73Bcri9T1Z+N2cQjh
         8kbthQURfloFaH8NFo/lWRoBOOKjjuv6TVzXpMzUoZtC8ouZWMGffgjasyQ69PyUvPlP
         XIoO2okKGg5b069KivQf0QYvdxk3bEq6AJXbadyDaCHhCyJI1hOYu2SIxeNeucR0gCAK
         YDdHGtRW4qS8UM1ryLO74ZS+dF4jGMhKol34RzUrDILc6o41o5ASkNyR1+6NmMLjCanW
         dH2w==
X-Forwarded-Encrypted: i=1; AJvYcCVFLirwsjbwYMWqz37uVbSK2qDDidSJnogaS0eKgU4xkXu9RHf/6XNYoLFpyzawx7rbFT+AfGetUl4wFl9qal4=@vger.kernel.org, AJvYcCVZiE6N9+Vp8/A5/yv2BAiA+SWkA2iXmwycVlFNWM4S+YCqu23d83/qRTGvNB9dwtmp/dCTkijBkDFyANkX@vger.kernel.org, AJvYcCWzY9RH9F5D8kZp6cbK98wFJA/rlVMPK5yItCGpSqAqrHg7Q0fcqmJ7H6hC1pgHjaZg6GsP/iWA6Le7kQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+xMRNWRAhZp7R92znlK7C0ZKcIf0jEUlg8aT4qgMAIE8/RY4
	d7NEm5F5heGrKXX7cQStUEs53sj9qlqUa47vEq2Z2uUWeMx+xh0RyLm/j3PShiOMm0MBQbglPC4
	e9kHjvY0RSVLeFJ9V7tVa75ALdyA=
X-Google-Smtp-Source: AGHT+IEFqEwsaHBUgMDUat7yLxNvezUcYRV4sVB9JZ+K4uqVqMW2kzbQYUpI6x+5pJzErmbbR1OdDajIOk/dxqAC2E0=
X-Received: by 2002:a05:6a20:9186:b0:1cf:37d4:c4f6 with SMTP id
 adf61e73a8af0-1d8a3c0d92dmr115464637.4.1728418913836; Tue, 08 Oct 2024
 13:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 22:21:41 +0200
Message-ID: <CANiq72=1SfOrpO4VnUK90-Or8POJdPotYbN322DihgU=BHgXhQ@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 7:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> diff --git a/rust/probe.rs b/rust/probe.rs
> new file mode 100644
> index 000000000000..bf024e394408
> --- /dev/null
> +++ b/rust/probe.rs
> @@ -0,0 +1,7 @@
> +//! Nearly empty file passed to rustc-option by Make.
> +//!
> +//! The no_core attribute is needed because rustc-option otherwise fails=
 due to
> +//! not being able to find the core part of the standard library.
> +
> +#![feature(no_core)]
> +#![no_core]

What I did in the GitHub issue was:

    echo '#![feature(no_core)]#![no_core]' | rustc ... -

to avoid a file just for this and so that things were closer (i.e. the
comment would be then in the `Makefile`).

Not sure what Masahiro prefers.

Cheers,
Miguel

