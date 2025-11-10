Return-Path: <linux-kbuild+bounces-9495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 332EDC46058
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34EA188A7CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A640B306B05;
	Mon, 10 Nov 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sUGe7Tce"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E4305957
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771391; cv=none; b=ndmXR9O0BGKSPiP8bqQN8apYL/Gnp37TNY0ErqzKOyPaUnyMiOWk/6eyxpVockK4Vd9tGLl0cJrsehU8srsqzCTC4vTBqo5hUuxJjHivFG4eIG0CmxmMMOuKH7iekMXPdWU2tXnvUzWS3e/nLNAAH5FBAxAnP6Os3l6mxsM8RFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771391; c=relaxed/simple;
	bh=PaK9aaWb78+gpE3XwxvDFLq4iKRgKHKKrEr/MVH+uOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IefS0xbR0ypRpRfM1qIea7i1H1CGV1DKbfNnEPHeXVvEKfs0GLKaQG750/z/bT6fFlfjFqNG4uWTcSRoLLcvtMAam5kIcENy4M2ddNC5Zz3CzZ/ppy20QXxF/t5Df2SC2FrJPUj7nZRxnRoTEZPzgnTmlKXBP15TWMC10oeIIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sUGe7Tce; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7276057a5cso258042066b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762771388; x=1763376188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6sNizUOGkciptOGTci4SybgbOhVv6AEZQncHw0dXTs=;
        b=sUGe7TceYz1fFqSyRJb9rQwlDLH4ViqpFNlMmLDcnBGABOILnqC8ZCgrNIh7c0sUvp
         OBhRqFMVLWKCLnWRvdE3JlRWEj0hcj6FRhIFmF5ilbU9A5VhKx3LTeFrILBTU2wGOWn2
         x0Tc3S+qBUjYjtEmi4giWJl4SRwNQJtwZRY6Oqvq0CA9E1OKMlNbGM4DVGskZ9+uJ+bP
         mss37lM+/ogI6oM6rTAtw2qFNH1/MGCKcxDfBDSOqnUsZouv8FFKoAY0jt0aXF58+c/c
         8akoPuN6sHp2tHQmnYaTlVISar8jJ2qCUmxxUlTisIsjWJLI6U/g2Xw8cHAJLPhrPSqN
         grHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771388; x=1763376188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6sNizUOGkciptOGTci4SybgbOhVv6AEZQncHw0dXTs=;
        b=lBxDrnBzGi4TIDwOW0nYgoaTF+1Y+uH9QDJ8GmkyKnxMDbcg5y48500boxxDGirpuj
         0zflm6HrqgmKeZ7Y2672okNObw3qnE8YJqlzaaxTzi+f/r+r44z7WUotr5Q0vzzXFz3q
         ZiVQixGzG6ROrR7YQ2KZey05evvU6RPdn2S73gOVoQjDt5MnSXf4zCs5AN5/vZ/VaruJ
         DKQ/IQZEyy36DhIrPijVUO6Eahgt/b5jt7dFjAGnJ0xoKra7PFGfdEtAuAC438XDGBoY
         3qHVfmqpU7F68D2Go5DQFXSHUshu/mrBvS2jYnWshExjb3evZ5IdeIS90lp19OpOtl53
         3YxA==
X-Forwarded-Encrypted: i=1; AJvYcCWA9c4KtlyhdvpE1OMixslfYbeGf9Qbw7QjRWPb5TfbjOu1KwVsSv4q2C1sg42w1UaWk7Sq0/zr3wFIWn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjO++0rx0nm9dXGR9QqYEzsQ5vZgTsgmmPewFAEQ0qfqG8HdLi
	TFr0P4netkIjJp6EcC25f5mNuoWRAPbUB3I+gyI2uhlkLyOIo/jss8FHxBf4rS4cATEC6XW/7/S
	KGbBP0ZlU+1wg1tdXkg==
X-Google-Smtp-Source: AGHT+IFY61ejHKFEIykzrnpB2o0ZUucS0nhTdm30eA2AKho8jI6G1MrYig9/jVIr/y6CqyP5/ec46LFxxBld4FU=
X-Received: from ejctp27.prod.google.com ([2002:a17:907:c49b:b0:b72:ce97:7786])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9812:b0:b71:34c3:d5a9 with SMTP id a640c23a62f3a-b72e03ee841mr671805366b.38.1762771387730;
 Mon, 10 Nov 2025 02:43:07 -0800 (PST)
Date: Mon, 10 Nov 2025 10:43:07 +0000
In-Reply-To: <20251110095025.1475896-5-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-5-ojeda@kernel.org>
Message-ID: <aRHBu3RoOLTrMA8n@google.com>
Subject: Re: [PATCH 04/18] rust: kbuild: add host library support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:09AM +0100, Miguel Ojeda wrote:
> Add the a host library rule that produces `.rlib` files to be used by the
> `macros` crate.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

We currently have two kinds of build rules:

* cmd_host-rust used for host binaries such as generate_rust_target
* cmd_rustc_procmacro used for proc macros

This is a library for the second case, not the first case, so it may
make more sense to name this rule procmacrolibrary?

Note that HOSTRUSTFLAGS is passed to only the first category, but this
naming makes it sound like it should be passed to this new build rule,
but I don't think it should be since it is not passed to proc macros.

Alice

