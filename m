Return-Path: <linux-kbuild+bounces-12082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIogFKoovGkxtgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12082-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 17:47:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA12CF104
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 17:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2285334DACF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 16:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500C03D891E;
	Thu, 19 Mar 2026 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qfb/BU9X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5933EDACD
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938052; cv=pass; b=WKaOLeBmwNrl8jHL4j98dj2oAd7hlSMDkfK4A1S/eU9FqSycW9fwDYUK2BWof34uiys3UaqOFzIGgEbE/mI2T4NI9LR8QssZUHed8yCJ6PZ9O8kPzbYac5wDbK0YJMtV6NnuJntzxlkGzGHBzWe1ZynzENPIHDsfQ0RpxW8yYbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938052; c=relaxed/simple;
	bh=G4AinYb6gHY1qhJMnjZ72OjGwE4OFYuFz82X0vYoG74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFc0fO7f7fpiiHaazqiCzi0unYyjrize85/4czZKySxL9N14uqVmSOtEmylPS1LMGMhAwSpWqVio5/01bl5wKMy3CW0w2JMwLjYZKFT/4T8SlD8uBKgmhVMMaSRN2NMFCT/Wv+tfgeEU95cia4NQwWd02ANJ3rcGy1kKNFoTpZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qfb/BU9X; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so978330f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 09:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773938046; cv=none;
        d=google.com; s=arc-20240605;
        b=KHtAZV+uem4W1XjIChJ3NOK2wHIMxMDL3CEpPmgepigTO5FQYFBGEtb1BkCOEh9vuP
         6JGXH80rnsxhViOlJJp+XC032npCsDVXgIuG9X/4J9TCq739EHDTe6uyD200wMWO0ywx
         3Jfvx8Aac51ATxdrSYOrZkgxA0WlvtO3/m6JIbKSTw5tNHI9PqsMwgO33q0QYZVD+Igk
         lkRD5IZG7tKKBqTzLuQsEOi3Yi1KOF1VVf6ST5vNmK5O9Hjz8XQojFC6FoXvEvCanNzI
         RF6tKUkg700qSzEfEcKQfCUNWaoNRUvpOZTQczULIMvnfYDRrP2uASAc8J2urNTO/Aj/
         8MKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        fh=3N6FqJOGdS0S4Vh9k3qdedP/ND7aQwn9kkq4wjNYnd4=;
        b=Sm0/hNm3+QmWiqNVKP+2/XM98fp2qQPtAJGGpaSXA8/0HHt6eGSHs1OeZ07yQCog01
         Y8LKN1WiLs45nnfotUtkK35lHJz8xZ3m1zVl8F0aHSuny1h7FyE0dpXabnUWkZrG6zDV
         ATEfo2FZ6i0QyvK/4fPkW1koLkgLkDcYMz7QZXWJk5Hg5XWBed0Sp7h0iogspEyKXAP1
         ryDrBcz0nK6cBxovo57pW8U8k7zHEbEWDbufq6Ba78dIFfbB3A96PdRFiU5nqTmaGec/
         kLvDIBB4dHTxX2lGkctFCc1FIE4cwa6pWd/8Byry9LITaUk7r2c6+oHAJGJxHCZ+VDHX
         f+JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773938046; x=1774542846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        b=Qfb/BU9X7l1GeSRqSpfv070/nNw58kU4YLeu6jrLyfq6bdvkhAD7vp2bNDLLK7WQ+c
         nVPn7sO2/kgO+3BtNqSj+xWpB/cQKT2CDQP87E+n+uav43qbQBf5f8oFC1yav2MMrQmV
         FhEIIpZi9YoBHFIIxhvIlBw8KqxU5QaHwypQjE068WRU6GxpMhrFzMhV287crCec588C
         q4axoBWGlKXHJnJPkYJBTqicl5CvxZZHQWZaMhHig5u76GaMKdbUlA+yzWWh97hdKoiI
         Os/ELux+MOF2xaPR6wH4wlM8SDqbnlR9i9qOISDmpp17T6v0yOecFOLynb9kEHzl+P28
         dS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938046; x=1774542846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        b=MG6+GJlIwSVuIDaiHbSLOO9hs36408TN+YwE5Wig+xsMMkH3CJbvf3n8qHhr5HFoiN
         sVODY2rBo+x76V0Jxh06QEra85OQ1uLMpB6zgbhjqvMXDbjrQH1MpDnvA65SVx45x/7t
         GfDQ0b+eSA5YYw7+AlFuJtKrDII84TcPj88E3fW+SAmyJ/Vyx8lVZZImYPhsZxD08+TT
         0FMW8KgNxqqrqwLZiMVrGQx8KhbkXkMUD6QX/vL0WZXgl+Wy+9EHUahnrdGIW7Ugfrz+
         2MQoz1rNjUjs6IFyAr4DRyMhQ3LnnmUM2a6tuwVjz/feik63KfNKPiWQ0uajN2CSKy/F
         ymVw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCZV8oLz2n7VW5XAdgzpdb54LXByAZqHCq/JOw9nbvE8QH2mUlivVo/0dvN7DXHzHcXmvCGZL2JqF5FM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SJwnw1/VfS1yojN8NHwJFLMzSPLdC28mX22X5ZQfsjdr/gjN
	h86BQlSMBrumhbW7nU3n4hAnTPjQ9/btspmQdFVzCnKTctNaooKVslUFa79uIIoHNHJMF1QDf9q
	cLoVufifeEeJpSSU3LOeCvYgjKyCttb0lUu9Btp+4
