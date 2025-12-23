Return-Path: <linux-kbuild+bounces-10334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA393CD957C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 13:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A6CB3009AB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 12:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD9730FF1C;
	Tue, 23 Dec 2025 12:47:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0211531C8;
	Tue, 23 Dec 2025 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494047; cv=none; b=uRpbe4b5VBossrWTf11HwhfkocMr1biRA42UwopbByuXFDe9JowyKRbfpmt+cMmTkHwJBkOlsVzvFF0R1cF11J1if/J/SplvAwmnE5BlIREME64EmAY2A7bOdRDQWsF0N6MpiCredvLdWNWf/C50t3SWhMttGaLwuBuMS21eCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494047; c=relaxed/simple;
	bh=5dMacQuy2uS1n22p17JTYKdfVB+rwhuBNLSgsBU09GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YP1F11YrzNrE2+2n3L1qWYiV0YyBtkyAnJr0Xs/zWfBw4fJyS/D/Xxta13Ext7V5NtQAHlNjfSLdDl9p6cu96/YwGu44d8fFA5Au/noc92bKg4bzPZk8fIDdjFKKj0vegk7q2e1ufPo2p9peV759IuJQAoN01aI0RDMQRRFDQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.114] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowABXcNc7j0pp_E60AQ--.39070S2;
	Tue, 23 Dec 2025 20:46:52 +0800 (CST)
Message-ID: <30975f96-db5f-4072-a371-4ac252139e4e@iscas.ac.cn>
Date: Tue, 23 Dec 2025 20:46:51 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Mingcong Bai <jeffbai@aosc.io>, Asuna Yang <spriteovo@gmail.com>,
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Xi Ruoyao <xry111@xry111.site>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
 <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXcNc7j0pp_E60AQ--.39070S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1kCryxAryxWrWDGr47CFg_yoW8AF1rpa
	1xG3Z0yr4kGrW8Cwn2y3yDu34Ykrn5KrWUJas5J3y2grZ0gay8tr4xtF13WryDWF1ku3yF
	vwsI9a4fGrZ0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUv4EEDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 12/23/25 20:09, Mingcong Bai wrote:
> Hi Asuna,
>
> 在 2025/12/4 15:54, Asuna Yang 写道:
>> From: Asuna Yang <spriteovo@gmail.com>
>>
>> Generate a friendly fatal error if the target triplet is undefined for
>> bindgen, rather than having the compiler generate obscure error messages
>> during the build stage.
>>
>> This piece of code is copied from `scripts/Makefile.clang`.
>>
>> Before this commit, error messages might look like:
>>
>> error: unknown argument: '-mno-riscv-attribute'
>> error: unsupported argument 'medany' to option '-mcmodel=' for target
>> 'unknown'
>> error: unsupported option '-march=' for target ''
>> error: unsupported option '-mno-save-restore' for target ''
>> error: unknown target triple 'unknown'
>> panicked at bindgen/ir/context.rs:562:15:
>> libclang error; possible causes include:
>> - Invalid flag syntax
>> - Unrecognized flags
>> - Invalid flag arguments
>> - File I/O errors
>> - Host vs. target architecture mismatch
>>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
>
> Unfortunately, this broke build for MIPS and PowerPC, neither of which
> has support for Rust. I also feel as though it might be pointless to
> ask all architecture to define BINDGEN_TARGET, especially when such a
> target specification may not even exist upstream (in Rust or even in
> LLVM).
>
> As shown in the first patch, the original Makefile did not require
> this definition either (please do enlighten me). 

Looks like the rust/ subdir is conditional on CONFIG_RUST, so the
original rust/Makefile didn't have this problem.

Fixing this should be as simple as moving the check into rust/Makefile
instead.

Vivian "dramforever" Wang


