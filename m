Return-Path: <linux-kbuild+bounces-2621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9834938B14
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 10:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A08FB20A3B
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 08:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54143160877;
	Mon, 22 Jul 2024 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eMbxl77Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6A4125BA
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636448; cv=none; b=Dz8nn0/MPYqakPBp3HXUvZHybZdIZzngsoYijR92gbflTgu07NCVXSmUsneboGKFvDL8cBTf68pO/oPTsFMjVSwsiIjPawxpHwra5T/1iA6wI9m/e1tT1NZR5o7XvyVhkDLGcUWsdia1H0RADeXB9cAr8ukNJHCPUsIYGxg8i4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636448; c=relaxed/simple;
	bh=Gc9GfiVqIOW6AG0XYb6oTsaSrqIXqslUw+R/1OUGG6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7RjygrtmPMRhwTP037m2b3AZ1xOG7xLfKRjHbgI0KplUJvcK1nEHnwjgLpGJ4jehf8BldC7PI1uDlwNetfQ0YebdKVe0+LmpluEmtrl/5x+oODw/5KPwLIV/htSCVhPZN9W3+SvA1af6g01n5XclNDyHiPdmrYlf9HuJiE4960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eMbxl77Q; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ee920b0781so46516891fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721636444; x=1722241244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VgB/lccVac6zBTZqqHsKy16+19WVuie2nqQLn2rSGc=;
        b=eMbxl77QZ2yzU12J8h9FCuAGPolVsKbzqdYDefpmeMvmjTi4c4GRaD+9403M/UOOjn
         Vqp6xDnljVdeXE+XBq6W0xV5UwiBLrzTdWML0g9X0QR1mYLMJaM4zyxviPdt/0Nkt6Ox
         CmneRS4Pfzk9yM5y/3swgm7PF1q8Cxfp87bJonNGsKul7j6AvrIYAQIm+5xXjCZTZ45j
         lAG3TVHY9e3Ene205cFv/Ecas4lEXGSaC4FnF2gZKOY5n9eCnbOUa4rQsvYbDxdowNg/
         fvoFacFbhVUrOIpQ/Vmt2sw8z+2ioorBVEh8EbpMTGlfS6Xeox+5xdowKszps5WFmlOa
         r7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636444; x=1722241244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VgB/lccVac6zBTZqqHsKy16+19WVuie2nqQLn2rSGc=;
        b=W8pwAu5let548+1H/rkrGXP98L4qmR7UkCC1OMlZFOS0j56thZA9Yinz0A09PevT1k
         oIpwuP5DJfp096LZezYGXgW5pip8PT3kP+hwxjewvB1ryZcdZ/5unMa/yggQVy/HXAbp
         5Yw0FL2pzfV5joRyAXr3RNmYTzzNN0V0EUB65zrIwpFMjCQ8WQmGmlBaXCCUszSlQRDM
         CnzUVTYxKQ85JF5XQcsmaHK8CKn3rUZ9h1Mn/sgKhOAAppr8Dg0j6hrd0ur18ZDeBxHZ
         jInkVEMbfNQiI22z6/AXt7+RLJbxLRKijNwvOI028lerZosozhrbI1b9wOdtFhtnDBc3
         Lgjg==
X-Forwarded-Encrypted: i=1; AJvYcCWn7dLVj4Ez1o+TqvYXRTVTWwn3VlwWX/tLu1D3MTbVyWb8AxBTsxUAND1sCV+MSVY3jMzIbqpSANQP1ukjgS/0AjtHKWUL8DcMdJQk
X-Gm-Message-State: AOJu0YwnLesob3VzSxZLrm1CrAjYAfaF2mu6m7fv5zXdANgOScCfQT55
	PYPDUeaeIBn7S4/B+4S1x8E+Us8u6Gs1R8Txk5xGBTzmN42OCwZ6gWWZxkRJUqQ=
X-Google-Smtp-Source: AGHT+IFZ2Q+AkcV37TqF+QsvZ6J2I6gHwlMwj3NTq7zlAw3SR5/ehvU6L+ZpDtObyjgWCJAuX4BG7Q==
X-Received: by 2002:a2e:2d12:0:b0:2ef:1f68:eae1 with SMTP id 38308e7fff4ca-2ef1f68ebe1mr34682991fa.17.1721636444239;
        Mon, 22 Jul 2024 01:20:44 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb76a46dfcsm3186370a91.0.2024.07.22.01.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:20:43 -0700 (PDT)
Message-ID: <00714a65-953f-4885-9229-1990543c4154@suse.com>
Date: Mon, 22 Jul 2024 10:20:34 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240617175818.58219-17-samitolvanen@google.com>
 <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com>
 <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/15/24 22:39, Sami Tolvanen wrote:
