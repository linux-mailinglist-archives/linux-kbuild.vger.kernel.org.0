Return-Path: <linux-kbuild+bounces-13982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eGEqJSMYUGq7tAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13982-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 23:52:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B223735E37
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 23:52:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xiro37Pc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13982-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13982-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471423021E50
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2026 21:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C773D34AD;
	Thu,  9 Jul 2026 21:52:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0B449997
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jul 2026 21:52:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633936; cv=pass; b=NjhCGpSyuPgoAneRtsg7SYrg/sDHyi9Al5E2U/w022oyilzefURkFjIBx5oR451QQQq6U0zI+xFLipPEY4aiZDDmgRc16hA3DQ17XRzZQNGGQqh1ujF3lJ3yHFzOVy63kIm4ArpJhVejfjobecrxM4T3PzKZ6d2yTIKZAmwkCuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633936; c=relaxed/simple;
	bh=yzsGbrV3mdbNVLNWop+1sWSocBxa7orHgTv+TBHL0OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8y/YcUWubWsrVlYfB9Hg84CpGKyhpRqG/dXglURg/4Uncv2eNbQy0zMQ3WQPgXoxzBxONzjaUKqVqMDfXLcEoBz23W034lCGuVbk22ZvR55NnJEArrp48dY3M4FpzzvhHGljf8qp01lOvYYTO2B0fnbHu4hp3rMknhZoDVdSOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xiro37Pc; arc=pass smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so60033a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2026 14:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783633934; cv=none;
        d=google.com; s=arc-20260327;
        b=ZA8c737OAGRvYa5LgSf9+aoWly9slOotwG7mYvfPgJBUdPsOkj/pUY6CM/eyGEWLfD
         Ubu85uUDe1+9oXaS2zrthNY+JnIlH0RhZrpZaokmbTN3vD0e+R2rc8kdpSCGKpftrJ62
         eg8bfsIT7Co9ULdGw3UtHlLfS5P14YDQ92rEkcGJGwGRgDM8og4HOmeKIFpQTUjY0n+7
         3KE7BFoPN+iPv8PQvXPIZP5bwGUgt2R17gFwSxkFAXhISqzgQjopEMu3cjqcyVipWfq4
         pHTqfgNtJoqWL3Rj+7o4v5KMhrdXbljYVUCkUMUPrS4nnDuD8w5ubDHfX6+dCwl0HeWZ
         pZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        fh=7ylyaaSKltIMB0FyB0v77iY2SOL8ZWwzuNTgJjYDDPg=;
        b=mSLYTJZpkKCaTmNL2e+kaQALjUYsLQKBVAflhijIzJKnBRohV9ByIKVHCWuJy4JlCU
         ddAeN1ARRL6cSveKzq0Fmaz/0xl71r1reXdzlZVijczrnlJQ8CSXyd+CDib/S609HuP+
         p/ED/PdZwhIl8ZKsLzFA69piZc5IFf3JRyiPt3+nZLIgzsSX5Be0JrLCM6D0PqA3jEF4
         IdTvA467QE2f4A7zr5xfVIDCBsNOOo5SjDHvgU4XwhleR8kfyMYInMY2YWRGQu+8PsRs
         fvaaupQ33u/M5FtcBywt3JyR9CXLCY+Jutnpq4Ik9wmNDA3XOpXXQtr76b+Bjme7Oycd
         o5Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783633934; x=1784238734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        b=Xiro37PcuwFnSZr1Hx7Ogb9zJY8CPE+tF3SBQxePNylx1pOoT8EgXMxnL0pio04VhC
         SN0CD8sAHIeOa3QfJh6NCdnDOK3o3/qZRQzE3QYFxbyar5ctnRU1gLMxO5bKyW2Y9eNj
         jIDoFkW1VIkCBw6RcN0zon2fAD61mmxg+fBEz/gqutz8Y8vJrozM2+LpwaIWfWJ4m4KV
         vjaRrVk2FXcNaRiJ6sI12+T6Ff7T2Uyq/ZAbwTxnaoIxjSkzu3z2IAiAq28LrmztRUdC
         dBzJX1ab8BrzFs2LfFEFj/l7x+PJrqbEAgBMBS7RZaaEbFvcgDFudfSJQH74euLbqoSZ
         tfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633934; x=1784238734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OujVERdej8Ao10y0ERjq88R9Ec3m1vVbNiRIyWvGzbE=;
        b=gTvs8BirhjoXNNUY3wTf+cwXX95OzCf+xcZdCZN87J2POy9ceGqzrSFdlQeTFoE+1c
         7+ENoa+1Dc1wjj4nvNDenMCuP6GK3U6Vop3AQRHkSWCQWwihsX2fo9huBU1/3rVkCK6/
         9EDRYgYHhLTLPsORdNUh8Ymlah0QRf3S7uFq/hvnuChthdApPp2YL8qzMz/xSUYDBTu8
         8WRlX+ffRyRos5tenMaVFQfmxlmYXGzidDXvxF/Ep3sHM0UTOrMD6QgwHDNbtJpvoW99
         lDdpdMCAIzy9gTYE+CxjD2WykXGGLcO49ytycTbm8h+2o3cBS8lMsOEhS+DPnlY/R6r2
         iSRg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+sxvFiEQJE4tXM0gBh58KhDwZKYmhCxZQ8+xJfufduGt3eC/Vz06N2Gw9Z84MxKsmjBv5cdLyUI4urbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfKMnsRqU0ijgVXSYjLzm0suTt2cALdKQN/qAzXk8+KHvQnsM
	tWO/mVOv0F7pdI12ad4+IVc2Ha+WXDqMZu71vBdFTJlfjAkJi9PLF9q+XovAFbzldxNI8ClZdda
	o11MalquHgrOK6hLw0Q+NJNS1vxdcDxQ=
