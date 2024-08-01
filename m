Return-Path: <linux-kbuild+bounces-2769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFBF944A43
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 370BD2867C1
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644E5188013;
	Thu,  1 Aug 2024 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QV5uuEkL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B1189529
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722511346; cv=none; b=U+XKNDbHuoZg8siCnaAO8qOe5ZG3DT/CdYwUIy5ZJD027DPTAVyZyIX1+ofFiWnrqnIXN53qH8qMPhFWXd4Ly4a4l3KDInr0MmchDm8SxTHXdYZTZjL12opymrRcnc5CgskSbKVARsN5R645N6adaWeTpdXFXQxomb6CZ7yl3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722511346; c=relaxed/simple;
	bh=wT1WeQtWSF4pKg/aqyS1PtzbeURzHustn4W7PgKlu/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQSxPL3FCsjRCeChcMEkOATbz/0/IkjPNQZ8CUlQHNpAou9xK6eymUIr48Yvgi3YjaOqUmRuwIrQ399reSjrWC6d8Hc3lDTBRnQ8UJOumhHqUjhhSigB7YvATGT1ZAY+5MUuaQpa3f6v2WmhPc1H9FcltqSVXslHnH2EcD/dFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QV5uuEkL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a94478a4eso370267766b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2024 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722511342; x=1723116142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qlZj/baYl2pbc9LuE7Qbzb/56dqo6s6gnzipMfbe3g=;
        b=QV5uuEkLlhu0v3M2uPfkYKSaz6GZaHbVnu102+7axKQdD4l8dQLcds3JLNFXbZVCLD
         kFpkil7+YE8t1NCKM8OqTHgKGlan1i8Z2FYmB7eFijfR1uYLzRJ67n04PBn5GSP2f0q+
         r0PcCG/0xY6tuXSDjOeC43cVTekKxpYu+WhNj985Yq3RmupPV4Pj4RDJu06tu/sDX+gR
         pQ5Muea2WHTE0H2st0UlBopKKt9DtEU1Ef/XLj2usTlvmK12nHnxHZVtxGUhqaMTg1vw
         Ja3G5MHKm+QQkb+mamMMoTmX5n8Qowhn1AyEstPOpoA7+AAGLTsltSSPAJ6wYja4qbri
         fHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722511342; x=1723116142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qlZj/baYl2pbc9LuE7Qbzb/56dqo6s6gnzipMfbe3g=;
        b=uMssqsOLw+Ha7QG5Dfp7C/SQBl1XRFI/L0IklPZvZpX9BoGI5X1Pd2lt2lznxaB7nv
         W3YfQpL6NThCKWBEj7GQAATfpSeJECz+UGutJsKIgBOS4/D8FGea6vs8HZc845U8thzO
         0ZftT7qR0g6p/5ITEz36uPlfL4cG45fqTSZkebTh6GJFJan3gMKY6YThxdIXWF7VPOh3
         s0Kx2o+eXMcydAZ99Ur1f3LbPhnCytSsahPqFX8+GapiEBQEYFh7H2gInbhEHIWgd55o
         jGHV2ad9UNhXty9mITL0NzF7MVpjagt8PujuBMMbFIHM7NE49hEJFp1w5h/LWcMG0/HO
         bA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8A6ipROPPkRBub7c5ufy/QPPXrGcBQf33WU8roEAa7cMwcYTkGxSnIgw1dDwqZGBhlbl/YVwbQ/mtTrkwpIe/252lzL5iqD1T+sH/
X-Gm-Message-State: AOJu0YxGbJymeeP1MUpcpO7NviHXqejL4nkX4Ri3g/WqhOKAc2xba4U4
	ItFgVnV7Cc+BlwiSlbHTwXL6YzX57hIfkfmxApUD/hLIgbnLGPUAdLZpwMdplJsdQb5UqP7R0gu
	GZkc=
X-Google-Smtp-Source: AGHT+IHSi4OBNzaU+B2LgJN8/gLfHe2x6D+r2Bobw+i8XhnHPuZjnSs85LOFa27DBHA9NywFZOhCkA==
X-Received: by 2002:a17:907:1608:b0:a7a:bae8:f2b5 with SMTP id a640c23a62f3a-a7dbcd4b357mr54629866b.36.1722511342367;
        Thu, 01 Aug 2024 04:22:22 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23624sm885445266b.20.2024.08.01.04.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 04:22:22 -0700 (PDT)
Message-ID: <f08678b1-260f-4200-889b-a4ec016fc7e1@suse.com>
Date: Thu, 1 Aug 2024 13:22:21 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
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
 <00714a65-953f-4885-9229-1990543c4154@suse.com>
 <CABCJKucj7zjc4=EiFdSnzNDBvQmaWBBt_KJsTq1ybp=Vegp5eQ@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKucj7zjc4=EiFdSnzNDBvQmaWBBt_KJsTq1ybp=Vegp5eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/26/24 23:05, Sami Tolvanen wrote:
