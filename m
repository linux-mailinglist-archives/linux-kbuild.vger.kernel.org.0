Return-Path: <linux-kbuild+bounces-9519-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A3C4728F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 15:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B088B3A722C
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B06531283C;
	Mon, 10 Nov 2025 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gYwvnRf1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1D3126C5;
	Mon, 10 Nov 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784665; cv=none; b=otRPKQyE9of7bqf3dvdySAP5WB/XxqdDdQeuPNX4cqbAuncCKRAZFWSwhlWTQt9jW5SqqDXzgsfdXZcYXneFdr0iwe0tDoCeq/RUf1cZ1M3+NS0SCtBPW0AmQ8nMOataK0G8Rz5XZgHemZpEj8wW+6kH0GjCpsrTnyeluPc0MZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784665; c=relaxed/simple;
	bh=JGZIzuVhWGC5kPsqULut5X8vxT48KYgXTejxFx9xV5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mK6pmL2+P2iyF4Dp7ZJRVJ3vR0rT3uV9ausfDoz3KLrfouTEDgooW9x5bGLAMLWvNUwyV3agHE+Np8lVrbLzSYhzLETKlJsPs76Tut+BvPOPq4/7wBd9oCJSNcw+vOjRFKY4mP8YVgFDlACZbmaLTSTkVz9LasWG7GUqUlAqifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gYwvnRf1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=MyqtwMhfj3aYB5/YZYHefwpNNP/5TyDe6z4hlolkG1o=;
	b=gYwvnRf1gXDq1/sUEjvMK6XeiqeZ/mQhNjHq181GZDVBcLsWfXzMtaWbg8iX5i
	aoVSlSxhcNndtiCfkr5mjHtd3llD0eZaNhMbQHusUrQrBCOCjEvN7QrMYAH9AD87
	aXy+aSnJfsfYFr5A9JgX4rz+3YcePIhqhgDCD8RMU/xn8=
Received: from [192.168.1.105] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXnNFb9RFpkRvpDA--.18906S2;
	Mon, 10 Nov 2025 22:23:24 +0800 (CST)
Message-ID: <ca686233-f687-4147-b22a-72d0b0bedfcc@163.com>
Date: Mon, 10 Nov 2025 22:23:21 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
References: <20251110131913.1789896-1-ojeda@kernel.org>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <20251110131913.1789896-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PCgvCgDXnNFb9RFpkRvpDA--.18906S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww17ZF4DXFWrCFykAw15XFb_yoW8tFWkpF
	Z3Wrs8Kry5Ga48tFW7Gr1xuF15X3s5Gr43JrWrXw48ZF17Z3ZagFZ29r45uFyUuws29ay5
	tFsFvF1jgw4qv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UtPEhUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/1tbiRR0Ca2kR4R9-swABs6

On 11/10/2025 9:19 PM, Miguel Ojeda wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Starting with Rust 1.91.0 (released 2025-10-30), in upstream commit
> ab91a63d403b ("Ignore intrinsic calls in cross-crate-inlining cost model")
> [1][2], `bindings.o` stops containing DWARF debug information because the
> `Default` implementations contained `write_bytes()` calls which are now
> ignored in that cost model (note that `CLIPPY=1` does not reproduce it).
> 
> This means `gendwarfksyms` complains:
> 
>        RUSTC L rust/bindings.o
>      error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?
> 
> There are several alternatives that would work here: conditionally
> skipping in the cases needed (but that is subtle and brittle), forcing
> DWARF generation with e.g. a dummy `static` (ugly and we may need to
> do it in several crates), skipping the call to the tool in the Kbuild
> command when there are no exports (fine) or teaching the tool to do so
> itself (simple and clean).
> 
> Thus do the last one: don't attempt to process files if we have no symbol
> versions to calculate.
> 
>    [ I used the commit log of my patch linked below since it explained the
>      root issue and expanded it a bit more to summarize the alternatives.
> 
>        - Miguel ]
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Reported-by: Haiyue Wang <haiyuewa@163.com>
> Closes: https://lore.kernel.org/rust-for-linux/b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com/
> Link: https://github.com/rust-lang/rust/commit/ab91a63d403b0105cacd72809cd292a72984ed99 [1]
> Link: https://github.com/rust-lang/rust/pull/145910 [2]
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   scripts/gendwarfksyms/gendwarfksyms.c | 3 ++-
>   scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
>   scripts/gendwarfksyms/symbols.c       | 4 +++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 

Tested-by: Haiyue Wang <haiyuewa@163.com>


