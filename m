Return-Path: <linux-kbuild+bounces-13525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AWITHi8XH2qDfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13525-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:47:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E8630D20
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QDnaJ682;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13525-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13525-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5215B30DCF1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F03FF1C4;
	Tue,  2 Jun 2026 17:42:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EE93FD96D
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:42:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422158; cv=pass; b=EcrCsoHQPHX5nJPrUgcx05xv+KmOamUB3EUoVcTguBLOYHqAYlcvBKgKXdsTvMebMkRgiGe2FvmhIlz7+x235CwLKRwRxXIKbAjGhaqeF31wD9qM0yfQIIQBersn6staDY+csXvSgzGG2ZhWmDALrnc1QdZKNwNAlrBeOYOrclw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422158; c=relaxed/simple;
	bh=cB+FK6kf/Adz/pwPxhpxo1tvMZtjuqm0PddQaUVizx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVk31JScBomQx8JJOHj5e4U4KVkWMaDldeI0jzqWnqsAzwGb6V0pGu3h9dDvLji2sGg1PzWzL70HR3u8WykGxbXNBA/K+JRAlbGi9l9xlMSHIiXFH/0YNhQfI8JodWqgaHbVxJ/vKNCyJnO3Xptg7diOSLGklI8cweEv1bM/LLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDnaJ682; arc=pass smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304da3b4508so557676eec.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 10:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422156; cv=none;
        d=google.com; s=arc-20240605;
        b=PwsnImge2z0qEJDuFWvmdyVohD4sB155nEIJcM9vy+ArAtJZiq8fdB6KKtwT/M7Lt0
         dQwiFVP2UlNB2bpxFbn9YIIalg2de/Fj2jIBBnIeNyjHl+cE7V70hRUGMgN/nSSD4BdN
         9hI8YnglhULGZT16mXfvQW5rOZ6gAGTJzWxAFJF//Y+FzL6rVOZLvJVHGnblo6NVvaGC
         ZwQe8FmryQUewltUxioZm168er2FU6aA6gpMiiq/E2Wjfve7x42ybJNbf+4XTjhsZ7Xr
         rgyXDLWk+tfrYBAI+uJAvi7hEvCoanrbfRA+rAuFnIyZ9Y1N8Eo8UBu31H4F3Gnh5Q1J
         DDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        fh=IXPEXpK5UfmoxyDYm9Hnn7bi0T4CUpatMFm+UlbF7jo=;
        b=G2w2/NT5DMWn5z6oKmTk7Zf4A0tjJY3ryyB5G4XWNfMObVDS6Gn1irw9KgWhh5ky/9
         uM+ULhoY4ya02bAOA8sGJYjFQ4j/o1JBCLBZOJcvlglpSv5zVp/1C4h+SDyu4K4KbFTH
         WwMTet9OOTXhQOKgx4jkOMMDpCyuaJp3yRmeLTeh1BJEjYAjoZEvvfVaP+DrKA389kfE
         y+z8Ze/BUVXOyOEBLplzPjx23UW0o1sA/U5Sfym/wL4MrTjygk2ZBLcvsMUyLLs29G+B
         cwaS8YwMPh4iYZ6Yr6G648akXoeuDC7KpH8yDHL0pmqVJc6aRL3bzdWCWkYqxn9vCWBD
         Btng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422156; x=1781026956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        b=QDnaJ682bZcnU9pPeqHWONeVvTN/47bOXZ0na1m9DwslqpYr5lgJ7RRiIMzecD2qbq
         gfhhAUw73gh+hs06rB7BHQ/bI+GeSaTt2EHbV56iLtg5TdigNLDjI9jts6N17pR2DSgC
         bp+PaS4V9QmjmklL1VWWs4nhuPz5K3Hnc5FsDRWAy6kQw/KuU2+TclxV5Lc8Ff3t6K+w
         XSF+1X0+CLbRihX2PpbU46hDbQrekohYdqgm4SEvpw89daEo9lZqpStXQtFh1i+uXhzV
         /g4WDPXmvlDQUpOoMExGnCx/DpEVgVS7pQ1CoyWsOgkhF2ISvZHaqzZGX4d2qvmVwRIK
         wKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422156; x=1781026956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfDzhsnQd5soOg2P3CtPIPXAH3OnSFtIQ+tYBcVUhI0=;
        b=kv5aTjcEBqP7nPT92qkQHERQ52DQH+A8+LCI1p9khXL79q+0qGD/KlbJ4h7ObnLrNE
         +67kI6Yc1rrbq5LLti0M+qcOVR0/GxPTKdzS37Q84EaKtG9UbgaCYyvYcqFoxK+/ZSCz
         NptgUXs4pWHYfWGgYZT3fnULeRWSRYpbvokiUjAwSyxg9t5PP1ubiziN90NmvqreoRTs
         kuFEZneohje6EhFlRz8BHlsP7WWpNlv5EQflApnBFHnzkJ38rqw/X01IFrxk4qdYa7hc
         c7LUPkhwxtL+nlawiAdGY1Jf3egComZU4h0lbjR36Jm/O+aMVSvKj0XZyD3F94uvBsCh
         ssuw==
X-Forwarded-Encrypted: i=1; AFNElJ/XcNismm/uV4oHCtQSAWUHuahVo3kqszGlm95xHcWaV0H8dh60bm+68MMoshikzYPOTfIm1Jgd6UqR1hM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJsWfhTqoHS3i+7QUxa2E/8PY1bfGrnJop0v0x3gknmCOlkRb
	OaaL5ABQmZ7eNaqOBGeSiVxPrjhYLqlN/qbsE59Q/EFx/ABDVCebBiKKQmGaUqfcxD8pJSiJB33
	YgehDupRT7s4YjnZ7hr1w2RFxlpfn/vI=
