Return-Path: <linux-kbuild+bounces-8113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C21B0FB7F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 22:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59B43B9F0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 20:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164E4218EB1;
	Wed, 23 Jul 2025 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G55YCzyg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A21DE2CC
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 20:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753302735; cv=none; b=HqkfIVtFBrTTkbvFvYhMzYBeyCffBP2V566yRwwm2takSF6CP94tBTTw1sKD71EDKTV2rVpVDsDbXbBn3jKonnS1CU6jIBwPdeN+j0uyPf7wRPFq9ro6j9J2uH9vAfItsxGiu8cfv66RAxx1krc0mNt9QP73lNIE2E5Ax+hm34A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753302735; c=relaxed/simple;
	bh=GTXQscJU4LPgrl6bU/T+prkMwqEg/02bZaCUdUkEXXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQsL7bB6/pYup2sn4MOk8pj4nxJSZILOugxUqu4ID3ipH2fJhd26e4TSjTYYzE5RUUuoFbRw4UERKftwrUad0t7dFl5rVsNYFHFSU7H5EDKXbiWmf9sWBw6SQAVEfS462evy4h3F78cbnIlhVQzoEKjBJbVg9++MhBU5XqJcuxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=G55YCzyg; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0de1c378fso36560866b.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 13:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753302731; x=1753907531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tW3QBWuerrQdiuDXr9GW4Ls+mtrfwnWITMUravp8ZU=;
        b=G55YCzygxpJN9/ThQnEuTYlUGwf8cJ189wmbpY0iTcAeKQw2CbMPr6sjbBzSBNMuAU
         FtPHX8Js2wiHiv5Khqr2UsfflnqT0R+nvTGVWXusk3Vdtxrhmk6MbGWtFyZzhfvbavz/
         YpBLrrhVmDeIFjB+87PgsHWFnaWoYMnzsR5jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753302731; x=1753907531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tW3QBWuerrQdiuDXr9GW4Ls+mtrfwnWITMUravp8ZU=;
        b=Tj+ziT1DVNDi6tuq7+4+TmUSHsGUATIiV9V4Pj7DDiIZBp6vIsHWc7DGw52ALupNzn
         5XnGRs1bSjnwkMROMB8p4kzX0bFag041u697KfBSojy43piFJBbKEyerR9ZDIvr9SQMO
         xU+1N8tb+MR4uK6DJkYUC3VbKVZJztXeHM9AD+SVVemVRM2j8ISCPPeW4UHWmpW2hw8s
         4ksdgbamOVB2PEnCaj5xVU3y6WAoJdXxUUvmHktFtk0zHHWVEdGC1p7vYdpdLnA9wqEl
         ykC0UQN4LSd+z0GNlPpFDlVyRQ356lqCAyW4EImKJDbixngi88i5E6bqowFqGf8AdRnV
         cvFw==
X-Forwarded-Encrypted: i=1; AJvYcCXkAFsnolfldTKo7dE/BbFb9KEk+l0kxTHrO0V57OM6L2sNqr9OcNLKQ0LaPW1VmBrp+YvHM9Rj48tOzok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXRSQDRRpJTb95xxWM9ka9U1tnvzEZr6WaHakr+XJCivlns0Np
	XBcOY2srEt/qNK4aJt22+smbRXdLx4nChdHGZQLQdk2340hhBaxl/OoZFDyDHfDBIAT4jZL5EzR
	AcSUu7ms=
X-Gm-Gg: ASbGncvZ1e89GYZTAtCW5pmCe3RLkgSoVxnU8Ig/qZDDq3+eC2sJRLCftrruxAFLD19
	KytqX3zeNBSORFPtwJBhBzzlzIUv7COwOeOeVyF5t0TXd3F7/uQYoy+DQNMqiXdW8fz/WrqHoh+
	Y5NiuI0D9vbdCHeu9JPCOXswvPuU9uebUQ9aVeOSDMlTt7UFGBRmnlATqfH7cjNATefiWYfBt7g
	t0nWaIBOhgChbYjLwcT4YCPMPbai9tgdNUy4VNcpymvFyiFppWDW4/YfT3R3/92fiV3SOn7luhk
	RpKxK8lsrZuZWK7ue1EMqkS3bvo6diOzdCBx2Ld2w2okVkcdzcICxHEap9GhGYEf8AjLBnCl+BS
	+XJodkAy8Dy2P7eE0CSo6oA1Gm1rBZSbzRVlLDoIEIfN1/0K2FSiqERzghnM/nGU8BwiomwXJ
X-Google-Smtp-Source: AGHT+IE2hvhHGOfd1Tgvab91HYU2EwFmcFpufxqfIZTlA9a4boOnw0TdrSnN2IHbknDJ4eNmhcISAQ==
X-Received: by 2002:a17:907:97c7:b0:adb:4342:e898 with SMTP id a640c23a62f3a-af2f885a6e0mr448343466b.28.1753302730760;
        Wed, 23 Jul 2025 13:32:10 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff432c5sm2565366b.147.2025.07.23.13.32.09
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 13:32:09 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so564957a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Jul 2025 13:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXYz7ofNzgdKwzO9kW4bAADbHpLpsG7qI9833JyMa21D+p3VYUfTGyYOPFdcKRXdfwE3CR27/x3w132BU=@vger.kernel.org
X-Received: by 2002:a05:6402:2682:b0:60c:4667:b29e with SMTP id
 4fb4d7f45d1cf-6149b5ada7fmr3885377a12.31.1753302729207; Wed, 23 Jul 2025
 13:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723194141.617125835@kernel.org> <20250723194211.768813368@kernel.org>
In-Reply-To: <20250723194211.768813368@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Jul 2025 13:31:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
X-Gm-Features: Ac12FXwxyPrv8gGTCI226Aa0lB-U1g53Om9xi3Ol5z0sTqQ_za5i5iEvuIY4KFk
Message-ID: <CAHk-=wgbAruRX=xFVGevggtRpHNYyMVwgNYYJgYg5hMuU6ASGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint verification
 check at build time
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jul 2025 at 12:42, Steven Rostedt <rostedt@kernel.org> wrote:
>
>  kernel/trace/Kconfig              |  19 +++

Annoying "one step forward, two steps back" change.

You literally sent a "remove one pointless Kconfig option" patch
within ten minutes of sending out this "add two pointless Kconfig
options" patch.

Because as long as it's a build-time thing, please just fix the
problems it points out, and it should have no real cost to being
enabled.

We don't want to ask people questions that don't matter.

Of course, because you *used* to check this at run-time, you put the
new "__tracepoint_check" table in a section that is actually loaded
into memory, and it appears to be still there.

Just put it in the discard section, the same way we have (for example)
the export_symbols table that we also check at build-time without
actually ever making it part of the kernel.

                 Linus

