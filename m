Return-Path: <linux-kbuild+bounces-13138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACRHCNunBGogMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13138-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 18:33:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F56C5371FA
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 18:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37407335B01C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 15:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F463803D7;
	Wed, 13 May 2026 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePZpomXW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F3357CF7
	for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687315; cv=pass; b=NGUqI7I1/c5eoBT5OqTC2ZmiUKRCcmhifb6dn1a/GyHEfFJysCRFQRmrgoaLuaUfrdYBeAD/s0VxbVrX1su9+qMiO38Cv3DliOj6LmYftduNqmNPgqvmMubYD65lSbH+veh980T6hyyRLjyJpv7BSQ8jIIoO+Md6xJV8lTFFrK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687315; c=relaxed/simple;
	bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzU/KOiAeH3+BAxYCvLor9ZMN5AoFi56tUqPpPV8Q+OGOI925QKp9lPPTNPjtSEMN5WECsXZdjU7BxPC3Uw+STrBWk8hHIDzYLVfGeT6t1eg6CdbfyVrvtQpL0c3V9zQX3dFajS6xZ530y+fNMNHKMXfXHUTz7k4K6IhXbq/jlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePZpomXW; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1161232dso614476c88.1
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2026 08:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778687314; cv=none;
        d=google.com; s=arc-20240605;
        b=c80HeFu3+IGeIRSBtuYJNMBxebqUGriOEhIuhjToLfvrQ9/cN8rzLqexDcUdeDwUgY
         I4i3ikeFtZWSgiiM5cpnF2qUUNkdierva7ZyFcpktfqkhht7k6TKt07VNLe3wRAVW/Ug
         EfkyT49ztSX3OxdCr/Vyj7dmzEgabflQBqnpzLuS75T5CNqtHgp0H7O5XMkLc587uo4o
         /NgE6do6Ir46yxGjtundt6p5qkHBnSaPSnKdWizttfZNK4cq3TdBgXXmd/1MSuo/v7De
         +Ltf7XCyATqr3lgpMx1WrTN+v0NH0/LIPXXNc+ePIdnb0NZeJEzKD0YwA8gYF2eq2nFp
         tM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        fh=JEGbDVC8dyEpOGjWyOW5ZH99KYG8EgEP6ZTJ+A2qrMw=;
        b=kC88mg9/He3H1rRwteILsoNTdzcqP6Qs0GHBzgHPol/i2r7ok9rl3dAVn7IT2ob7EO
         5+NucW9elqzD1Xabu8CdFXrUulZos7GbujRblYLSFr3PjAr/SqWAQ4+i+ysac7VT+CR9
         23R2c7zeE3etDd+zkyc9fHoS6lsdssLbZtCaf3MxBb4gDyniclLDDVcQ0r6e/4qldoX/
         weRqS0EVlbPmiWb1jMC14CaFFvNoMDNZnP38C2XVAmXX4HrkeujOZUJQhB71kAEzoGN8
         11HTrBLOa2AX0SpRFSzMTrDpKrW7zJUWc6gUalwXXpC4WizNsJcy322Arm7Ks5n+iwsI
         OmIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778687314; x=1779292114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        b=ePZpomXW0nt4BwzpgNwkpszZlpW0M3L5wnN1c+TqgOTXad5FgCj4YCHT4T4Y2p7gZM
         kSMXpTRLUi6l1rEliqC9SlwjZ6C0c5IMPiY5LEt4OP2cl7LbpM2N1gdfK1ywhbViLU+J
         PmtC/0Q0Z/Y2JKCfkk9qOlrrm2mklqz08pCzW2B56xhZVbq6cDPsMJ0q0LeSMnpEMWtb
         Q5YZ3f59F2s79n4osu+UikGmGI4z1LQee02ELzx1a+5jY/6twKLLYmcLCAKhQ8QQi1mM
         O1X45VZRIkAaSdrVQp3EqZBz7qKXcT++xxYOvWnAngS62Ds8cHW7SRXjIs8VZjFHibDF
         +hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687314; x=1779292114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        b=Mq5szQ7OH/0SXpa0XSB6lN62lMoO5BeEgnxt8TmC/OtsZtlJz9l/2KRTBaz2eiiCz4
         9JG2MP5+7O1yiHYB4RWeg4igrGMTu+pKlK/Gi0tvMpO+c0mLVjKvI2Z3gAXFDa0NySez
         9nsSEnkVoXGqIaDGhCS8BrJ+YvXM9P9NG7ACzOIDIGWEnI77ciQTX9vRcxGjQuYN80Z6
         jSS/JD4fr6e60RtUtEpRQxG00lf2zdZIQ7k3HX24akx8WZKHcnTMBJXJqq+v+kFMu94K
         FPlGCEnhPxRZBTYXKxqNI8vRFFDbiePTIw5GloSpT1zpUVcyDPoYTC3mPFCCDAlfvFD6
         MWNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8js4a9dJ2nlSo+yOxzUo3/jsYGVGggCXsOTEtKMR9K7vswkIkJOw+oqcqKC9SYSGxDVd7udzr61E2eV1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBA5wRnVU0gERv9c4LB+ypL5j13COf4JzUtpMSs0whLlSMg7JM
	TrdN0mERSxmcTevyJKC1t2c8SFFmEtSQm0+PI29HQkajcMGDcRSt2lJXCFEzb/le2GOEvKCkHzn
	lA8UCOKoTmKiQKf/8Za7+X0M/bu/CQjY=
