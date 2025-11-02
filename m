Return-Path: <linux-kbuild+bounces-9361-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EBAC28EDE
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 13:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0B3D4E4FC4
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 12:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEE318BC3D;
	Sun,  2 Nov 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNF+/GA+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5A1548C
	for <linux-kbuild@vger.kernel.org>; Sun,  2 Nov 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762084853; cv=none; b=B9Q++3mb6asaWk6d8WXfYDNNiZtY1DnNg5StkSAL2yN586+3kfBK/w6KHKpx//IVJiFWTr9gmCCd2BhFWho/tOaxM2etkzjqsp1W8Dt2lGejFhMDMgRGZiPUzvZyZO9PmCPlszsTTli1ZeGynnOQVz5gVgRBwUUbXyofydA32Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762084853; c=relaxed/simple;
	bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OToCSaqHVeWyB4xqtWwZk7ykkj2I3znmRA4uyShQnLKLIYoR7CwILInIgr3oI/7IGJuRnKA79xisK0W/CdFKkYbCNs42mcm7G0yCbw1SZdcVownRNWnBZ+0dEVfHOWWlqOr0VuWWViUudYNt4PZCFz2LmgIFJfbi3MVMyQ3Mi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNF+/GA+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so179107b3a.1
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Nov 2025 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762084852; x=1762689652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
        b=WNF+/GA+oenV6oX0hToWpSZCPYGFt35BVbRPVsIX8XJSYp8Hd7i1pRt++3/2ZATxAi
         CWjUa2/oFWjBSqFP7i2OvOX97HKMsclwvHGQa1aLQLyHMqNHw3/u+bk+y7Ml+kW+77Ih
         4OCFE+jByBkJMBfGDRt3azoe9mADmHCZ2+6z9ZpYk0nzGkH0u9ViTaaEdYQSRYgh+BG+
         kBSlBHgmRXTdL3XakBeqkW6qB+oDRPo3fyCccn8r/00o/ezxRhThCcHi7aARiHVem/x8
         He+8qz0nfXXOBoZ8Hqn1Mg35J5HWxiOrufhQwlRVyTz7Mpwmg99UQfg8mZBIoUWic4Eu
         AL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762084852; x=1762689652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
        b=pOCVgiEnCR3hVw7bUBzIcIb4uRzgFWf65FXNtJjv46RZ96i0Pp6VGVF2j2MYXXBkVd
         MeNEvEYLSj4NT0NIE3BhrHaqJ8uBtMlgzIa/OYFZRVm1Rsay5PKDoCJrlOXXrIh2tQqN
         gMIbSwO14aBpU1CFZ7fOvukm4nbwRYHx/ehzy4favBA0hwTkdYLrlg45XYGv/zQ18N2k
         anqxMnKvFr6RLWqd0UDlR9OxOABcSQWFXmQWzCkzstdbEAU2wFQ3C2U2NW+pd61fVCwW
         3e18Sw8L3bX5/fkYxTpz2V1PdcJMvLvhMB4CRG4RXMZTLVTi23aQoREwZ4VdYENabfHD
         235w==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ru3OsiOvq4EO65nSLLmVaybhywyCUmCOCjp0wFazTs9YvQ63InlYC4HlO4Xs9zDIYSCZNEXeLh/x+Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUeUn/p4D8qpSa3k0yHYcdqfFwh1QTYubpmnN70cZUrq1hA3AP
	j9Xj3uxl/eyDv3VCcN9KKjEDyvgnhzZiOh2qwrQ2ItVh8r5z9oL4kGHY9YMW08CtV1CSCM63Kza
	eHjKY4lzXbDjAjBKVIgjBuuo7da2tCcc=
X-Gm-Gg: ASbGncsOh9q8sTa8RN5KrP/HUwI5mPARI61jV03MZ3ZBnJiSS7UTY3PNKrMZe/3bf4A
	I58zufd9nQWylA1UX+0Oby+Embz4/G20k7eY+FSL8BbFoBcOEjcFXK2Xia/EusLEes/MSSTLeNy
	etvD6RNEcn+S558w7mb6gBq8S4xdxkAi4yDjZao291K+Jxhwai/iq2vhd56pH3IVCUoOE8qC2d4
	x6bLmO1VJsygghuWoA+LO0FVl5bZNEXpSSi9WW7133j3LFvEIrShRrOeZWeqd3j4H1IZkHiQwlZ
	ttPJvAbLVhX2OOl15xlDKzzVReu+lk6DT7YT5/7YyZexUXTmntTpj6B8qB4xeJuAmZzXuqQAeuM
	XvcL5JAkNgCTs1w==
X-Google-Smtp-Source: AGHT+IFlgxIxcweJjpgvdwNQZG2ObtUFGP6xwJxym9cLEe/yblvm5Um+k4aAXaoyZYzWM0OT+gOTsLm5UbIq0wEpl3A=
X-Received: by 2002:a17:902:ec87:b0:295:8da5:c633 with SMTP id
 d9443c01a7336-2958da5cad3mr14628385ad.10.1762084851701; Sun, 02 Nov 2025
 04:00:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
 <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com> <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
In-Reply-To: <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Nov 2025 13:00:38 +0100
X-Gm-Features: AWmQ_blSZ_mArdZ9J5G_VoH8zTPY8nJrqB6TsxhMMXSS3qgYUhTO7Nq8nGrdlro
Message-ID: <CANiq72nakhVrfK=pyz8VBo95NJHpoeDXRkqUBc4GXSdroYuAQQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 3:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Also not all of these seem to be tied to a feature;
> `RUSTC_HAS_FILE_AS_C_STR` appears to refer to the
> `Location::file_as_c_str` method, which is behind the `file_with_nul`
> feature.

So what happens there is that there are 3 states: "not implemented",
"unstable" and "unstable but changed". That is, one transition is when
the stdlib added it and the other when it changed.

Now, normally there are only 2: "not implemented" and "unstable", and
thus using the feature name makes sense there, because we use the
Kconfig symbol to enable the feature conditionally, not individual
methods (and a feature may contain different methods or even language
features etc.).

There is also the "stable" state of course -- the features don't get
removed internally when stabilized, and in fact there is a lint that
tells you about it (using that information), but we allow it, so it
all works without extra complexity.

In this case, we have 2 states but the other ones: "unstable" and
"unstable but changed", because `slice_flatten` exists for way longer
than our MSRV. And for this transition, for the other feature, we used
the renamed method name, which makes sense since that is what got
renamed, e.g. it could happen that a feature has 10 methods, and 2 get
renamed in version X.

So I think what you have in your patch actually makes more sense,
since you are in the rename transition, not the feature addition one
(i.e. we unconditionally enable `slice_flatten`).

I guess we could come up with a different naming scheme to distinguish
both cases or similar. For instance, we could add `FEATURE_` to the
cases of the first transition. Anyway, it is not a big deal since we
don't expect to have a ton of these -- quite the opposite, hopefully
we can get rid them soon. And I wouldn't invert the logic of those
equations, I think that gets even more confusing.

So apologies for the noise there :) At least I hope it clarifies a bit...

Cheers,
Miguel

