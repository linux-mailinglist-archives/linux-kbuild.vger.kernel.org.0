Return-Path: <linux-kbuild+bounces-13761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TfUBEEtTMWpXgwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13761-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 15:44:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A84296900D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 15:44:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=K2Q+j1JM;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13761-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13761-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F57D30464A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 13:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470C1328267;
	Tue, 16 Jun 2026 13:41:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC9322A1C
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 13:41:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617318; cv=pass; b=qBaARZcEHFLNc09WfwDgekPy3AcA+qmKx1oRnmaKNAgD7LaM1T3QAf8jRa07WByXoEcm0r3iG9n/4WzqMbzwpv5Seju4sjK7Vus6A3jdj09Q8sderdPQNwoOqGrCAEXkln0WHm4BRhKCFnw8QJvwNyafXX7l8JcNuH8tQQUxJhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617318; c=relaxed/simple;
	bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVPs6oh021eD57RrICFBsWCSO1P/oE/MzVb+BUtTTn3Czq16ZD3qPHkSnfYAX2cGlqIP01zS52nqstPXqrAceMrCCn8JOHoVXqkbr7vC2+N1bpzevjPMWkEB4gN2/tbUCfUXPOsMU/gAstT6+4zLsVBpwBu4gjijqNnRVIN+uJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K2Q+j1JM; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e83724bfso6228010eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 06:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781617316; cv=none;
        d=google.com; s=arc-20240605;
        b=RqZA4GOHdmkyHPULqxREH/wfF9WCLCuSCEp1seW+x3cHCgBtIRWgMqVvtiG9Kf1+qv
         APw5VZwh3CS9PUz6Wit7isim5Nx1sRIqhXpsji34aRXQLPcXxTOC+Kcja4HreueXa7B7
         2/ZIS6butNRafi6R7pSM12/9EmnsWheF0lgDEcOWxQ/bwlTqBR7f84QB9xknU8WnDa6c
         z57M0IcpMpx7Hw6a1m90nz00Vy3bP6uzayNyWknENQq/RAgd+k3XY/W9radhVdUGrW2B
         z568FM3piYVGUlRzMJn0j4bVX4kdHjYBuCNKW8ziWjsheD6dTYcVx7hn744BaH+lqR1F
         +BKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        fh=LUBWrpJ8e5XZsTgSaWCPZaXmglazuHGRRw4BYE6QJVs=;
        b=imleYeYp22zsp04b2ZX87e8Kk25imL6+wRIGF4rOM3YItQs09xUN1/kmXYQl4rIO7C
         TKbN4c0RKmud2MY9tQZgVx/1wCKrPgLZZlzAiI+WaFc6bKCZ+jQr5/LDvncyHzVzcxtH
         qfjyf237QtgJNjr2pXkWALwGBe8gNjzUOIS657vcRI2xK7sSRiLlGGaKw7rwdF8V02kK
         qPIHU1W09DFgsDfw2PdzouLm71GiK+qOf+HFcP9jwVXUP8SQWZznQBZHtk0sIgG+xFI8
         CdQb2elahkBQY8B49VbjWo5YMafmCjBRSpwtwndb8uo4XhOKZFGxUg3Ak9jxJv37gULo
         FHDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781617316; x=1782222116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=K2Q+j1JMuaxoREgOUgS8GYQH4awesNrOGFD2kDr5VhE4EJ6f102/Kd6Isq+HOUqyJj
         P1FGn8/c+n5kN7nuwGgHfVMQuDHvsakIHyJP2N0s9MTyKXmeY3+Hz4XCIV98KLjcerb4
         3StdVgW6tgATcyuO0XXy4EtzDzdk80PIrJfRG4ZMOhT64IPQ/9ly1T+hiUTkoPR5ypSF
         z4OOgyR+lDDsKGppg7SMJq6f/sd79WBFLvZnllhgxUNiLSHb7s3XKm1PmFqj+cj203+5
         RSm5WHahrxiU7CFax10/TDMKbsc2YxSqzDBS5TpJ+pHW5xMZOugYKgjTnzmAonX8f0FN
         cSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617316; x=1782222116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vFyIEqeIs5fuKpAzuSBPV4fQXXxeTn0cFHGy9OT1450=;
        b=FDqRrSCpT8L5N4zGUsfCpLW5FDgwH87PoValxZGdbMQCNIQoxOiSIIyr5nHg+1vY4W
         IA02mHe7T66DDkpDfryPruRUhmgKF4x3kUkR67vjwKckEcRAwhOsMnwTEMnaKsa/v4+9
         SCwNTBFno20DMHVEt10HhR2JEwywpHZb51ZtcDiL1GTfMQHl1CFv0v8RNf99k2sNSeDP
         2d7BTNEXNKLSh2vdhpdMZa6E10i9sAUVZe83gxYIIRmI4VamKjbrCIbYhgI0hXhwWoTg
         c46xIN11MYXOmrV7+alcoKW9paiIY3uDDZctMVY7Tp/yYjLFwF/s5IVkPHdz8fa/Fugl
         TaEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YQWZb68mBZScP2YCLR/lBPZd7bROXYDrHwE4kbjfKt/RrTmcUdrY4US0AJbk7+nit/lpmNhiHfmmVccI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXx095aZfGb2cLZuhQHdzP5qIV8+IxUsANLJKUSacYJ3Wvzma+
	yh1RDYcMBmLg5XTC2WhcmoiBFMgYMSTr1Q5NjTEqN75oNeRH5A7ntbLxA91vBbvdR2WjiSIsazQ
	jkOEa7BpCD2uEBdIOoPt/F8+kpIx3PVoEOSs8uf46
