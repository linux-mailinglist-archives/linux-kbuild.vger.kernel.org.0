Return-Path: <linux-kbuild+bounces-12645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mf8FjHt0mlBcQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12645-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:16:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D93A0276
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13B7130073E4
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3706F3845AD;
	Sun,  5 Apr 2026 23:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgPU9FAH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C1383C99
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 23:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775430955; cv=pass; b=TEwRnI43NWcQEQv9BaTsuki9/muOYhhoGBsNgmt1qXc8DAsSWGvH+OQlh1g9p7oO7ifWEGabYvVI1hGj74Bq0vWslVAymZl2LA6fZYMtzbrQYcVaOS6tsNe9pnE+2+HIwLlczozTmXkEeLtj/1Uf00btMsMHCOXTa0SmMRMBIrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775430955; c=relaxed/simple;
	bh=DuXfeYCW4QOQ/5cD3aG7nz3kn7r2sbXuLr+omP2BF5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsNUqP7tGJfkuA//WlRcVJQo3w+1QxEE8fmtQHm0JNOXKwwFZl44rmTQUtc0rM0TFqe8CE4/Ssv5qgNmzULLNumcGNHoPJ4/7Pfm4ToW72c4IT9vp1Y/q/djmy4pVIkBcJssatqJfqVzWfHkWoEvw/sRRrFbO1RIYpj9aRzjxo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgPU9FAH; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd801b40dbso273769eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=S1SSZ3CEfb11h4QYqrk0I9jee/xlkjiD7bx+fHJUhBn5J+O2C9F4OmA2krf7bfWnEb
         3T94kxMIa4Kivq5iZ4yNzZFikcv9kMccV/WFp2AepcjUtF5GBla+f0JZNYlhWfqxW9OM
         hsxqKIB8DK6FRFMdFqygtr2iGbHz9fOyQW9hy4uTfiG4EAJSFRRoNOseCs3kL5dEcbVQ
         tJ1B5lpdBQ+MQLIbhqy6hsrJwCIqiPAdSm4N41xFOy1IzJHRuWdb9p5jElCNxdZdkgkn
         fCpM6vwqa/kWW34l1yDvCPAwbUgEDL0+LwYpgFKFm6ObPYbfcX6Mk6bTrA0htgb8nW4B
         6kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=JKsyfC8M3ptFZ0oWZsFxKWV56wsEOyxZZRywZas4/Dg=;
        b=hWnDp0UzA0+VbiuFqDKMm6GCvDH/z7Eu4WVqxLy3tBb9PbgO1xYokvHy5fp4TtCnLv
         V+saoS4/AvkLgjbB/k+tSdOXtjsdcv3Z4szGZrQLZesLoVTaFImZqdmFX7XZQiIolj5b
         4rc6f2TKQVktwhBguWrztwt0agJqnfefRQ2rs8NezDxVhYbPiesyJdc7nIafBTkx+YUF
         eBB/39iB0TtdLVSxzK2tpqnXYtRaDjK/wzonOzlHx1co1uLNd+zLh2EIZEzZPAHn6aUG
         YrMBEWBXiBWCiIml35Vw4v0a37J6TOOC0v1kxoiilEmzf8v0pJOxTGCnk0+s+VgOopPk
         pk8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=BgPU9FAHd/0DkGlhrPlq+mpFnKR9NanttH63t5+ukkWgo5r8RO95uUTtwGBZKHEQwJ
         mStErKJb4FphO/b2ZSD/0WR/O+KkKxVJfDy3UeE2b1QtAHU8qWLxLd++b2mF7gvkf7Gz
         DWf7Xp/HFWYCIyuoLxxY7GaKfMM+x85lbUvItA2qG2SZXcaBwfimoBTBmCjGa41gMQfv
         9TFfzhiMWnVPAME2Go4HRHwQW+gUMJGk9H5LQGFHtyqTybD8Gss9bCdr7Mvt2zUQ08EA
         tseXLLJRLPrBlYCL0huRsKFFMe8T9ArJ8+fxn9217jpGlIoeoBdUX5p8aq5X8rQuLDfs
         j2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=qyt/ACeS1fw3W32gnwS4CbcB84JsQePpzqkY4q5zShAtLer/KgHmIjvlFtEzhgjP20
         lGafXuaMA2nc4/qDoW4+3Bfec3HnrpwkPxJCG0Rr+WhzEvOYQe60fiHxhEFN4DqRyr2b
         3VoSNeIZ2NdZizbAuXZtnU3Bpf3ytV6YF8qUVRF93aemLSqbIm21qFU72ijUUqXoyw0t
         xwiz/CJVsfbCzxi495NWZMKfY4c7Q82m7bKwuIekwtuUEaW5wTjQAeMmzzlNITwj23uL
         Zd2a84v26iUf5JKiEwHgD8KwunGsqczUUhwkgb07ck7XJkk45LSQNKk4ubMRbwQmXyhF
         dwMg==
