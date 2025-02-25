Return-Path: <linux-kbuild+bounces-5904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1051A43B64
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 11:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650E37A4B1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 10:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2F52676F1;
	Tue, 25 Feb 2025 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BYmSE/vw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24F2676EA
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2025 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478933; cv=none; b=KkKyOkHVqgz5tTFUpoVaNkK2KOfjlzHqwDtw32gDUgiPZ1iEEZzb0Pw/irVx5WVETiu37XZVRkggVKh21/sMwg5mdIDx8JExBD06z9zUpku8ZSlA+mu0hI62T5PTxspAQUeyEBp7RakD7CXd1BHR6IWd1XJZmjx/0ZhP1ktC0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478933; c=relaxed/simple;
	bh=7jS32IN9BvBO2WdCNC43qfDUQ12l0omi15BL6gdKjSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Imjencbke05uTQM0GZZerl1DOpBaTPEUBf+oY5mzyFrAr1XIKVC2Lv9ylhKpWPY8RdY11XRSLZGb2iwTAcBxJj+v0NiX+icpf0mL/SPRjlujC8aJW5t8r7CESpBDhZZqjBNQvggQLOK9Zpq2Do74KUrW5QLaCe8JNesVir6hDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BYmSE/vw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so7950784a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2025 02:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740478929; x=1741083729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tirQLw4kKN2n7nJcTTMNgrKBrHBCr4gOSdhS88B+7TQ=;
        b=BYmSE/vwCQqhOVHnXgdu2OnPBHYSAN0tc0MAV0xqBuUsGDzq8lNT0fCAr2oLfrk1df
         ssJ+NPzNKFdg3DOfwx6mbmYp/hDrT4yxQC/2f1NXN+sR1jUL1Ri6eB9tvLpZUPIG9EtN
         TD8MVQSZG3KrJw0FEiwcJYw7pQgyJOFWhoYmGJtbdJw1kuwuJ5R50lwDirRMd34u/St+
         lqbx2/K6XAaXn/+RsqQOYnirwuAhmae+df/oXjmdXBkQlDxrT9NBreqjZdKZFg58cyBS
         UdHYpYL+56yqXoraJv+i7epmRGp7AxfcexqKsSjtA5TRszKp2kfoC3McVOjyS4cK6RyF
         OSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478929; x=1741083729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tirQLw4kKN2n7nJcTTMNgrKBrHBCr4gOSdhS88B+7TQ=;
        b=LSGg5sbZU8sEO/uXcYJF+WZbDOGYZBSgd5FXo1roProzirw5ctJONYqhj5WXM62eme
         u1cGB4S+fEnD0HczZhjXs6hhbbmDt+3s/nmr5S2TOAVl8Y9pPoagfBQL38mIBjxj7LNA
         M6rbos6otTC5Xb+MNGp5WWpGWwRbCeIMU5rM5pHqlmw+cqEPv/Os9olNnNITyQAhjxE0
         FNlV4Az5owO8d/i9BdBbY9d5DixwsZOjF6NzxXw5hMI45BzOoqohCM7JvEl8Rpcvs/82
         VlAomK8CgMzTtPcbAu3na1tB0vO0DYZRlwNcOfPjfcSAYgjn3PAz6cFMeus+JjZwGc8q
         beKw==
X-Forwarded-Encrypted: i=1; AJvYcCUGl5zWbTTrO13o/D05TNg4XP3bEymUmh/w8B8C6UgH/it3syPzG+lKK0ItlYvtjdkgDI8zvC2c2siUVJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKUsvLG9HgJnTBRR46lRhfsP1JZGxy3pMqR1PUUTTg8pmXd29M
	XitjfJS8ha2DE+qxTGekMt9tbOnCp0+KGukODt6tBYgx4bTlSAqN5ZQgwkUhsSI=
X-Gm-Gg: ASbGnct5k6VwrRvSq1q88V/vBhwaBm96ke4thG6NH7hFqRMDAzJys4/h0WUuB5aCkXJ
	ygFkQC0AFXL5jCW8AmG3pmRE95Bf3DMOJtp8rVLmVMk9ALkGA8U9GYEMCQOFqy9xb3OzUHam4gD
	rxC2uKC4FcBrPQbNeO0qxKdpPacchmSrLPgkr+DlxDH5GgFZPt4u2gph5h8w8b8tW2rN58X4aaS
	SXeKna/nsWmt1r0bFyPYVLa3BTeCdhwNiq/BFhtbflvPZNlvCi8vYe5QjA7PWq88soYSKzkvnQb
	rK+2azbbdZJ2VGhs3/pnrQ+tuf3Xeg==
X-Google-Smtp-Source: AGHT+IGt6pTVXx3wx/wRIHWsfSGAMt1cqb6es2jvkO8FnqdPuOZ02O/dkb0pjA9QIhd5xREqhWrTXg==
X-Received: by 2002:a05:6402:e87:b0:5e0:82a0:50d7 with SMTP id 4fb4d7f45d1cf-5e0b70db116mr11539027a12.8.1740478929084;
        Tue, 25 Feb 2025 02:22:09 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45a8b8c06sm1001139a12.22.2025.02.25.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:22:08 -0800 (PST)
Message-ID: <0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com>
Date: Tue, 25 Feb 2025 11:22:07 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Adam Bratschi-Kaye <ark.email@gmail.com>,
 linux-kbuild@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Greg KH
 <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
References: <JKqjFnoTeEbURcTQ5PpmUZWDS2VMEt0eZl68dWkgk3e8ROFpb2eTWH2mStKkkXJw__Ql5DdYvIR9I7qYks-lag==@protonmail.internalid>
 <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <87ldtv1t1c.fsf@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <87ldtv1t1c.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 12:27, Andreas Hindborg wrote:
> Hi Petr,
> 
> "Andreas Hindborg" <a.hindborg@kernel.org> writes:
> 
>> This series extends the `module!` macro with support module parameters. It
>> also adds some string to integer parsing functions and updates `BStr` with
>> a method to strip a string prefix.
>>
>> This series stated out as code by Adam Bratschi-Kaye lifted from the original
>> `rust` branch [1].
>>
>> After a bit of discussion on v3 about whether or not module parameters
>> is a good idea, it seems that module parameters in Rust has a place
>> in the kernel for now. This series is a dependency for `rnull`, the Rust
>> null block driver [2].
> 
> 
> Luis told me you are the one wearing the modules hat for the moment. How
> do you want to handle merging of patch 6 and subsequent maintenance of
> the code?

I'd say the easiest is for the entire series to go through the Rust
tree. I'd also propose that any updates go primarily through that tree
as well.

> 
> I think we discussed you guys taking this under the current module
> maintainer entry? If that is correct, will you add the new files to your
> entry yourself, or should I include an update to MAINTAINERS in the next
> version of this series?

Makes sense, I think it is useful for all changes to this code to be
looked at by both Rust and modules people. To that effect, we could add
the following under the MODULES SUPPORT entry:
F:	rust/kernel/module_param.rs
F:	rust/macros/module.rs

My slight worry is that this might suggest the entirety of maintenance
is on the modules folks. Fortunately, adding the above and running
get_maintainer.pl on rust/kernel/module_param.rs gives me a list of
people for both Rust and modules, so this could be ok?

-- 
Thanks,
Petr

