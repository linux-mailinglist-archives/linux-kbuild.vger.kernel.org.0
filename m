Return-Path: <linux-kbuild+bounces-11078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCJ5FBhniGnepAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11078-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 11:36:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41C10861F
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 11:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D10F30094F4
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Feb 2026 10:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF91120DE3;
	Sun,  8 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP0LvGkM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A53469E6
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770546965; cv=pass; b=eX6lAeBdcbbjxBVOj68slZbNtlCkmXGsAwC6jL0/o69tt3mbVpZq0Bl8SvSOCgPAbTm4IC0U9zonyNSc476y7DyqiGju7qXalPhaWg06QZ4tufaV4QIYKfDn8W+RzwwsvBe+07jJtVNNAaLLPc68o7gNG/KWj47SBVHAP84Sfx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770546965; c=relaxed/simple;
	bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOTnJ/IOuVJPkIO5Kkq3QxrlZZOWrEl2wg80C1cMeX/5CEgi808b88QKLD1LBwSbd1mgBodvsHNI7v9FaLCJroaYOzQuWZED6nDH2XJtBIOSIMId8jzIGx6fHb1PTqCCig+mzF23sh7UIdGZ6QMdLVbqLItMPkrulm2xFy6wo6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP0LvGkM; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba716126f5so2243eec.3
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Feb 2026 02:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770546965; cv=none;
        d=google.com; s=arc-20240605;
        b=ezRWTObHGOTPVnaG24WssKYqnCAnFtw4PdS47IE6rNk0TfPUCLxYVzho7cqI0hQkLy
         6vd8X4j+kp2Jfa2Liz66ia5A8oESUSPv7fgW2b6DxN7aUFBYbz6aqP906mYxXzv5qVGF
         xy/y5bEEygvOWzZN7rgepHY90Q1jguNdW2BOYPEEmJg1lfRcaj63svn9VhZp9ahxrPit
         w74PxWRqPNE16Zj/wFDSgFcIAd1sVvNPrKxP/dhjlcVV6UeCFJzF0aWIPBMAlRl3W7Kx
         zO2uAGfduNJnYCI39X1+O3Q7fa6D1+Kcpjkr6/fSZ1Q5quoNz3OEN2GOmea88yugEjed
         p5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        fh=euXDDodO+dhrzLEQpRBhx+yqwO6h0zGYUNse/4aiS98=;
        b=DJuf+GeJv2I3O2U19ot/UDI2N4QdOCQ/6+27FZKXX7iECg64gO31IDQECq1rMgV7/0
         U6/C7UocEdPc2LWxgNXh78N8WklpDivPOdU7VT7DDyZT31BaRlM8r6HMustrgZRzI0W6
         U9Anr/7xSuLaKE8O6yynO8XQe7r3MjbqEETY9uy9d0W9xwsYYb4dC38QQ8lw8anfUhSi
         4WFnRzVl4ryHc86sA9rW8VoKIOqgA+862YVB9PHq/ks1yfKqp24Dy+eDCiqS246Wc545
         kL3l9SNsDCd1kLOPG5HrNBjQ0eP6gPrD4Mk0YT8OYspN9aysfxXcx7BQuiJUNHnR+D1C
         xVwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770546965; x=1771151765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        b=WP0LvGkMM7mVQRJhYIoXk1xKtuc467gglERL7CkEyKEZTdJk7O3QGPA+Rip8tHJXbb
         y9FKCb9ED/o0LFKD+CQSwBIN2CckVgPagXTdWVx6a/EwFhkhuO/iDrzf4hKgFNP4OT3P
         bR4X0YUgBAjAgRUd2QPXozHJ8taE3KMDXPiXHWIYv/+eiwoduHnTPkdiyPjCVh6E7ldc
         1mt6sj02lxcux24QcXESd2z1TUTCkOxfYfwwDdLfE4b4VsD4KpVhCjPSMkoV1cvBGGnz
         5a0M5LTL2txTgOHaYT87pmPP+NSa1B7XYMPgmxN7oN17QzE3eP61odYZ1m48zllAmhXz
         t/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770546965; x=1771151765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9O1wrWh3odojrrpWa3rmcifMg4603V9NZnEbcjcOIp0=;
        b=jMgxtlIV0oPWPUir0mdxY3Mo4e6XqESeHWuYlXV5rRzkDhbmmfCwfAuuekPvW9iZQw
         CQCRbVRZ1+10QE2TBu6scG5PAxKJPRFbcczYONzBi1Ng9MfqO4SMH9heYI/pOdujhg6a
         qcEh4YTpSh6y2+B+3Gc/jaPwUekDhlFgteSQ3mMfUc4dzRsHXd4VfXICxY5oVQM1VtXD
         WoL0ec2Lb0DJ/Lu9pLdKZza8Wt7zq9T9To2/lNe4vj3g2+05qUocXQyZdVoWrKfaLr6J
         2JSqpZEROkeqvxsJDrZApBnP0XyYSYCgHLBodwytVygWEEvXLS2vuE0MSwGipDgSw8zb
         i2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWVX8k9VMP0ubnaskjbpUTgrp3nrmIMKQi4C+sWKQXoj63mg2lQ4Z0vBkvS6nRCKRvU3yt/4z+8TUNFobk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqsUizQkfynr7Kr8m+r7ccGMLlAKpyWhRv3rhFPjA5qWhKm6SJ
	gy5Hu3iYYMT1gzSU5hiZDI+Z56xnM8pK85ZN2qojVIr0lRhkKCY3U7GTRp7TMFRxS8nNI2LW/1i
	skSnQQggSgZbEXJIujAm71SB+OixRiFE=
