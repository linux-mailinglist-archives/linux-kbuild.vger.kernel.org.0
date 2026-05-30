Return-Path: <linux-kbuild+bounces-13436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGx0OCzSGmqM9AgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13436-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 14:03:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035060CB3B
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 14:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BADB3043F8B
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DB63ABD9D;
	Sat, 30 May 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOLZXYel"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71537C902
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142505; cv=pass; b=l8yPHi1a4qel21f2GekEr80RzykmvHkDSzLUmP7xTOWc6JdLaj0Pz0WiKiwG68fB3hqkdtB+drbCrA3ytEZTjdjP4EoR0oVlCaRfyV//ZSd7fElLD/L9Go2alCuZlBFPGNGQwW8eG90qixdaM3Zs1mvRDYAAMEndgZHTdZMvVhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142505; c=relaxed/simple;
	bh=OCqszMk0ZgOWIK4Jm+n02VgcUtOHbxZDLR7gWYCvH4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCDkPnsfuvcxrmD/w4GLZS7/3tsxI2FpJV0A5avsBNzccdvX4mS3WHsAHX0Kt4HCJn0mRov5Nn4o+Per3Ww5kFT84Y2jW8tzZC3x+plvPKXBulUdC/XP9r73drdfI9PmqAaJg0KhDj+Al5O6219Dg0eLUW8CASjWk4n+bYUcdtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOLZXYel; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304e5d3cdfeso118450eec.3
        for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 05:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780142503; cv=none;
        d=google.com; s=arc-20240605;
        b=Lk3ciaEnvqgcR4qRsGws8/2utyW9iUD7kWHplLkAh5vLpDzSbCd9iDTcILOTFqN/cC
         AKqjLZTgqyOlIT0jqay2a/I4/tViMYG+1BQTY502r8CVcvrjYq5d0/IuY2Mt7719ZB9/
         WAjOYPmaSyy2Tt8XegJbrUEJpxAFcXFfSTvj8XhLPNoSOxNHhqMIZ+BMPccxcZu7kHHH
         i4OCSxw21qNIK7CN4wTiDbS7FuaIVd/Ww/zug7LcNp4j4beT8LB7+y4dctuDNbtu1Uj5
         EvLsrmFeDys2dTLu7sCaaqcDcHcSnn1/nmHvhY1bQ3J4lT/becdvG2Zqe4yloVaulpDz
         DNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        fh=J9RuK3LK1EWr7WWfKiR2Ium4SvBBE7IDKsiSgOYmcVE=;
        b=BB5PhaAl8JTvBlaaSIR5ZS9/SRj2GfR1DAOT9R0AyhE0brznlttKA7AUrdGszqM16d
         9t3n+pXjxZVJzJWNxMcUTot0R+FXcXMwrQMQtlIrlskNNwDM9Zea0ucfPswIvpUdxWcY
         JkAiZsymwXdB4Sdy7YiDsjwnsUXLXp3tSNi4G0Xrc0ohAAmKs4gGdcOkJQGbuH0jMEiE
         /axIHnedsbuCEbfGejpqZs4nm9H2u7jxlMiRYPS8RE5G7fp+KXL2u7FoiIYgGEoXLkst
         azLf4tBnFn9vN8wscz6YBxT4W3S7UL1ekw77emYPzx5I8aDNBrP0ZQj5TAujLk00M0XO
         O0LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780142503; x=1780747303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        b=HOLZXYelsos+2Pa7vM77drfVCTY6Gx/4PjajxYibJXhesJ5w8MP14JHfP/yL+1+pQq
         TN3QJH6z1lYzMCXcQlezILd8V0sL+X1q0rnYwZIH0pJOe79qfRrdxWHW4lVM+tRtrrBz
         0RW2mA6XWD/NcOM1OrcQUFv7oZosUTd4G2upj9BIoHeaRiL4ojCvPOHMbNUwxZFvstKf
         qhDLpsEfN1zhKu+o+HuS8Ru3vC7m16iHmqWDTjJdQoFah4BLORsf3MKR2dR21tKs/z0X
         Q9l6ymQZJJ9hdidx1o/Miuqv8uNHJIfgNlZK74Z672Z+tXUOB5Wz1w9zhJG7HnZ5XfXM
         aYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142503; x=1780747303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJn8/bdk1cE+ulHsADFHheOpLB5d3Qes9hugaPWOOuQ=;
        b=sHVHb6zqYZXjXOVYJrSgvmiqprkCxncTdsnzMrbahg1PTtRp81jAOYurHlva7Aa7dj
         zztTnQRhLlzkz7PPkhgBrG1lwJ2HRMEz0/qmI+4Efx0R0MZUvxdVxiMPyIU0zVL+4uer
         oeFwHFGcwX5p9oBXYoUdwARvLENZDMjxFDt9PPbAHV2XZ0EppedoZZJwqe8O1murhbuK
         R7a5Xf0eTm3oasfc7FWMM2mSavG6lFpC4R0+FGpvIEFlFIoD8TEjTk0jVgToreIod9UT
         HQeTFvRlEpr+sj7gyuGO39Ko/Uvt6Dga/y/GLthfb0VuDIa80zbLtvQzkZ8D+wRhhXbY
         xEFw==
X-Forwarded-Encrypted: i=1; AFNElJ9QZ5EbcetBMissNe+sAEDM4OzyKpOhphLY3fNzLzAGwP/dZ6zZR+3FIPmZ3ACECxzeVL5I5qht7etO0Vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaLrzwdyCI5RQnV2WQrUi34cy3OK1Vom3zSrwWz+dWxMBfuLy9
	YNLCKDsAuAG9ld/+4xPiGl0wEdg8v5ZjoSByTLWsqUGA1cMl1y9dpInCXGIykz+EPbX5eN2b2nC
	7/XtuX7zh1OU7NatYmeR4yPUVxj2Df1Y=
X-Gm-Gg: Acq92OFb2Z9FbzA0GCXE/GBttqfiab2MsS9Zsg1psQxcnTKxMqXFp2SWwzwfgYxr97k
	LlDpcHup1Sz4qieskr/V7PBYyI0/98wxl4c8gi4j2PgnkCWTPuFr3x2WlK3e94gTtL1N1TDBNh8
	l3dcnq3G/77vbhlsKBTmPS51Egie9fPriGpOFxceXR6o/kwSUDnFzilAuULpcSSdnvSGLBKQsi8
	9s0YtGV5T26q0tfEf0MEpt41lymqnk4NgsrU/sljnyW04Lm9ZwG0ySh5AcgVnDk8uHYsJrUSufC
	xsFJpSNi+Q+B9Ep37K/rsD1FfNmrD01zMqF4M3llpEgrV4rEtqf0zZsuoz4ULKZWxgq7nQvA4kA
	G3PZ5UQwuSfLB0ApiNur8nh6pNQQqbhGNOA==
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr774505eec.0.1780142503142; Sat, 30 May 2026
 05:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 14:01:28 +0200
X-Gm-Features: AVHnY4LGlmoBZX2w5sGabCmClFAFhHgoPKWwrt4LBnvwnqXauOwx3a9EVVcoroU
Message-ID: <CANiq72=1zmEs_Sc8PpMNETmHEXNUERwCaWddxjuTH-TuSLzX2w@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13436-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,zytor.com,ralfj.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5035060CB3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 1:49=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>      } else if cfg.has("X86_64") {

And the same change for 32-bit UML as Sashiko points out, of course --
tested that one now too.

Cheers,
Miguel

