Return-Path: <linux-kbuild+bounces-10333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2DCD93DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 13:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00018303FA6C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 12:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10158336EC5;
	Tue, 23 Dec 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="kdY7NMD0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F7334C04;
	Tue, 23 Dec 2025 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492300; cv=none; b=ZzY5bPaF/NfmoI5eqpeGVjXics/yjMk8p0Wb2oyYaSak652cviaPC8gkV775NABKMKzgvzRLUUASTBCGBOSWArv1i+99Xf9WbY4DalmMJGPJySlRGLBCBZskTVsPZPTR78PYtZQsiTQTYsCWHlI+YxgEfGloG7NDd8mFNRiXbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492300; c=relaxed/simple;
	bh=hShu0VvTqLqoPnYAtOi90jcL9XwDFeX2rrLnK8xEvXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhRUYQhIQR4aUkod6oNFQ/p8xqvoeL6jn4qNaPwGvqFh3mdEdyIFLFX6antrJq0thWXL5adfrIhCRsyggtRpEJSEMwd9hxtNE2BEBGlFykYYtYQIZZUJIYmAHf97wEWMVVHur5p46aSOqghJ8XV7AaFV9cyEbwoU9ad33UXcoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=kdY7NMD0; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id A29F9202AB;
	Tue, 23 Dec 2025 12:10:07 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id EBE25260DD;
	Tue, 23 Dec 2025 12:09:58 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id EEBB4202F1;
	Tue, 23 Dec 2025 12:09:49 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id F3967400EA;
	Tue, 23 Dec 2025 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1766491787; bh=hShu0VvTqLqoPnYAtOi90jcL9XwDFeX2rrLnK8xEvXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kdY7NMD0uAbptoodukmzohX6nCDGwGUFnQXtBWnQWGDUKCLQXrQDJRwMOgedlefk9
	 VAn6l/nni+E6VEp2JEbvGDRpxE/FHui6ZLjUxUkykpZho4jM39GEeshYlbzhm21pSE
	 TYOwHLYDAJ/xUCwgnYwX4W/nrePK1+lTniGJOnk4=
Received: from [198.18.0.1] (li1893-83.members.linode.com [172.105.239.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 07013404AD;
	Tue, 23 Dec 2025 12:09:34 +0000 (UTC)
Message-ID: <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
Date: Tue, 23 Dec 2025 20:09:30 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Asuna Yang <spriteovo@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Kexy Biscuit <kexybiscuit@aosc.io>,
 Xi Ruoyao <xry111@xry111.site>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F3967400EA
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[lkml];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,redhat.com,iscas.ac.cn,aosc.io,xry111.site];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Asuna,

在 2025/12/4 15:54, Asuna Yang 写道:
> From: Asuna Yang <spriteovo@gmail.com>
> 
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.
> 
> This piece of code is copied from `scripts/Makefile.clang`.
> 
> Before this commit, error messages might look like:
> 
> error: unknown argument: '-mno-riscv-attribute'
> error: unsupported argument 'medany' to option '-mcmodel=' for target
> 'unknown'
> error: unsupported option '-march=' for target ''
> error: unsupported option '-mno-save-restore' for target ''
> error: unknown target triple 'unknown'
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>

Unfortunately, this broke build for MIPS and PowerPC, neither of which 
has support for Rust. I also feel as though it might be pointless to ask 
all architecture to define BINDGEN_TARGET, especially when such a target 
specification may not even exist upstream (in Rust or even in LLVM).

As shown in the first patch, the original Makefile did not require this 
definition either (please do enlighten me).

Best Regards,
Mingcong Bai

