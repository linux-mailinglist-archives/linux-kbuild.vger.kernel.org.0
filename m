Return-Path: <linux-kbuild+bounces-9982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA8CA2CE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 09:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9131300399F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 08:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56C133554F;
	Thu,  4 Dec 2025 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh2KrTYv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D719335098
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836802; cv=none; b=qh5x+g5ifYxkC2Jug96ilKpcuZFejhNYecg3oXUsFCDvWe+LnCVmoMGbUIktEm9lou9Snn3awMcOELFaq0gZk6UueKgRRsw6Y5N2eqW28a7bcsjkK6JoaTFskLzlEYPuT+o/DXv4FSpkEnRYmF7acFksfae0MvPlQx0ETrG9Gyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836802; c=relaxed/simple;
	bh=5nYFVp69QLdOo49fMh37kOqCk58/nQX82HtuIDyE89o=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kyANJxYN7JbTh+lErUfkfEU6y8eSCHrNJ8BdI457sMJ4mt1isBaqMCTRJlujxgHrGL0PgVsI/lGtpG7wsvAp8/yXN/IgbGUQI8wNAxAaX98ubKm4SjqPE+Y1jwH84mtOsejqSjlSvV5r/rEVXAqd/R/EA8BoXnFurK22LPjI6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh2KrTYv; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so556344d50.3
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836798; x=1765441598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=Gh2KrTYvR0JiMIIeqArR6hFkPU01zMN2LB74RC78+JNq+4sOnx8GheMp1lc8LGUVMA
         +8wMOhc+bmj0xBVzcwmW+S4jN0/pP6OadzU57UUUmNOyTm8U2Eueq3LelkI7jPfX3RIL
         4ba115YI1RlcmBYevOWkRGNPbpxeYQEHnw02ILrbUuLuYLEjvVxoOLbn1dAMTEpKrfgu
         u8DEifYZHIrWaImg1WbTTovZ0HX5BMEIPtLcMomGOs9laG3SxbUIzOUuv71Z/+ymmjYD
         DF6VEMxKYP57zrrc9p2vD3DbqYMGWizmNq2C45xyg/bYOqFwVPaA0sVXBD/GkVSX+oGM
         YC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836798; x=1765441598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=CUxGb4RCAmtDvQ3WZv+d2pytJKQSpj0wLfeGwjlHjue6Yrk4T9UTrr/yOzgJnoaBB8
         pYR32ZUh1OT5U/2ZuVg+FCI34VnA1s48C12Gl0B1wFagxREjiHMVUpKxDyJWGmbMuDKa
         1PfMbal+vQcZC/hG7E4Yt2R4OUXE/VcnqLTmL2nUW/s2jrfbYVLfluKUyWLKOiCaF7lK
         GmWlhG23ot0prLJ8fyqOQDIohHiGOLymIrggZcCLp3kQVM2SYW2EuZ2naM8/DKaBVcfx
         UObWY0fL51fBDD9/mU2BhQwKM2Yte/x983HSPWYLJHgcSC5yNmdjANrtRWbIFyTnxte3
         F16g==
X-Gm-Message-State: AOJu0Yx0voBepDv7SLBIj3T3JdCuDBEMqpN8cuTzsoT2JBVOHJyHXPkC
	mUwpnre/RnlBqeEdenmY6i4vKCDJjL4VQHPRm298kFW53B62cT6NNaDu
X-Gm-Gg: ASbGncuuoFhTOVbjRuZVJeVK+w5RrbaYKdsW9zJi31XGMBuSJjDiMMtxRmTNfiPfAcw
	UuIkCDtxZ3JgZ17knDm1QYeq1Wrd6uggex20DnEYBbh3PW1bGhsrFV6HADfzGINGZ2d4DOLOl1v
	nbvEubRZjGohL6sWeZNu7W1+kDM99NTBvrpSpKYjqbxX1O1nV+mtnuuT9U4aVJw46Emxk0AYvm3
	QJsl4jth/xbFlkGAae/+XSikOlVjHeV6kc00Hzj7PUvxrloLSr935yXJ+y8sKgeB2rhcaJkGEuM
	8jSgHKrWg1/3LgYUUAd9AbCvjVWXihH9lpY2UQRwVGDXFP061HBEDcIAWGN9cqWIm8nFzDfy3SJ
	6Gc4h9nrWIrdVEsO3gpHmQnMpyotV++RLVnNufosapGxPOM0U6EwC7q4nfBiGiCrfPIQYYlQecw
	HkcC9vA19JijPX3tKhhz4EqSoVxRFwq+GQden47POh
X-Google-Smtp-Source: AGHT+IEToPXaJNU3FPitOhzv7XRD5fMJv3RarJ69HwAUtDs8DEKyQvLYwMwVPCfHblHOk8hTaaSfgg==
X-Received: by 2002:a05:690c:6f06:b0:788:e1b:5ec5 with SMTP id 00721157ae682-78c18956f0emr15033157b3.70.1764836798216;
        Thu, 04 Dec 2025 00:26:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae534sm3349687b3.3.2025.12.04.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:26:37 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <74cf3591-fe3d-4005-a5af-269e4c806d9f@gmail.com>
Date: Thu, 4 Dec 2025 16:26:28 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore the "EDITME" in the title, I forgot to remove it from `b4 
--edit-cover`.

