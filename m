Return-Path: <linux-kbuild+bounces-12076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP5rHgviu2lXpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12076-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:46:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3062CA8C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A84A301C118
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A2E3ACF1D;
	Thu, 19 Mar 2026 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLeCxn+X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818238BF6C
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920702; cv=pass; b=OMGtkIUpPoADHjJ6PiCvHxmOBsl2Ou7UavOlpPr7krqgRx9bNGl1nouA51xh855QEpNBWSZ5Pvt4klcsJuSbrkH2bcxMPWlaVmPznIF3cyFmIzaU/SMcxS6h5V6JPdJ/sePHqCb/m81YpkAZgCA7mDnP/8rpu6ibKqSd32/Hcb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920702; c=relaxed/simple;
	bh=jbaG/PqEIG21QZ3ePm59YLt1fbFqha0ZeCW2lG0i3w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BladR1aYCPVvRdXOQ4SsQ0hP906CCcJaSosdv1fa27g+TUndJQInu4PJDGsHSl9Z2OUJ9e8SCzzsxtM8nKunPHjjCQLB6XrFVMkO1QxIIFyNEfTyapXqAT8Id98qzm5osi9dEoFMFpzuuvfngUZcfbrOWoI/UaYhQb4TfEmtLfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLeCxn+X; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso421671f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 04:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773920698; cv=none;
        d=google.com; s=arc-20240605;
        b=D/UnSYKcDdgwmtI+fXZGBLl5d6x5xkeqx0IrB5veqe+d6eSFD0m8z2Uviv0tj3ES/8
         50tAowfnd9vDRGrSKHg/UFPDzHCbXq6D89LeCrpbqrdBjXDYb/L97YZU8DzIHXXWRlaX
         3moaS2RdAwOSIdI72vXNHLUD0naazQ7zuGpFfDkk5tv6RAYfJHSj5WuU05hpD1w2QZsp
         sZ/uzj/G0RitazOuk0k6xJoh0e0PpoefYUT+CEDz3dTW8ok74jqTsRGP/ZetwLKHCoKd
         RqHIboSplCddVR1FKIcvUWGQid46mMWk0IrI18x8RPtTkBBHcqX/Ng8XWS5TBd5OfrTF
         fuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        fh=cMlmdwoNirFDjitNi8Mj56UJ/AS0CQVGTaelXY7SJCU=;
        b=Kh+d4iyz7F5VWnlASkbyiGzJOAhll2Ats/sgLaeXesTIau8Gjm1qhhAbVAOlddOqGH
         PHrGxPk1w83yIqGYuG2y5kiD1mtUTNvWvTMDGI6IreDceKaZo7gfts4+1cErosrsbtvM
         YDgEbVVV+qG6D8+aGLMsjeDYCVjGgkTiCeapwvsb0jOBLQrTXLBi+YoIlH5RhHCZFVk8
         TXAiCp37Gx+4g64nf+d7tKgxdAoDIwN+lLYsF6fbZHgdIUvYlBxuYHx1b26ucYVUaayv
         w7JuWlfyxigaPsdCCzsmHZxJqW9aTUCOOX7lhWet+AcUqpRr6DPswRXId+kPMZhku66n
         VPXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773920698; x=1774525498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        b=FLeCxn+XIgRJjYzqz8w5eS/NRYcFBbRjYC0+znqoMxZTJVsIiZz7yi3uoJS0AhZRWV
         jYacsaGHWxrTOgJKvxZ7LxcT74g7Byce6jLT06mrj9MO7YvQ9DwxI9tZtMXPfDmafgvG
         WI/eYtBQIdILggwTaZj0xfKv4a6secGmsfFbtUK2it8eUEGuzno46Qd1LjY5PS4WWF+r
         d92QF5TJc4BdDlMqb8S+XMI4iycsvCOig+OVrhQsXm/dy6neu1U8uq2InrQ/6wwieKic
         5QMuUfWUcfpobneUGqgBAsu7rURLsiMFYDXd5epWvPxiakOqBKVYK9fCF+pn+rYLb1Rf
         QAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920698; x=1774525498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zbr1Hl/781eUqZ5+RYHCjUCdCxGAQ0+UKwddrWf252A=;
        b=r00NerkUmNYsweHjClN4PSu5xY0H4el+43tuLfwo8UWChygOEENtzhyo07jULSqe1b
         Nfbd+/CVsW2BZfJITC+FK1TBQW4nP7ypJkYnI8fO5q38uR3D2neyG6ZPnSPjLjpaNiEz
         BUHB653t5Wo9gDxzjgfuhAcIgunp/pFMMTibbmaEG81wQsiksMEL/u0Cjn4C5BmD51rX
         YHG287ZCny2oZXTJYQOERz+hoqGizt70TIE/yqR6tIKqbNPvcqQPxU8gB3XhAy9ifK4a
         PlrfCYV6ikZbZgSHKFmXlznwN++8M7REoTdS0ktw8/D3SoRqFeRbinLKXcJmIFbvUd/B
         vPDw==
