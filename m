Return-Path: <linux-kbuild+bounces-10133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CECC7121
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 11:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E48A23065E1E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 10:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC5D2C0262;
	Wed, 17 Dec 2025 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYPfLFKx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80D233D9E
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966243; cv=none; b=Tu5EFDX2yLgzWW1K/Fr59LnW8cebWqi/qhpv+ll2Ko9vqHILFuY9K7VUFsETvOWFCLK58bMOGc4CzzBaalarJtfjRGsDv3vEJ0fKgpn40Ma6XAVQlWoWI0CwnvTQe/FHlFqneGijQ/kohDoqZPbBQ2+IF9Dps3e5nG7afnMEMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966243; c=relaxed/simple;
	bh=SMvRzUudMwE9gh+QI3p78IKx2rZRmC3QOeEAGSMOXbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FENFYHb56gfg7cAHrstWHCbfFX0+dnrxw9w7eokbiwStKjqBfSfnRimzZND+2LvvnlCzUuCi9jxMM3pYJOk8hMvSMSIOk/Qe66ae/gAV6YxIpLIA99h3k4zWULpU8/OhLteJ5sVuqZmfAA7rZ+J4Guczjbol+WAlwP2jetqEJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYPfLFKx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c03eb31db80so3995923a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 02:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765966241; x=1766571041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xO3E6v+EYJi4XiIbsXeHvys7mPWX18qJ6xl10KMPnZ8=;
        b=KYPfLFKxICsP2RUSX3eGUynFtKyaQwNVF4f10XE7KEem7RUcmWf45tP0A/i3eA8ALd
         B+HkJXjXfdW+90Cn+MoCRVxecT201NLRjvZKekwKlWhBTcWagIUSqGGfEZVXfEt8y4+7
         4LVYpCSCXaCwaj5egZCxCVi9eu6rfQfAA98rIAkcsxOq3KEfPXyRD/GUE1KScbvE+x2V
         GQOvvuBwfHn2VMJE/wgkVtKchgivEoEwuMYBZGzNtwheZyIQCA35UCpikzUS1NAjDttg
         P2M+nDNVIpL6GNgAPc2W3xr13YP+V13DHYgNAoAJjXzkskcEziJGZ615XZDJI9SCrUTN
         xKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966241; x=1766571041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO3E6v+EYJi4XiIbsXeHvys7mPWX18qJ6xl10KMPnZ8=;
        b=fmnmtcnXKGDoLqNXPJE1gbSEeMihBVdxWyE1TH5Z1T++UOceBS7GDy1eL6ASsQUouY
         q3+W7SHxaIDH+aGw3lQm1nqKI3tfLOVPbfEg8Yo28ojCANqes7o5Balz0NSqJuIYIjLU
         m/8IFkKYGTU2Pdh+wRci754pDtZxdRDMXnPa9dfXZ7Zr8btrGfr5d7/dZlhYbSlnJVRd
         6bhtoe4S+D9QDYQNZnH4bx5wxEiePWvJRCHcgqxThq0QuuOdOjrq+DVCIeGNBlLc0mBD
         y67EITQtc/3Id+1mV94diWMn8c7co4wnF90tdqcoAbhB0SJM1QiWFhXimiHcVg8HMaXL
         Gj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSOoDESLSGHZLw/jFPWE+CvxYC6sSl8kIhQ5EFYQbcXhz83p4tTFEXL6T60tOvvi1Xp3gzLEntCmfSAkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+83wuQQ/Q0JbDVZ6AHdgIAuzEvgR30b37CdmgrgHeI6Ex0IY8
	3iMMGnuV7QGySJr9TrsHMYMrqcyO97scLQFmD3k81gt4+c+0h1hFCFdh
