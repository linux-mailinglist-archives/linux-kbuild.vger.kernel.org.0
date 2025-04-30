Return-Path: <linux-kbuild+bounces-6814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FCAA51AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7BCD3B574B
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C1B2609C8;
	Wed, 30 Apr 2025 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="MJvRCvHV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD225EF94
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 16:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030555; cv=none; b=EWU4ptBq01w8t3eCyHRODtlvMa5YzbJW4Ek/GUE4ZTtOsBGkdRgxw64YCYboR2S8bnFzi17j1bm0YN+jaoaej+m0AofKdcEII2PAFMVsn/YnvsMZ6HzWqYI0cBAqNxLT6idSc1eQg2dcNNaGjHBKMbFCDYKCoee222fvp6T/DuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030555; c=relaxed/simple;
	bh=N2fIhTPP3bAsp+EgIBZ1fV/xQFWlcYofrCRmusWDnh8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=hdSUK0MQfTWE956cFAeLYusZ6Pxv+g0TmYDNyhSBKI/cSeY5pp5ysxO/2Gljvrr/1COXhHhW7TzEQUDQVukBkhKZhXReplyYCd6BHBEX4adWEodytMJJMTiQe2/MCIOBheyzhl3rfrIjLUHRQIgLHfnoZYwVkQlewzHlOU7AmzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=MJvRCvHV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1221347b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746030552; x=1746635352; darn=vger.kernel.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GFOC4sM5/CH4fwuCHLrUzpIazRlQRbLd7/G/i93FgIw=;
        b=MJvRCvHVFKRCK2J9qzxUI9YQOZ5vQsTZTtI+4dzuvLOKru4mNhjLgLqWg7yfZaFCh/
         oE8u7WSCpVg+zaTwGWBhtm3Sc2ARTdfN7tSehpECzFLESgdVJPNcc5rmTLxiYkwMWFtn
         rdVxRdnRJfmaUa4NTMSYEFLb94vp/IOXH87zD0epTs0w3gVl+62FYG4IrrEp+4WjLEHY
         wX6+t5M9UCYj7XLmc0EdXr+M3wE5WPU6ECFhQUyzUDJyKrC9mdV96CVkkh5OZA3ig32p
         ZPRBacUaKCdmPqQ5Eh82/aRJo3Agg0tS+GKgZiXr6TqXknNkptRBYYPINvK4Vtzc2Oe9
         bQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030552; x=1746635352;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFOC4sM5/CH4fwuCHLrUzpIazRlQRbLd7/G/i93FgIw=;
        b=tlo5kMuaSJfFkuG4lbD2te2HqeRQI0PeuHnlFkM7L8J0WI7Vqau5HrZnAKfuHggAX2
         dY34vMQ5jzWmh8q8/adqj6R0MTNEeSoToVGjuxYdMYUp3oNvzIzSYR8bTh0SKRztV6l6
         KoClI17wTj017Wb363p/ROJicTyWLxWhNadAgDtu+BaBoqktJtB7YoxuYxIVtch02cJZ
         31BUlcLih3lN7zxfJqHVZxjoHME06yIRNtBu+Gf+GmNliz17ArtgSO5xa9zZ7PxOoCrb
         40/cw4gGYINgqsUmgeyJ8dtmQ5gvK8NvNTi0VogpAiZanMssqM+Ig5uFnQH2GzaZTlA1
         JH+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+T+g9gzIO+7znZNtTSyFHYSlGRpg9HqDomJRjLl0sI+7UrWQDZgnXldnBwzHUeRZDuOaGVk9aZaJKTSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85ypyWBz+xXaw7Qq9wS5fJO3wRqpLBm25+1GPNjTMCCEp/6iL
	meTp0ezYddJDo6P6XKUY3yYUz8f3XIK90BMJyjktzqoksvBjT5n0S6TiVsuYtBQ=
X-Gm-Gg: ASbGnctguzpbpaMTAwdFZNBBsqkFscpzsdiHinaGGQSBvnLL+h7OwCbHzOW9STTehkP
	Aai3NfLPFiDbJ/IxWEbjfjjDZXyeuFlwlf4Ir+5wJwFgjGUI1wJlflPiNKHx8kfD6za9l2C+AcL
	5pe1Cg6wC8Jxg0UY+qDlZT2rLWN0iXNg6fJbKo6jINdUHrgp4EEJAqGEiEJFrQISadveLTQA+fx
	liGLGKALC5fksLp58TQMh+fqSrYYkeALSQ+TJuPyraTP+2FuBqt8VpH0nqnPZ0lujcQizGQkk/7
	RGmznCPioA1z/Ctw9d1IlUbLWDv6mg6hR0DyQg==
X-Google-Smtp-Source: AGHT+IExcv1noClcSuOpJP7nbUZjzGDa8bluXkLE8YWpSh0gFLO9pEFgcrLD3V9H/3+JCHX18NNokQ==
X-Received: by 2002:a05:6a20:2585:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20b9688ad53mr178074637.1.1746030552553;
        Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740415497a1sm865577b3a.116.2025.04.30.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:29:12 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Apr 2025 09:25:26 PDT (-0700)
Subject:     Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
In-Reply-To: <20250430-bronze-unsuited-3f47ce46d8d2@spud>
CC: ardb+git@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
  x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, masahiroy@kernel.org, mingo@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-66039f92-bd1a-4314-a728-3fa8db3f3e58@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

On Wed, 30 Apr 2025 09:03:56 PDT (-0700), Conor Dooley wrote:
> +CC Palmer
>
> On Tue, Mar 11, 2025 at 12:06:20PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The imperative paradigm used to build vmlinux, extract some info from it
>> or perform some checks on it, and subsequently modify it again goes
>> against the declarative paradigm that is usually employed for defining
>> make rules.
>> 
>> In particular, the Makefile.postlink files that consume their input via
>> an output rule result in some dodgy logic in the decompressor makefiles
>> for RISC-V and x86, given that the vmlinux.relocs input file needed to
>> generate the arch-specific relocation tables may not exist or be out of
>> date, but cannot be constructed using the ordinary Make dependency based
>> rules, because the info needs to be extracted while vmlinux is in its
>> ephemeral, non-stripped form.
>> 
>> So instead, for architectures that require the static relocations that
>> are emitted into vmlinux when passing --emit-relocs to the linker, and
>> are subsequently stripped out again, introduce an intermediate vmlinux
>> target called vmlinux.unstripped, and organize the reset of the build
>> logic accordingly:
>> 
>> - vmlinux.unstripped is created only once, and not updated again
>> - build rules under arch/*/boot can depend on vmlinux.unstripped without
>>   running the risk of the data disappearing or being out of date
>> - the final vmlinux generated by the build is not bloated with static
>>   relocations that are never needed again after the build completes.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Delayed report since I have been slacking on my testing, but looks like
> this has broken boot for me on riscv (mpfs-icicle-kit), no output after
> "Starting kernel", defconfig should be:
> https://raw.githubusercontent.com/ConchuOD/riscv-env/refs/heads/dev/conf/defconfig
> Toolchain is llvm 16. LMK if there's some salient info missing.

Thanks for tracking this down. It's not manifesting on my end, but we 
talked this morning about this maybe being some config-specific issue.  
I'm also on LLVM 18.

I'm going to start poking around with the configs...

>
> Cheers,
> Conor.

