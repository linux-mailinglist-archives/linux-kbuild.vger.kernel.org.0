Return-Path: <linux-kbuild+bounces-9491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E98C45EB9
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB2A1891E65
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B04A305977;
	Mon, 10 Nov 2025 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WIaQYpF2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C806306D47
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770268; cv=none; b=d+gBIzItOKAcTUsMkhKknsUblOm52QnQaXU6j+bWupQxDzd3BU3bCRtWe7CftXctHoXgfORkcMQh9hljLTPvnFdA2s4Ohh+JkMHCDdXARZj5SuWOKZuK94vtxPcbTYRT+UQG76DqzzstUcbzICFK2js0Dk9B1kMV0hGQgMrhTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770268; c=relaxed/simple;
	bh=aE0cpumrRJ1UXIBWA3mSkc4AapKLk4WpELDVIiqYqrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U79iIPjqivrEVSjDujQGUwM7JMNvruk/zu18acAfhA7Cmpr7lQc5i5Nh+y1YuuLM1LYgFFFOnQAvM3GJabDHpsg6H1FyBkoUKXoTsMoG57N0Y3PhM0ON5cYtKkrGIm6tRqfmyU5jTaJmn7yHBppo80J32fxmne08ffQpECfWoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WIaQYpF2; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7270cab7eeso251375166b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770263; x=1763375063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nNv22iO458s//Cdaagcdl8KtQQ9ntxwjUMQVBshAGaQ=;
        b=WIaQYpF2dJNWtsu1TA3IOGY0VHBfiS881WUK21fcyqYc48yF2Wz9NmOpe9MEgepAK4
         cbS1bXKaucri7bpfwffweucNmTdUB17uwgffv/KCukmslQuq9dlqSSrMO957WB6LPhsQ
         FvZxqEfJS5jaellc9jpoet5LRpk4diF2nxg4dKa73KSigs990xKJ3LTP5JsbtxtYLFsJ
         jxzpcdXxnXvdevxmtGMTvG9ykc0mUSZubndUgxvS/8I8IvTPYfHINL+zwJnPupw2bs0W
         liXwmy+sUPizVlqnMoaDwxwlJx0hsamLNGvAHAV8g7hR3le6GkyD2NNQzlXEYZWAjXa2
         V/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770263; x=1763375063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNv22iO458s//Cdaagcdl8KtQQ9ntxwjUMQVBshAGaQ=;
        b=owYOgFr4UxJhuAWOOQjE4m8kAHLA+wGWwNh8af62KnVyoTHB02DCQ+JFprCx8tPzKw
         AQgxeqYPQg1QwUpzeVQnmX4zYE4GBkpkVsJ7p+r4W2TOscoXO6v5VtQi7ad6hZcDS37H
         L2jf5O/PytUxlyvrfRmg2RkKzy56AmMhdMBTG6k8/G5xiK/KhjYpKlkLV9nCjfSNm/Ce
         Iwe8R3besOrzZfbfWEYCAT9N/2tqLlZ+v6G54mvJsk3cyoJAY4bXQGhvzSl2u+cdXTEM
         dd/4yMC5YOymJlXZVbAa5gRwtc4xo/SXMyCL7bW2bkrMQx3TDB921mIzvs5iH0DheCL7
         JsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDWffxB1yjXd6UvCzc5mMNYmVGsoXpjwgiBV0VPg7a89Ii+hhKEfR1MHTrIXd10WMG9PGf0CJ7UX8PyOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOlODf+TgfmF25zgwxlIuNCKgx1hk4KDU8MVuN5lv2l811ZaM3
	cz4Sby/z7Wzccg2ZU+N5WshCNmZyGdr5Al3wydWg85BxukBQtzoiZm49vO6dVaqtVLKvA+aaZ28
	2X3+M2mTKVwWUvJMK0A==
X-Google-Smtp-Source: AGHT+IHF1mfHQnJtzIm6KGV9avfylPLNTU2wZn2/rVrhlMwC4+Dos2C8BVWng0M+4Mg0oVxmMCdjIYjJS7RxIbY=
X-Received: from ejcvi8.prod.google.com ([2002:a17:907:d408:b0:b72:41e4:754b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f26:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b72e041276dmr757987266b.36.1762770262892;
 Mon, 10 Nov 2025 02:24:22 -0800 (PST)
Date: Mon, 10 Nov 2025 10:24:22 +0000
In-Reply-To: <20251110095025.1475896-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-2-ojeda@kernel.org>
Message-ID: <aRG9VjsaCjsvAwUn@google.com>
Subject: Re: [PATCH 01/18] rust: condvar: avoid `pub` in example
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

On Mon, Nov 10, 2025 at 10:50:06AM +0100, Miguel Ojeda wrote:
> The future move of pin-init to `syn` uncovers the following unreachable
> public item in an example:
> 
>     error: unreachable `pub` item
>          --> rust/doctests_kernel_generated.rs:14683:1
>           |
>     14683 | pub struct Example {
>           | ---^^^^^^^^^^^^^^^
>           | |
>           | help: consider restricting its visibility: `pub(crate)`
>           |
>           = help: or consider exporting it for use by other crates
>           = note: `-D unreachable-pub` implied by `-D warnings`
>           = help: to override `-D warnings` add `#[allow(unreachable_pub)]`
> 
> There is no real downside of keeping the example as-is until the
> `syn`-based pin-init is introduced, so there is no need to treat it as
> a fix nor to backport it. However, we still need to change it before
> introducing the new pin-init.
> 
> Thus do so.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

The unreachable_pub warning normally does not trigger for documentation
tests since using `pub` in documentation tests is not wrong. So this
sounds like a bug in our doc-test setup.

Regardless, I don't mind changing it here for now.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

