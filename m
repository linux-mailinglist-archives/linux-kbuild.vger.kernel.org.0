Return-Path: <linux-kbuild+bounces-5513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E29A1752D
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 01:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8066C188A121
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 00:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817983FF1;
	Tue, 21 Jan 2025 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBmyeLCk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C1EBE;
	Tue, 21 Jan 2025 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737418594; cv=none; b=pR8HGsP5i5zGIr0Jp65oUG4xchK8qCb2v/QS+hOhHyMq0PbN+0335ke0/0rLaDmPlg5S3sL/OHwPI2AsJW2NyfdXlsCo7iv+AGmGLooXUa6PQOVFb3MLWxFX7uztfx8ujoFSSwgFlCY2ETFiEk99VO8m83Pwz+vP7X3o3IFtNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737418594; c=relaxed/simple;
	bh=IXHhK7u7t7+cWey3ovuTh9k9yR/zw60MRK1NJWGAV0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foHVTFUOzJ1nhcdpj11c3uVi3Eh+9Q55s/S+7RjIgiHXagxDqZ3u5piuZpJTgwkIT/hLSv9CcF1f2La1q/XylOHzZzpNQCDgWrIscG30k1ov+CTBbHeRr9XAPLgKFK9zK1wb/8WCiIRHHMZaz6kngKoxb2QyfIz75q43CU8bfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBmyeLCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB3C4CEDD;
	Tue, 21 Jan 2025 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737418593;
	bh=IXHhK7u7t7+cWey3ovuTh9k9yR/zw60MRK1NJWGAV0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBmyeLCkdd7Zu/GaE2qwfPi4ofP4AYcBf8mmmlNWxNJiFy5lxxwjNqdSfj04XlA7V
	 jg9fR+Nyj3r6A82z4xWXEFTCDrGTaW9/9bGioXBONDA9UkqSdYCQiMSwzVKuONf5in
	 2kFGRN8tiwoC5rDNhgiZs74yJRs4+ROmaFvwxLfSlaY6i8UuDsspeYmheRK7emGfW2
	 EtMCi1wFmfNFbkkdhyPb8z693HmlxEIJ8V9vmRfal7fhajnEMWfbLeiaBvfbwMXE3h
	 TeuG7vOeaKPL0qP7c8yvTTC/PSJTeuUI7Ns1LGk8+kTLmG7PGBWtKNm1FV2T5oX4V/
	 HrEsrK1l2SibQ==
Date: Mon, 20 Jan 2025 16:16:30 -0800
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>,
	Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	arnd@arndb.de, linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <202501201615.F606516@keescook>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
 <87r077j1fa.fsf@gentoo.org>
 <20241119044724.GA2246422@thelio-3990X>
 <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>

On Wed, Nov 20, 2024 at 03:28:35AM +0900, Masahiro Yamada wrote:
> Some Makefile overriding KBUILD_CFLAGS would forget to add
> $(CSTD_FLAG), for the same reason as they would forget to add
> -std=gnu11.

But at least we'd have 1 place to change when we changed the std level.

FWIW, I just ran into this build failure too testing GCC 15 from their
ToT. Both EFI and compressed Makefiles needed it in my build.

-- 
Kees Cook

