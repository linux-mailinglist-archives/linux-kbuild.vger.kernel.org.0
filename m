Return-Path: <linux-kbuild+bounces-9506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C2C4661B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C9C54E540D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E944B30BF67;
	Mon, 10 Nov 2025 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbfLQJ9i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF330BF66
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775441; cv=none; b=Pri0sSelvCZ0rpG3BdHD6lxFN5HgRFjDBiJFfwt4SDGNYrNbMFbGO75L8F/um3FdULIoDU5D7umhJYG8pTzQMbR+znfjAjvjfVPkRSwA3vaNrxxpFsaB4c0G7m42tSQpr5jzGkIKAh0saGyZOEPeik4xGHwVQGXe7Yt2TfB2JBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775441; c=relaxed/simple;
	bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YEidpilbT8jCevvZxECU5zggu/2yz0YKBFlCVr3PJGdC9foBAOZbnBwplRR1By1wnpuGazdha7TxQfHLbh1wcq0L4XUURZXQDozYXJD/8eweCBeqqeO2bq13cbzcA+Jl2vWPVUDTXrDCmIu7pkMOMEhANJx86tPNRxkY5YUKzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbfLQJ9i; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7270cab7eeso260866466b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 03:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762775438; x=1763380238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
        b=tbfLQJ9irZ4UgYbxHdBuCQGlz6pi+O152fJLPmwToJSNVSuIjg8Z/2/TzDmQB0wSKu
         YtAzMdezswPJLeOz5f/+NjJ1bGweh7X45VSenF/gKIehj+sPcNjx32fP8eIClW18/6dr
         vcLyY6usgSXfdNzuNUd/9ksixTNqvtb8dbI+hjqJ+8NzUWTtsdbj6kJFNo+eudz918n/
         X2GAjVGkDlxW56HHziaRBfsfDOm6DeZLR0I7Qn7jpgs+8lFvo1ACVjnMTEARw941Kvwl
         yROal+T9ZmrGcpPPZZlqbPI3ba/47nTE/Mij/9RK+CoG4nVNHfCS8HrCODrQfZTTF9jX
         arfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775438; x=1763380238;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
        b=HebGj33nWVaT6sqo2XxyUlStjmOZ9mGwdeTEOaHKu0P/Wao83jmLqgN70zxBm2c7g8
         uePtOqBWgj7LiXL/wky/kf5EcpeQCb0AdtaYUKJAZrLZ5DKcRkUTFQnNPtY7Kte1JVid
         XyEILsheI7sT7973+P650Njb7FXVxku/WSciaJlyZmnlvczuGhvkLsUQBVXMUYIhbfDa
         ADY6RvJJs+bH9uxuKyTDKHEDC4gLpryxm9g+rzG11SS4qVyh39XMYx7HOiAC1l2jrW8K
         XR3zUUHRLU2RtuW312iUJ0GB8X6l2gby7mbDlmdb6wssFsZOZcZ2ssEi/IvvFU14LKE5
         6KjA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgOZIyJPs6OOSGLXXTrtnXHUUrbkqw91tu5SwfguUo9qSlK7VgbP+sPk8SrbWMbA2nyH27Ars+Dip1jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXylS/HCP1pxhzE+T1L5HpDJx0ASVXIvBFzAiKLMkg5eJ6syb
	dUhHiLrOSgxU7Q9XC3bakkuS7d5LGWJpBLtGIIWpXCsxwlieSOTyQy1aHaXART+yuG6ZaoRwJel
	wntJardKd9vMN4ZPHJA==
X-Google-Smtp-Source: AGHT+IEdN/OzNgvJoDSQXjw0rImyZwQBZCotyROrmcQM6Hiiz8GNRc/HF5cFI/FbvnJNkDypZwcJNKuHze4K1U4=
X-Received: from ejcwb12.prod.google.com ([2002:a17:907:d50c:b0:b72:41e4:755a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3dac:b0:b72:d2df:641c with SMTP id a640c23a62f3a-b72e04c520bmr672023066b.49.1762775438697;
 Mon, 10 Nov 2025 03:50:38 -0800 (PST)
Date: Mon, 10 Nov 2025 11:50:37 +0000
In-Reply-To: <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
 <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Message-ID: <aRHRjaSHO0z9R_Se@google.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:19:19AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 10:51=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Thus do so here for `core`, which simplifies a bit the `Makefile`
> > (including the next commit) and makes it more consistent.
>=20
> We may want to eventually use `--cap-lints=3Dallow` here too, but the
> skip flags here were already feeling a bit more than needed for the
> series.

Using cap-lints allow for core sgtm.

Alice

