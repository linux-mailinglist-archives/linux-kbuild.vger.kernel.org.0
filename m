Return-Path: <linux-kbuild+bounces-8731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3EB44A50
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 01:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92D907AFA2B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 23:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5F22E2665;
	Thu,  4 Sep 2025 23:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koivvgoQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FD28152B;
	Thu,  4 Sep 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027837; cv=none; b=cP0VTWFKDILH5o1/WOmPOfbbq4qsy6MUh5VgOSwephHQ0+yaBRD/HXTOTSnIttGzVbDNQys1p0nHsGtT9X9D4ruHHWZ+MDKNZwn8xwQZrVgQHL/l3AtjhPzNKwwMnUfuC1oX4x4h26O2ACLElN25px80X8k2d/1mCZMGWiiNdKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027837; c=relaxed/simple;
	bh=vKxJqxUeb0q9SyWTMnv9Doz9iKaRIBHyfoEX6YoudiU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qZAoKkrLMeyXEsn+CJkKZow2hPONY0XHdSeacUbtiaVNR0vryspNoG+KNMfHpfZWw/m+IXg0erTEJzCBEw9AXrqltvoAiSZdjkaTApKYT+guNHpY5updhvWg/m8IsJCSgQBZ8V3Qylqy3fCiOlxfX1WEdKKnoumoTF2BNU5Ry1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koivvgoQ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e9d5e41c670so1638833276.0;
        Thu, 04 Sep 2025 16:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027835; x=1757632635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=koivvgoQq1y4AINaz63To0fJD9N3RE72wjgyEuMyjKZKEB1hH6JB8OCbWQ5fkh5pFo
         uPBv2ZFvwoP2P5+CS6pUW7ZYEFxZvwCj9/FnUm7MIgbFcJ4W0M4691U/7HuELznXvq3a
         6V2BLEOGu+rUTtu/1DoTEgGq5RWwJ6OPzm4aR3bVVXabI5UrugOkLL5qzJAZhzImM6Go
         VqiuaF0vwVzkqUqEaBwClnoz/0xcjj9xzEaeJvBGka2lVstesZlqdJVEYA8JNLrkdFbG
         1b2s8gHpqSBkNm8M7cOCO44eMLYr0BoM5Pn6oXp1EFwa3WHmRRlLUBw5AzwV3/yaKkGO
         0uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027835; x=1757632635;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44c7GuplR7w23bz2/uE3YIyn+u8WzZUsTx1xHnP0MOM=;
        b=PUfgKfsOnhQ0Vn3v1vHo6UO7RAGM+q3wORoIEdBDDI/aQmxJogIOcrKDxwnDWywkkF
         qSNwZo6i2knGVte8Evmkol6e3Dv4YwU5D8GbWRDudzZeQFBL2pTM81VwuUSxwQZvY33u
         XIcloC8XbJWxut/kZdOspBGlFNJS5RQgwIjlpyRANJPUCRPj52BAHly55gVv1CwLtkxk
         4AGilEpfEQkiPINxE+SoRFg5lPhR1Zm2L+GU7dkG4VV8RJQ7BIL2dOIOZj2n97ERYXEN
         aN8NS92iSkQkU1kZ5W+3sYCqTp9pgOzsW0ca9laby9ZQnfWHjkErGN8xmEWkVa16G6Lb
         aaBA==
X-Forwarded-Encrypted: i=1; AJvYcCUDg2XbJ5Xxh4BsEDM1qEl/ew+PkbOhaV9uiJ++V4A0GB6nx3Wua4XQGP6d6vHP/sseGWFmy1NAEULw2cN3K4A=@vger.kernel.org, AJvYcCVWVD1+NVqw3OyGgs0UQDt4UwgGQ7Sx2slT8zb4OSiiaQKVX8tqyyJU/GutKQdv0+9rJZJTu/dudFf//7pj@vger.kernel.org, AJvYcCXGUkrlQ9snY/BtEcHy3+08w89Gd0MiSVJnHUa1yOf/FJQ/aeCVi75lxYqeUm49GzwlbMIdUDsoYl0=@vger.kernel.org, AJvYcCXLi+vVcT4JWjf6CgKAf5iKzRi49stR9/QxLyOQMyDb8KRUao+6egfmTcFXrIXCEnOwe2GHBtid+E3wZRyE@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8WP76VX3MEW7Mk7QCFeyHIFGIp1gMTJdj5PGePbTbOrIOZDl
	FY3Os+TF+dq+OrZ0H6baqJvqOLjIjujj5V5X6KDQNO2cQeQJ89cOYNH+
X-Gm-Gg: ASbGncvq3bb8MX2Ef+8MsSpbuDgcyzNETUK+KkAcg79T7iRqhvRzsckLFg8qGUkLhjp
	8HESiOi0rEfxDWKIVg8m550QGPVH+3e/zSDqi354SPKgRngZjR7EkRCJoHHi9wdSBYWSgHRtoOZ
	aPeqLDINMTe+z3Ft8DDp3sVB9ApyDyg5uDHoZTpmNwsxUftdz40K0mQAGLE2Chw0ud88Q2fpvrz
	D7zBYsDYZoQtqQs3bBz3iMRw41IUdMXIRY259BWVTcMdfxn+T1C/qTrWLDVzWkfadDDIwEMwCCC
	t7qj0f8qD6xmLKAkAClPjw9N3xPBOJPWSo0Z19T8xZeXrNOcw3Z5GW2oZ9J/9GoukljK8gcNerF
	a0qfUXU71exnOgJMrycUac/2XCMnqFW9eq2LaUXmpQgFx/S0qgbwvVB/ZXEeml4LzcSPkU1yErg
	==
X-Google-Smtp-Source: AGHT+IG5rC/L+YgDnZCQ1gLq4F9L2loshi3GG0alOQkkWDK4IDT94yEI8uFHJeAzvHVBTi2SzWU91Q==
X-Received: by 2002:a05:690e:23c3:b0:5f3:317e:2eb2 with SMTP id 956f58d0204a3-601782cde5bmr3513128d50.28.1757027834471;
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8511f0asm24570997b3.34.2025.09.04.16.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:17:14 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b0f83328-5df9-4280-a357-7fc4d48fd0cb@gmail.com>
Date: Fri, 5 Sep 2025 07:17:04 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/25 7:27 AM, Miguel Ojeda wrote:
> I think the commit message should try to explain each the changes here
> (or to split them).
>
> e.g. it doesn't mention the other config symbols added, nor the extra
> flag skipped, nor the `error` call.
Yes, the commit message is worth being more detailed, I'll improve it in 
the v2 patch.

