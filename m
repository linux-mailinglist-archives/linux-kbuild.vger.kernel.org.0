Return-Path: <linux-kbuild+bounces-4318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FD9AF5B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 01:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7081F22709
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 23:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC21219486;
	Thu, 24 Oct 2024 23:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vG2rNyOd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13B2185BC
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2024 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729811284; cv=none; b=ViU5qXbyxu1DyHj5CdfndYdFveanlTilJyK+D9XplYdJFsr6wyOegFTTxPLJxRM9YaJVja/841mG40iN9M/hlezsEyvFroVgrw6814VrXdH4BHRtkOUPNMQMJ3/gKIZ2xYlmitQlt40QTv9kY+tpUdWdRml3FxpaZV+dtTTz8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729811284; c=relaxed/simple;
	bh=FIweofO8swal8FliqNKy5jgFXKhTKwfKXelv1+xVPns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIx7drcz9zltHD2KTYCgdAPKocW7jLs+QJM/sM9qWnNyTGdffKXnhmLJUWpjhLAEz1VwWcEZTCovvtLZfaJSObubR6i2UgznWxjYWrm+utC8fUZkI0CAtbEkSnSx1dwDswAbifCwhmyx1deGqvZVvKSddxSHoDA5Xoej9IpHWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vG2rNyOd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca4877690so35995ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2024 16:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729811282; x=1730416082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwjW5mBSAuFOFhEIlf3utQozI9vTmaDM4dHrZQJtjd0=;
        b=vG2rNyOdCyiQeuq3KkVpfzNrI7ydLQfSUrb86Z8xnqMOXDoV+eUlHD14fImKUIHadv
         7MptuOOCScPUVP7FCiJUGA+7iYyKUbuSwSfP3pIHraT0xjfzvLKLjUrt8oznwdy0YviP
         aQYEmQimqMUGfyjTbE+3J4EtMhVkGWjvjxpi3hmexPJ4N/oaumFeqrPyWtUayL81A/sj
         WovH4w1n5Bld0wywds/uPTptA1O4NmsPIhWXVLjxssOn99TfC97hTX/Z3HbfyfUICPiI
         uBhyUIOlEl8WbGy+NWnZEKFzxdceTVkPyeClNajiXv889lUIWiFQZEc0x0NLIZYK0TND
         lEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729811282; x=1730416082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwjW5mBSAuFOFhEIlf3utQozI9vTmaDM4dHrZQJtjd0=;
        b=F8/d2hEpbvegtZ+5djXPNvzL8bn2fK1/iWAYb+KKOzKvK/lZig1ojnC9ddIKuEiYOv
         U8W+jRHvD79ZFIyWtkrQX2EKi9WvtsGpbd4AhS9IdwHl42kwdrTGuuREJLyd2zuCeuQV
         cpenfubvzM/oy3PzMmicmjaZGyaGaAaSjAnXX5/uF+bVAqkhuYsngU/9CJYN/KJm/Bdw
         ktc6Wz4iJ5Q8y/vMHp47EVGr1jdLJOfAH8RA4+2GnCSOJSEHKyQ0Wzl7kTVJTM5u3bG7
         iCw38s4kOX2yhYRCNE7U3pyEzGP0q9ipA6w8X9K4B6uYV/fewOlw6LHy/35z6LHmmhH7
         Vwkw==
X-Forwarded-Encrypted: i=1; AJvYcCUfS6T4yLxjgqdDEaJitdIq/zlDPSgWC0zrzWKSKbt1E4tFHEKmsAaYyEIGhV/XwoWHx8QmlP1hqg/ju/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEeJq9tMZxstsu7h4zCQas8bmear2AXPbDlar+dyExRCYUAqFe
	0A1yYp/mwmaniZdQ19n/yD2p6oQVkmIkKLFR8s+gYklCxSrZ3ayUdi2TAgtC9g==
X-Google-Smtp-Source: AGHT+IGPM0ZptJIpwnMZ9CfEcrh9lVIEAKuBohD9dLT7W11XHiulVCeuXJZu5S3Q/78EfDc25LTScg==
X-Received: by 2002:a17:902:daca:b0:20c:a659:deba with SMTP id d9443c01a7336-20fc212d688mr1257735ad.4.1729811281798;
        Thu, 24 Oct 2024 16:08:01 -0700 (PDT)
Received: from google.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48ad66sm2087361a91.4.2024.10.24.16.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:08:01 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:07:57 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/3] Extended MODVERSIONS Support
Message-ID: <20241024230757.GD1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-extended-modversions-v7-0-339787b43373@google.com>

On Wed, Oct 23, 2024 at 02:31:27AM +0000, Matthew Maurer wrote:
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
> 
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
> 
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
> 
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
> 
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
> 
> This series depends upon the module verification refactor patches [5]
> that were split off of v5, and DWARF-based versions [1].
> 
> linuxppc-dev is requested to look at the ppc-specific munging,
> as Luis would like some eyes on there [6].
> 
> [1] https://lore.kernel.org/lkml/20241008183823.36676-21-samitolvanen@google.com/
> [2] https://lore.kernel.org/lkml/20240605032120.3179157-1-song@kernel.org/
> [3] https://lore.kernel.org/lkml/ZoxbEEsK40ASi1cY@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com/
> [5] https://lore.kernel.org/linux-modules/20241015231651.3851138-1-mmaurer@google.com/T/#t
> [6] https://lore.kernel.org/lkml/ZxahDv5ZKdM__0sZ@bombadil.infradead.org/
> 
> Changes in v7:
> - Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
> - Drop patches to fix export_report.pl

Unless Luis prefers to deal with this separately, perhaps you can
just include a patch to delete export_report.pl in this series?

Sami