> On Mon, Jul 22, 2024 at 8:20 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> From my perspective, I'm okay if gendwarfksyms doesn't provide
>> functionality to compare a new object file with its reference symtypes
>> file.
>>
>> As mentioned, genksyms has this functionality but I actually think the
>> way it works is not ideal. Its design is to operate on one compilation
>> unit at the time. This has the advantage that a comparison of each file
>> is performed in parallel during the build, simply because of the make
>> job system. On the other hand, it has two problems.
>>
>> The first one is that genksyms doesn't provide a comparison of the
>> kernel as a whole. This means that the tool gives rather scattered and
>> duplicated output about changed structs in the build log. Ideally, one
>> would like to see a single compact report about what changed at the end
>> of the build.
> 
> Sure, that makes sense. Android uses STG for this, which might be
> useful to other folks too:
> 
> https://android.googlesource.com/platform/external/stg/
> https://android.googlesource.com/platform/external/stg/+/refs/heads/main/doc/stgdiff.md#output-formats

STG is an interesting tool. I've played with it a bit last year. To be
frank, I was surprised to see a new tool being proposed by Google to
generate modversion CRCs from DWARF instead of potentially extending
your STG project for this purpose. I'm not sure if it is something that
you folks have considered and evaluated.

>> A few months ago, I also started working on a tool inspired by this
>> script. The goal is to have similar functionality but hopefully with
>> a much faster implementation. Hence, this tool is written in a compiled
>> language (Rust at the moment) and should also become multi-threaded. I'm
>> hoping to find some time to make progress on it and make the code
>> public. It could later be added to the upstream kernel to replace the
>> comparison functionality implemented by genksyms, if there is interest.
>>
>> So as mentioned, I'm fine if gendwarfksyms doesn't have this
>> functionality. However, for distributions that rely on the symtypes
>> format, I'd be interested in having gendwarfksyms output its dump data
>> in this format as well.
> 
> We can definitely tweak the output format, but I'm not sure if making
> it fully compatible with the genksyms symtypes format is feasible,
> especially for Rust code. I also intentionally decided to use DWARF
> tag names in the output instead of shorthands like s# etc. to make it
> a bit more readable.

Sure, it might be necessary to extend the symtypes format a bit, for
example, by allowing spaces in type names. What other problems do you
see?

The example I showed preserves the DWARF tag names in type descriptions.
Cross-references and the target type names use the s# prefix as they
they need to be distinguished from other tokens.

>> For example, instead of producing:
>>
>> gendwarfksyms: process_exported_symbols: _some_mangled_func_name (@ XYZ)
>> subprogram(
>>    [formal parameters...]
>> )
>> -> structure_type core::result::Result<(), core::fmt::Error> {
>>    [a description of the structure...]
>> };
>>
>> .. the output could be something like this:
>>
>> S#'core::result::Result<(), core::fmt::Error>' structure_type core::result::Result<(), core::fmt::Error> { [a description of the structure...] }
>> _some_mangled_func_name subprogram _some_mangled_func_name ( [formal parameters...] ) -> S#'core::result::Result<(), core::fmt::Error>'
> 
> This wouldn't be enough to make the output format compatible with
> symtypes though. genksyms basically produces a simple key-value pair
> database while gendwarfksyms currently outputs the fully expanded type
> string for each symbol. If you need the tool to produce a type
> database, it might also be worth discussing if we should use a bit
> less ad hoc format in that case.

What I think is needed is the ability to compare an updated kernel with
some previous reference and have an output that clearly and accurately
shows why CRCs of some symbols changed. The previous reference should be
possible to store in Git together with the kernel source. It means it
should be ideally some text format and limited in size. This is what
distributions that care about stable kABI do in some form currently.

This functionality would be needed if some distribution wants to
maintain stable Rust kABI (not sure if it is actually feasible), or if
the idea is for gendwarfksyms to be a general tool that could replace
genksyms. I assume for the sake of argument that this is the case.

Gendwarfksyms could implement this functionality on its own, or as
discussed, I believe it could provide a symtypes-like dump and a second
tool could be used to work with this format and for comparing it.

From my point of view, the current --debug format is not suitable for
this purpose because its expanded and unstructured form means it is
bloated and hard to compare with a previous reference.

I'm also not quite yet sold on using separate DWARF tooling, such as
libabigail or STG, to actually understand why gendwarfksyms produced
a different CRC for some symbol. Using these tools makes sense in the
genksyms world, where genksyms operates on the source code level and
this additional tooling can only work on debug data.

With gendwarfksyms working directly with DWARF data, it doesn't seem
appealing to me to first run gendwarfksyms to produce CRCs, compare them
with their reference, and if they are different, use a second tool to
process the same DWARF data again and with some luck hopefully get an
actual answer why the CRCs changed. I'm worried that users might
encounter inaccurate answers if the two tools interpret the input data
differently.

> 
> One more thing to note about the current --debug output is that it
> directly correlates with the debugging information and thus may not
> contain all aliases. For example, the Rust compiler deduplicates
> identical function implementations (e.g. Deref::deref and
> DerefMut::deref_mut etc.), but only one of the symbol names appears in
> DWARF. We use symbol addresses to print out #SYMVERs also for the
> aliases, but they don't show up in the debugging output right now.

Thanks,
Petr

