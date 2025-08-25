Return-Path: <linux-kbuild+bounces-8583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A6B34AF9
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 21:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746491B23407
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 19:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C16E283C9F;
	Mon, 25 Aug 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=outflux.net header.i=@outflux.net header.b="dmm7Uk1r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.outflux.net (smtp.outflux.net [198.145.64.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC011169AE6;
	Mon, 25 Aug 2025 19:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.145.64.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756150622; cv=none; b=Lj/zMjllBqeAPYQ29SoGRDrKvyLoMp2e0JE1BM7wiftT1MGBmBC8cQUADpOFdsohzLCPcihiDNTJ1BAI4EioCtntUxop4F9B/3XALB6AUQcdkl/eWYyCw3oLTd5Ncl70Y1d1zNw9i/pKm+0151DC6R9wX+32ZDsX4WFt4XGODkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756150622; c=relaxed/simple;
	bh=Cc0A7KST88BbLESFvBNiNEgFzJEi7Yi2EVmfXhRgL6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CHhUWVnPZVFNLan+Nka92dJUgT4BQL0Y0Lx+/48EhPgWG/Le5QY4hQN458pTmHGTwXViDZtTEkNDxMGro20ngdSCQJIUFJs5iiGEp0QvIMFFRzVQAWjauQpsJ+nLeBF1a3Vccofif0rLye4H0DBYT5GTRnOPY9fPTl35CGR1QGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outflux.net; spf=pass smtp.mailfrom=outflux.net; dkim=fail (1024-bit key) header.d=outflux.net header.i=@outflux.net header.b=dmm7Uk1r reason="signature verification failed"; arc=none smtp.client-ip=198.145.64.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outflux.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outflux.net
Received: from auth (localhost [127.0.0.1]) (authenticated bits=0)
	by vinyl.outflux.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id 57PJVcXW012364
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 25 Aug 2025 12:31:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=outflux.net;
	s=2016010; t=1756150300;
	bh=Cc0A7KST88BbLESFvBNiNEgFzJEi7Yi2EVmfXhRgL6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dmm7Uk1rljY/b4/3j8njDIEy+Scks4cnfZAOL8qtbXCH9h9jV621co70Fuer5Vf17
	 2vNGEXeFRnmarqqQKCQXq3nlyBV+sTTzdmwDNFgEktyxTZkW7g83isIllAWQ5Jvik2
	 /8fn12aBvHvvu5EXYWBmhf7ySJSjrTUnGPHeNjnY=
Date: Mon, 25 Aug 2025 15:31:34 -0400
From: Kees Cook <kees@outflux.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <kees@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
Message-ID: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIMEDefang-Filter: outflux$Revision: 1.316 $
X-HELO: [IPv6:::1]
Envelope-To: linux-hardening@vger.kernel.org
Envelope-To: llvm@lists.linux.dev
Envelope-To: linux-riscv@lists.infradead.org
Envelope-To: linux-arm-kernel@lists.infradead.org
Envelope-To: linux-kbuild@vger.kernel.org
Envelope-To: linux-doc@vger.kernel.org
Envelope-To: x86@kernel.org
Envelope-To: nathan@kernel.org
Envelope-To: corbet@lwn.net
Envelope-To: dwmw2@infradead.org
Envelope-To: puranjay@kernel.org
Envelope-To: mark.rutland@arm.com
Envelope-To: linus.walleij@linaro.org
Envelope-To: samitolvanen@google.com
Envelope-To: peterz@infradead.org
Envelope-To: kees@kernel.org
Envelope-To: miguel.ojeda.sandonis@gmail.com
X-Scanned-By: MIMEDefang 2.83



On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel=2Eojeda=2Esandonis=
@gmail=2Ecom> wrote:
>On Mon, Aug 25, 2025 at 5:35=E2=80=AFPM Kees Cook <kees@kernel=2Eorg> wro=
te:
>>
>> Yeah, that's a good idea=2E What the right way to do that?
>>
>> config CFI_CLANG
>>         bool "Use Clang's Control Flow Integrity (CFI)"
>>         depends on ARCH_SUPPORTS_CFI
>>         select CFI
>>
>> ?
>
>I don't recall what is the idiomatic solution for renames, but I
>remember Linus talking about this topic and about avoiding losing old
>values if possible (perhaps getting a new question in `oldconfig` is
>OK as long as the `olddefconfig` respects the old value)=2E
>
>I think your suggestion above will still make it appear twice in
>`menuconfig` -- there may be a way to play with visibility to make it
>better=2E
>
>A simple possibility I can think of (assuming it works) is having the
>CFI symbol for the time being introduced just as a `def_bool
>CFI_CLANG` for a few releases so that people get the new one in their
>configs=2E

Ah, I think this works:

config CFI_CLANG
    bool

config CFI
    bool "=2E=2E=2E=2E"
    default CFI_CLANG

I will add that for v2=2E

-Kees

--=20
Kees Cook

