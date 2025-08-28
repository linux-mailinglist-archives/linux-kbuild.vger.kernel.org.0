Return-Path: <linux-kbuild+bounces-8648-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6CB3ABB1
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1951017342A
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 20:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCCF284B2F;
	Thu, 28 Aug 2025 20:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGl5m61t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44C30CD84;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413140; cv=none; b=tVFnA1h8dDIod4U+fao+Zc/P7QJxiWObOGmQuD3axbg8DEhnztKhoUDPbKnhOPojKwAC5T3XVOdoia46N203PNA4WOhuSWGTkhAUvQ3twW7HNTyfF+2pxi1buA/DGvg14Ywm0TQv1kfyT7OPPMhcLlBIh7VURIq1SgN2w7/nl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413140; c=relaxed/simple;
	bh=LJ/nYBW1tIRXTpCBSiKp71T/i9+fSZdNs8DZzPqY1Ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IgNuTNxSY71obnSjqJKpuZyao3/tDq3Y0TXF4kI81srhujg+7uPT0w1QSg8GJ2Tr3EmmE6dLiYzuVP9RFxpCKl+jPQylyCHIQ2syO0vDF9C2NMfFAD8vdNsV31oMyoawy6slrkh2S5hLMsdlbjOO0L8WCvpbZTcjZdQuB18LTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGl5m61t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34509C4CEEB;
	Thu, 28 Aug 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756413139;
	bh=LJ/nYBW1tIRXTpCBSiKp71T/i9+fSZdNs8DZzPqY1Ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DGl5m61tjFO/RGbdmcv8xyDmu/ykBezYs0GHdT4DZw9Xhk3fSMKGKVpOWVqw5/86+
	 jK5yY+L4Bo1ZIZ8v3R6pXEW+Fjm53GisvnYMX/XpdM+rD/Z6hIBavWTcDeIfuLkZV1
	 OujLD+Q0WWVGa/LUPqHTaRku9THwma5s8N+6X6Ert3RAhSE6UW+cGdCYjC4CScygIJ
	 Cj1DHZR7LIX821VJ2VhiEWxiG59HzBd0B8RaijpHpGW7OMJ8muA6HNFHK13GjY0yLf
	 N1Mj4ArOxrslcU9fjauS/Fhpnt/uL/EXomlp9/E5Eieg9kjphzcZPHUoOzR0suUrJK
	 kAVWObwlnDGbw==
Date: Thu, 28 Aug 2025 16:32:16 -0400
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <20250828201915.GA219815@ax162>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com> <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162> <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162> <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
Message-ID: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 28, 2025 4:19:15 PM EDT, Nathan Chancellor <nathan@kernel=2Eorg>=
 wrote:
>On Thu, Aug 28, 2025 at 02:11:51PM +0200, Miguel Ojeda wrote:
>> On Wed, Aug 27, 2025 at 9:38=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l=2Eorg> wrote:
>> > Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a u=
ser
>> > selectable symbol and making CONFIG_CFI the hidden symbol that both
>> > compiler symbols select=2E After a couple of releases (or maybe the n=
ext
>> > LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated wi=
th
>> > CONFIG_CFI becoming user selectable, which would keep things working
>> > since CONFIG_CFI=3Dy will be present in the previous configuration=2E
>>=20
>> If we are OK with something like this (i=2Ee=2E waiting a few releases)=
,
>> then isn't it simpler the `def_bool` approach I mentioned? i=2Ee=2E it
>> means one less symbol and one less rename later, right?
>
>Ah yes, I reread your suggestion and that would probably be the best
>course of action, as it does avoid the extra symbol (although I am not
>sure what you mean by one less rename?)=2E As I understand it:
>
>  config CFI_CLANG
>      bool "Use Kernel Control Flow Integrity (kCFI)"
>      depends on ARCH_SUPPORTS_CFI
>      depends on $(cc-option,-fsanitize=3Dkcfi)
>      help
>        <generic help text>
>
>  config CFI
>      def_bool CFI_CLANG

Oh! Keep CFI_CLANG the visible option? Will the later rename work right? I=
'll give it a try=2E

-Kees

--=20
Kees Cook

