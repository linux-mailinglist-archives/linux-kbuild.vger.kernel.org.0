Return-Path: <linux-kbuild+bounces-9983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622FCA2E92
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 10:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06BA03020379
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 09:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED08331A53;
	Thu,  4 Dec 2025 09:06:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BA313E34;
	Thu,  4 Dec 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839213; cv=none; b=GjI1Wm/miIECFtUr3ztXPOu28a/OGEBuv+DeF7dCxCXtLZ6VOIImhC9A3hrh8MTSmVyhv4JZMpmjaOONWdFLSZ5SJwQdHD18XCfNuIJDgpORcTixeoN4Jcqca9l4rLtOLoDtJYBFFwCtNIwuQa+2xeR0li+3TpteqU/DYkxgxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839213; c=relaxed/simple;
	bh=y5lRhbplovhxS8wXZdgJehPPhVuxa9eyvYlnoEEqbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmYf1TZk4A66xML2HGL3Ician8cDnN8r+abfFAjIiirmEyBQ/bkYgyztoMB+BGiIGPND8+dNjVc/ZEYWoB8HDfYuqb5lpFH/GazVvbuvlQvfBaBxjZ5FRLoIxDv49oNx1dqPavKu+pG/NH0aX2oZzES2sN62ttlVTKRiNtzGSZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.107] (unknown [114.241.82.59])
	by APP-01 (Coremail) with SMTP id qwCowAAnwdD+TjFpm+0MAw--.960S2;
	Thu, 04 Dec 2025 17:06:06 +0800 (CST)
Message-ID: <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
Date: Thu, 4 Dec 2025 17:06:05 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowAAnwdD+TjFpm+0MAw--.960S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUWr4rtFWrCry7tw1fJFb_yoW8Xw1fpr
	yvkF1q9rW8J3W8Aw17CFW0qF13ua1xtrWfW34kt347JrW7Xw40gaySkr47try8CFWv9ry2
	vF4F9as09F4UCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUVhL0UUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 12/4/25 15:54, Asuna Yang wrote:
> From: Asuna Yang <spriteovo@gmail.com>
>
> Add a new `bindgen-backend-option` Kconfig function to test whether the
> bindgen backend supports a given flag.
>
> A subsequent commit will use this function to test for RISC-V extension
> flags.
>
> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
> ---
>  scripts/Kconfig.include | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index d42042b6c9e2..5d4d29eed0b3 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  # If you are testing for unstable features, consider testing RUSTC_VERSION
>  # instead, as features may have different completeness while available.
>  rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
> +
> +# $(bindgen-backend-option,<flag>)
> +# Return y if bindgen backend supports <flag>, n otherwise
> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))
>
Can probably be simplified down to:

$(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)


