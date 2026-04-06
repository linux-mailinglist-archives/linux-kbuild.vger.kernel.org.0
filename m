Return-Path: <linux-kbuild+bounces-12686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GSdM+N202nPiQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12686-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 11:03:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C653A26A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 11:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29D91300381F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 09:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA5E3128DF;
	Mon,  6 Apr 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIATw31B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA081EF09B
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466204; cv=pass; b=KQqqG9b8i4Q3pOXxrzvR3VwQmSGi0bqJjE1yV67yEDIpBKwGEtiIsL3dQMVLr6x7fBLmxT7zTBftFIOXn1WO6/sLF7f4TqR9l5Ac4wYjCGYpsCvJeJ37k2i9zReIB5CdySABEaj16HTc8uJW4jqEby3AD+tZOuodCnIQSWQ5OBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466204; c=relaxed/simple;
	bh=R2dHTJQnBLz14FBWbb+c8la9tQYirU1vpp38y1sgoA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnsYx/Sg9ttGwZac/BE/pVpXIXoe6gtlBEisgTBmx2cQErbuYPB1RXcBC9QH8titVp+K2Sw2wtXddrTncubCF2VlyoV0tvuMFdxCTLhsKZ+GgTySAMHd1aB8R97KwMnYQpGJcRt2dt2+2Vhjc3oY2ERV8lLebvalw00HFyxSF5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIATw31B; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so171493eec.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 02:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775466202; cv=none;
        d=google.com; s=arc-20240605;
        b=aVsYf/zH2bjq0eplX1Z9uNB8b436AwbpAWqcTunS7Vv0f/JhBvg2zWKfT5GOn4RgIs
         A/GpAHp3u6w7Xx9Vc0LOzUFdH4M49JWhDjdK6dwpvtIdmIhYWU3QOR1nB/Fth1M8IrTW
         fMMC1nttoYxSmBxAHWIDXftFYk6weI6twuNobTJeRbphk2W6W66YqOtcZ3+yIZVvDcVw
         uK+NJ45MFrhV5DzcbUHk8mPlEXNNnv4990JtYRd322gYdwSfjT7r8TtSzbIiyEBM/j/L
         Hi6DMsHW5HcYBHy0aFKG1xGqp4V3iP9IE2cktKx1A59kBipgmKfMZENRSN0+r80p2yi2
         fw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        fh=F1rhzioTh9t/c+Dags0MxlEKx+Uf2XQCejAL41wSSss=;
        b=leq7V27svtMAkJ9BQz10K8OZI9qIgbu7l+slzx9hVcItXZMoxoyVAvbz4xy57zv75c
         Yzn1W1UusSBQ94JOiiL6qR7E8je4Qe7ptuHwZWeEac/B/xufqyEYkNZIgCJsqaCMai/z
         QpuzbygAJLOU9FOxe/X3komtjJ3tp3E0/xKa0mOOjrxplH8Wxn7aAa06kzYkKui0uP9m
         75JnpFzSgh0DzHnszGjr//TqwNfpK6I17RdATSxGKsJ1fan98aigz7G1rtAs3y2FxyVH
         gVuBmszI+eTPz76TacZjFaJMP41dES70OPoagjH37xtsTIpwcal+CB4gs75BcXHH0Fch
         MNfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466202; x=1776071002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=PIATw31Bk+3hkggZjJ21LYlWRCEdonuXrhStaxjfpeEy+RZoMphpX1G6fDXJDfirK0
         Lcix84JqgjmxFvtJfqRfPYEpHGb1ZhF83nIFw3O8IG8D1d9G4/P2un8SlPIrkQlKDQvS
         kAjTgHjN9voZ48IaKsTLutwUAdxm01rYT/4srX8EaIwQURRnjXuJteiO0uary5DO+b1y
         eIHYD5+mctWtaH77V7OyvOW7r4QVs3CY/XzcE6cCxPuvfHIp2DtxiKgzIF0EMRv1ON+k
         6WsWVXYwGXy8FB5vlCj+jWDIFXrgcqNUpc1z7vi6MIUB1fjeeM+HBhDZVaiEGtXGmhmh
         Zktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466202; x=1776071002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVamUPJfkbP2PYNa14ddDsteyLquBt95MrPlozlxwT4=;
        b=hnldJoMkSB7adXdd8Y8ZlPpcGEYZchlUNSL25Mc0H5Kvm48vGUJjx+rKocKg19yxbL
         ig/Ev2s0DLm7NygjWE+AAlqVi8L7b4Cf2Xhje4OwDcQDldW3Yw9vmV2hFFgYbA4gMDy8
         bmttK8jVd254hkKF+dEGpY91MgF5jy/EHL0c/C/fT6olcFVN2TK9ekBB4eNbXpVB16dZ
         6xKqjvCflRKoZYTGK32abs5FB7WYzhGVl+MRi973V7cr02fW8wPKNr9nROI5UrIfNQIN
         beqHMrvfcJCgqLYv4s088KrfPScPZat+1+4qZNOAej/f10h8a8e7H4HGgRKNQG678sM8
         wq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv7btSXeUXP2AIaF/1jhk4cfDYnuq1Qwh/9SxZxaedKVPno+USuZ4eO7b2gSA/NYRFS+twu616w+Yz+dY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6HuFwEVeJZkSBiGkGaC4/PVDnwnaG5ULBOAVlcgUWwSm7rc/
	EJNP2T/vdYTcFyLzeo6b1ND6XE4ql7PKOxF+nXEbJsjzCDDfysctK7aTMAaubNu/KdUKSxgfTn/
	1wGkqk6VS2UXPbOgWk05kSS2Dwgt9UDE=
