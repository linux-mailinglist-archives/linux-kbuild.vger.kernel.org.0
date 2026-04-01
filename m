Return-Path: <linux-kbuild+bounces-12510-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKTRCRISzWmMZwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12510-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:39:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B641637A913
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6EF530224F3
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 12:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF6940629A;
	Wed,  1 Apr 2026 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty6k57Rd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D5406281
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047142; cv=pass; b=oCID+qn8C5RmVLOpXm8WCIivFPM3wVezkjmlBftB+Rn2f2p94I85PNElRHERw2OL8DZpYu2FFe4145fBRkD2er5EOsG8c4NtSGLpUEZLEYhCvdiqLvmMAtNNxJJrCvCsNAtHCps4ryeOSBLTfJ/+Xt1kZBdrNAfzQNgTa62PJzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047142; c=relaxed/simple;
	bh=GodnwCNRPwhTIOZcCkQ43DAq+lvsz0DfYPnKri1+5dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL/IrveRGk87qfvSHibVUMGtcEEYJTCCR8Y6oHgEroPTXtQYkQvmiUHL//6GUq4VNtQeHRSWPWVcbD56K5Cq51H8IWMpQ3MhpL1XoIXUxawvCZFHAaS/JvivlFQUbaIi/oqji6r8A5qkXnpO9QjtfMfeMIOlsili/8VhFWYN8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty6k57Rd; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd5658b901so279405eec.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=ArFlCAXuofUyzbzGoNygBmwQ4ZY/x9vT0qx2IotrJsKKAcIE42pNWLpDfc44GbXtpl
         hljXydaYCpPFsIr42AQAg/e6F89xcYN6BGYeLEUuTJN5EpyWBWECQ7rDPWVxh8Vaobus
         F5D5+DoSBeO6CBirQrcVRlu4tERl/EW0qbbA83uWeccNq+ViFl3h9YNQwKoIiVRRM2Ph
         pCq2qgY1BFM1HlzbCZ9phkGkhbWXSKYgLH5mZtXq3paihm9tmk0SLYVDiXuVz0xaNepR
         M6CDFdo4o4FpIbZgYSPdNdLv8iRhcHKvXz/aEGta/GDC505VU9knrRneVbz9eIPgtYR0
         p6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=ie/FyGBz8eD2Mjft5o03MHwvx9fw2W7Kt4MM3VILIcI=;
        b=WlTENY8KmEjgBMvO4ZJSdojwclPtjA9lhhkf7nhFJVPw3liIAPexFgM1t9jMYhxncN
         lxVjMpnPi/6HjcGBu0pI6tU6XhRf65/gHzWhCj2lilGLlIbmNCBavSoyVEN4lLOplFew
         1dOuoPaIl85pZmZpf5f0tchmCZivVcukjSIyB6ZjHIvfX1BV+kjplPnibnv8CB3ROcL9
         kIP25rsqt6/s52LX3ngt4zNboIHz0d04fbWVrQXKphfCPNwCIcLkJV3QB8fB4nkvbhuo
         UuXTzvyDLXDxjtDYXog6U0onznAEyO21CSc0/+8Mswam4+QA9GHOkqtp95wGv3RQEj6A
         vn1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=Ty6k57Rd2b/j+l5SXT6wVtwVPCofZk6GKODuiID9Bw3DAg+mRwi7ZLqWyKUaY/F6YM
         NoA7tYlp7e7vj9yvAAnK6JUUKVsZuGQEDRy8Kk2VcKRM15hwDVNvDqKKYiugVNhP4Th3
         MM6AG71UacD6q+z9Z9DjlpZT+7Ferlmc4ZwbnQECzBSFC2yCpWCehJBygWufqD+E7Kmp
         19yTa2FPCd+7wB1vpq0YLo0qRK3jOFfh8n4m05FM9+fPCmmEHS0UYOorDiu2exuQrqzT
         UAmbuxKEi6TdpLW0Zn5cDAA8H4L2qKGzbxHskdXbg+o92URUDiHxvCoGu1tBMM7aXg0t
         EqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=Jvl7Iu39RmnIbCYStCMIXf76tVW7CKxq+Psrz3xk39XQ72rrxaiFi33E2NkaReBTBy
         6/E0Mhu89JvNs5yvBz6uNzJnMfskK+q+jnOdWnn4wXEvriisguIsaL9t0f21XBrPQZYO
         Sunu4+vnOV2hbJgUJbo/aLR6S9bxCt2TQtOk6ZXpZ6psNAwGm/JyPHR3/lqlUpuGpM2b
         r53XYV7CjIJG/B8Q25eOI/gKLeaL410o09WUQleFjg6zw8FlsArSb4fnK/lOIp5HvsNQ
         S4pX5+91RjBdjpx9IUuucDo/t+4MLBAKDUK6ztp9H1Z6DjPAsgTnOLYyRwbpxuugX2Y1
         hP0g==
X-Forwarded-Encrypted: i=1; AJvYcCVeojUyZFkzGvRGg7wbIU9/CdQL8vpbd0B9EVLekjZ3MY7uJ0A/rIXdJd2pGXtfywRI86hyQ+fSKvcfVAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz53fgSUx2yz+Ei6vkMCJNpOSIxNiCWcCisdoP4vqg9uIEbNwjv
	DPn5FleLnrAngili4KI9qNbGgrGWkkMOz8qALeMWJMveV1u+kvtb0QJ2eEf8Jy1nA48fAMLQReF
	o1Vvoj/ioX4yjMr7Ko7dxOnBx/j4wSm8=
X-Gm-Gg: ATEYQzwacnxjIVIfQJHKuKZMrSreFHhVNAf5V9HXko6eop9g9vgi7UwhtHRZuPXkFyi
	QS3Af9cfLHGNQZ+bhgHTk5CY9m/c+rKauLfkdRhrh8gNk1ZDzm3NLKN0Wy3WokLL4Q9ie5JlhkT
	VHv2mkcF2f4pXWDvFpp+0EfrHHpGLNCtLg/QGt0PUwfhsOASDGyzzRGl2Yt5b0dKki0sNDYjOQb
	XDXoN+IHD9EzQbTRd8YtWM+6NtNb2q4D/3BDk5n5GLWcGI1iouUodUytigDKcV5u62Yc8Y7RRbl
	zw2Iiob8+dj5qHOdNDGJ0e8+fBygbsC5zTIlvp8Hzu00yphheePwF5wyluliSmijCSz1C23AElr
	a9PwE7mcXhn5xJaBk+eSnRNA=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	NoisyCoil <noisycoil@disroot.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12510-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B641637A913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 2:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Debian really *should* pick up 1.85.1. It contains bugfixes serious
> enough that the Rust team decided it was reasonble to release a point
> release.

I asked them about their policy yesterday here:

  https://lore.kernel.org/rust-for-linux/20260331190053.482607-1-ojeda@kern=
el.org/

Perhaps they just prefer to apply patches on top.

The issue linked above is the only one I noticed so far, and it is
quite specific.

Anyway, it is up to them.

Cheers,
Miguel

