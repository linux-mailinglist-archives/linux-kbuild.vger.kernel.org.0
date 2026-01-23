Return-Path: <linux-kbuild+bounces-10835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGoRCPJDc2lEuQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10835-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 10:48:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573073999
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 10:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6E9301F9FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 09:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5C4352923;
	Fri, 23 Jan 2026 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtCVATXs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14F214A8B
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161580; cv=pass; b=c6+qu746lRtu3koRpX2GLYM2oQb8VL9H8nZXWtrF2HA1deI2t890PswVkrBoHCbKrvD8YreyG6nHINRv9CH2InRZoYG5kDeXvSKO1O9z+Oxj88c16wzzkC0OX3tVZUtgp04N9jayj5JOVmDLLQvi/F9pu0rK0WPXWx4+kuS2owc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161580; c=relaxed/simple;
	bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db6HUDMxhxDexyohwcHWy2ITTbenUzNY+ywd6pkJA2L932ZXI3pz6zRpNFDRuM18Ag52Iv6MspUuAxZhlf8OcGVISHFMXeLuOfLC/sPIsQ8b/UepkI24QwG/+S78uGLCzG24vSY8H4lf6B81oxeARWzX06uym1nuSIeDOwlqBoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtCVATXs; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b7267ff06fso162550eec.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 01:46:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161571; cv=none;
        d=google.com; s=arc-20240605;
        b=CuOEA4mnjTIleqdYVbgMLQ9qgpACUSDNZKX4A7KWn845BwKhHcdfOv/P4kAofSNOHk
         nJW13fFnTuT9Pmo6tuwB1TVVlM8AEDXYi5QoTK/kZxnTw19EATXghVvEUIwMZBvtCIGw
         BDmEwTYGNZynHQbn0ZDg83PFYZ0OGF3VVAOoTzMGNDjv626PrCmTHgfmGbfCFl8QvHbh
         mjWESHmEwyx2k0n0RlWB2C7zF3y4jAsGNZ3FJ8d7sbmCSjzxKYaZxZZtXkE5Svi9eIXN
         u9ohjv9wOLFhKsHzN2qNRkSu2UU41y+l1EXCG3mTnlXr0EmNWV9Y7OQ7PTM3jwTeVdx8
         xaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        fh=yn7citeF+Qjq6yurWQFgPrXoQJ3Ah/wJoVWvC2fAIb8=;
        b=HpLl4ouxBaG9Zpz26px6xb+6dQpE1VOKa/VOWf7C6PZK3aCUCAirRgKwznHh59QjyS
         oaXUkTSw9HYU2Pf4RW6DK6WtObltEsujSMVUFXzzUJrGsJHavQn0rI9CmzDbwenUXVC7
         P3Pnur1p6yTIXuyY08OxsEB9HMvkn/pzwnSEpcljaEJlD6X0h4ftgi3UCtDaNYEU1rn/
         6ODmW7pPQCvuySbXmvelH4gJLWiLe4yje7XRta5nXSclY2FoCDdNV0RJ+1wHqRj3RoeA
         RIVdwgjbsmV7R2WW50YDMlRu+Il23TNkwcUQlS/cZZ1+v1ASyFHzj7yhdYSS7jgE4hIc
         G9/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161571; x=1769766371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        b=DtCVATXsO5ail6ibN1GXlDcFwQfuG9+/dktdMsLHpjUT+9vptmUgwzEL6WCrK2Aba8
         Xz3mp6J1QJHVUVjaDYO5cVyZrS5Ofk4wSvCTgBGs15qBOy2RdfiN/MUtycE/WklikyYe
         DdaUU11Z9lHX4PeB36ANplJtPHWz3Ch8TwxxcyvKGmcFcPAMoiIqsRszMp39eVJg8BDA
         4zHvcUftcL/+cvckUpEBbaEnc9qhoF9B4nSom+mHUyqjQ2bBGEZHPsi8EgnmwcOtL3M4
         1UVz8NZcmt3CNexBCJdrJwIES4Zj9KlwHjA3Ce5fFcoWs7J/VrKzNCLvbUUCXsNfmOIu
         xRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161571; x=1769766371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGU0lW3PpoR/lCJr9zaXHdWSyoNp9uzel31o3OqO2iA=;
        b=ufPsdyK85Dm+yLtBc7SDfHQ2gSlZ6gpE6jwKtmhI1YvrO+ylLzxkrfi1LxyYoHevkJ
         lw7yQxBiR/lOEiC/HxW9Uq5WpA8Ss6GBHVzCdKU7PMiVFRCbA4BjcWrT7H/F+KKFA9vT
         UiEXk3klnt7JXCTAMfOogstMDIdUjpnX3TMXN8OnbGkMXDWHTRakUTrn9uhZ9dkRDBp3
         cgXAj3xHjfImlpPsZCyL6os3WHqPWyS94ASbxwaJpnN/5WVphVc4RhkwR25Hn+gH6/cM
         wrrVcWuPFFFnIHuByIgMEbUn3V+a6vst38a6/Al1Haq3Sxo532eQOUNvJq9YXRoLCNsD
         4fAA==
