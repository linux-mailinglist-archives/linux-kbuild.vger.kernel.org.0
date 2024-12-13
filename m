Return-Path: <linux-kbuild+bounces-5119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FA9F0C37
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5020016960C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0DA1DF744;
	Fri, 13 Dec 2024 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvfWGXCQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A8364D6;
	Fri, 13 Dec 2024 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092920; cv=none; b=Br5jifFSJkrioJySAIgdm/JRYcELsJn9HFsaTI9oXct5pbtnK4rXBkwCWOGkbRhD2RMgzi8lE0q8szONBSSplvVhcE328waBNUq0YsNb42au6XynrmtRt6si/UzalknE2EIz4wrCRN9ACnO9NsmyJHZ+nNzyvaxphFifdZCf+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092920; c=relaxed/simple;
	bh=L+eBbx2GkNIdEiNf+4ZQbQzQvej80TZ2xwSaVBQq8Uw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oH7cyJntmtlFomFYuEoBi9Tqi/SYhFgj1O+5lJ8wyxbq27aKy8Srvp0HVUlWgrLVlE3LzYlTufyJFUc8mbrtcBIclmheyzT4nbfdomOtggONc21mwXg1Zpv/wljmj8YOXV7uSXaT06GfiXN4pqxGb3r/Fxg3y3tpeKeEf6THi78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvfWGXCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C481C4CED7;
	Fri, 13 Dec 2024 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734092919;
	bh=L+eBbx2GkNIdEiNf+4ZQbQzQvej80TZ2xwSaVBQq8Uw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RvfWGXCQ4fe/yqpH+kHkNrVpRKHl4CDZu638YQnZdA3Dsydg1LVW2XD+2hzzkT20u
	 /jRE6vVY+kTsd/dZSRrdMSbVRWXQc9o70e2cjtlO5iF6TmeaHW1WbKD27QIR1secd4
	 oEn0B8wPHsQ0Md19ykhu6k+9PTcglVlotC1i3gjvI5+ruCt4rItdfYX7+wA5exngDL
	 OPpW6LGEu048kyg+jmhIQWwP9MJ9IVaf6AtMBJFOQ+oYCEpmgNlIx3KJEKJUpmhMvq
	 aL5xpF7vLqN3wGhaA9YeH7cDEOnea3fJivjACUDGNpmlLlzD/gEuMuwdxCPWRaHxEu
	 PdK9hPzvxBKfA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>,
    Sami Tolvanen <samitolvanen@google.com>,
    Daniel Gomez <da.gomez@samsung.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org> (Andreas
	Hindborg's message of "Fri, 13 Dec 2024 12:30:45 +0100")
References: <xK59-BGgPeRPn4PEeT498C5hexwXQ1H5sDle5WuMs3OtTzS0cA4NTRiBh1zLr_4p6o64eXKYOlEka_xzUHG5jA==@protonmail.internalid>
	<20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
Date: Fri, 13 Dec 2024 13:28:27 +0100
Message-ID: <87bjxfephw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Luis, Petr, Sami, Dani,

I just noticed that I failed in email and forgot to add you to the
recipient list of this series. Do you want a resend, or is this
sufficient?

Best regards,
Andreas Hindborg


"Andreas Hindborg" <a.hindborg@kernel.org> writes:

> This series extends the `module!` macro with support module parameters. It
> also adds some string to integer parsing functions and updates `BStr` with
> a method to strip a string prefix.
>
> This series stated out as code by Adam Bratschi-Kaye lifted from the original
> `rust` branch [1].
>
> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes since v2 [1]:
> - use `SyncUnsafeCell` rather than `static mut` and simplify parameter access
> - remove `Display` bound from `ModuleParam`
> - automatically generate documentation for `PARAM_OPS_.*`
> - remove `as *const _ as *mut_` phrasing
> - inline parameter name in struct instantiation in  `emit_params`
> - move `RacyKernelParam` out of macro template
> - use C string literals rather than byte string literals with explicit null
> - template out `__{name}_{param_name}` in `emit_param`
> - indent template in `emit_params`
> - use let-else expression in `emit_params` to get rid of an indentation level
> - document `expect_string_field`
> - move invication of `impl_int_module_param` to be closer to macro def
> - move attributes after docs in `make_param_ops`
> - rename `impl_module_param` to impl_int_module_param`
> - use `ty` instead of `ident` in `impl_parse_int`
> - use `BStr` instead of `&str` for string manipulation
> - move string parsing functions to seperate patch and add examples, fix bugs
> - degrade comment about future support from doc comment to regular comment
> - remove std lib path from `Sized` marker
> - update documentation for `trait ModuleParam`
>
> Changes since v1 [2]:
> - Remove support for params without values (`NOARG_ALLOWED`).
> - Improve documentation for `try_from_param_arg`.
> - Use prelude import.
> - Refactor `try_from_param_arg` to return `Result`.
> - Refactor `ParseInt::from_str` to return `Result`.
> - Move C callable functions out of `ModuleParam` trait.
> - Rename literal string field parser to `expect_string_field`.
> - Move parameter parsing from generation to parsing stage.
> - Use absolute type paths in macro code.
> - Inline `kparam`and `read_func` values.
> - Resolve TODO regarding alignment attributes.
> - Remove unnecessary unsafe blocks in macro code.
> - Improve error message for unrecognized parameter types.
> - Do not use `self` receiver when reading parameter value.
> - Add parameter documentation to `module!` macro.
> - Use empty `enum` for parameter type.
> - Use `addr_of_mut` to get address of parameter value variable.
> - Enabled building of docs for for `module_param` module.
>
> Link: https://lore.kernel.org/rust-for-linux/20240705111455.142790-1-nmi@metaspace.dk/ [2]
> Link: https://lore.kernel.org/all/20240819133345.3438739-1-nmi@metaspace.dk/ [1]
>
> ---
>
> ---
> Andreas Hindborg (4):
>       rust: str: implement `PartialEq` for `BStr`
>       rust: str: implement `strip_prefix` for `BStr`
>       rust: str: add radix prefixed integer parsing functions
>       rust: add parameter support to the `module!` macro
>
>  rust/kernel/lib.rs           |   2 +
>  rust/kernel/module_param.rs  | 238 +++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/str.rs           | 138 +++++++++++++++++++++++++
>  rust/macros/helpers.rs       |  10 ++
>  rust/macros/lib.rs           |  31 ++++++
>  rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++----
>  samples/rust/rust_minimal.rs |  10 ++
>  scripts/Makefile.build       |   2 +-
>  8 files changed, 600 insertions(+), 19 deletions(-)
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241211-module-params-v3-ae7e5c8d8b5a
>
> Best regards,