X-Gm-Gg: Acq92OHSZUO01zb7cUCYB6WzU2I7g53mc26lPniwAsS/YF/LgWgHqPLMipbFJ2w6zIN
	eVn0ULrD/TbmuxdtVOVEtbTyKhofyhsIS4c1AgSth7+homQGLAFqEFOQEtFuv2GHGtxB/rUjnP7
	sAyNcRpd922Dt5eF2RUrjKIm8hMCvuWRy87c+0oqdMHZi31pOcvBswrWXbWJNNNRcc1buNsxZsN
	BHTpgZX0lrllt9YvqCEPe+kbRQ3C0Z+62VhjxRx8TPMh6BUppI2YZzOIVYktfxuBMlCHNvXH03G
	yQ+rWL6VRgzgIECkvlQ7Z8Um1KJFx1bcZiF8G9EZumTdI4htQIgGVgTaCAvdPwi8QSPhBKTXqhQ
	/e1jOBzOm6hzWrPTajhQ8lO7Bm0lkMV7m7Q==
X-Received: by 2002:a05:7300:fd02:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-304fa658e8fmr3812966eec.4.1780422156331; Tue, 02 Jun 2026
 10:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:42:23 +0200
X-Gm-Features: AVHnY4LO55kfdvPBb2_bfVBAcomqXxB6mPWZy7OOmQYofSFewCwToqcraa5_B0U
Message-ID: <CANiq72=nmJ5rn0N6FKWmHm4bxY4-0X_tok9pNYvn7vEqXLAHXA@mail.gmail.com>
Subject: Re: [PATCH 00/18] `zerocopy` support
To: Miguel Ojeda <ojeda@kernel.org>, Jack Wrenn <jswrenn@google.com>, 
	Joshua Liebow-Feeser <joshlf@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13525-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:jswrenn@google.com,m:joshlf@google.com,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,crates.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E1E8630D20

On Tue, Jun 2, 2026 at 7:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.
>
> It essentially provides derivable traits (e.g. `FromBytes`) and macros
> (e.g. `transmute!`) for safely converting between byte sequences and
> other types. Having such support allows us to remove some `unsafe` code.
>
> It is among the most downloaded Rust crates (top #50 recent, top #100
> all-time downloads; according to crates.io), and it is also used by the
> Rust compiler itself.
>
> The series starts with a few preparation commits, then the `zerocopy`
> and `zerocopy-derive` crates are added. Finally, an example patch using
> it is on top, removing one `unsafe impl`.
>
> I had to adapt the crates slightly (just +2/-3 lines), but both patches
> could potentially be provided upstream eventually. Please see the
> commits for details.
>
> In total, it is about ~39k lines added, ~32k without counting `benches/`
> which are just for documentation purposes.
>
> See the cover letter for `syn` for some more details about depending on
> third-party crates in commit 54e3eae85562 ("Merge patch series "`syn`
> support"").
>
> The codegen of an isolated example function similar to the patch on top
> is essentially identical. It also turns out that (for that particular
> case) `zerocopy`'s version, even under `debug-assertions` enabled, has
> no remaining panics, unlike a few in the current code (because the
> compiler can prove the remaining `ub_checks` statically).
>
> So their "fast, safe" does indeed check out -- at least in that case.
>
> P.S. This version of `zerocopy` has already the unstable `Ptr{,Inner}`
> types -- to play with them, please use:
>
>     make ... KRUSTFLAGS=3D--cfg=3Dzerocopy_unstable_ptr
>
> Miguel Ojeda (18):
>   scripts: generate_rust_analyzer: support passing env vars
>   rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
>   rust: kbuild: remove unused variable
>   rust: kbuild: define `procmacro-name` function
>   rust: kbuild: define `procmacro-extension` variable
>   rust: kbuild: support per-target environment variables
>   rust: kbuild: support `skip_clippy` for `rustc_procmacro`
>   rust: zerocopy: import crate
>   rust: zerocopy: add SPDX License Identifiers
>   rust: zerocopy: remove float `Display` support
>   rust: zerocopy: add `README.md`
>   rust: zerocopy: enable support in kbuild
>   rust: zerocopy-derive: import crate
>   rust: zerocopy-derive: add SPDX License Identifiers
>   rust: zerocopy-derive: avoid generating non-ASCII identifiers
>   rust: zerocopy-derive: add `README.md`
>   rust: zerocopy-derive: enable support in kbuild
>   gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`

Cc'ing Jack in his new address -- I took the email from the latest
commit he authored in `zerocopy` from a few weeks ago, but that was
not the right email anymore, sorry!

Jack: in case I don't need to send a new version, you can see the
series (and instructions on how to reply if needed) at:

  https://lore.kernel.org/rust-for-linux/20260602172920.30342-1-ojeda@kerne=
l.org/

I will fix the email in the Cc: tags in the commits themselves too.

Joshua, Jack: you may be interested in the two "tweaks" I did to the crates=
:

  rust: zerocopy: remove float `Display` support
  rust: zerocopy-derive: avoid generating non-ASCII identifiers

A double-check that it is good would be great! :) It may be that we
can add it upstream somehow (e.g. with a `cfg`) for a future update
when we need to bump `zerocopy` eventually.

Thanks!

Cheers,
Miguel

