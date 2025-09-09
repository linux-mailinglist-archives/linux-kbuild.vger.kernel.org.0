Return-Path: <linux-kbuild+bounces-8790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18AAB5046E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 19:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6474E16E8A7
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 17:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA63570CC;
	Tue,  9 Sep 2025 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyIfbSRm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596512D5C74;
	Tue,  9 Sep 2025 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438805; cv=none; b=mvR4JsYjrOngR8USG02YtnARALNhO08/dQFPuh8zdaEQGeNJJdLmDZaVeSIPArUOW8NCp8aaZP0leiEGLrqKrPXYDxmiBHefJ8owkVU2IivJmzW/U/c7KDTiDNe5c4IRkXIsdEk+WOsx8uOYlxy/wxPYreh79Aj0la+0j0W9FJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438805; c=relaxed/simple;
	bh=N+pGwPw9MZww6G+9DA4s3ooxnN9i57hMzT73xzakERs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fVuqGZ2xAuOKBdC2S/K3Tz3PGyhhs6fnu9osCUH20v8X9wi5lpXltLxhoOPXErMnm2iJE295yozx7we/4zDHiJMHKiEm7aUI6C0Uzmmi5HwpAVs8KDpqL2I3SbmPKDA5DQUF3CCgM8EePdMTg2tYV7NrhUcGpFbTn6dG4sHcnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyIfbSRm; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e96d65194c1so4533488276.1;
        Tue, 09 Sep 2025 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438803; x=1758043603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=QyIfbSRmWt/H/WdIs9NxGXg28tR4bQgTUsuxQFFGCMEjtZGTtAd44nokr64mRLHba7
         z09jAa1zpBqdZQBwdyRZ3CiRKoQvTcS+Lykke23hJyx1jaEwjFOh2qh6BPVNjM2kRXcL
         XJNO/qxHup6JirMBHL0KnI+rTa5H/SFkKVqFSJOtYCPkDTk1ndAvcM/fDqMwIp1Iu2qG
         YqTEGu6M83nXjDzB9NUGg6KC8ZYDxb6UMk1sXiZKNpjg0QcsQe3ArqkwCobH+z2TJWGW
         rg00aPmljaAi0O573u7/axQujATfCUmMUT8dpIIFRG5VYDnBmdKUfFbLwjwOcyF5Tpn8
         Ggeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438803; x=1758043603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=Knn9wIoNv9jEWVYIf+ltK4Rv3W3ZeeL3nRlTgJRRIYsclGq/m08SEKX4APVWHQ+9aW
         qWZRlAJamPd3Euk4N0rxSsD5Ild6GgZM57utepY09L+yXf+fCjWxkX/q5vLiMoKf8hqV
         PKsfGeoa6RKmA8ZzPrQP5e3dIFYDV7ncXZ3Nzits6qXCgYGSorHS8h5epAS15t1aIpUl
         RRfWjGlC6U048tp/Em+719M7WbPHVdj/0+LiwUSV6X/Gm+N7uD84LXnjkswFBCfGUG/W
         xWnFL7xasXV1FVxQ5JdtAA80FLj9UffbsYwObn0CxyOwX5kDfnIW8E+SoFcb8+nXdtgR
         vsGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPs0b0mCZ/uv+cluZu1SNKdsdBDtuwKE0H8+VR+vDBaQtV8EwGLS2E0WtqVU/1R7+HcykvJuXTTgbT4x69@vger.kernel.org, AJvYcCVnqd5qC/aBdviP5HaMF7DdPiwyhAxDuczL0nhCULJC1506vsBXWLAYfu9/l0WsZyccDliIICQ00Mk=@vger.kernel.org, AJvYcCWJ8mtkNJ70aacTYtWD0dUNboMKtaDFbA4X4gag+AyJEHA6odyPLOfdIkWi5zs9ROE4rc5oyCFCVr+YEqrQKqk=@vger.kernel.org, AJvYcCWqYuYRr+119jfkXSzToD6mo8W3JPc9MGrMHmBtHrm0PqveWRVv/NTHBwolvg9pxaPJCbTGOrmViS6jEx36@vger.kernel.org
X-Gm-Message-State: AOJu0YwHg3zYxBMgpZ1OBKvK//3aL2+WuzVThEqfTAYTvxdGJDu7Frdw
	fm5esQT1Of9wIsW5Amr/GGB/BzvGsFL2akj2xmdATMQmwStaizSQI7wJHb/UgFMdHUk=
X-Gm-Gg: ASbGncs1vsVNuzQbU3ANxg1l/N9qgFY2c/esJySAuaN7y8QC7g3cCnkwfokQgRk3/UK
	DCjaRg5hMPjNAfyL0j6RBSdcAcFZU2Kd4+5O+nt89EqsBjbKH0MFb+pkpfiTEbGPP3Bm1Rafw0d
	ZmboCl8at8TAb9HLK4TR+MxFsAhBH1pDqn4rQMDFQMXbR+2fjSPst3Y+1Nj+UFcabmlqkhCt4qU
	QqxML1Rmn27adJEEb66SvLwmD2CjDz3CkFhw/hmCNUrBhi5xPPw1gRB37LfZXlVbf2/L/eX25YJ
	XN7x3F1V7CHE2q0+VXecjLWGNxn+46emcAvWOpb4DYryKc5QDdH/MgUJFZtFJp+H1X+bz2RCj56
	w1POiKTj3kFHXvpm/ZVGykeioUNbvd/80peocCy5mG/zyuhQcTz37
X-Google-Smtp-Source: AGHT+IGWvHZDYiA4RGkwYsweLqhI/RtpyRtGhg9Auj53oYUggWnrYnKSkAk9+pz7VYUcyUr/yHalzg==
X-Received: by 2002:a05:6902:2b8c:b0:e97:1bc:b273 with SMTP id 3f1490d57ef6-e9f662ee3b5mr12680572276.21.1757438802651;
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf1fcbasm6726070276.6.2025.09.09.10.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <a78dca6d-5504-4f46-910b-820cb9ca750c@gmail.com>
Date: Wed, 10 Sep 2025 01:26:33 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/25 1:12 AM, Miguel Ojeda wrote:
> To clarify, since this probably targets the next cycle, there is time
> to discuss and get feedback to do whatever we feel it is best
> (personally, I can take a look after Kangrejos at some point). Is
> there a particular rush for this?

Nah, no rush, as long as it works so that RISC-V distros can deliver 
Rust-based components, that's the main issue I'm trying to address.

