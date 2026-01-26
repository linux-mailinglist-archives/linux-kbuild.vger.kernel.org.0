Return-Path: <linux-kbuild+bounces-10865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIs1JYDqdmkjYwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10865-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 05:16:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43A83D38
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 05:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75FC53000B2F
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 04:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E12529A33E;
	Mon, 26 Jan 2026 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYMiqTua"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAD28BA95
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400959; cv=pass; b=El4jCiNofDr0mmdrUcapscdKH2+PpivKKPsCmaU47VkdVoiMNIqmSwM+kCLhNAe/dz5lJqzzrvtJYe9+NKuYDx4v4jxTK/s6EF6dRpXn0aJCAYnv9+L4PnX5OaSGlet9L7ze4eL8VM+nfBUUus1VMzMxNxo6uvfFyYzYwmSSlpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400959; c=relaxed/simple;
	bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGP80VRfmp7ooftuBP6G4A6FaLVQBY8UabVvsAENm4ObfwpS/U21E4DCezOiRQGSxTSHq1iLQErjEDENGosDKTXMy+NXR45eEwLfVqtBr4vDLzo4y5cue4sz5nPndF9uwVi5iPFqgXGNaIValq62AdNnrmlHeQL10/4rbDwSHI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYMiqTua; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b6a868ad45so432114eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 20:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769400957; cv=none;
        d=google.com; s=arc-20240605;
        b=hCmct5RujBFtD2CabwsyET6jysR/z8fSl/LS9tSuqih670X4DAnY/MDH6vuTXUy4Cc
         NhGO+cSmSlwOK2RhLEGU9ZVh14ecD7L3Uwwt1MXt7QHMMgtlS2l0s/zP8DpTORbErXN1
         qGXIWqNPWPYPijulj82MVOaLdrEa7hP6d424MotI/g6EFRvijA5umDnapHZBOjg+BKvd
         l+KD4eqwzUsUE0QuVVZyik8FjWPmdShuyx9a9fMlGNugo1oUbO0tOWUm6d/6Lt+JxPgU
         aHwvRfn9UQ/grDtIQvPyUN+c6Xib3TVnEsxbeOIJhO1T8qdxzOIkP9FVEXX1KSBz4B3N
         bg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        fh=s7GbVbjGnuKc+OW1ju+fyqW9skZpHZNB7KgyxciHv6I=;
        b=RtWBzWmqR/AT7zydIngs6Ufuf7s0rT0i/mB2fcHv/VCpYxCLuTxtDkbKPsdFlLLMMv
         OfW0nD2l3DJxn1XFz3zugdivUPuV5E2Og3/PXE3w5th4HJOgw5irA4mss/aMZQNhRevf
         ZeV4cjWKL2/Xw2z77OmLyGj+FtkVg3elgJsWanD6kyeJ1CLOXkIWsPh4xR3POMvxEBdX
         ofFkoBSY/5NVCL6whketEuFkzca0P+Ii0pmJ0HM+QeSvuTfmnvC45hhTMzwJxZ0dETiM
         Fqi2qUxTEDmRUvVIGXDW5RKL09CbE6Er3Xqfo/oQyYl8zYeQYVPKaZztMY1lWlLMwzVi
         k68g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769400957; x=1770005757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        b=VYMiqTua1ZQLzsLKQw2eDMMA8+Bdkc9wC5mx972UmgeTE0bVPnAVsAEZIEdbrF5ezl
         lJyO8YQbibI62jZTeAluAD7vut7LL0F+LoLA8KQACZ5niFG7D9YR0/C07tseYGreZwUU
         vYW8L6xHZyj72Nwdh9iCrhmN4MumurLN1ZajZcJ4siB06kD64RQn/SHIEDeSGaMy/qcu
         at6i3QOLPMN9rpCawIq1cYmXBczWcVQ3j4sZrQuVfExfagkX45+Vjy1oKeAf6GABEnmA
         VwNv03zc9vOXjLi7gAySD1b3tl3gHkD+E/+EQS8Shd99m85wleGwydAY3iQzuZ6Zn3iM
         Of8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769400957; x=1770005757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4sRl6QEMGhNZFC/L8o4zXGaE9Xe5T4wa80O+hqMUdYM=;
        b=WtE3ydCH7rEuJCRlkKGNLUqzlH48qDB3sTAhz1oksZDkp0XDxd0fAr1L+D2w9OOAbc
         vj8d2bEB0wo344avPz8FkqeEBhfdTs1mwxEazchgwe2pzTBknVhswy/KiteRGWnN5j7I
         BPjU5RNKw2jhGsWvksKqjAoS2DMbcIP6RFBkH8uubIJe3Yk6DSvn9zki6pUrSzMroil+
         kINH2IPPUhMkzgsq4mbfHCzEfhsCnSCtI5y50gS1gDTV9olljfJhz+Tsbkzwyzsg0B5L
         b5NrPrCUsmC29f7ci8oz9Y88BFbneETiz+IqY6wtvqVlai4PR3DqyznhXDupp8SIPDKG
         fOuw==
