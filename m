Return-Path: <linux-kbuild+bounces-8817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B5BB562A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 21:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC0687A21B8
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Sep 2025 19:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C6423D7DF;
	Sat, 13 Sep 2025 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqzklJNC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E123D7CF
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Sep 2025 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757790220; cv=none; b=BiqRozPf4j/MafhRR/+8cjlEp/DGW9uOepG/SqqsjhkD3ZWU1qsVWKE21c4XEKJperIYZq2kwu1KrIRZNTG4D+TxT6/kmZNVZjhdDwNhVqgKk0zRUDxMwx0ZuP34P/7S9/MkoHLy4zvvGVrmR2+0nHs6TmXFOVrBxzURDZRvLR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757790220; c=relaxed/simple;
	bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7k+tQLykoq3KDaqufbxxEqb9z9oOpD7pyzc06WJHAKiTRAk9vG6Bb4i7ZrsW0uo7D3/6EY7CLDj3eBY4DEUG8sNkcI8c7LOEw8CIGJTct0MppxKOS75txJ8+1/N9KUaUbGeLmnf9O1cIo9JaXxJlfDzmD2We/nVHHYw015P1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqzklJNC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24cb6c57a16so3437345ad.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Sep 2025 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757790218; x=1758395018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
        b=YqzklJNCC7ugoWV609NsZqLrlGyeN0HpCB/snpzeP1sLbihAMbdfDxbjov6wdNMIse
         muZEAzGT8raQc8TTrrt/DEdjjx0qTeQWnIuFDSLCKcFFYy3lNWEAVKUqlo4cVgQ1mZzf
         GZrr9haoJcM/seKiNY/ucGnZPueL/1bOLQiQnUh8fVXnm87xXJypfoTFC5pjRL3F9zV2
         XDW5fBpr8NwDrqZQ82Fl8ULGaT7yUs3TjnN6CFMQHp65pRsXgErGwPmXXHjQRVmGX7mx
         MQjsv0osmK4ZZB1FcEzJSdItLVqKJWxkGth8moAt4Fs2RcempZBNaMW9LUVrABNHzflA
         Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757790218; x=1758395018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
        b=Sb0hr3Db5GgAWz2+h0SICqNqtwuXbYm4doldT67RmbzLaTHGvfU7avodYdBBPVvmRv
         drTMPA5UZ7fYJ+ySYGrhYC5X4cd6BvDvkcYCixAsTpMb9uoLWBF/iIvFzc8UtUCPpjBz
         j1N+sdRrzWo9wSWJ7pC6f8rg7psPzeZluexv07kkoR7lIvT3kQ3CfhxFET13uGGf/1uJ
         MYyeuAqM2MKo5JMWQ/jUcX8Fd8MmvnW9Dw+IrgoNGq2m2IdAKOaxQxENBZDYNO8rxRKb
         ADiXw6W1ziCQ7xgDpYdETGr4jizp7BvCOlV5PrsXbBVvwvR13sg55gLdMlCMeJSfY2tj
         kaYg==
X-Forwarded-Encrypted: i=1; AJvYcCWATyhWSuKvzEoyVZvmYpKIoeMEzor1RR/s1624rhgBHa8Jroshik5qbnMth86pEboJRJanAYDvti2v5BI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsI4FXK3YqXXfXIIMFJqL5RPEnfQWpbQNIW+aq4WJ3bAD8dgl
	KUIxZLIBWL9PpLMsWb4eaNEjw3SpfTutgHgRjnqk326xajwjP20Or5TVAX/XaYrxbMx1La9jSfc
	F2Rz5POdPq8N7fmVeYbheGqrADZvWOaY=
X-Gm-Gg: ASbGnctS7jTOqdt/AB8vTqPEu7GPktWH5IH3uHeQfFkoifPs3okXIFaw8FguqktNhn8
	iiN/VUKswAJkEobbJ+Sp3MM3IDYGBuAaf/N27QprqkaG6IwasJVLljLAq609CqjmPwatsMX1uWQ
	hefb6rkNub7+8Pake9KPXUZgFK0IuJctlmjLCVi8RIADYyT50dAg1GrlTsqcatD7XALnA3YSB4b
	OD63zOHlNerfl2QWFGnO9XyWNd9f1RqKsp962pGqkjwP8FkJnnEzcGptCNJ5H2CCUybKtmeLB3l
	vElrzZW70k+sxHeoCgHZRpU2gBj9P68vNCSa
X-Google-Smtp-Source: AGHT+IHB/p3aamI8tG9kOMmpITgJyh98PQ9GJhpKrDDNtlxPb8Z7RQ7MmcePFRjRvqHcelMNs9pcfv+bsQ+RJAs6Q0c=
X-Received: by 2002:a17:902:da87:b0:25d:8043:7832 with SMTP id
 d9443c01a7336-25d804381d4mr48208615ad.6.1757790218426; Sat, 13 Sep 2025
 12:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <-ebVaoKp9tTjZGmdSRi8rrH1o7SgmGyyzk-g2ALSCBKPJP44z7dSPCplhwKt-sibwLwqP7IPEml6qCkSpJhd8g==@protonmail.internalid>
 <20250913100847.9234-1-work@onurozkan.dev> <87bjnei6tn.fsf@kernel.org>
In-Reply-To: <87bjnei6tn.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 21:03:26 +0200
X-Gm-Features: AS18NWCQkGD0dQVq9enzHNa30IHtZXRVI41tuTqtURXPnwY5pteGtWO1FPfH2ls
Message-ID: <CANiq72=zP0TLCjM+ySOu3Zbn_UnU8ntqb2MH58cN60O0Voe+hA@mail.gmail.com>
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, nathan@kernel.org, 
	nicolas.schier@linux.dev, masahiroy@kernel.org, aliceryhl@google.com, 
	thomas.weissschuh@linutronix.de, tamird@gmail.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 7:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I think this is a good idea! However, it looks like this target only
> checks rust code that live in rust/. Can we also check code that lives
> elsewhere, like drivers?

That is more involved, and I don't plan to add features to the current
system, sorry.

Cheers,
Miguel

