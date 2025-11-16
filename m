Return-Path: <linux-kbuild+bounces-9642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF12C616E9
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Nov 2025 15:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D46604E6EDA
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Nov 2025 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F49C258CCC;
	Sun, 16 Nov 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/AejFoF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331C4207A
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Nov 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763303788; cv=none; b=Fz1spgomraP0J4N6j4s0CY3hiRFrkDPS+m4175We4Dy44rZ5wRQoBUmh6bXn9i/Suk29XF33aaKroEqiOo1G7VEF6n75hGJKknCe850QR4E7rbD6L/TSY6TEGtWNHcG9yZRKYLAj05sT570KAkq+svtwY/qBqyiVMAO9QnobHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763303788; c=relaxed/simple;
	bh=4NScxB0D32Ozgb1cjp08xR9+0LYResDTWlsurLKMKwA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nAxFmqIMGbaruz5IImPKbgtqtpnnfdh2iB2yWV6kvpa4xiE+TKCP11MAGcD++vXLJJm5qStRq30OHiQkI1QfkjRQ5ORqleVCYt7hHktaUUw/XkaEOeghIZSLKq08FsR7JMldk8i5iodrhfzoX0MD0/TP/iYDoAr89tnuQzfLgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/AejFoF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-787d5555274so33509627b3.1
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Nov 2025 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763303786; x=1763908586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=R/AejFoFrQJOQg7i1hPAN3N8pRRjn9veXiSfIEDMtSNrcH3GWP9i5YII3ssYRfyZvc
         DxWOXljYh4PU9CBVMpFCR6QMTRz6S7LbzzGGIj9V3Pag7CI+mz5qvEYr3bKfaE44lRBZ
         UI91Ey3l/zbSDyI50V9MeFT6YL37NqXDJ7lwkvS7EUA/QgDOqwKcnPvLceZzKGc0zlTv
         eJZyDlCSVd3xBE2uzvSDC+ab6IMAQiSPKoqxDozs0ACpJOk4s2cmfOmNN2x+Vc5lkbK3
         VTLmITaJ4/CFeiGfqaLnV4/tHogrSs/FY01KdMFmlD4W8lGUwMMTr21nL07ek1KX0V84
         1+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763303786; x=1763908586;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=aW83ZHfNlaRY4zJDltPUauP1fKrIcFShOnu2uqP85tUgZ6bcoC5GKyX/bYi3Pxnx1G
         66BK3J16g/mRuGb3fQ63QMrVk5uRrF9E7InA6wZUWK1QIn1XGRgqji6KK0AJ4HuMycOo
         0O69SQOCHX5XQ9sEeFPx4Gi57zqyMCdl+MPsftJr3Qi2fRhZ+oMabOqUgks8XIITun37
         WPudzJoehYMaFcAf8apmwbuMBREDpPMU5dwjkkaJgAngtdtMA7XxV4o+KzQgx1g0w/Ms
         Dgo57x7YHQAPJZjI2XQ+bA98Cy3pjcIKIYyMutGKwO5tyrYADejkKurCJbcCIg0aItQ+
         9GXg==
X-Forwarded-Encrypted: i=1; AJvYcCV71IlCbdNclb0/EXVYCzpzX7ELetGWu965vlUmvRPO4JZwj1ZBinl+RZAumT0X3Bl5O5/xu1JChU184n0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuipY6ns3vCelZYnsVYFAhjl7cRqW2SP5G5TIWUNy7n3r0rgf
	z24eH9z4JKchE0RoV8aY19nQxhC142dYm0bVnGsKlJ8azmwVzcsYERdy
X-Gm-Gg: ASbGncslKK0WrKVQzq63epectHAIY60XiFICnA8rKowSaXfHXZT24sVDVi+rjfYrZi7
	lyFm1aZ0vqXH4uTFrMTJ0Va9CYhFqOD42tMQazUmNHBooVzDpkQyli/+/ExcRV9JuF9DuRBdPwk
	w5VcUHu4V1L8JUE2A52bcWg4o7cCRzIsmsZ7mB43eFkwMZPnO0b8/VNPxhWzQ6+jfnHsZWJjOo9
	4l5d5qAa0z+h+4wakFTCLlq68LQeuGOxNTYFCaDnLRYqSh63Dk9vJFSW7ptzqEzEIcok/cxzy3c
	xu7+eHk/8N2pNlAvxJQ32gS7FllVgnBa45t/EaeXUQezX/4dTFtAS6mi1as4Wby5swirgZqejFe
	D1ByxtAO6ahjJwo6JOIn9b0hsZnuQ7/MMMwpsyeJ7UMGQ/HlCgYju3EgyjYEzDiAho8mcf6CIdC
	ZIITI8YwyKToo4jLTMPQpn/5sLiHwyepvC1nm6euF8
X-Google-Smtp-Source: AGHT+IHNIw6QIiDFPjc4EkBNFnRmBFkcbvwCydSVQ0KYuZPWWteIOQJm4rOkV5skYl/t6OkSO5fGIw==
X-Received: by 2002:a05:690c:c019:b0:788:1086:8834 with SMTP id 00721157ae682-78929e0d1a3mr64629257b3.12.1763303785409;
        Sun, 16 Nov 2025 06:36:25 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de192asm33464657b3.8.2025.11.16.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:36:24 -0800 (PST)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
Date: Sun, 16 Nov 2025 22:36:16 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone. Sorry I was inactive on this patch for a while. I'm getting 
back into this work.

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

Conor, since you've reviewed the v3 patch, do you think Vivian's 
suggestion is a better solution? If so, I can start trying to make a v4 
patch towards that path in the next few days.


On 9/19/25 1:20 PM, Vivian Wang wrote:
>> [...]
>>   
>> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
> TOOLCHAIN_ACCEPTS_ZICSR_ZIFENCEI?

The word "accepts" is not very clear to me, as this option may also be 
YES when the toolchain does not recognize Zicsr/Zifencei in 
-march. Zicsr/Zifencei are always enabled, this option actually detects 
if the same flags related to Zicsr/Zifencei (-march=_zicsr_zifencei or 
-misa-spec=2.2) can be recognized in multiple toolchains at the same 
time without causing any errors.