X-Forwarded-Encrypted: i=1; AJvYcCWBse54BGG7lE8oiRzWpUBQWNVhLMa1Jt4eidQBS3bXUhdyUS7p/FY9+pb8eQfjNJW90OvuYDVlqLDcDTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvv8qfP8UBJ/jYHOUEntIN0vDzgEngQP8DUl2GEjqVJXhszyGk
	aPu1lUsdmrmK+2+r+lCcA8t/ztXd7RVYchfM5uzm6fifiwtegpmWdG8nQD/lSEIDHsadgBItMo4
	gkVxt7+ZfeIaqetrF/4vZ9ypjMvGN6Ek=
X-Gm-Gg: AZuq6aKbE5WD1euX4nbXDkxCcMjDeB3UPhsli0b/j9lDnz/+NHz1I8vp/IFZaf8Ao8W
	EPwYzkZN9WYLHKKmtUj6XGyLNgWtWUKApNz/fSUloUcUkozIq5V+UuxteN6gRe7FFIrhZNqevNE
	uf/4H4qK3dYaLUzqYPP98uEvIisy3B7ZZ18uTRYK/bHwgjfKC63hRWg8wd3R2pp4fgNBMKpAXUe
	eVVzKvklBPJBHKSo+lqCUSRoTaAVaqHVZeLP2v3WJ0Rm0GkoJ8FK4KQ+JRuwO2enHD6n1Y749KC
	H8RN2dYLEok0wexAt/cJ55Vjt9fpmdKCfVNRx8biA4DTGV3ihyy0uhK8fzMB5F8W8ySwIFT6KDE
	/iatZmnLxEvXW
X-Received: by 2002:a05:7300:cd87:b0:2b7:2d5e:3f45 with SMTP id
 5a478bee46e88-2b76420a659mr766944eec.1.1769400956753; Sun, 25 Jan 2026
 20:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
 <20260120-rust-analyzer-pin-init-duplication-v2-1-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-1-a1c76f0d3bef@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 05:15:44 +0100
X-Gm-Features: AZwV_QjCsZHapAOek5NjsM7OI8JLH-dBLiS8N7JjNtU5aKmN7e0b8px5Y1Pp7n4
Message-ID: <CANiq72kC58jdpyxx9AjVD-2cMHVWHAfbhZ1AYBu_MESsH1uYjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kbuild: extract configs for reuse
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10865-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B43A83D38
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 5:10=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Introduce `pin_init{,_internal}-{cfgs,flags}` and pass these new cfgs to
> `generate_rust_analyzer.py` to reduce duplicate information.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Looks good -- my suggestion was to move the two rust-analyzer lines
here (`--cfgs=3D`) also into the second patch, i.e. here it would just
be about factoring out the flags, and then in the second one you pass
them to `rust-analyzer` and use the information.

Doing it here doesn't hurt, since it will be unused on the script
side, so it is also fine, but I thought it would be more
understandable the other way around.

Anyway, I could perhaps take this one with or without the two lines,
and then next cycle you can apply to rust-analyzer the other one.

Thanks!

Cheers,
Miguel