X-Gm-Gg: ATEYQzx8D0jfMAsF2GqwFkhXxj9P2aSMDAHOXNoLPembVleECURFK7PouvmiNjW4S0y
	PC/VgphFFOXHuswh2Xa8D1sN5roC2TMD49n2dp2x1pflCfKP3YDItvf9v3NBZCIjKnAsRlkKs8V
	COWlKSNVxvOeua/uXoehnIy/9oG7KvmopBxPtu5C2A2VXBbGPeWqTqx+nXp7izo7EWozoLb1iVY
	DdpNxg28eiYq4vcwQltI6vVuZq9JXwdiIEU7fDKeIPinc9FbLfaKLyIAcrL16En5NCCfpEzw7O0
	zHhWInVpJYG1D4+WskdBe2U2hMqO4HlGUrCbhg==
X-Received: by 2002:a05:6000:2c10:b0:43b:498f:b039 with SMTP id
 ffacd0b85a97d-43b527a463fmr14121260f8f.9.1773938045711; Thu, 19 Mar 2026
 09:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
In-Reply-To: <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Mar 2026 17:33:53 +0100
X-Gm-Features: AaiRm52igaWHP0PtJKMIDt1AO6b8_WSVHZzCwNzgTVsmtygwlr-ZUME6FVw1c6s
Message-ID: <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12082-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A6AA12CF104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> > On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wr=
ote:
> >>
> >> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
> >> > This patch enables AutoFDO build support for Rust code within the Li=
nux
> >> > kernel. This allows Rust code to be profiled and optimized based on =
the
> >> > profile.
> >> >
> >> > This was verified by inspecting the object files and confirming that
> >> > they look correct. It was also verified in conjuction with my helper=
s
> >> > inlining series, and it also appears to have worked correctly when
> >> > combined with that series once one missing thing [1] was fixed in th=
e
> >> > helpers inlining series.
> >> >
> >> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  scripts/Makefile.autofdo | 6 +++++-
> >> >  scripts/Makefile.lib     | 3 +++
> >> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> >> > index 1caf2457e585..3f08acab4549 100644
> >> > --- a/scripts/Makefile.autofdo
> >> > +++ b/scripts/Makefile.autofdo
> >> > @@ -3,14 +3,18 @@
> >> >  # Enable available and selected Clang AutoFDO features.
> >> >
> >> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable=
-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> >> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=
=3D-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=
=3Dtrue
> >>
> >> I get that it's currently named as AUTOFDO_CLANG, but this really ough=
t to be
> >> AUTOFDO_LLVM...
> >>
> >> The flag translations look correct to me.
> >
> > Do you think it's worth having Rust not match the CFLAGS here?
> >
>
> I think the C flags should probably be renamed AUTOFDO_LLVM too. After ca=
ll, all
> the perf tools involved here are called llvm-foobar as well.

But isn't it just called this because the config option is
CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
particular config option. It may make sense to rename
CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
this change, in my opinion.

Alice

