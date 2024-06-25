Return-Path: <linux-kbuild+bounces-2249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 546169170C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 21:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4861C20C6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 19:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482571448C7;
	Tue, 25 Jun 2024 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="M3rbxX2n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337701DDF8;
	Tue, 25 Jun 2024 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719342062; cv=none; b=ao60Rjl9oa4d+r+IHGMgzHcWHIuCbjGne9Xs3KKi9jzN5w5ugJfYBM5N01uE41Rqd4wwaMLrFJc8h/FCiY7+6tN5Wt66zgejSrIjV7ELZ2Rrv2ErI1KJZPYLB1SL0cdrlDBYLCUZtnpCrvDQU1FRHRr3fwAz1adLJzxBg3GVG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719342062; c=relaxed/simple;
	bh=JwHUKbMcRpahmyUhbH6RiR9M6mR8udrEXrGHmlJqHjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gwkl3pEgBuIFZtxrYc4/EEWF8hMicP1rIdRaT+JA0XTyrSWpkgllqJh4sXRO+VqLHr1QRXu5SaRzQaOoYNbhxfDue11ENoyr/0utYbbW91qnZx1FnLmgbGYz34+Ooe0QcX/FtLW3TzQT2MyLPIQAIWNiNWS5jdi0T44nWTPtabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=M3rbxX2n; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1719342055; bh=H43X7bDThMZ+yf/2+EGK7hfjogg/5KQsBFDhAK77OeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M3rbxX2nyJmUCAX/Y8LmbjZUTjpyNMO8I5U0YIAY8NIHuwaha7Di8k7k0plmsm2kz
	 3hjg187Z+CP9g+U2GLC6tJzShnrASg8CRyDpTlt5txQ8FqBszmUMSlvBHgoCqkLBEP
	 JU/K4TG3zesf0s7joupP3ZbN7qWS7N9tAmW5LElY=
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
Date: Tue, 25 Jun 2024 21:00:54 +0200
Message-ID: <699F1B9B-3240-46F9-8D0A-F400D5DB9D1D@kloenk.dev>
In-Reply-To: <20240620205453.81799-3-jhubbard@nvidia.com>
References: <20240620205453.81799-1-jhubbard@nvidia.com>
 <20240620205453.81799-3-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 20 Jun 2024, at 22:54, John Hubbard wrote:

> Replace the cryptic phrase ("IDE support targets") that initially
> appears to be about how to support old hard drives, with a few sentences
> that explain what "make rust-analyzer" provides.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 07308277a6f5..d22491184af6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1967,7 +1967,9 @@ quiet_cmd_tags = GEN     $@
>  tags TAGS cscope gtags: FORCE
>  	$(call cmd,tags)
>
> -# IDE support targets
> +# Generate rust-project.json, which does for Rust what clangd's
> +# compile_commands.json does for C/C++: provides a symbol browsing database for
> +# code editors and IDEs (Integrated Development Environments).
>  PHONY += rust-analyzer
>  rust-analyzer:
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
> -- 
> 2.45.2

Reviewed-by: Finn Behrens <me@kloenk.dev>

