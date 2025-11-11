Return-Path: <linux-kbuild+bounces-9574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC369C4EB89
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 16:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1CB23B1F91
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04CA1E1A05;
	Tue, 11 Nov 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lfrQT8UK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1D2E62D9
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873558; cv=none; b=N2/Z7WAhyuVdS8yvFzQhtjS0VdMr5npSCQXXKG/2qGpYvXyiMgrIzZXYu5/ql741wtoEKBDDsi1DnYgK9A1hZ7ijHS6qBQQCtDLMoSQ3f+ccwGANhOFpABVTwt6MIdogk6vcNWvDHRdUd19u7fH5wScjxQA377csxOOvgNB/Wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873558; c=relaxed/simple;
	bh=SfMT/5nRjA3afLzv9Foi5iH+LBhxZGY4UrfDPe3Kods=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UzJdcGQQsSc3DTP6iw9gHnsLcbV5MaK/klS1jhsKH5Z8w72+9adosdTY+gEzbJqkA/8SOtuhDH58Di+Icii70xBjS7x16MToXoH+udu/50YJqtBTV7ERvgL7zYCEtyIcRnq+DD+U8R+QxSUMk3OBYcY96A5tBgfT+SsY9ixrMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lfrQT8UK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4774836c376so22941915e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 07:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762873555; x=1763478355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfMT/5nRjA3afLzv9Foi5iH+LBhxZGY4UrfDPe3Kods=;
        b=lfrQT8UKNOejvXqbNKuOq2zmRAVsY7hM/XzhrWNyvmB+Qs1b2pcRDVhoeGeffXqlVr
         NBxUGPqGhhKktU+FHSIJ1umcgsEWVpbXZJgXN4N1dRWS2HO4hs9M3xkVhCifCOJxfqo6
         Peky4QnNdN378xqXzHDkw3IxKg+pbyw9Uips+7UKsI8W8o8OjSvbv57Z0fZagvLllRvZ
         QW4IKHepAieNuLrKGVvuslv4dzi0fgozF7BkW9kTsOXjC3eHDtYdmz/AraZNm5rUxOWx
         Fnl/hYA30ITCU006kQXGNqXKFcurUhrkvgj2LZmM22PHDmMx86SU+XPDIPU5jHoEfi0j
         U66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873555; x=1763478355;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SfMT/5nRjA3afLzv9Foi5iH+LBhxZGY4UrfDPe3Kods=;
        b=KhEnl9crjVnsZwRmcOjLs8CZ2RfpThXRuAqfq+hYBRw8wn53LQn5O3N6kBfKP8cnDI
         QPp+kqd7xfgSeBWNZllEvvGHUmgZLDeRgB6bUEQ1Q6mIriEHY+NQJFEkb6wZ7Q4so//A
         ahfHuVcLOWN5vWJ0Dm1XxdrMoF1/KvE1W4a/8hXliQir0k5sSkvA2L2QgLQNgTJKmB2s
         n4rY2c9h2OS0YnejWjV1cCEneoJnty8nzqXLoggkwJIgzHza+T8OhJNvw1T8hxMy/2kD
         ZFeNfmxiJM4F66rVZEViYEyBIuyey3ZG2qs5MI6N1/ugmFzfDxrkEp2blCwFg7zi7r2i
         w7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUIxBYF0s+LrsgYIYeDW60/dI9iFkSDQteoiFekO0Aco6DEUV1rXR2imXo1wir49TvQ27U2zS2P4HKqylc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAmimGlyZm4TGqVLf0+TUs7j1IqYjIN3wK9e9N/OlxblQsFomp
	rDddT+8HayOvaCa/UA4S6+m2KMkWXkCtNRfIZcOUem0F+08A6/VbB/K7lSVpB8EXSJRGaO197zd
	Wv9Kw+9/2Cy5Fr3nICQ==
X-Google-Smtp-Source: AGHT+IGvgucKwyCN8EF+pU643WbqgIgijDo80ZsWN9AosRWSEy/CQyb/HN1/S31aszXHJHlV1eCqBbXhnvjyXGg=
X-Received: from wmlm3.prod.google.com ([2002:a7b:ca43:0:b0:477:554c:6842])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0a:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-4777322e253mr92021425e9.1.1762873554751;
 Tue, 11 Nov 2025 07:05:54 -0800 (PST)
Date: Tue, 11 Nov 2025 15:05:53 +0000
In-Reply-To: <CANiq72m4K+UZxodnKqdx3cowbYB+Mj_Z0gB63j=3jE+E-x+3UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <aRH9Tjf0tszyQhKX@google.com>
 <CANiq72m4K+UZxodnKqdx3cowbYB+Mj_Z0gB63j=3jE+E-x+3UA@mail.gmail.com>
Message-ID: <aRNQ0dymO5GIBc3e@google.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 05:48:51PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 3:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Is gendwarfksyms actually present in 6.12 upstream? I know we have it i=
n
> > Android's 6.12 branch, but I thought we backported for Android only.
>=20
> No, you are right, this is just me being overeager. It should be:
>=20
> Cc: stable@vger.kernel.org # Needed in 6.17.y.
>=20
> It would only be needed in 6.12.y if someone actually backports the
> feature (which does rarely happen, so I guess someone could have found
> it useful since there is no Fixes tag, but hopefully people would grep
> the log in that case...).

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

