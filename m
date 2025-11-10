Return-Path: <linux-kbuild+bounces-9494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4CC45F2A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64EFE4E45AC
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF09225762;
	Mon, 10 Nov 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlYQiiz3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82B22A4E1
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770821; cv=none; b=tpqWc9j/AqqBNOI2pYpbIvj1oMV0IT7TDi97WnkkEAOX71qRVE4WcF5lkRuWWUTKwNN1YZs2n+nPwVO//N5Njhc4gPjEyaJtHRPN1/VTo89mRJQiv3ElSevIRs/1P0graUMnPiTeTYCuq0rdXN6KxRkIUUYfev17HXmAKiLQPbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770821; c=relaxed/simple;
	bh=GoL3gN4h5eYU7litgF4qiXRimx4qE9CB8i92qSY1F7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s+5svQhQKTaEm1jIFyd/8vFhuPDiZgFf29S3rVUK9t0NpUUVNTepmybixApgXyfJNrYzVeLBI1mhOD/DKhd5EccrbCYAddjGeQ0VnGIQZ40mOSpV4Qp995UNQwlERXIuu5ivhtQJvASUTdYlSxSbEdsdID4rhKT708VwkIXeUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlYQiiz3; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6416b2de86bso2380233a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770817; x=1763375617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CCzpwObG7lLSpKChT0Fx+ByLzoerKxd9DaM7EmJ24AM=;
        b=nlYQiiz3BD+lyjdyVnTBmWTZ2IG/XAysTS2skjDE1SjQDsJ+ZkQUFOR74gvf9/CCGo
         JMoafsnCZBBH6TZlXy9Xpx98yBEnozv7kiIaMZwAZ4BLES2BrXtWrTPRG+92T7R4sb+i
         y9e+vzAXhhZgOebdiutYHp8mIVqjzdLldc/KFiTrPIMfFVkmdjR/TaT7/Em8OktiDMdW
         /Ru75aupcw9+lPOT7I6tUuwDeM14GXQ/EskgBiT4j3bWELt4Tw3jAFcGMyuHnTU1E9cx
         n6eD77h1IF5kWQ2I4W5ze1H8XfsGl6K+pxtyv9vymECVrLJ0B5EK4mWXElhI9TVLkwcf
         vZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770817; x=1763375617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCzpwObG7lLSpKChT0Fx+ByLzoerKxd9DaM7EmJ24AM=;
        b=fFMI+qtOUmUaZhLBBpy/My01JNVGgd0JYsx39VaJ7d03r84CdRRtCtVPpkvwXvBrVU
         tpsWKV0eyg2VZqd++tunATf5aFmWd6rnBuzdJWjLLqBqKu1h+rOy9V3CS0zGwmFyGDO5
         4rd2OuUBQHF5RXm/Ysjt0R4AbG/pDRWhbKgyRAtHOcmpRNMSHgieThGhNXcX2qzdV7cf
         DQFwE5punF+NbRSKNa9tkIPcXlMwN8QWt5AOaByRNyZS+JUMF5DeasaeL6JOXMDEgvCA
         wxE+sXzFD4w3xL4ZBbhvcld09uB7JuEAr+yIxcQgAfUtqLDWs2ghOYqlUGpmdmdk5lxN
         znoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrA9/LwCsHAUNaug9aejN2F+bJmS8Fw6UuBf9JihceSgsNGA39kCb2A6n08cCe7V/mhK0vgP2I/6vHmro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38x/tCpv1NQgJCGCxqRaipJXmqXzqzEmx3SGkQd0r+ZSwdhk/
	ybAYyg7sB88212OjjIZDVaxnohyqjY5VhA7TCJsV5KH5z6VXwQEjRfC4bXc534QNBHpkM5sD4+h
	XBf1OC9KfaQS4zmNKzg==
X-Google-Smtp-Source: AGHT+IGrQByfI9wokfMWFe7K1Ttk8ewEB37twW8Y2YwoEzQNcIfJcFh4xKKTJ6P4DH7/NHxDz4jf6iOvc30RilE=
X-Received: from ede25.prod.google.com ([2002:a05:6402:20d9:b0:641:3d6a:4b38])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27d4:b0:640:9eb3:3673 with SMTP id 4fb4d7f45d1cf-6415dbfbd56mr5809440a12.4.1762770816828;
 Mon, 10 Nov 2025 02:33:36 -0800 (PST)
Date: Mon, 10 Nov 2025 10:33:36 +0000
In-Reply-To: <20251110095025.1475896-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-4-ojeda@kernel.org>
Message-ID: <aRG_gJu_yZeJWPuo@google.com>
Subject: Re: [PATCH 03/18] rust: kbuild: simplify `--cfg` handling
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

On Mon, Nov 10, 2025 at 10:50:08AM +0100, Miguel Ojeda wrote:
> We need to handle `cfg`s in both `rustc` and `rust-analyzer`, and in
> future commits some of those contain double quotes, which complicates
> things further.
> 
> Thus, instead of removing the `--cfg ` part in the rust-analyzer
> generation script, have the `*-cfgs` variables contain just the actual
> `cfg`, and use that to generate the actual flags in `*-flags`.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

For anyone else reviewing this, here is the relevant part of the
makefile that calls generate_rust_analyzer:

rust-analyzer:
	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
		--cfgs='core=$(core-cfgs)' $(core-edition) \
		$(realpath $(srctree)) $(realpath $(objtree)) \
		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
		> rust-project.json