X-Gm-Gg: Acq92OEBLSNyr/KRzmhbCRdBxloLUHlBEGIAl9DEyVJdujApOlowmYJ4N1LX5Xzrbya
	BqQhvr/jis7JuXiNvcga3Sw3bmC3chnrluatRjTcfm6S9nep5QdKQ9rHUGgVQg0LSxKomG1NPoi
	5+CsMth6KsfXboWm+sVtnxHtN5Cx6MAGOYLZh/6neqlbf41P31iuIPlrTyY2PNZnY29OscxU6Lp
	qaV0O8xcny5iS2wEGHpB3QlcP8R2+p/RQlO37NpBJW0O7q++mOC0UYU+xZ0uzj2zKEqsy/rTRBW
	8cpkP3+3EwLEA8Jdvq9v8AibLRpTDyv88sC3PH/L5YfiyxdY0+zVC6cPcLWa7MTAIVnXuZntnDu
	GtJ8L
X-Received: by 2002:a05:7300:8609:b0:2f5:5907:3a48 with SMTP id
 5a478bee46e88-30ba596d056mr2231147eec.1.1781617315522; Tue, 16 Jun 2026
 06:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com> <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
In-Reply-To: <CANiq72kek9NoFe2PCFnND1p6BRbuzgv6kT2o5jw09sWg+wau_Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jun 2026 15:41:41 +0200
X-Gm-Features: AVVi8Cd0shxPdtGfFX62VGFf_4e2WR3Zgq27GdoB5xnmwoEa6aUwuGjBmlMVQhg
Message-ID: <CAH5fLgjqVxoBVdoSG40vE2uqybeC3zvgi7T_fTA1=HwFY010Hw@mail.gmail.com>
Subject: Re: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Douglas Su <d0u9.su@outlook.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:d0u9.su@outlook.com,m:alex.gaynor@gmail.com,m:me@kloenk.dev,m:thesven73@gmail.com,m:kees@kernel.org,m:wedsonaf@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:stable@kernel.org,m:miguelojedasandonis@gmail.com,m:nickdesaulniers@gmail.com,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-13761-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,gmail.com,google.com,outlook.com,kloenk.dev,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A84296900D9

On Tue, Jun 16, 2026 at 3:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 16, 2026 at 2:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Cc: stable@kernel.org
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
>
> For 6.1.y, we use Rust 1.62.0, so we don't have `-Zllvm_module_flag`,
> so we cannot go that far back. I guess we will need to accept the
> issue there.
>
> For 6.6.y, we use Rust 1.73.0, so we don't have it either.
>
> For 6.12.y onward, we support Rust 1.78.0, so it is fine --
> `-Zllvm_module_flag` got added in Rust 1.76.0.
>
> In both 6.1.y and 6.6.y, we also don't have `rustc-min-version`,
> because the version is pinned there. That part happens to work,
> though, just due to how lax Make is... However, if the flag had been
> available, then we should probably still do it cleanly with a custom
> patch to avoid confusion.
>
> So I will instead do:
>
> Cc: stable@vger.kernel.org # 6.12.y and later (flag not available in
> pinned Rust in older LTSs).

Ah, I didn't know it was so new. That makes sense, thanks.

Alice

