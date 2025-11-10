Return-Path: <linux-kbuild+bounces-9504-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B569C465CA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCB393B0524
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73228309EEC;
	Mon, 10 Nov 2025 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="INJlm9ib"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83930B505
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775250; cv=none; b=Om6j5eUQG/Qusi7yN4OITOA668ivnS0x36Fpv8FY651ThS3GIZiBMhsFuGtKUoQ7qopbDDiIUQNdqDAEWa8QhlXk5wn7oNVOeotHgT3ey4lj3ssuwOnjDoMxUBmmkciJMXAlAj6wDT78zpjSTjSIxdXX2H1cLAnHQNAjqBpyS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775250; c=relaxed/simple;
	bh=Certre8NKMBWjJMOdCkjiT37S95gzPpjFWT1M8r9T2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DmY+6bjNb30mytMUnolv0EcTg/zpgpZDc2GwW2SzwcA88YQo0wuDbawZB+2sdjfUANEci15yAT/QxWjQ8rCasLiGRfpEUtB5NW6LuiVXzcIA8sAKDLcV1x/8JuMJluD4jktcsASeOn3cGlWJps+6w9H33btDY5DhPaskMOg2saw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=INJlm9ib; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b366a76ffso517764f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 03:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762775247; x=1763380047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yAt7Z27w/lXRkHSeX0o2zGMIVMbZvME2esCv61DwS7Q=;
        b=INJlm9ibIvrZ+wYgtzhvboaENtDAIrI6dy3Bk/JMDydCdFnSUiXqjD7wvKqFVdnP/b
         Zh66kWpa0/fIZyN7bKajxWBttrBPzrFesfyZb7/+vqav8nAErFrtiDBfKXVjRmICqPhD
         bm1CeInN4XTcIa7xCGC/5IAgqKqX2FuS+icLLEH7TRG4EthIvJlFcjS2i/0CGvwqywFG
         W1PyssSUcVUs8JlGMWDN6dG9gOjobpL1Qw97yxu8UhS+9wEfgLgrq9lrNzjNh2F128gz
         9JEFv+qHyca98L5DbJQCAn/4xuWLRSIziK+vBtrcuEHQxGaACM0Fmot3486cflJvJkPN
         PJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775247; x=1763380047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAt7Z27w/lXRkHSeX0o2zGMIVMbZvME2esCv61DwS7Q=;
        b=rFMrstjlhH8ZRH40R69mSVM2FChclVWJBD5NlZOy3cUEGJK0ubxCAb8cCiP5vj6jCn
         mmKSB/U4KwpyuLhDEPg0TP3X00twxi/63B/4ea0vo78UK3wsO4z0jankFhVbr97IJBCG
         Md7Fg/mzuW/0PiXU9zDrpW0VUU1QleAgDo/Bwh7kxjzNvpXfykG2/bUE8ZiYAOniP9Ac
         Hc4HPtsTo4YEXkeYiCQ0eNd6BM59ZRN1mRoSKk8YkHMLV82BPDr1kvstN2dRTIRsHy8a
         ZakWEwRzhtKmvgSNgmYXi1dt54S5/RJfhju9kOuqzrKuYkC5SKnSRD8dZnnikcyJZL/W
         VsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNsfxPvvp7OdYFxgPVZQeg3azfGICG3lQ2HHzyT+LQOmqC8Z/mrOAArFXg9212SmqNmNXNwt+dlRdVxV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEDU0rgRUsVZ9Cn7wAS3mDg6YzMLn5UZoad8jw8bCPzA+T8ZX
	AkuIr9vqSpOrnW2mASxkB/ZGIRQhokPaDXf8Q/WE/lCRkTzENuZQWvHjEuTfnYygSI2zZS3Y/9w
	ooybE+VGfKyHNVGoz+g==
X-Google-Smtp-Source: AGHT+IHCLy2mdnxpnK0+nxJnKpheaCzAh9ChVq3lvYBA5uZFfrDQycfDIP5ZYdgDCadZ+3ZCgwyWUNwt33mUhMs=
X-Received: from wrbfp24.prod.google.com ([2002:a05:6000:2798:b0:429:ef2d:571d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f96:0:b0:429:d004:bb2c with SMTP id ffacd0b85a97d-42b2dc6c8a9mr5644715f8f.57.1762775247005;
 Mon, 10 Nov 2025 03:47:27 -0800 (PST)
Date: Mon, 10 Nov 2025 11:47:26 +0000
In-Reply-To: <20251110095025.1475896-18-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-18-ojeda@kernel.org>
Message-ID: <aRHQztaAl6Hi67FM@google.com>
Subject: Re: [PATCH 17/18] rust: syn: add `README.md`
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

On Mon, Nov 10, 2025 at 10:50:22AM +0100, Miguel Ojeda wrote:
> Originally, when the Rust upstream `alloc` standard library crate was
> vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
> kernel"), a `README.md` file was added to explain the provenance and
> licensing of the source files.
> 
> Thus do the same for the `syn` crate.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/syn/README.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 rust/syn/README.md
> 
> diff --git a/rust/syn/README.md b/rust/syn/README.md
> new file mode 100644
> index 000000000000..d3e3981da2fe
> --- /dev/null
> +++ b/rust/syn/README.md
> @@ -0,0 +1,13 @@
> +# `syn`
> +
> +These source files come from the Rust `syn` crate, version 2.0.106
> +(released 2025-08-16), hosted in the <https://github.com/dtolnay/syn>
> +repository, licensed under "Apache-2.0 OR MIT" and only modified to add
> +the SPDX license identifiers and to remove the `unicode-ident`
> +dependency.
> +
> +For copyright details, please see:
> +
> +    https://github.com/dtolnay/syn/blob/2.0.106/README.md#license
> +    https://github.com/dtolnay/syn/blob/2.0.106/LICENSE-APACHE
> +    https://github.com/dtolnay/syn/blob/2.0.106/LICENSE-MIT
> -- 
> 2.51.2
> 

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

