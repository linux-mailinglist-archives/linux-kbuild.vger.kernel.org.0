Return-Path: <linux-kbuild+bounces-12000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF+9HVsLuWk/ngEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12000-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 09:05:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBEF2A5473
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 09:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4799304DC94
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 08:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30853932EF;
	Tue, 17 Mar 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="couwyBty"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB194388E54
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734552; cv=pass; b=G97umihR71sHOijvppilHdPErEk8dLoB5lQyNQXzbLR0APcYyPrkHAB3Os/vgSNsYtbeiMsCKw6jU/Bdw4qypK2MgN4xn5/POmkZUimRa39ZxrCinhxnFXyKYDTW4XfDWUgBsCm4sR2qpodzvOoKgCy1UPjdZmGSX3I2WvFBH2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734552; c=relaxed/simple;
	bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzPYUGSiXh42E7odGG43NFNrD6SxbkSUKhf5Gm6cKsQmXfif2ep66Mm/d41Dz7dby2oCn0+OdV3wUK4OMh5D2pfWW18/PwkGCWW2vwjLk1LxQL9lsyPEkOATfEGFGHSc/YEVw6WBDfDL2Fx32NGn5R/bBzj9n+LqZz4kMrP2DAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=couwyBty; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127337e3870so279925c88.2
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2026 01:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773734551; cv=none;
        d=google.com; s=arc-20240605;
        b=WxkdJqPXe2sjs6+sXIyyqQ7yJmR6L4BGu5hmO+8WMekY4XITQ9nLEFdqWizAyw22/g
         FQGq8eomXWOqWQPgUopPcDkymIniEdBtu6FoFYOdw8Xj9BkT12rinqqHxhCgCeqFCGyJ
         jqZvV7YV7Tm/gM28jAB0oRkLnt1f5vx3nfbx9iKPw4G04LtjEdz8HK36Jg09gH1zvvYU
         8muJX74TWYxrqeX+y2sdelmdiUimX1bnVgO7brh+496YzkAHJ2QfsknX3T8OJDcepM66
         ehN4grXs0XdRzfKNMZDnddAWWTafMpg3oaPwL/QoQs/IN1lQNVTUvPOw6XmL7QhFznwJ
         Te9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        fh=GWbE2lPXKXAC7xlePkF7oc82O/SBlnqaTaTGukgmOyc=;
        b=FfY3P9bl5HdaSug2Esb1M0+UQ+m4r4VQHxoPz8h97sq1z2EMCeNvOdfvNt412yxnE4
         Xa/8Dnwu6GECwR9DYy8lTJZ2sNNYvCpjGCNEKouZSEQHKlvruZe2rdunW2HKSCEjmdlX
         IUMRqgN9QLqpZ74gFhHoTmxt/6tp2j/RuE7brIT+bDVxHWM2iESQ+837WWFZsYXW5+Hu
         6nf1WTyz5rdbeZ0xr6aG1k2tDue0GF71xmirz4mcuCsmCQ2LGzOIhW2U5j7sjL8tLBtd
         UDMCxvEvrXLkNW9E6Pv2RaztFzB9Q4qmaUdCeZNBXyuAs0UlQJ/Ah8aI3NVwvUOf4Gj1
         Ca3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773734551; x=1774339351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=couwyBtynGBaImYXSeyyFbfDqGBmNC8xydtv8C+uh770JC3c14pSXt77h2/k7wzuJR
         hEoCP9T5mBaPDFkNm9cL0g2tsbzAjJaTtmT1MrvwZqcsKaDkTtZgFE1vpr0LkGjMTo2N
         bBVC2aUIewuKYO6zyT4tYr13pmHpSGpfKYvSlyYgmBpvZqNo6yRk2S1+2Jz9pudcO+/q
         wJGCVZr7zp+jN9mDr9d0u72awvCjUrCf66lYWfKyMG2dChwV5J8dqZfSS8L6c291U9+i
         +k1eHsWvZTdR/BjPc1PBnkyiILhYSvEz7h3ZvbYLzgXbjfPU6Xe1h4fBWZkoo3kmVB08
         mCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734551; x=1774339351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=L0HsRCL+TMj61oexPfIQG5kHOPf2Vot4dTWq6+6k9O1jsEMHLOZWgGlyzAQLBFazpY
         5Soqv3aRaftS9EDec6gV0mYkadmbT9ve40e3CoGlW1vtBChMppFov9h3PUh587D9AJve
         rQoiF4Oa03nhCgfV3IWNsLCnMsb0i1EIYGuxSH7KRDYWxrmAf8Jf3cHo0QxO+2UIOnZw
         rGqB0+wa4jxsfMnycUXCYSWrg0dW4FObOlAoykCfyt8ocibkReycbZhNS1dy/E4x+jtG
         OnJqW4M6DYCT98/KNODrbADr5LXpZhVANrWibaGcaNAWCgf74Yzc+VNGfCeKPY5zTwHy
         38ww==
