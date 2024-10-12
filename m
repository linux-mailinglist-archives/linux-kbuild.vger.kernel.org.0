Return-Path: <linux-kbuild+bounces-4074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FA99B7B5
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Oct 2024 01:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5BADB20CE2
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 23:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370C5126C15;
	Sat, 12 Oct 2024 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPmNqT+E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5E479B8E;
	Sat, 12 Oct 2024 23:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728776270; cv=none; b=QGwXTqCEuOOuO1z/8lngXHBT+ySorKSrhpTjr5MuIq0i9vPpCZDn1O4pwOSoGSG0Z5vFGcS9nkdxQlyA7AGkKB1pxn6dYwxGIYCUq7QMqz8zEG+QklPWfSZzOPovdl+MHbcBQlvKxuXG6SJgUcObH24cpLp6w0iBjqad73NKQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728776270; c=relaxed/simple;
	bh=5w7n5i8kdPmFGjMhidcIe4cdNLqiRbV10cl9HtqaYcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2Ajgyq3y0grU/XPaQ1HySEVIsZ3lWidfNr1SZaBpdMrZDXQMmcEsKvs84cmEyWMIVSDtkIHi1Me9IkDTcZ7yIeF2zGDjnXa+NexmMQeE2MZNstDiW2T4Tsou0+uXf0EWcjnAmW4E8wqiLMNTSwFutmEWFAKmhMZmAxOUlblRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPmNqT+E; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71dec222033so356746b3a.0;
        Sat, 12 Oct 2024 16:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728776268; x=1729381068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w7n5i8kdPmFGjMhidcIe4cdNLqiRbV10cl9HtqaYcA=;
        b=YPmNqT+EZ0tKeYVCLvMLLjbhQa0k3u+DDkvMtDin2ZyMOXvLvzx/iDrAXCcfk0unBo
         O8DijXsqG1y5tSGgq4EHBjaN3+2FD8H6OD9505IBAZ+HsD08JuFSrs3BPan35XpC8Svl
         blOP/Fd9apFFYjGEIZuzgPtTPm4uc+u7KfOVIVlvR/wfme+q7RcNZGeVCcBsleN5sx9e
         u7psYsPW1p7G4womztxrY3yXZmR2ccwolrr0OlNrhlLp8gFXFyO4U6PVqrIic52F3brX
         Tw/qvw3VgL9qX2y44H6Tku0HERxO3DN9F5GpVuPEVKdSHL8UXNUu0eTc3BHzB4CJJRy/
         MTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728776268; x=1729381068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w7n5i8kdPmFGjMhidcIe4cdNLqiRbV10cl9HtqaYcA=;
        b=XCRIAdU6jd5tiYuKfucajHcRbQV9klzaRNcEhpJ3VWiJAYaDnqH2NHxgNF3GukWVb+
         EslcF8KyBaNCbSW+pu1m1kOfi5t8Q7uQcY8zO50giq0o1wWksnXyrHNRMIUP+vXUNByZ
         9InoaEKKqnyUv+vGiEICPOdGEJeF27+GJVNbDEbqeujAdX/QdvxdsJ9C3dHsZ4+vVT66
         e1casYSnfGTCjphNhRkvodHHqoUL4LkwKznIA5MWFQPSBZ70jpHpZzREcyGZljVFqXdU
         F0yELlk7HiwZuLbQvqEc8Kkb9sML9GH7QHPRg05Ppy0Tp/zD9DuDEAZ7ug4VfEkjSVjD
         CyRg==
X-Forwarded-Encrypted: i=1; AJvYcCWn5oy8KmlrBqmDobz2dwW4ICHcQzJ2x7yHPwqmWyAinjA/L9N+9tvNgNf12SazoCtDh9bRdSZiY5iL1Wun@vger.kernel.org, AJvYcCX9umRnOHo/dUf+skzZ0Ee3S4NeWfjW/hZafaWY0PUFTV29gzLwTlR53LTWqlkai46YsiQIktCGKjxwsTc=@vger.kernel.org, AJvYcCXMYrzzd8ioRqZLzXdPEl0ZUw/5fKyYgNyRPBE+3d9gMoKy70qSCgBFBk5gUuPTEn98A6Laq9Ser62V0L+f9Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXKcG+p+hVgDRIfOBqkJFgZvPakMzF9VTY566dJISE9dk2Eti
	KqKAObKYiZYaO37JLAt4aHfKrT1bo+6TdIbnHb3CHMhmepgKDZ43sFJqW0kxVaj3Ib8gZ+QI4Bm
	HCCQtsbfkzNMyZV/TSGd28yDdwQM=
X-Google-Smtp-Source: AGHT+IHVaqqLABZ8U1dA0Wj2kgbXRNh2oWknrS6iBj2uTd0lN/mg27x6VrojgZ9e7SuJIEF1ePjneDBw780te2uFDik=
X-Received: by 2002:a05:6a00:3cc8:b0:71e:5e9a:2db with SMTP id
 d2e1a72fcca58-71e5e9a06e7mr65888b3a.6.1728776267911; Sat, 12 Oct 2024
 16:37:47 -0700 (PDT)
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
In-Reply-To: <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Oct 2024 01:37:35 +0200
Message-ID: <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Sat, Oct 12, 2024 at 4:25=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> In order for this to be reasonably maintainable we'd want the variable
> to be something like DYLIB_SUFFIX so that we don't have to revisit this
> if macros are ever provided by more than one crate (or worse, have to
> provide N variables).

That is reasonable, and in this it is probably the right approach
since the complexity is similar, but I wanted to clarify that, in the
kernel, revisiting is fine and expected (features are generally not
added if they are not used or expected to be used very soon, so
revisiting to add a more complex feature later is the normal
approach).

But before we do that, is there a way to force `rustc` to load current
name (or trick it to do so, say, with a symlink)? i.e. can it be
reasonably done out-of-tree without changes to the filename?

Thanks!

Cheers,
Miguel

