Return-Path: <linux-kbuild+bounces-2841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B55949913
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 22:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32AE1C22947
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 20:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687A170A33;
	Tue,  6 Aug 2024 20:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cIxwze3f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97116F29F
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722976088; cv=none; b=pCvdLmMdV5p6BfdYLpmKsJFlCviiaE8ZzhWCzawbptTq6BYIzmA/XdEdqtvJ3XzYyXMxjE5WEHw16503OPJE6b9WgUr/iJ0vNzRq0g7EwJPb9lfyw4xe+r15CnWU9B/K2X4/rmzGNkESyDT+5jk89Ne0uq4/tAvhrfk/L4MixmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722976088; c=relaxed/simple;
	bh=PIqwq05eeSJrJAxwn95ybQWvhk0Dn6GFtbODZZoaYKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqeBGjQP6TwKXWuwBoacFCHBh9RQIeeTJUCrgdSlVansXZrBkSvj80ISA/Q3X574E2cWuYK15z0q4GWhKDVAAGKrxn8yMnqKKLMJMQ9h3l34DauUyp4AKd26mgpndmAJdvkye17FJUIYHsI2Xso/DeBwJ47LOzVN0UwW8ppu5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cIxwze3f; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso797081b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722976086; x=1723580886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNJJxbMCTacBJYMokN6YIRV7m5EBShQyXf92BOxMYb0=;
        b=cIxwze3fhA0NLN5oMfEGkw+Y+xhu0TRfWOc2qTlDrGupWGFLzfyL/DX+6f9XCXLVcJ
         1Cms9JgteDFeN046O9vit8bsnW0a4LwamURs0iyyoEPod2HTK6gHhQ/wYeHxJprNBkRd
         jDMk6BkyJJAHoYYzcC5peFdhjQaFFSQTd6o+t1XlhKW4F2ooJriHHtBsZcWGGqs4Buo+
         yKWxa3wu6u20VydzceJhdt9fBbCGCrwap5PesKkuUB2WHaFmgx4wftLMjM8u32DR1Fkq
         Tw21bG/IjN0hQJes5NBLNous4M3X4HC74mhalNQhzfzyTvcxVoKQLA4dp4vF+6cU1YGI
         eLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976086; x=1723580886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNJJxbMCTacBJYMokN6YIRV7m5EBShQyXf92BOxMYb0=;
        b=dDMHQJ0ewWpkTtyzWAmKcvQKafye/FpAFWcqUhpW4fXwE1R1wTfoctlnqvwQIQHEzw
         KIyj7q/gPo/V3/0Dwag2hM6ACWrDksuu5Sr/8j5XfAfZoJ2pcEThIEzP0zsGHN2v7Dig
         5QHNOHReg2QrMLW02BeH/9EtXpfgXTDnq/NL6Zgamd6CQ/lZrRLWtktLmwIpVgEyCG2/
         SUDL5AFROb4N+9F458WBszTI7gIQ0CuNpt7r4stJo6KRVhPptKdz9Exb1LJBKAVfIxWs
         91nGulDh8fYFyC+wkZneIZ+1knENdla3C046evhYB9nzWw6IQi8EcVgjoh2ziu7uVrOb
         TJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0IkTAkKXins23bbvodbSOKXY3PiAD4mRF2FZDWSP4k3I4M5oCvjS6z4mMt6vOBFaS5MiTB1AQn3OK5wUsvwCwA8yXuLp3kIkMZ2Yo
X-Gm-Message-State: AOJu0YzMBX1C6nngTEJA08lsW+W1jrdHXZVJUSwEVfQEw1V/ajC5aHEp
	FZTcTHtOFZ8iYSo9xtwYhJMe5wG8AlS73riNfoLjwtn0ZjizDFGgmKNPswynOw==
X-Google-Smtp-Source: AGHT+IFm9uhPYUcX6BBhhu0nbe6Hn1ROfYd6y3IS8Wi4xqj74fV2681KS5TuBgKc0cmX3bLcvOgaPQ==
X-Received: by 2002:a05:6a20:b910:b0:1c6:b364:dbd1 with SMTP id adf61e73a8af0-1c6b364e170mr7596007637.19.1722976085743;
        Tue, 06 Aug 2024 13:28:05 -0700 (PDT)
Received: from google.com ([2620:0:1000:2510:6419:5b4c:3008:6065])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b763562989sm7403878a12.34.2024.08.06.13.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 13:28:05 -0700 (PDT)
Date: Tue, 6 Aug 2024 13:27:58 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
Message-ID: <20240806202758.GA1634260@google.com>
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>

On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow
> configurations that work.
> 
> The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
> version 1.80.0 or greater. This restriction is reflected in Kconfig.
> 
> When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
> include unwind tables in the build artifacts. Dynamic SCS uses the
> unwind tables at boot to find all places that need to be patched. The
> -Cforce-unwind-tables=y flag ensures that unwind tables are available
> for Rust code.
> 
> In non-dynamic mode, the -Zsanitizer=shadow-call-stack flag is what
> enables the SCS sanitizer.
> 
> At the time of writing, all released rustc versions up to and including
> 1.81 incorrectly think that the Rust targets aarch64-unknown-none and
> riscv64-unknown-none-elf don't support -Zsanitizer=shadow-call-stack, so
> the build will fail if you enable shadow call stack in non-dynamic mode.
> See [1] for the relevant feature request. To avoid this compilation
> failure, Kconfig is set up to reject such configurations.
> 
> Note that because these configurations are rejected, this patch only
> allows SCS to be used with arm64 and not on riscv. However, once [1] is
> implemented, I will submit a follow-up patch that allows configurations
> without UNWIND_PATCH_PAC_INTO_SCS on sufficiently new compilers. That
> patch will implicitly allow SCS to be enabled on riscv, but this is okay
> because unlike arm64, riscv does not need any flags for rustc beyond
> -Zsanitizer=shadow-call-stack.
> 
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
> 
> The `depends on` clause is placed on `config RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
> 
> Link: https://github.com/rust-lang/rust/issues/121972 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Looks good to me, thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