X-Gm-Gg: Acq92OET22Q8Gh8CnBGnj4sd++cv3SuEota4tbR5SSjnJEpn786Dygnkm+QsS3ksapp
	uub97iZMjLR/6xLZKMmYQ2nhOGvr4RUvuqksf3ryspcdgB/SPJlLDTW/FcBwjHIUUsRCr1FbMGd
	qa3aPWLALpVUj+S7F4neoSg7zV8sg1W4je4dkMDdBZeRWpWjSzVV0SIO4lGPI9FAKA1F/HStOLA
	BZj+8mia578PNMM1KA2rFdGJTq4xZW4v4/1JrFE5Ej45Z/ervBuqSrb5xS7FvJS5jwqFEE6y0zh
	yM2nOPJ2unf53V20ScsY8EaUUp09E+I2g+FFuX2R+zysyr0fo3dO15ajGSYWid9LOOkr2adqWDQ
	l3NqTkALPL9gsvuSn0kkRZZ4=
X-Received: by 2002:a05:7300:e425:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-301198748bamr1226522eec.6.1778687313541; Wed, 13 May 2026
 08:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513145425.1579430-1-arnd@kernel.org>
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 17:48:20 +0200
X-Gm-Features: AVHnY4LbTrmrS9TyU9LR4vM776F1M6zVZyBYrHuDnEqo4hrsMhud8cQe5uMH7DA
Message-ID: <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6F56C5371FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13138-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 4:54=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> With some more experimenting, I found that marking these functions as
> __attribute__((noipa)) is both logical and reliable.
>
> In order to keep the syntax readable, add a custom macro for this in
> include/linux/compiler_attributes.h next to other related macros and
> use it to annotate both files.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I double-checked that GCC 8.1 implemented the attribute in commit
036ea39917b0 ("attribs.c (decl_attributes): Imply noinline, noclone
and no_icf attributes for noipa attribute."), which also happens to be
our minimum in Linux; and that Clang indeed does not seem to support
it (not even a mention of it in their repository).

If you don't mind, please add underscores (i.e. `((__noipa__))`) and
place it after `__noinline__` to keep it sorted (the file is meant to
be sorted by actual attribute name, though some entries were added
that break that, but I will clean that and a couple other things up at
some point).

Thanks!

Cheers,
Miguel