X-Gm-Gg: AfdE7clMMB1ZjyO4e5hO9zeIoKBQU6Nxid+pFCsDw2Rd785FA6miHn4NIGv55F20vP4
	8y8Rmai3NMO/4AmmKvdkx2YS+0TAXPYHE4/nliW5A9wS6GVfqn7LCsbuftOTHbQaJO/94PnrAZk
	zMOVRcG7JDbsSECEF4ZJr0MhVEjsUBZMebDBKSgAfMjTWtnyLBhPNRZGuWFaO2K9uEWSJL8Bltg
	9z173sUiZj5jOVenGhHYO5XWL5eB5dkVp3CS8jyxqcbxhMR1W05UIflA2wGJNH/MVbpBCqxlMcF
	+gmdYVqQIzNMatv/Y00xjPD6tT7GibTQj5fvFBWLvTKVPQWVfMehpKYyBS05Th3bpObaupR/8Pw
	depY+oUh1AHp4
X-Received: by 2002:a17:90b:2d08:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-38a1f1dd5c1mr4861384a91.1.1783633933876; Thu, 09 Jul 2026
 14:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
In-Reply-To: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 23:51:59 +0200
X-Gm-Features: AUfX_mwu2wRhxSIY8869LMM-JC2amc6Sh4AcwhSXYGOD0MsD-zAXWgwmX0yoSLs
Message-ID: <CANiq72mBdo3nOJffN4LJe6XS1Sm3qkLvM8MdnS5Q61=0UiE9_g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: allow `clippy::unwrap_or_default` globally
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13982-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acourbot@nvidia.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:work@onurozkan.dev,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,onurozkan.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B223735E37

On Wed, Jul 8, 2026 at 12:49=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Starting with rustc 1.88, the `clippy::unwrap_or_default` lint triggers
> on `rust/kernel/soc.rs` if `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`:
>
>     warning: use of `unwrap_or` to construct default value
>       --> ../rust/kernel/soc.rs:66:10
>       |
>    66 |         .unwrap_or(core::ptr::null())
>       |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_defau=
lt()`
>
> This is a clippy bug [1]: the lint decides whether an expression is
> equivalent to `Default::default()` by inspecting the optimized MIR of
> `<*const T as Default>::default` exported by `core`, so its outcome
> depends on the optimization level `core` was built with. Moreover, its
> suggestion ignores our MSRV of 1.85 (`Default` for `*const T` is only
> stable since Rust 1.88), so we could not apply it anyway.
>
> Disable the lint globally rather than working around this single
> occurrence; it can be re-enabled conditionally using `rustc-min-version`
> once clippy is fixed.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/17379 [1]
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-fixes` -- thanks!

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

    [ Moved to non-versioned group. - Miguel ]

Cheers,
Miguel