X-Gm-Gg: AeBDievVrzyuMrRkxNIpdx0el7h9n+Sj/4xUYzqrMezq3o7/YdcOUQRoFfyCND2CYZU
	8De1Rd5ORjh8ATrnJgrYhIXFoCOVm/xdYaTuv4J4gs4kBji2GA223af1WGHfjdxVh2+cmvTmT3s
	hRwZmz8H/HISd6bbaYWsH8wZ+wjSaODL9J6ZM793YShMWzeviAWDf24YvgqRWjiL/dnolOjXPXO
	+KxtqrHAN5T3tQJ9yKgbEhWLZjY8bQsdcyA2pF4Pbz6phbQdTXpdf3v44ndjVlYn+0dLFiEo+51
	rV9CAr7SbLSzna4a6cC8IjggFkPCThleozFU7KjLnIGn6SjY5OKxWX4qLZW1MEYVDe/ThXzHQr1
	M7ZjOX9+w19qycv8mrilK98I=
X-Received: by 2002:a05:7300:2315:b0:2c4:76a3:bdfc with SMTP id
 5a478bee46e88-2cbf6897126mr2280931eec.0.1775466202269; Mon, 06 Apr 2026
 02:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 11:03:08 +0200
X-Gm-Features: AQROBzDwpcCEtASRfptsJ0WJ2jdyaJlOCl6SPsL-e-w0TnWmNnUbHOjTvtft1Wo
Message-ID: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12686-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 25C653A26A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 1:53=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie was released with `bindgen` 0.71.1, which it also still
> uses to this day [4].
>
> Debian Trixie's release happened on 2025-08-09 [5], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new versions, i.e.
>
>   - Rust: 1.78.0 -> 1.85.0
>   - bindgen: 0.65.1 -> 0.71.1
>
> There are a few main parts to the series, in this order:
>
>   - A few cleanups that can be performed before the bumps.
>   - The Rust bump (and its cleanups).
>   - The `bindgen` bump (and its cleanups).
>   - Documentation updates.
>   - The `cfi_encoding` patch, added here, which needs the bump.
>   - The per-version flags support and a Clippy cleanup on top.
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://packages.debian.org/trixie/bindgen [4]
> Link: https://www.debian.org/releases/trixie/ [5]

Applied series to `rust-next` -- thanks everyone!

Let's see if we find any issue in -next.

(If someone wants to give tags today, then I am happy to pick them up)

Cheers,
Miguel