X-Forwarded-Encrypted: i=1; AJvYcCVaVqhf3f4He0t6AnhrHU0fTL1SYcIR9dStwtEfbAq29m1K4ikUD5pNLiF7hC8DBb7pnKpM2GqIQNJPvN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0sn9lLjswjg0S0AH7O39Ltdd+gzicRv9cw/EOxIyPZJrd0lW6
	oCiPPUWTxSzvqINVKR/3v5B5neCaB0oui9/K11YbVYC7xJo8iNUxqMg7DRMCWZVApBbnZwXxJyz
	pWeW/MGQXq6D8CNnUsmk6qCb4d6JvaWaIK9i48bhe
X-Gm-Gg: ATEYQzzM2wmkkvoSS43KASUVzAidi39Zf8RLOk+RXjgXDG0qiqA+n0/+d3ND50LE830
	uF4GVJc2bL/snudTcIsem8ukKXBFkZY4euN65MUpnRww467Fq82vl0QU7ENlxSWUZXqDwc5aK7x
	kO8YUVOjFlSiuMYlTy7TVmOCg6sb950GecyNNQdO2b4gkjCWoDkF6CKjdeCKA7nWTpsJEhzk5m7
	O28wKLBzPbffvl2AOPfTQNg57AUlAAC0GgE1puhbirwCRbeav4ZJ3iWJ4BdBSLQbLmi5kb/vJJ1
	V28RcNwV73Byco8OJnXiugEJDhp7451qNucBfaSnhC///PCzng6enT7XQ40uym+39Dvjnw==
X-Received: by 2002:a05:6000:b44:b0:43b:5765:96a9 with SMTP id
 ffacd0b85a97d-43b576597d1mr3995568f8f.24.1773920697944; Thu, 19 Mar 2026
 04:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com> <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
In-Reply-To: <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Mar 2026 12:44:43 +0100
X-Gm-Features: AaiRm51I9hCb6E-7s4x3bNWQlwrbdQCQ_wMEyJrtvica5oTfej5ghV1R_rZkleM
Message-ID: <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12076-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,garyguo.net:email]
X-Rspamd-Queue-Id: 1A3062CA8C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
> > This patch enables AutoFDO build support for Rust code within the Linux
> > kernel. This allows Rust code to be profiled and optimized based on the
> > profile.
> >
> > This was verified by inspecting the object files and confirming that
> > they look correct. It was also verified in conjuction with my helpers
> > inlining series, and it also appears to have worked correctly when
> > combined with that series once one missing thing [1] was fixed in the
> > helpers inlining series.
> >
> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  scripts/Makefile.autofdo | 6 +++++-
> >  scripts/Makefile.lib     | 3 +++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 1caf2457e585..3f08acab4549 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -3,14 +3,18 @@
> >  # Enable available and selected Clang AutoFDO features.
> >
> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable-fs=
-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=3D=
-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=3D=
true
>
> I get that it's currently named as AUTOFDO_CLANG, but this really ought t=
o be
> AUTOFDO_LLVM...
>
> The flag translations look correct to me.

Do you think it's worth having Rust not match the CFLAGS here?

Alice