X-Forwarded-Encrypted: i=1; AJvYcCVfVPzZRaivV+CIXGGLEUa245SNoQV2YgmLj6adUA6cJBlPL8fVhZwIIyfMISQZ8SIjZBaCeLZSNW/qOzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywos5ZcciK77TaBRpIyqQaI4jJXIqhtAxLHKXXoFcWV/2kuzBgq
	51uciPVkNwqgkgJpV1LlqgWGTe8oK9d3I0vzjesRMnx3Bhw3Azg80DZ2KEjAlowgF+iD5YAn8Dt
	J5wshovyTsgyZW+YbVgTV9Co58l9ymGg=
X-Gm-Gg: AeBDieuNi4zIao1PchA9Ctf+YOUBJ4Fvq2UhnfNOzSLKXpf92pA3e14WUdvolgyOK2K
	IwMseJ/n89LboEyA0hCZ1iLLpebK1eJPR/NRgzrFb6coLfrYY6NKS+rVdQPNdU1E6JDFnEXdQuk
	vhRAcmL2ae1u3Kq7c1L/jHxdTNgvqsvTHxHVNjiqWbTaf5/XD8bG2PVN8bUIYFfEW9U8hbNLurj
	juo552wSlCYEZdLwUmCnt6LymCQNewh0L1JEIMXpde1MlkVsiHQn9mEqVavs8HHBAWrzSqHHpez
	YXURt4HJjDyfEfC7tWqkbk7guL7OlW28i5KNMUZJIjw+4/AKkVLfcZ5WvpbpoqoMSwDsDvb0wxQ
	wsE6WP6sJlsNglvUOfcSBY6M=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12645-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1D9D93A0276
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think I would prefer moving these down.
>
> The current approach append the flags to all variables, which will cause =
the
> following equivalence to stop holding after the flag update.
>
> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>
> (Per version flags doesn't go before -O anymore, it comes after HOSTRUSTF=
LAGS).

[ For context for others, Sashiko reported the same and we also talked
about it in a Rust for Linux call. ]

I have been thinking about this, and about potential other ways to
achieve the same thing. I think the best at the moment is to move just
the `$(HOSTRUSTFLAGS)` below, but not the rest.

The reason is that it is closer to what we do with other user (kernel)
flags (e.g. arch flags come after the general ones). But I am
wondering if we should/could set all the user variables later in the
`Makefile` in general `HOST*FLAGS` later in the `Makefile`.

In fact, there is already a limitation with the host flags: `-Werror`,
i.e. that one gets appended later, and so users cannot override it.

This may be considered a bug, because commit 7ded7d37e5f5
("scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=3De for
hostprogs") says:

    While it is
    possible to avoid this behavior by passing HOSTCFLAGS=3D-w or
    HOSTCFLAGS=3D-Wno-error, it may not be the most intuitive for regular
    users not intimately familiar with Kbuild.

But passing `HOSTCFLAGS=3D-Wno-error` doesn't work, since it comes
earlier (`-w` does work, but because it turns off everything).

I am also a bit confused with:

    While this means there is a small portion of
    the build that does not have -Werror enabled (namely scripts/kconfig/*
    and scripts/basic/fixdep)

because it gets enabled in the build (I think it is referring to other
targets like the config ones).

Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
bigger changes (e.g. for more `HOST*` flags, appending it even later),
then we can do it afterwards.

Cheers,
Miguel