> On Wed, Jul 10, 2024 at 7:30 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>> On 6/17/24 19:58, Sami Tolvanen wrote:
>>> The first 12 patches of this series add a small tool for computing
>>> symbol versions from DWARF, called gendwarfksyms. When passed a list
>>> of exported symbols, the tool generates an expanded type string
>>> for each symbol, and computes symbol CRCs similarly to genksyms.
>>> gendwarfksyms is written in C and uses libdw to process DWARF, mainly
>>> because of the existing support for C host tools that use elfutils
>>> (e.g., objtool).
>>
>> In addition to calculating CRCs of exported symbols, genksyms has other
>> features which I think are important.
>>
>> Firstly, the genksyms tool has a human-readable storage format for input
>> data used in the calculation of symbol CRCs. Setting the make variable
>> KBUILD_SYMTYPES enables dumping this data and storing it in *.symtypes
>> files.
>>
>> When a developer later modifies the kernel and wants to check if some
>> symbols have changed, they can take these files and feed them as
>> *.symref back to genksyms. This allows the tool to provide an actual
>> reason why some symbols have changed, instead of just printing that
>> their CRCs are different.
>>
>> Is there any plan to add the same functionality to gendwarfksyms, or do
>> you envison that people will use libabigail, Symbol-Type Graph, or
>> another tool for making this type of comparison?
> 
> gendwarfksyms also uses human-readable input for the CRC calculations,
> and it prints out the input strings with the --debug option. I plan to
> hook this up to KBUILD_SYMTYPES in v2. It should be convenient enough
> to simply compare the pretty-printed output with diff, so I'm not sure
> if a built-in comparison option is needed. Any other DWARF analysis
> tool can be used to spot the differences too, as you mentioned.

From my perspective, I'm okay if gendwarfksyms doesn't provide
functionality to compare a new object file with its reference symtypes
file.

As mentioned, genksyms has this functionality but I actually think the
way it works is not ideal. Its design is to operate on one compilation
unit at the time. This has the advantage that a comparison of each file
is performed in parallel during the build, simply because of the make
job system. On the other hand, it has two problems.

The first one is that genksyms doesn't provide a comparison of the
kernel as a whole. This means that the tool gives rather scattered and
duplicated output about changed structs in the build log. Ideally, one
would like to see a single compact report about what changed at the end
of the build.

The second problem is the handling of symtypes files. This data is large
and if one wants to store them in a Git repository together with the
kernel source, it is advisable to first compress/consolidate it in some
way. This is trivial because these files typically contain many
duplicates. However, the issue is that to feed the data back to
genksyms, they need to be unpacked during each build which can take some
time.

I think a better approach is to have a tool that can be given
a consolidated symtypes file as one input and can compare it with all
new symtypes files produced during a kernel build. An example of a tool
that takes this approach is the kabi Python script in UEK [1].

A few months ago, I also started working on a tool inspired by this
script. The goal is to have similar functionality but hopefully with
a much faster implementation. Hence, this tool is written in a compiled
language (Rust at the moment) and should also become multi-threaded. I'm
hoping to find some time to make progress on it and make the code
public. It could later be added to the upstream kernel to replace the
comparison functionality implemented by genksyms, if there is interest.

So as mentioned, I'm fine if gendwarfksyms doesn't have this
functionality. However, for distributions that rely on the symtypes
format, I'd be interested in having gendwarfksyms output its dump data
in this format as well.

For example, instead of producing:

gendwarfksyms: process_exported_symbols: _some_mangled_func_name (@ XYZ)
subprogram(
   [formal parameters...]
)
-> structure_type core::result::Result<(), core::fmt::Error> {
   [a description of the structure...]
};

.. the output could be something like this:

S#'core::result::Result<(), core::fmt::Error>' structure_type core::result::Result<(), core::fmt::Error> { [a description of the structure...] }
_some_mangled_func_name subprogram _some_mangled_func_name ( [formal parameters...] ) -> S#'core::result::Result<(), core::fmt::Error>'

>> Secondly, when distributions want to maintain stable kABI, they need to
>> be able to deal with patch backports that add new members to structures.
>> One common approach is to have placeholders in important structures
>> which can be later replaced by the new members as needed. __GENKSYMS__
>> ifdefs are then used at the C source level to hide these kABI-compatible
>> changes from genksyms.
>>
>> Gendwarfksyms works on the resulting binary and so using such ifdefs
>> wouldn't work. Instead, I suspect that what is required is a mechanism
>> to tell the tool that a given change is ok, probably by allowing to
>> specify some map from the original definition to the new one.
>>
>> Is there a plan to implement something like this, or how could it be
>> addressed?
> 
> That's a great question. Here's what Android uses currently to
> maintain a stable kABI, I assume you're doing something similar?

Correct, (open)SUSE kernels have placeholders in likely-to-change
structs which can be used for new members. Or if no placeholder is
present, it might be necessary to place a new member in a gap (padding)
in the struct layout.

> 
> https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6/include/linux/android_kabi.h
> 
> If using unions here is acceptable to everyone, a simple solution
> would be to use a known name prefix for the reserved members and teach
> gendwarfksyms to only print out the original type for the replaced
> ones. For example:
> 
> The initial placeholder:
> 
>     u8 __kabi_reserved_1[8];
> 
> After replacement:
> 
>     union {
>             u64 new_member;
>             struct {
>                     u8 __kabi_reserved_1[8];
>             };
>     }
> 
> Here gendwarfksyms would see the __kabi_reserved prefix and only use
> u8 [8] for the CRC calculation. Does this sound reasonable?

I like this idea. I think it's good that the necessary kABI information
about an updated member can be expressed at the source code level in
place of the actual change, and it isn't needed to feed additional input
to the tool.

[1] https://github.com/oracle/linux-uek/blob/dbdd7f3611cb03e607e156834497dd2767103530/uek-rpm/tools/kabi

Thanks,
Petr

