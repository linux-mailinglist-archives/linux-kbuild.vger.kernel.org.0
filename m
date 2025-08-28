Return-Path: <linux-kbuild+bounces-8646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C18B3AB8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8F71BA872F
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 20:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC55F285C96;
	Thu, 28 Aug 2025 20:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWYmvZjG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B22278E7E;
	Thu, 28 Aug 2025 20:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756412361; cv=none; b=LX5/5NT4xcb2k+PC0i53rmDu/LgS26Z/iHkpewrvp26JzU8SID9N11gVX1nX7LcRzA/KPwCFdPeFDdJnf+kbZdoAeosP9keo2xY4I475DxQMcL9WwukWlPar8uIiLSpaB844COTya7ixmM4AtfScrms0wkr6G78/13XOHnKCgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756412361; c=relaxed/simple;
	bh=EfjnmzRM4EzcfrEjZb23/Q388aWEyQC6jnzqc5fc3EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYaN4af2vOLwAPvJt0IKUn6XlhZ+6YGJNPTq1kg/rOGIumg/LdyUqzgnnVAG5P5mMegPEYQQ2i5vKjw6UeFxAaFEwtqGCjmtowDkbXHaALlemOdYt9yyiHpiu7DE0DG1a5i5XaVuCxttyPt4Z2/TdZXThBuibnoc7y+7PB7dAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWYmvZjG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8182C4CEEB;
	Thu, 28 Aug 2025 20:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756412361;
	bh=EfjnmzRM4EzcfrEjZb23/Q388aWEyQC6jnzqc5fc3EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWYmvZjGSIhGsXSITNjValCU+H/NakH+Ls/Djn/tsb1jdJotNaLCwT5loQOWcouAI
	 L9RCLZblArg6XxZ+165bTtoXHQyfMZbRxY+nq4By7/Vbriu4UDciz9M/fhi292xlfg
	 MlvDF7Q4gmgRW+JnZQb3ugIJFYG51hxAsvnNyrfGhLWRmuR6Q0Z09CQF+EJfYGL/kc
	 ZLYOLaR3Cf0mRUUVYgkqT6Dsu1hWwB2LTJDQceK8ZyzuT6aZQBjTVDVsis5JCRanln
	 EYIsBdufpk0e3794rEjgqj9JtPTkeB3oYtJopEGq552ZGP7crVncu0xWF1Qjhp/ycN
	 0/2Ql3ZHeRFRw==
Date: Thu, 28 Aug 2025 13:19:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>

On Thu, Aug 28, 2025 at 02:11:51PM +0200, Miguel Ojeda wrote:
> On Wed, Aug 27, 2025 at 9:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> > selectable symbol and making CONFIG_CFI the hidden symbol that both
> > compiler symbols select. After a couple of releases (or maybe the next
> > LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> > CONFIG_CFI becoming user selectable, which would keep things working
> > since CONFIG_CFI=y will be present in the previous configuration.
> 
> If we are OK with something like this (i.e. waiting a few releases),
> then isn't it simpler the `def_bool` approach I mentioned? i.e. it
> means one less symbol and one less rename later, right?

Ah yes, I reread your suggestion and that would probably be the best
course of action, as it does avoid the extra symbol (although I am not
sure what you mean by one less rename?). As I understand it:

  config CFI_CLANG
      bool "Use Kernel Control Flow Integrity (kCFI)"
      depends on ARCH_SUPPORTS_CFI
      depends on $(cc-option,-fsanitize=kcfi)
      help
        <generic help text>

  config CFI
      def_bool CFI_CLANG

then keep the rest of the change the same with the rename? I guess the
CLANG in the symbol name could be confusing for some people but thinking
about the timeline more, kCFI would not ship until GCC 16 in the spring
of 2026, which would be after the Linux LTS release at the end of 2025.
That means we could easily drop CONFIG_CFI_CLANG in the first release of
2026 so that compatible GCC users should only ever see CONFIG_CFI from
mainline. They could see CONFIG_CFI_CLANG in the LTS release but at
least it would work.

Cheers,
Nathan

