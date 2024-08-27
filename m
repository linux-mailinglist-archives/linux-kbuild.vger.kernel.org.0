Return-Path: <linux-kbuild+bounces-3243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F4960B10
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5CEC1F24197
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC8F1C0DC6;
	Tue, 27 Aug 2024 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsU2C8e4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60F1BFE1A;
	Tue, 27 Aug 2024 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763046; cv=none; b=I3TjJ8ZPjOwTV2QERj/nwPPlOoSHWOCFPXPK41xXItxToplLt+RiACPNup2wfB7Djrtor8ENCIwBSVbpFmeCRg1Y/a5Lb8XpZGhmjDhIlScNnmxNQT96iGjvHJuIxmDJ6lDH8FL/MorqPrpOTFDyz3dbYyVJ1x95HujAGOIIuNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763046; c=relaxed/simple;
	bh=qwDcptw+GorkjYb2aHEhqk3vhBLhz0T0r/3W8LEKW3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udUH7NePoxZNzw/2H8ZL+hvPxVyvVxrYYRxLsItW/DpgwMUngeQ99temZW15+c5GY8b3PDMA2l5+n4GhAoDpnlzEPwXogDc20wI5FOr7e6yPapbmvDLkNhjOy6NUHqBHFZXaykBzRCjShwkGZZtkF6XIfbTxZp2lJOqcR+lpe2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsU2C8e4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E28C6106D;
	Tue, 27 Aug 2024 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724763045;
	bh=qwDcptw+GorkjYb2aHEhqk3vhBLhz0T0r/3W8LEKW3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsU2C8e4LDwj/SADssPE/RQmKmgNsC5cSE+iGDc8XbTNn/TtPDiTQml00UjyBKiPQ
	 7StZK4bmdbuJ8mDViwf3tRSyU9D9OdOlf7npkI9dvh1AyFAQovBiia+V0Dqk9yamRs
	 NZQILFjJIbw/+NdbJB+SbSfAnVuTUaLvzYcMz4e4sAaP8ybmhhPi7uO/I08TCEVzqK
	 So84DwabR+DR6y6gysD+VnEddq70DmCemjIRcjgNuxdzny3RTwRVbqo/ELaJZtuRyu
	 9zzDOEfJWJCp3iDgzLdFqeuJua2wna0feA/4LX8/kmoUdx/BVipW7M7ezAq+k6n3CP
	 QnSPSayqIaejg==
Date: Tue, 27 Aug 2024 13:50:37 +0100
From: Will Deacon <will@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>,
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
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
Message-ID: <20240827125037.GC4772@willie-the-truck>
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Aug 26, 2024 at 02:22:52PM +0000, Alice Ryhl wrote:
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow only
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
> enables the SCS sanitizer. Using this flag requires rustc version 1.82.0
> or greater on the targets used by Rust in the kernel. This restriction
> is reflected in Kconfig.
> 
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
> 
> The dependency is placed on `select HAVE_RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
> 
> At the time of writing, rustc 1.82.0 only exists via the nightly release
> channel. There is a chance that the -Zsanitizer=shadow-call-stack flag
> will end up needing 1.83.0 instead, but I think it is small.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Link: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/ [1]
> ---
> Changes in v6:
> - Move Kconfig requirements into arch/*/Kconfig.
> - List non-dynamic SCS as supported on 1.82. This reflects newly added
>   things in rustc.
> - Link to v5: https://lore.kernel.org/r/20240806-shadow-call-stack-v5-1-26dccb829154@google.com
> 
> Changes in v5:
> - Rebase series on v6.11-rc2.
> - The first patch is no longer included as it was merged in v6.11-rc2.
> - The commit message is rewritten from scratch.
> - Link to v4: https://lore.kernel.org/r/20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com
> 
> Changes in v4:
> - Move `depends on` to CONFIG_RUST.
> - Rewrite commit messages to include more context.
> - Link to v3: https://lore.kernel.org/r/20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com
> 
> Changes in v3:
> - Use -Zfixed-x18.
> - Add logic to reject unsupported rustc versions.
> - Also include a fix to be backported.
> - Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/
> 
> Changes in v2:
> - Add -Cforce-unwind-tables flag.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com/
> ---
>  Makefile            | 1 +
>  arch/arm64/Kconfig  | 7 ++++++-
>  arch/arm64/Makefile | 3 +++
>  arch/riscv/Kconfig  | 7 ++++++-
>  init/Kconfig        | 1 -
>  5 files changed, 16 insertions(+), 3 deletions(-)

For the arm64 parts:

Acked-by: Will Deacon <will@kernel.org>

In which tree do you plan to merge this?

Cheers,

Will

