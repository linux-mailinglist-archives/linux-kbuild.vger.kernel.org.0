Return-Path: <linux-kbuild+bounces-9669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1322C6A968
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 17:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 31B5B2B610
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Nov 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2074136CDFC;
	Tue, 18 Nov 2025 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zqwcb0P4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9193730CD
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482867; cv=none; b=FQv4HRYpZKzLAERr6IsvNmLO+C8UyUpCojkUZ70az+Qtq2QBBLAQTOKA+iZRbUHl2S7iRnZNroDLvkeaziuiwcnrOqTIZuhjvix7IsLWcqUwaSQHpnRRZoaQ/LXO8sian8yVNpDu6Oo9m9AKsL7WLDSyx+vWvGcLtNr9e+jixSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482867; c=relaxed/simple;
	bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppA6T/AxTec+IlXdxYqrKcNcge/FkuoKeUwzyQbrwNGpgdXDdzM0LiPPmX/u61OxPCGHZli54iInadLGcVgfAknuUTSj22Iy68hmsQgJ7d84LAWhDqNZaPbWWqQkwFPEuUgepONDAuAZf6pOAa82Gr/UIFn3o4IRZzc0jmOmGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zqwcb0P4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso515448a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2025 08:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763482865; x=1764087665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
        b=Zqwcb0P48+Opg0PaoHzGH2nKmoyDyyWA0N0PNFgCZOOvSciSj3ry1FttgSdglPBrLu
         OvABB3L07dtuewiVowNYjlByh7RpAr2ZENjqlwK8K5b6nbe2CsalMtbjLWt+qQn7I+qP
         p0evDGvas187GEDn4kAZShlo1qDSOjoJlKWiO6ova8+TadWigOgVTkCPOG2rcotHtH7C
         UfQpu+AHtSbVZCssdbrPNPaQuWsHvevEsxO8ss+k8JhTuBvI1QUt40iUmWvjvT+tgn0z
         Xqc5Gz+Ouvx/1vYgVcKShvUxqGgLGR9JtSBlTwyrMAYot+lJRjK+TlDP6ZkKFIugUIWX
         UhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482865; x=1764087665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=faOfBULiO6Qp0WVmE8McFWL4GEnAP8ye2ZQBGtxMog4=;
        b=HaXw0N96n6ybbGt2MeDHzoFvZI5Zdqo1s3He1Om8lhcPfk7D+U9HdaJeKKVFUMCoFE
         X90a0r4Qa+SKh+PEsbOTzVdabQqVKiMHWkyaY1FFP3Iu7P+hJn51EK1v+BX3SDYvfG5D
         +Yh6hp8l9givB01fqYz8V8Eh2z8dtcVmZlYltZ/IPuVcvYijy/OQvUmJs3Pigy3f5Lvc
         5HVHNFKwOTJByguw/9FplH+maxmfV9yIRi/u3rWeIaKTjeLwaMmmTg09GXJFdSbLnruK
         2cZiWsf+oJWMBRsBmw6xZrPJ7o1A+L13zEuyNK+Dr7qUjkoMgYdvOtloUKWbbuo1/z7h
         umOA==
X-Forwarded-Encrypted: i=1; AJvYcCUZTfeiZtvy9Ta9g9u6H7rnqLjvJrTgpBFv/t07IolKD5EtX4LIe9KEQMva5Eq0s665hL0IJZc9b0aJvoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Iz0cENPh6qvHs2PDcpfOldXKY1EnxyIpuMhF3P1wbToN9Bp9
	uKXTniIu8EqcGCc459LcrH9Ilh8N9OcnPO6HBYuMUCTS0SB0SkMpqYNYlfSOjV6nxnZnj5MId40
	x9NWJdiio9GfsmTtieHzRQy3JgfHdmNRSs35F
X-Gm-Gg: ASbGncuMg06V32IQMIipSGUsiqT1LIZKM9rvBlBnOyEAMemCf9eqAyMnUb/VCvKoBx2
	NkSb9jgW4VBCfFvrTF437XYWSS4x4cphNfe3p+SW8kpFum5V+MuJFVIdenZly34qbKuHJalQGhv
	53y5wiG4CYxBInejrXEd2RfcaMwiTyx+WqkPt03cR3/6RRJ7p0O/T/EZs5GQFmg8++R2XppAW0g
	LuKX3IK3ECHTF9RjlUbvgs/wW8LkpOg9/x6DQxRyHiWgcF+7QwM4WzTQIxuvw9nTVpm7hnxrvln
	eByEKLw5yJ0A/Ls/zgVatF/tjnDAIe2eHe5t+CQm3o+Qr2uoj9rvH+9KmuhtEr2zP5UU7CEM20x
	tBvo7VSwgOaGxPA==
X-Google-Smtp-Source: AGHT+IFVRdNsejBm6GKYlYca1Ngn1yJHjVdLnMU26Ia9C7PKBAIRtq1oGRAnFqiiyXtONzw3uw69CCzFP8m6+uCM7y0=
X-Received: by 2002:a05:7022:ea46:10b0:11b:65e:f33 with SMTP id
 a92af1059eb24-11c78ddf633mr1026663c88.1.1763482864497; Tue, 18 Nov 2025
 08:21:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <20251118145741.1042013-1-gprocida@google.com>
In-Reply-To: <20251118145741.1042013-1-gprocida@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 17:20:50 +0100
X-Gm-Features: AWmQ_bnVmxUteFT3dr5VfpkhZiAQKyOG1ub40EZh79PVRCrhks9ZqnFaWxh_hDc
Message-ID: <CANiq72nsU1YH3ihkaTiVjF_YUZY2nSKbc7j3xLTcHDC-4-Y5iQ@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Giuliano Procida <gprocida@google.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:58=E2=80=AFPM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> This results in the -T foo option being ignored in the case there were
> no symbols. I think it would be better, consistent with the
> documentation and expectations, for the file to be produced empty.
>
> This means that just the for loop should be skipped, say by adding the
> condition there with &&.
>
> If you disagree, then please update the documentation to match the new
> behaviour.

Sounds reasonable. If there were users relying on that, then it may be
best to keep the behavior as it was. But up to the maintainers what
would make the most sense here of course (moving Sami to the To:).

Since the commit is in mainline and it seems you already thought about
the solution, I imagine a patch would be welcome.

Thanks!

Cheers,
Miguel