X-Forwarded-Encrypted: i=1; AJvYcCWGskvJIIF18b63uSPH3RIAWl69/qxl1/1qUp8QPQX+ezzuNy4xV36dRNDEZVQXdSIRi/A6Ylx5Fd9WYWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+h0TOkXmN2m5VWG2PyTBb75IbcmCEURxup4pzyb2xKsW0l1AC
	/f4K53zZ9O0DpHZkjgLqImzkfg6prPSMzk+2CXU2BGzBcMQTMU5WctAP1qEEJTLu4vtPbpEKt+C
	/76xYZjCD+QNhLbHOdABKSpW/3su3FQs=
X-Gm-Gg: ATEYQzzVlOGShFgGhOK0omjKRGfsw5O4HKrcVVHMfU1ry6fEoX7HupJN47O/pywFjt7
	rWnjoFESzpmUUbd3qvNEyZ68GQlE8MyTxh4IscU9B/7cPcxW5abYJ27Hmy7EVZkdrHfl+gsfS9J
	UKJQE4MKQ43K8HSVh6tHBFfqp190y9SBtkvT8m8KqXYoXj33RWGAYLLO4OlPgfWgJAx6ejEI1tS
	Tfz49G71JtWYgkD3+1/whMOOXQa1bWelyTEUetkJ28ni4EMz/CMIJbAr+lN4ijKhtdDS/tnbuaE
	jlSSeT3pkPyb5LYVM39f/I1lNEw1wyN4oHNMAjGotXDacHwut7Dz5mqYpKw5aiPj3jeSNtYp2f6
	WkndhknQJmnYudwf/QpciPz4=
X-Received: by 2002:a05:7300:e887:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2bea5590bcemr3462168eec.5.1773734550615; Tue, 17 Mar 2026
 01:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com> <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162> <abVE6VWCzZfyMEsu@google.com> <20260316213440.GB1329928@ax162>
In-Reply-To: <20260316213440.GB1329928@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 09:02:18 +0100
X-Gm-Features: AaiRm50RfwFM9fMmqm7H6QEiWpid4KdXpZyBrHWN7l2K7PyOj7AradadNJ2iMyA
Message-ID: <CANiq72nEFH8onFqA-8qXxeT1izR+xJdHT3AWrAqAzjPsEMJrsw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12000-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,infradead.org,arm.com,linux.dev,linux-foundation.org,vger.kernel.org,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BBBEF2A5473
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hmmm, yeah, I suppose so. Actually, adding those would allow you to drop
> the manual inclusion of -DMODULE in cmd_rust_helper because it will be
> included via modkern_cflags.

Yeah, a week ago I asked Alice about simplifying to `is-kernel-object`
as well (mostly because I used it elsewhere in our `Makefile` in the
past), but similarly I ended up thinking that if we are OK using
directly `part-of-*`, then it would be better anyway.

Cheers,
Miguel

