Return-Path: <linux-kbuild+bounces-5487-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462CA11782
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 03:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18103A0528
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 02:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F82A22DF9F;
	Wed, 15 Jan 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBIcCM6+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E11E32BF;
	Wed, 15 Jan 2025 02:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736909767; cv=none; b=hJDEZGSVvQ/BBGibvJBWACyunRrF209snMGtAohZJP96tt2l5z6hPhCTfgZBXRQJiIerxLWOtKTIYOZNQBXZsryyto4H1JJYjtcWp1cb3aUlFzgHaobuQfXMQKW50gFNyJe3ZH/hd6vjcL+f4ei6SG2zAffNUfKEofDBWQzEbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736909767; c=relaxed/simple;
	bh=b1D/84dPUMBe220vbJMcnbOIxZdg5O2ChLT4aFfY+yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTgrsAY2vKiZZ4xoDqMt2D98GZ8QqWM6sbV7VbxfW1BGICh9VC/tTFLhlx74NKCGba/GnRLCSetq2NTNw3KS+eEtpf9YqKtWv6LRIiCZYby1hOzAJ5WF4P4NLF8H0Ha2hajyi/CktbSb1IN90zkUJ1hXzurSoCoVJhAhh3LTEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBIcCM6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6714FC4CEE6;
	Wed, 15 Jan 2025 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736909766;
	bh=b1D/84dPUMBe220vbJMcnbOIxZdg5O2ChLT4aFfY+yc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OBIcCM6+oaj9KLFplmpEVD4/80cRA4OiBp60v5IR1D2yZdu6vRQDYKHyiMzsgHC4k
	 YTgZK+NA4FbtOPvII3WPpCyzavbKX/JzEQrNWPACH3R9zbwi80g07Id8LzXSqZI0qA
	 XeDCakto21NyxW8mc/Ah4kPWbN44ex8yuduxX0x/LfxndTlse8h0iZpnRAkc4dxkdD
	 M7zlLdmNJyjXqoDN6up1g19XFCURZKaTDTxLEZnGFEwkH2jVfMBjKIUVYW6d80oZvv
	 n61q0Jsk7359sqdPxgIsACW4h/VdvsQxALh1gUCIPjnTm00vDBBeh6j9fvinhdXP/2
	 SrmkfrlI5Pa1g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30225b2586cso3920951fa.0;
        Tue, 14 Jan 2025 18:56:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlV8MLOV77vL53tFmdvxGOdPpWK0wWTcOgbMCB0AajGsXtyyXL8nsiJ+f2hbBKj+Lb+X8pkK8BoIQ=@vger.kernel.org, AJvYcCW68GpsJWtFyhtF4kg6xLeo+L44lvC5okRUSYHToNXZvbFqRquXaBUn52iD5moD4iVUz/i7wtT+CJm9T9ji@vger.kernel.org, AJvYcCWChq43Hu935/3Qa3IN7eVwEQJzyAtutsJLRkh0cNuGoUG7CCheGRziKLlVuE1rzDL6PXHPTc1hMOPn+dCo@vger.kernel.org, AJvYcCXukr13lNYbRq3Qyf4kRwnXszxicUHt0Xbmd3b0oux4+m3E6jNKVyGCkAu/XoWSywIaVwmepozQD2e7MeZ5xTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmdD9yUfX6bMr6xQhZb+uw/Oc6hSuouqzE4cn/X9g/xhQhZ4If
	iBJWE+TXSHlc5YCgwB9VSPfbT/9UqOlQOu2KpM1nqoUUnbe39+zLkahJCEN4736MT1CkT0TlZeu
	TKHQvTgUO6r0MlPFCSu+Fjqep1MU=
X-Google-Smtp-Source: AGHT+IEbKF7/p4jXX2Y6c4kqW+fI5K4N8QYbyrqp8XXUV/YZnWVH3r/4hFyXitJa+p0igPBJC9MwYK7VAnxehvdzjSw=
X-Received: by 2002:a2e:a544:0:b0:302:4a8f:428b with SMTP id
 38308e7fff4ca-3063068737cmr2821231fa.15.1736909765029; Tue, 14 Jan 2025
 18:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CANiq72m+k07miKu=vHfp1-A+nu092R+khau5b95Ugq8M8sksFQ@mail.gmail.com>
In-Reply-To: <CANiq72m+k07miKu=vHfp1-A+nu092R+khau5b95Ugq8M8sksFQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 15 Jan 2025 11:55:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASXLdya8d2Cjo9H2j5J2d8ukj27aDNStqWEVbDQFgsP2w@mail.gmail.com>
X-Gm-Features: AbW1kvZlCoUAFxXw5sPs1DKJmHRvk0hzaEaGSs6dBB0CiAx9p8qI6YLajE6H3Tc
Message-ID: <CAK7LNASXLdya8d2Cjo9H2j5J2d8ukj27aDNStqWEVbDQFgsP2w@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, HONG Yifan <elsk@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:05=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Nov 12, 2024 at 7:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > To distinguish between the two, introduce this new variable to stand
> > out from KBUILD_HOSTLDFLAGS used to link other host progs.
>
> Applied to `rust-next` -- thanks everyone!
>
> Masahiro: if you wanted to pick this up through Kbuild or to give an
> Acked-by, please let me know!

Acked-by: Masahiro Yamada <masahiroy@kernel.org>

--=20
Best Regards
Masahiro Yamada

