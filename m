Return-Path: <linux-kbuild+bounces-6724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC5A96C5D
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 15:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40E58189E9BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 13:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ABF78F52;
	Tue, 22 Apr 2025 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dkcpLLjr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79A28136C
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Apr 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328139; cv=none; b=gd7MMvn395AMxuwyZS6tyi6Trem6YDddCSVaWmM8nhvxeVg6SsV7r0bi9PPQpdCQrA3wkiKB/P3IA6dA4xD8WrZ82NSNPUZoUplK1cN5FU0Mkyq303VmBQUJWXVvUp0ZVIvN/+fcwsbQz+5qoJU0/PKFzfUhOE+S69urzIkPFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328139; c=relaxed/simple;
	bh=iBeERhynzVtABJ17zsJg2c4wme0BjEpBgTwXNfdYvBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s24ARNXSv0kZpIwZQQ383GKT6j1nYYdiZ7AwTQ/mwCj2jagje3AQs9uXu/FeUIldEpcn+1JKwwh8hRzYIgueU47ma7EQ+KPDbCglCQgavJ5zd14Ic2SO5C1DTBQYZhJV2TNodBj93MpmE9afzrZCRcbqo2buP0o7BFJFB0cEoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dkcpLLjr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb5ec407b1so695468266b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Apr 2025 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745328135; x=1745932935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3XNp6FOG0YBB40BSQ5b9F0xQ6kk+DLGoBOj2lK3UkU=;
        b=dkcpLLjrEpCHq1nKnXuvvnE7Ty4INfDd501NyXXelhCX068hkJZUQFJ2WtGlJxJYwb
         2UJj0GgcisWHxN74+x+RBnf7Lj9iYg5CVEMq7BgG7Hmja/RTtO79Y9yxRjiDqfgOHTXa
         Ise0dlanH071NWrvuKch+JiakrzjohIzbzBdjyxMxwERMGz+R0DO+zg3V74FjSX58qJs
         Hs5onzICDyTxD08TCTQycBc5Lxpnq/538QXDGfTYnb89zuSI6YnLHlhxQZKWLYHNVZgp
         AyxzcjIKOlBHAR4hQ9ZgdcaKXxb9E118KROawqpHJzJ7fTeDG3mdqWOzp+d3pm/WGuT5
         1FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328135; x=1745932935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3XNp6FOG0YBB40BSQ5b9F0xQ6kk+DLGoBOj2lK3UkU=;
        b=BLPQNeQFbm98+D56bCtfj27ZSnhGlChQXeIzBG8NTWftpIej2N1tsEwAy4F0EbSky7
         INqE9eJj26i+FTi2p/vf6VzT3ydO/asYd1bu2AEHv3xYEkWCS5hfcthwQ52M3TbWfv+B
         F3p0rY5xeAYiBPvgTu3sp8aHFgJjpL3dDBn0miZw2rP1gRcj2L6yWV8N7CY1LmD12Chq
         i7naqgijo9NbcSYUqSnkNEZkAL8zJ0jPD0Q452xPXul5A31Qq+aD+huAUIvTN/fHGusy
         vvs/7Gpk6fLdhxCWCaYMMbfV9T6VzZW+KDwzcK9XNiRjKwUD06yDbIllViGryqb/HSmY
         s4EA==
X-Forwarded-Encrypted: i=1; AJvYcCXWYThJvubbq2XhvQOS3ZG94j0LyzGGjWTrCPOdB3wKFYY9FvXyl2ZzyFws38oR1AFxRr2wEBeraudAgIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvn7fbDt2fpEO3e01BNAlZDXCiiytvJTna1tl7QkhxzbuNN7L
	hKSPjGIrlEuxQjx0DMYkO1RfQz3x0syuYmhhMq+dWl4MHeabqWqRePAtKrvyS/0=
X-Gm-Gg: ASbGncsP8oDKVy23KIf8jCauGbRAwyAi1lrXQlMlmXWbcMX1nB+fJaLN+ARFL0n8BTD
	hskv1twcAslZ/7PUFQ7znzaAKnRS8LKPqseXs86bwCWr+zrzv6die2V8BS/5f2d3l0sIykWkzKx
	xE8r8V1kzT7pTg3s5ifV0lSUxkmn0lC8i3Bd23dBpdaGCQs0iP2qVQUzP2Wa9b1Xr3HxUdJuiKt
	D8pgTlyzF78toC8CY1tVPu+UB7IVfOhQQpegB2u89fe3qBhuu6qKjxVqXG3ruMccBo5qcCFkXYA
	XmOxRo1rxcXFYaIes+rdDPbi7mTGFwEjCJu5ryaVZfk=
X-Google-Smtp-Source: AGHT+IFaXpflFI86k8u3dSw6HVkF/uY8OBEaZ5S2zW87LgBRnFduZGRJWQUonbqQbt0m5a26poCJnA==
X-Received: by 2002:a17:907:9727:b0:acb:5f9a:7303 with SMTP id a640c23a62f3a-acb74bcc517mr1311357066b.35.1745328135152;
        Tue, 22 Apr 2025 06:22:15 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b6fbsm668648166b.19.2025.04.22.06.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:22:14 -0700 (PDT)
Message-ID: <7f707d8e-f2e4-49cc-8d7e-e8c4c4193cec@suse.com>
Date: Tue, 22 Apr 2025 15:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/21/25 10:17, Andreas Hindborg wrote:
> Extend the `module!` macro with support module parameters. Also add some string
> to integer parsing functions and updates `BStr` with a method to strip a string
> prefix.
> 
> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].
> 
> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
[...]
> ---
> Andreas Hindborg (3):
>       rust: str: add radix prefixed integer parsing functions
>       rust: add parameter support to the `module!` macro
>       modules: add rust modules files to MAINTAINERS
> 
>  MAINTAINERS                  |   2 +
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/str.rs           | 170 +++++++++++++++++++++++++++++++++
>  rust/macros/helpers.rs       |  25 +++++
>  rust/macros/lib.rs           |  31 ++++++
>  rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++----
>  samples/rust/rust_minimal.rs |  10 ++
>  8 files changed, 635 insertions(+), 20 deletions(-)

I'd like to pick these remaining patches on modules-next around rc5/6,
so they can sit on linux-next for a bit before going into 6.16-rc1. It
is a new code with no users so I don't expect much fallout, but still.

Could you please post an updated series that includes the cleanup from
Miguel?

-- 
Thanks,
Petr