X-Gm-Gg: AZuq6aLSceQb2+KQwqstVHCsz/JlPPuvBN/lodohhZE/sYVpMt1B8q4W/R+w9S3Srsh
	NPsDX3N85v4bD9MK/Wc3NNZml4iUH7K5YiKdWFL99Aic/wvAdCupYEcdal+1djjCXVNyFuYrHbL
	HVJrHlet9ID7297cmRs2qeGZ+gJqDECvuNumleKrkC0BAN/ZFXT81+rv8736fqvfTCHyzzmdMwC
	g3yTSQH4+Wc6oUHYO9foERz0r2g/4s4KiMulxnUdFKrCeGQnwRp5JP4QX5OdFzU73RoUeW7ofAQ
	YYk46anByjKv262JbSVNo8fccGBSdBmIiHcMgBI1VheX4jt3bjJYNY507hIxd+c7LVBARSPLcvK
	xSPlhCqPVk87x
X-Received: by 2002:a05:7301:2f96:b0:2ba:705c:c8b5 with SMTP id
 5a478bee46e88-2ba705cdee0mr51988eec.0.1770546964617; Sun, 08 Feb 2026
 02:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org> <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury>
In-Reply-To: <aYgmENPRTdD4wCVF@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Feb 2026 11:35:51 +0100
X-Gm-Features: AZwV_Qj9Du_jkMva36ZyaDnahvdaMWuW_Dr2E9c8WWpcJW3fs4Mc_FBQ-9Oqr3A
Message-ID: <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11078-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CA41C10861F
X-Rspamd-Action: no action

On Sun, Feb 8, 2026 at 6:58=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrote=
:
>
> This is confusing. You begin with "const_assert!() is more powerful",
> and finally recommend to use a less powerful option.

The goal is that users use the least powerful one that applies, not
the other way around, because the least powerful ones fail earlier and
are generally more robust.

I think the first example is intended to show the different ones, but
I think the wording can be improved -- the one in the existing
`build_assert!` docs is a bit clearer.

Gary: perhaps we could factor out the explanation/examples to the
module-level docs, and then link to it from all the three asserts.

> I don't think this compiler implementation details should sneak into
> the kernel. The compiler may get changed, or whatever else, and this
> all will become just non-relevant.

How do they sneak into the kernel? Gary is explaining why it is not
called "link time", precisely because that would expose more details,
not less.

Regardless, that "link-time" vs. "build-time" discussion is
independent of this patch, because those docs already exist in the
tree.

> On the C side we've got similar statically_true() and const_true()
> macros, but they seemingly have a different meaning:

> Is it possible to maintain consistency with C on rust side? If not,
> can you take those C comments as the reference for what level of
> detalization is desired? Maybe pick different names then?

Please explain what inconsistency you are seeing here.

Also, please note that two of the three names have been for years in
the kernel tree, and that standard C also uses `static_assert` as a
name. `const_assert` fits the pattern and it literally expands to what
it says.

Moreover, `const` in C is not the same as `const` in Rust. `constexpr`
in C is closer to `const` in Rust.

By the way, I am not sure why you suggested `const_true` for the name
of that C macro -- I think it should be `constexpr_true` instead,
which is closer to what it does, and it fits the pattern on the C side
better, too. So that would be more consistent.

Cheers,
Miguel

