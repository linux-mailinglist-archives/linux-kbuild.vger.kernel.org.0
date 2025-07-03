Return-Path: <linux-kbuild+bounces-7870-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EDAF82D6
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 23:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271FB1C430C7
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 21:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6451FFC46;
	Thu,  3 Jul 2025 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgzTO+XL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B3A2DE701;
	Thu,  3 Jul 2025 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579394; cv=none; b=Bz9ttb/DklReJzoYTGUpgdIOGR9SDJLCaqKTcllUhlgIjwppHpWOZYyrGzSSXQUr5FMjj47kthAbJpUFcyMxcixYW5bKVznSspUIvyNWmRtWauqPogrKZFpPF9BOCj3DWjhrL2ZxKTmJINP3cNyZKI8A8/zPBp1ZNeQNu86I2ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579394; c=relaxed/simple;
	bh=CGX2SPIZ9xHHR7xXxfAWC/JUQPZzoF0O31iWxNQOu/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5inA0DFogyCgufVEWnmvr6gJ3Ltk3QbXqJMcCBOh8xhwNy1i/76TdQimWqRTgRhqZi22mNb+qP5+XbB4et4X4gSXc7SrAWKHcILFLOiewevAyq2Xc9iUnA9pmFtK91zcUpJVWALN/ZGCdeswM5pzInSfXLPv9PC+RyW/RSXkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgzTO+XL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F7CC4CEE3;
	Thu,  3 Jul 2025 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751579394;
	bh=CGX2SPIZ9xHHR7xXxfAWC/JUQPZzoF0O31iWxNQOu/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kgzTO+XLqwCuSwNpaXZACKDE/QvJYSyRQyBOAaO0MinLorg3TvaZTL3j5t1aJP7NV
	 kKEx/gHmpJz0UjUHuWO59zTx/ywLtJs4MAQ0N9Ul3KUsbKFuVTH7wetUAWIoM7mMc3
	 2eXJD0D4kES0VX4M4ga0JPF2w7+5pVYfWqXdJErUr49QPtWrp2+0vTDUlVHO1K0j4d
	 rbPvj0aKxhh/syUyXhZEihGdwIggAvrryynEkyt04ZrX+x6yZrPgXDJWX3qMbhkCF9
	 ZuH8WDcFq3WK1US5Czl0dP6w8oUjMy3yiz09nbypB/iKGpG/wN/E0MGJiV77PwzQKo
	 5lh0WWrDGieLA==
Message-ID: <0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org>
Date: Thu, 3 Jul 2025 23:49:47 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/25 3:18 PM, Andreas Hindborg wrote:
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        self.value.as_ref().unwrap_or(&self.default)
> +    }

I think you forgot to rename this.

