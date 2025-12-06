Return-Path: <linux-kbuild+bounces-10029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE1CAAF82
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Dec 2025 00:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E71E307ECDF
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Dec 2025 23:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42452DEA9E;
	Sat,  6 Dec 2025 23:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePbt8rTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FBCA4E
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Dec 2025 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064504; cv=none; b=Vfl8nQE5esOOBxcbh5YRa1nP6MsuHEAniXul21qrdoYzHu8p9jcg7pLorGSblcZ/V2cZ2XJ0SURikI7kH+mGNgOadPSJaXcHGKsvYfpyw0FFjYIrpQEBqNDpIUJgk0IhL6r4vE4KFz1UveWiM+AYVO+OJhGlXlZEHWJVKPSnpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064504; c=relaxed/simple;
	bh=2Q/7XbQJvjrLnrR/4wKTgacaB87PLU8rSVQMMxnKDKE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mg+Z1jFUN/pEhbchRNvYVjOzHocCkeXsTeyYuK7PRo2ylOmsuY/D+acxQ78oxqel6Vy1fKM19XO0ytO2xpd9cWZ8ZX8GP0X4rsR6m6q0n4sOBsYVQ+Qv256BPZF4cW6ziC5+b4V3uxb49A3fSE7P54hEHD9grpiRUM8OVdDQnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePbt8rTl; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-642fcb9c16aso2879595d50.1
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Dec 2025 15:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765064499; x=1765669299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=ePbt8rTlE1/eJnR3sxlgLCX439LMvWsXdYqDxSA+rAA+wjcio2o5qdAW69NWoHSF/q
         uT0cDQ7XpImbiond7HESH8CUO09+l1Tf+VyzTxeMUFInb5tGKBFEXPvqtG1J6HQ2+g6+
         S2Bfv2iqXLc46Q7PxygPijpCgWZdQfec01YtKZx9LFgOFogj9G123xUhtSp3KdMTrrT3
         qyGY5FH+b+lmQqhb73ZXslptbAtXGH0bzSEqifHeJThhpyXi2JBdZO7JeOMUe7HQMdhr
         I29RZjK9nRLC6wZqwqLNn0U6DaIqKLoLA06pBWGrMXXy5XihSHqBBlOVKos41TZSC++W
         Q5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064499; x=1765669299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=hKYab9brwv4dVO+RKxRF0to4hJOdNpvZnpf0Zf5bJKQDL7kMRysbJWJC8EB1lJBtEL
         MKQcYWoC+V4ZH0IgVatDZ87mCSXX5Inq4VAufG1z61nsqnCdarKW89RMPeQLBSEkyYQN
         w9jX8UuP5GT+tAivoNPZfn+LfnOO89aJVVg5k683sQUCVq61BdP2p4NLi2JiYmRpLLMO
         yOEGy+6iufQntmzWCyWHPLa/+y0/tzcU1Rlsp3PaSt0SUdtaWoo/n8bSIeeP596p6w+8
         9Et/W7WzKAu+7cWOJOj7V0R8kFdVt2hpt9Zyu+hadZqeANhqALyRl043NsywflymsvDZ
         WIxQ==
X-Gm-Message-State: AOJu0YwGLQypfU/Ca4oDrZ6B3iCKdjugBaBIuXQAy6EreebhZcXy3EYW
	GlsnH7GBEUR5LgsBrjppt+xkHikV4frbtPSscN9hDrkKIvYru68HqrQg
X-Gm-Gg: ASbGncvhzHxQyl8uaZl/KODH7W3lioX0rIspcifiiwBzEzX4H+3P17xykfztUNfNrwq
	bXzBaU8QEyshEGe63ERszh1t4BM6t03CWV++3gDKiqylp4Qghn40qD97C7bH4yb4vqaIzfvEOkz
	Vs+Z0aJ0sdHLshvLG8RRt5a1tFZA9x5jCNZHVnxKw8LfEswJOfFSUNjAAYIVD13mIY9d+c2YypF
	Sp0uUVMBMXsDouC+vnTYgnFj2q36qrqQ7C6wXY9kVwnkORoDR54CaC5VIrGZSfF2ONeHseFKj59
	Fp9tdQXl/WTqZR4/i5C1sDaFY3edt3nbwlNxl3vlDtDzpuLY4gW/5KQTzI8IcdQKsz6hwtTgaKN
	t5gotvGntiWr9D3cC926/BWehOLlC3X6MF8sxb1N6OFgbyQukvqINX8ONJLksimTAFNxmvm3U+q
	V5ATscF6migVtKH7WZVHpWY/giye8zPQEfT6uDuv9BFJlH
X-Google-Smtp-Source: AGHT+IF0mKyXnKTQB1xhzD6LpgpTfgywW7IIal9fCo1GqYHTHD2NnE85yzsXQBQPCshexFlzlGdhdg==
X-Received: by 2002:a05:690c:7404:b0:788:e74:b267 with SMTP id 00721157ae682-78c33cb321bmr61970637b3.65.1765064498716;
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b7a72dcsm31972167b3.52.2025.12.06.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9ef24254-2761-4a0f-9c4f-342293383800@gmail.com>
Date: Sun, 7 Dec 2025 07:41:30 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
 <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The -x argument should explicitly tell (lib)clang what language the file
> is without needing an extension. I don't know why it's not working for
> you...

Didn't realize that I should pass a `-x` to the backend. It works now, 
I'll include it in the next revision. Thanks.