X-Gm-Gg: AY/fxX5jyRanW/fqQ1SkMQJ0t4/IrrhJi0p+fI0P+92zjptBecYXdR6ELSY83wNv3hD
	pDULvzqtYnIBl1pQQe+hX/vkjUSWlv/ucvvdqLFuLZa+nmHo8zXa6cI3yprn99AD9XT5kdT1cZO
	0zb0uhxdAqt/Z26Bwx82mJ6v26u1O5f3vuaxO1pEj/HGPXMEQbFZTHG1tL6k6mYDwBJ2SyB0pF1
	8IG8bCRBowekH2JVMvxQM3Om72ad9ii+ruuaNSnmrnn8NJSyEjbAuSPqVgYfrLAXGpsRDK8TX7V
	M85DG64rt1mbWRphXl0ZoukyOgAqVay4aD+xSKYluf6lDgylkxERkWHJAv43Nnyd3WoGte3rz8c
	w3zG15fGAet7/rHHnxAqSmo5aC11B7qNZ4z0TSI3wYu/T1W/UdDdeOsGGCqMs9dkCqx8k/xSEcv
	ANvtgw2deDgPmgdeLr4IymJPkZkh90UuYKXH2C+fgkNRmDU05P+idD5cmjQIVGQYO5dBiortrRQ
	jW/
X-Google-Smtp-Source: AGHT+IEG8JLieGR++365pLcyjXKBpPQ05/7enLWig8JfwMbvY/InVaunD5JLpgX83zIDArSrsMhjGA==
X-Received: by 2002:a05:7022:6191:b0:119:e56c:189d with SMTP id a92af1059eb24-11f34ac157bmr15819602c88.5.1765966240957;
        Wed, 17 Dec 2025 02:10:40 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm26393130c88.6.2025.12.17.02.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:10:40 -0800 (PST)
Message-ID: <bbc421e4-76f7-4dba-8228-23488b1b1310@gmail.com>
Date: Wed, 17 Dec 2025 02:10:39 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
 <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
 <6eaa65a1-e7dd-404c-b716-d4f7a0ce7f5c@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <6eaa65a1-e7dd-404c-b716-d4f7a0ce7f5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 04:17, Christian Schrefl wrote:
> On 12/14/25 8:34 AM, Rudraksha Gupta wrote:
>> On 12/13/25 22:06, Miguel Ojeda wrote:
>>> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>>>> - The kernel boots and outputs via UART when I build the kernel with the
>>>> following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build
>>>> the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected?
>>> It depends on what that resolves to, i.e. your environment etc., i.e.
>>> that is resolved before Kbuild is called.
>> Sorry about that, I should've specified in the original email. The CC resolves to armv7-alpine-linux-musleabihf-gcc.
>>
>> When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust modules just fine. However, if I only use LLVM=1, my phone doesn't output anything over UART, and I assume that it fails to boot. Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and remove the rust related configs from the pmos.config fragment, then my phone boots and I can see logs over UART.
> Did you try other architectures / devices as well (especially can you reproduce it on qemu-arm)?
>
> Did you try a LLVM=1 build without rust enabled?

Seems like you've found the preliminary qemu-arm patches I posted, but 
for completeness sake for others, this is reproducible on qemu-arm:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740


As Christian mentioned, and I also now seem to conclude, it seems to be 
a clang issue.


>>> The normal way of calling would be the latter anyway -- with the
>>> former you are setting a custom `CC` (either whatever you have there
>>> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>>>
>>> So it could be that you are using a completely different compiler
>>> (even Clang vs. GCC, or different versions, and so on). Hard to say.
>>> And depending on that, you may end up with a very different kernel
>>> image. Even substantial Kconfig options may get changed etc.
>>>
>>> I would suggest comparing the kernel configuration of those two ways
>>> (attaching them here could also be nice to see what compilers you are
>>> using and so on).
>> postmarketOS uses kernel config fragments and tracks the latest linux-next:
>>
>> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config
>>
>> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config
>>
>> - build recipe: https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD
>>
>>
>> The only thing that changed was whether CC=gcc was specified or not:
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb
>>
> I'm not familiar with pmbootstrap, what is required to reproduce this?
> Do I just need to use the edge channel with linux-next or is something special required?
>
> I might habe time to look into trying to reproduce it this week, but I'm not sure.
> I have a armv7 based asus-flo device to try it out. Its not very well supported, but
> It should be sufficient for this.

asus-flo would probably also encounter this. Currently it's a bit broken 
in pmbootstrap, but I've provided a general guide here on how to go 
about fixing it:

https://postmarketos.org/edge/2025/11/17/apq8064-kernel-removed/


Would love to help you setup the asus-flo, since it also seems that 
upstream's IOMMU is broken and likely other things as well. If you'd 
like to drop by in the Matrix chat, we'd love to help you there if needed.


