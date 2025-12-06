Return-Path: <linux-kbuild+bounces-10027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46CCAAC05
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Dec 2025 19:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F5DD3000B07
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Dec 2025 18:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12DC277819;
	Sat,  6 Dec 2025 18:17:25 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825023A9BE;
	Sat,  6 Dec 2025 18:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765045045; cv=none; b=cnkcg41jlDPvrWqOX3ov/4yY7jV8gZ3XV8HM7FYS6B21tAXq4Yg9YNWDWVAaEZ0UCL9uGecmzMm4lhV4dj0w/P8FPMESFs4JcNncHprJP0T1WVXal8KYZQT73E7LB/8sT4RaCdeaZQaoWOu21u16KtMGAaZxxQ/Ktt0Ru85YOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765045045; c=relaxed/simple;
	bh=XDyLb4pfrbhH+H5hbDPdb5NwRxG4IzhCGeuKBK5USQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwp9/CMezFME0PJaaqXR+uJldeBU05WYliKWxS0UhfWuFBjOyLYBF8TZzpRkXKfQYX6oXu+7Yn7I9BvGA0AFbiH88HrYz6o2b7IoJv89vpOem+Jmow9lCLjc39XkETWTdLgxcj2Erswmz1LTFmvmIWmC1j4/Wx9Xo9lN5GrduOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.116] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowAB3_tALczRp1lJkAw--.48747S2;
	Sun, 07 Dec 2025 02:16:45 +0800 (CST)
Message-ID: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Date: Sun, 7 Dec 2025 02:16:43 +0800
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
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3_tALczRp1lJkAw--.48747S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr17JFWUCryrJw43XF1DWrg_yoW8AFyxpF
	18Wa1jva1kJ3W8t34v9Fy0qF15Kw18WrW2k3s5W342van8Ww1kKr1IyF1ak393XFy0vr42
	vFsrKF90yan09aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUneBT5UUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/


On 12/4/25 20:33, Asuna Yang wrote:
> On 12/4/25 5:06 PM, Vivian Wang wrote:
>
>>> +
>>> +# $(bindgen-backend-option,<flag>)
>>> +# Return y if bindgen backend supports <flag>, n otherwise
>>> +# For now, the backend refers only to libclang, so more
>>> specifically, this function tests whether the given flag is
>>> recognized by the libclang used by bindgen.
>>> +bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT;
>>> touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET)
>>> $(1))
>>>
>> Can probably be simplified down to:
>>
>> $(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1)
>>
>
> bindgen is sensitive to file extensions. If the file is not .h or
> .hpp, it complains:
>
> panicked at bindgen/ir/context.rs:562:15:
> libclang error; possible causes include:
> - Invalid flag syntax
> - Unrecognized flags
> - Invalid flag arguments
> - File I/O errors
> - Host vs. target architecture mismatch 

That's so weird... I can't reproduce this if i pass -x c to bindgen,
like this:

$ bindgen --version
bindgen 0.72.1
$ bindgen /dev/null
panicked at /build/rust-bindgen-unwrapped-0.72.1-vendor/bindgen-0.72.1/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch
If you encounter an error missing from this list, please file an issue or a PR!
$ bindgen /dev/null -- -x c
Failed to run rustfmt: No such file or directory (os error 2) (non-fatal, continuing)
/* automatically generated by rust-bindgen 0.72.1 */

The -x argument should explicitly tell (lib)clang what language the file
is without needing an extension. I don't know why it's not working for
you...