X-Forwarded-Encrypted: i=1; AJvYcCUnKNemF6EnfLfDnjkds7YsEuajncWYSZmmExYeo1zCPjT4HSSnAy7f/qGdQz2GqmPkbS97Nyf0FyG8GaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMAg9h/CIpZ7UuDwl0V1ltS9DrV5TRJpjPuYIMRc4JTFwoBQfF
	QhG+kLv3yw5yLBiQLO8HPBXy5b9T45o5UFnnthI/TXpYpB7BdV/C8DJL4K68sgrJUCY0s+X95R2
	n2nn5vSwoBCBd0pvwiF9Kx0enQGMoEjo=
X-Gm-Gg: AZuq6aKgr/mp+jJ/OkM3vebk8KJWChBJA12iRuwWwN7LiBY+SF5LpylAAWeCDyjidej
	mT9MqpV6xVrjGIu61NOg5KASH1IcmnERDUUd+naWlBw2sl9E2FyIG4X3p7pk4CRHFAd2kw9QT7t
	qxYQopMJIt7JAJMo0fl+VXs62HB58/0hOegt4NgGUtW2/rDM+ONCsVTBiyqQ5kBNfCqZs9MFHSs
	iSvGCU/5mfNaIpWWqVNRiewS2gHGcF34n0EcxSXSjp5xIQKxfi1FJbqgyI/tAbjcU8a6KGliRI4
	+1ebjtHrccwvQtuzMihS/lrdj0DiQfOLQhYiNHAVcvPqakELGVj5iBuI6zTJHM8QS2alzWM1nN9
	njz8oLprbmp2709RsFMeAD24=
X-Received: by 2002:a05:7300:a507:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b739bf315fmr648075eec.6.1769161570560; Fri, 23 Jan 2026
 01:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122054135.138445-1-ojeda@kernel.org> <DFV3AZV2J4YJ.3CQRIB59QRYBM@garyguo.net>
In-Reply-To: <DFV3AZV2J4YJ.3CQRIB59QRYBM@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 10:45:57 +0100
X-Gm-Features: AZwV_QhHw90EZaZIJJKDv9gslrN-7AVg8Fw18aflMn16Hilz5QP_uwlImwMcIjY
Message-ID: <CANiq72kvNbaufe_V8pwomSa9ZqhuR9XgzAtiuT84HRxcDkDD5g@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: rebuild if the version text changes
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10835-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7573073999
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We use the same trick for multiple crates now. Is this something that can=
 done
> in Makefile or it has to be in the source?

Good question: it can (we do it for `core`), but Kbuild preferred we
avoid it since it is considered an implementation detail, so I only
use that way for `core.o` since we cannot apply it in that case since
we don't control the sources.

Having said that, for the new build system, I would prefer to ideally
generate this automatically (and then it shouldn't be a problem to
depend on that since it would be a "single" place to update it).

Cheers,
Miguel

