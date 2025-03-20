Return-Path: <linux-kbuild+bounces-6260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F464A6A5BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 13:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91DE98A056C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 12:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7182C221704;
	Thu, 20 Mar 2025 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjBrpQx0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238F22172B;
	Thu, 20 Mar 2025 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472033; cv=none; b=jS0qvvEBhABI6YeZqDV88JRFcsRMIfA8H8PvL1gH7V5QHlFU2m4OMZXnUmhR2S2C3n2DHVoC3ltWGYKeLozo/T5O6y+LKJKYzOd84DEQBq6TYJXgO96fT+hx3Sy6fcFU1Lhlool9tXwkXUPkbmgkmHEixeQdmPq3FdN98kSiA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472033; c=relaxed/simple;
	bh=+JpqTZlUDUYwRI2Af2UJVSssidKLH53a8o68argLTeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHJZA5/kWUZFLg6XXv/NTOYcGh79wtJG3AjsPu+nX9ANFRB2P0c9CZEiXhI/S8xGI5mQF67f9guVgyQyM4T1TQlGVhpAN2OIqOi+G17Fl0Bo2Uh1yuks4wFZsliLO7ikK6faW9Hq8u8MLx9REwYeh/KoNzRl0VEXpId54j6qs7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjBrpQx0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30144a72db9so165559a91.1;
        Thu, 20 Mar 2025 05:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742472031; x=1743076831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JpqTZlUDUYwRI2Af2UJVSssidKLH53a8o68argLTeo=;
        b=jjBrpQx0XwE4t13JwPSpuKEQ+CWt8ARiWNUyWj24H0JhGmtVZ7R1Tcuzkym03laZ19
         NGwV6zIkxySIsccdbm/uOofp2tM3Cj0hdIBc2HqXsgMoECXYkWUbVfq7UFd6Q72vvHPa
         RypwT7+98nIlmN15rXAaQeM+/zQugZuYXpaMMlDswzI1vb2aDFhAcQSTebD8xOuMfmp+
         7FtrRraTqS0tXBCqSI91COVdOXC8yneITQnH52scu2iWi7rQY1BmHiGp76ApfX9/yGZU
         OqccOwtskBOusqwEB0Y/HegA4Eb4QxoufBjhgFmNoqJpdCeW/d7ERXqIFMwkg392gX9/
         NUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742472031; x=1743076831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JpqTZlUDUYwRI2Af2UJVSssidKLH53a8o68argLTeo=;
        b=DYhRBXIZN8lQeyQ/hqIUd0N7XxjlJJQ4yoWmXOPh6wh8/NTXosgkGSNAanZDnUqqsA
         SAsZBA8PCBtEvUTEUIdfXcdA4IQjMaxpbs3k4Mg8EzRlrOArs6K5X/GyxuPY8S2JZuC8
         OpohG/pFFV3g0JB5nMeZBgYzoTO9WMSB507WJNcV9A58S05IY8jpf9krkPaLC90XDzZn
         pl97k/uM5Ns+fYrHOc+U68a+EM9AjTezDr/mRbTFZGkUrIGGdmFePXy5L5ZB/o72G4AS
         KRDrCWKVMN++xrBdUJtkShv4BiVhNtuw9WPxAZDJU8FQ/1kffB84wuPsvhUGmHxuiYDB
         jToQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZjn9NgStZxV/BdmP6oCjwCeYU3lfM+wtxjyhc3NvMiIasTqZey1HnKI1NGXEqjrhr9NdfxR1IMcYrbeFhMg==@vger.kernel.org, AJvYcCVN8M7etE/Cv3GHbTTlkwLQ4262774Db6OOMj3Ruvdx7eM3LoKhZibVj+TMgLS4iIe+pV9UF1VofQUQCqw=@vger.kernel.org, AJvYcCWV4/Gvnbx22P8aOMGVftQ/5pGfjmE7lIT2XICGUYTYtCeNf53jC1jFUzNOx2w+QpY5zKlo/XyDe6MoDpVD/KI=@vger.kernel.org, AJvYcCWippg9bRZ/yuBGHx7uJBnmm7BszaJC8KZNEpKBf5GwOT+IVVFlnhZP+5qdHKieBh351rNuOS048VqF3Ls6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5OJzcB7SESW8M9RTO7wI9uyuuGipsZEsXNEQUutiygnx5Zns
	19j+s4BdtQU0h8RUpBdsp6F2Hzlc8hkQG/+Vnlf4P12edV1QEWFQWf9C/BlODlW5K+fo16lN5rb
	WS20aavDSCuaVQ7OBsmVRZCOT928=
X-Gm-Gg: ASbGnctSw8QT8P/ya7o5RVD/q5QXrp15yMswBSNZfbMMJstOSOWUj991VbK8MQeraR3
	/tLXShSujVbRe/WDWEYpYFcatFd9bbmPoECM+ZWZFU/mLdYGOvkltE/roL6pfmiiqjVUePoNuQ3
	9x23VYLiSn5Ko4a9IdO/KvROgN6A==
X-Google-Smtp-Source: AGHT+IGLnHem81pSy849Xj5e5pWE83gWruoVX126M+G8/5J8tR1iaCU2Org4jEG9DcYNth8MQP8v31q+vtP6uB3x6JE=
X-Received: by 2002:a17:90b:4a03:b0:2ff:682b:b754 with SMTP id
 98e67ed59e1d1-301bfbd457fmr3463081a91.2.1742472031169; Thu, 20 Mar 2025
 05:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
 <Q_mSCTsSMDQ6DylWZTrkH1Wru3fQ1LFIiuk1pHElSsTc12fDdaCrgzWvEEQRE2_WBxOBzPuCE-qBJjw7LhHbjQ==@protonmail.internalid>
 <nh23cbbpf5yk6mafn7gz7urlau22egilideytnnh7paagusaih@t7y7q7jha4fz> <87frj8dmlb.fsf@kernel.org>
In-Reply-To: <87frj8dmlb.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Mar 2025 13:00:19 +0100
X-Gm-Features: AQ5f1JqT0bJ1nCq6lcjr_QnPneXhQ7sT5zkUrLM9y47BNLBzjIHnH9YbYE6UIy0
Message-ID: <CANiq72kyAx=wbvYWBTmPb4eppfvGuFsjVMa49nZBrXGbLEDiCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 11:26=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> As far as I understand, Miguel would take patch 1-5 for v6.15 and
> modules would take patch 6-7 for v6.16. At least that is my
> understanding from [1], @Petr and @Miguel please correct me if I am
> wrong.

So I offered that as an option -- I assume it is OK since nobody said
anything (please correct me if I am wrong), and it would help get
things moving.

So I will take 1-5 later today or tomorrow unless someone shouts.

Thanks!

Cheers,
Miguel

