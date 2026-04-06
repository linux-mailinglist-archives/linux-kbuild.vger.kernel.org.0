Return-Path: <linux-kbuild+bounces-12694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFT9DevR02nGmgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12694-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 17:31:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECE3A4C15
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 17:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B48F3019123
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 15:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDFD26B764;
	Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz1Rh1Kc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE18258EDA
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489464; cv=none; b=U9/4aOdbgsACxWPo+f3d3nrI4B/n9NVMrt1uD/OuA6hGXnRGDLHYAoh5hDp6xrfojW0hreWvXY+RtmLXQmFaHEKBMu8vjTLiMs2CPbD806hgK0jgvS/C6/45C8iklegX8Ze9sa4CvAzBX4hAT2tIipzKKuvM+hL9R899SLB05nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489464; c=relaxed/simple;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuTA332HhwXlydruk2ARcwLgp804D1zPTMPgDKRYQObVQIWMlEfs1B4je3mLlEPvUE2Ag7wl9rYJ9wB3UD58e+Ol76Pdhk6uXDo6EDSdLkxeQrdpdFOjF6sVec85lVXBZ3Gb3MXV8thM9pX4sqgMv/eACVyt7Vwlz9QY+omdNEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz1Rh1Kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A772AC2BCB3
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489463;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nz1Rh1KcyfBmOA0LZp9VrJQ/BYnS/7p2hMbcFpEOG8VKVFYg/j1PW3qm3srSjHmhj
	 NJVicCHTHMtboyOwJZfRECfmpZ5+DFrT5FP9Eq2hAqwny42NV/4sFyqAv60tm5Vpm5
	 6Ysh0MMg/3FaRG+HKDHo2y5ur/2yw0A4IPAd76XczLyFWNM2d/7TgJS6u30KP/bCa8
	 F9YjZH9zPeObsU9M9MY95LohYIRNeRKABSzwk0/FtB0kEc1wkzDUCIIEkJmkx+CwfC
	 FDlZLKrTAnEzIGFXgaGZsXniT2zCMwavFBX811nBLGCCfEgBOi1seqO2oq0E37xZJN
	 yc+wjJttP9PNA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e0ef48ac0so2763591fa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 08:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVX27B7etmtA27xs3uOjUm/2NxY4O3kMfEzlBVeX03qL46+UZln730K+cSl2PwC7vDEcGJLC2vbfy4UxjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69pbnPrYhmFzwOzz0VTiKtOMg5u7ntlajB8sSfBA0P8yIPdyW
	KKYT1Vz8iZkT8/XJJphdPx8WTDlMzazwrB6s7dGDJxRA05DJAaYl3D01z2+jDml4WBhpTB4EmQg
	EFaBnhs0rib/+4MNTOZPe8zVJdPQuHoA=
X-Received: by 2002:a2e:80d3:0:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38d91c092bamr32802941fa.27.1775489462303; Mon, 06 Apr 2026
 08:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
In-Reply-To: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 6 Apr 2026 11:30:26 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
X-Gm-Features: AQROBzB1MuYM_2_U32IZvjJjOPHSscckixukkJGDNua3mGMOgh49W4AabPzp8YM
Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12694-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3ECE3A4C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 10:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> >
> > Could you add a reference to the upstream bug report [0] here?
>
> Of course, thanks for the tags!

You're welcome! Actually it seems the lint was already improved
upstream, starting with 1.90.0.

Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

