Return-Path: <linux-kbuild+bounces-2542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD3931C22
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 22:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C06E91C21E04
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 20:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA82813BAFA;
	Mon, 15 Jul 2024 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPWPewEk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D565113B5B7
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076039; cv=none; b=FfMsV2OdI5D/e8Myk4TJCEISLcwDjLSRchYkurxwejCnwKS/TA6r5zR35Nb0pw/CYbO11MJnN6wavjQQXyfDhxwsAgtziIeC0CWHxFfxISsJftB6fLpncbI0l/GjySD6NDvCNyFOuv99WBXkvGFRGPqzghf0pi2HocRWviEwnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076039; c=relaxed/simple;
	bh=oSy7pWCF/gI0rY02+WvHWDsxr8vczHoYLSUS5+7+31E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pH4laxktxmgBgJS7F4vDVWWSyq6QqrsfEWK8LmhOIC2yJjymYDZep2pItkbkp5e6qUP0gmBwqR+OvfLmS672lfMfwJns1/cF+6rFGFEkrxDbpVe3kQKeeGlzl//KsNZePrPDOG9wIOvOUZie07/jmUJiXjFcqWtFaLprAAxAloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPWPewEk; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-81177a1089fso1229705241.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2024 13:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721076037; x=1721680837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS0BTNSokaMY/dxoDgKw9rrLuSVkHGouvH7zTfa5F8Y=;
        b=yPWPewEk2HIlUxcXck4BYGsGLeEMtdjG/EihbfhLtN8JPK+hD0B68i4exYg49Aa26L
         1vFb5XolTRkvGVoBmN8xNYfC1zKFGp5pRfL2vaZwIJ9aHFtFTn37cpL7vzcWIHwFyJdT
         gh5832lBw1fToUNWEOnIplLZKHKxuSXv2VPGZLVBKtZssq8Vb45aJ6XpLtEeUNPH4CKW
         GKiB2fp3baFbcoiukYQHFfWTXTGyTrTYBhLNXVbbm3Dw7MpAPpn6imESgM46TfhkSYCj
         485aFPbNVDgkdHdCH1TZMRRJ7hzFWjv5GAF3vTmTILyxWrT9ReqTZIhzR+CWtqCs4CWL
         8w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076037; x=1721680837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS0BTNSokaMY/dxoDgKw9rrLuSVkHGouvH7zTfa5F8Y=;
        b=ehJrPVvsCszhBl1Ho/HJDDdE/D18A4MWzZKCKUqor8/Ol/+dCjT4F8RxOsmruAnsn0
         qqvQwQk1yaAJC6rDQ7Cw5VCgSHGhP5bDrig5zuI6d5ZCGqR5+MNRPqRmx+oKgkyLHnZe
         oNwxb2UR9WIUp4TwuMsQ9GejGJhqNEMWqjhr0JQopD4rgUhFBS6yMtB3XIehxFA+cxjQ
         ly7DdZA4WEYZPGaAgUmGCzViRgojbZZ4Z7SkIF5BWmyKvmRk9m2dSNQZI7NhGnyJP79P
         SRIM15+eVcRHQtbTKuZYlLB/+OTkfgCzBhYfQoBjIaqc3uYOAmhjeDV1Ekvj2E5quK4Y
         TFBw==
X-Forwarded-Encrypted: i=1; AJvYcCWObvMBaiq79kCZaKx5Cq5pMZ5mIm3rcYgojVmfv+SfLLmRLQojmODb0QDMg7ES9IRbrnYveVDyTTjpATW22o75PZQfNCLziahP8CnT
X-Gm-Message-State: AOJu0YxR1eF7dK+BgbBuO/WEA3J6hdxU7W42N6v6yIWhxO+aBxjXT3DG
	0x7YKNArptkj4yWu+pUwUh8RppDsAPvTYbMcmUXwVAAm7meZ13RPyuhJEjYVJCP9tBLMvGn3lzP
	/QGL/SNQvDluOV86mT5JlgiC4fyIu5BFnG4oe
X-Google-Smtp-Source: AGHT+IEielVS1o0SbsVVS78wRgd1TDMQT3A8qiYKcy98d6bE9prj7+6YJzc5lzzm8j0RfdvdKEkpi5wqVYxF4RpD0X4=
X-Received: by 2002:a05:6102:3c88:b0:48f:e86c:5e1d with SMTP id
 ada2fe7eead31-4914c4defeemr201499137.9.1721076036510; Mon, 15 Jul 2024
 13:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com> <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com>
In-Reply-To: <0b2697fd-7ab4-469f-83a6-ec9ebc701ba0@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 15 Jul 2024 20:39:59 +0000
Message-ID: <CABCJKueGRBdFfGW-cvOvqxc-a85GpxtwPmLdE_1RiAkNLrEg+g@mail.gmail.com>
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
To: Petr Pavlu <petr.pavlu@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Jul 10, 2024 at 7:30=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 6/17/24 19:58, Sami Tolvanen wrote:
> > Hi folks,
> >
> > This series implements CONFIG_MODVERSIONS for Rust, an important
> > feature for distributions like Android that want to ship Rust
> > kernel modules, and depend on modversions to help ensure module ABI
> > compatibility.
>
> Thanks for working on this. Below is some feedback with my (open)SUSE
> hat on, although it should be quite general.

Great, thanks for taking a look!

> > There have been earlier proposals [1][2] that would allow Rust
> > modules to coexist with modversions, but none that actually implement
> > symbol versioning. Unlike C, Rust source code doesn't have sufficient
> > information about the final ABI, as the compiler has considerable
> > freedom in adjusting structure layout for improved performance [3],
> > for example, which makes using a source code parser like genksyms
> > a non-starter. Based on Matt's suggestion and previous feedback
> > from maintainers, this series uses DWARF debugging information for
> > computing versions. DWARF is an established and relatively stable
> > format, which includes all the necessary ABI details, and adding a
> > CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> > reasonable trade-off.
>
> Using the DWARF data makes sense to me. Distribution kernels are
> normally built with debuginfo because one has to be able to debug them
> later, unsurprisingly. Besides that, one now typically wants to use BPF
> together with built-in BTF data (CONFIG_DEBUG_INFO_BTF), which also
> requires building the kernel with debuginfo.
>
> I would however keep in mind that producing all DWARF data has some
> cost. From a quick test, an x86_64-defconfig build is ~30% slower for me
> with CONFIG_DEBUG_INFO=3Dy. The current genksyms tool allows to have
> debuginfo disabled when backporting some patches and consequently have
> a quicker feedback whether modversions changed. This option would
> disappear with gendwarfksyms but I think it is acceptable.

Yes, this matches my benchmarks too. Presumably folks who care about
build times and are not interested in debugging information or Rust
support would prefer genksyms instead. I'm planning to turn this into
a Kconfig choice in the next version.

> > The first 12 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a list
> > of exported symbols, the tool generates an expanded type string
> > for each symbol, and computes symbol CRCs similarly to genksyms.
> > gendwarfksyms is written in C and uses libdw to process DWARF, mainly
> > because of the existing support for C host tools that use elfutils
> > (e.g., objtool).
>
> In addition to calculating CRCs of exported symbols, genksyms has other
> features which I think are important.
>
> Firstly, the genksyms tool has a human-readable storage format for input
> data used in the calculation of symbol CRCs. Setting the make variable
> KBUILD_SYMTYPES enables dumping this data and storing it in *.symtypes
> files.
>
> When a developer later modifies the kernel and wants to check if some
> symbols have changed, they can take these files and feed them as
> *.symref back to genksyms. This allows the tool to provide an actual
> reason why some symbols have changed, instead of just printing that
> their CRCs are different.
>
> Is there any plan to add the same functionality to gendwarfksyms, or do
> you envison that people will use libabigail, Symbol-Type Graph, or
> another tool for making this type of comparison?

gendwarfksyms also uses human-readable input for the CRC calculations,
and it prints out the input strings with the --debug option. I plan to
hook this up to KBUILD_SYMTYPES in v2. It should be convenient enough
to simply compare the pretty-printed output with diff, so I'm not sure
if a built-in comparison option is needed. Any other DWARF analysis
tool can be used to spot the differences too, as you mentioned.

> Secondly, when distributions want to maintain stable kABI, they need to
> be able to deal with patch backports that add new members to structures.
> One common approach is to have placeholders in important structures
> which can be later replaced by the new members as needed. __GENKSYMS__
> ifdefs are then used at the C source level to hide these kABI-compatible
> changes from genksyms.
>
> Gendwarfksyms works on the resulting binary and so using such ifdefs
> wouldn't work. Instead, I suspect that what is required is a mechanism
> to tell the tool that a given change is ok, probably by allowing to
> specify some map from the original definition to the new one.
>
> Is there a plan to implement something like this, or how could it be
> addressed?

That's a great question. Here's what Android uses currently to
maintain a stable kABI, I assume you're doing something similar?

https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6/i=
nclude/linux/android_kabi.h

If using unions here is acceptable to everyone, a simple solution
would be to use a known name prefix for the reserved members and teach
gendwarfksyms to only print out the original type for the replaced
ones. For example:

The initial placeholder:

    u8 __kabi_reserved_1[8];

After replacement:

    union {
            u64 new_member;
            struct {
                    u8 __kabi_reserved_1[8];
            };
    }

Here gendwarfksyms would see the __kabi_reserved prefix and only use
u8 [8] for the CRC calculation. Does this sound reasonable?

Greg, I know you've been dealing with this for a long time, any thoughts?

> > Another compatibility issue is fitting the extremely long mangled
> > Rust symbol names into struct modversion_info, which can only hold
> > 55-character names (on 64-bit systems). Previous proposals suggested
> > changing the structure to support longer names, but the conclusion was
> > that we cannot break userspace tools that parse the version table.
> >
> > The next two patches of the series implement support for hashed
> > symbol names in struct modversion_info, where names longer than 55
> > characters are hashed, and the hash is stored in the name field. To
> > avoid breaking userspace tools, the binary hash is prefixed with a
> > null-terminated string containing the name of the hash function. While
> > userspace tools can later be updated to potentially produce more
> > useful information about the long symbols, this allows them to
> > continue working in the meantime.
>
> I think this approach with hashed names is quite complex. I'd personally
> be also in favor of having a new section with variable-length strings to
> store the names of imported symbols. As yet another alternative, it
> should be also possible to refer directly into .symtab/.strtab to avoid
> duplicating the names, but I suspect it would be non-trivial to
> implement.

Thanks for the feedback. I think for the next version we'll look into
reviving the relevant bits of Matt's previous patch series, which
implemented a new section that supports variable-length names:

https://lore.kernel.org/lkml/CAGSQo03R+HYcX2JJDSm7LA8V370s_3hrbTBc2s51Pp9nx=
WTz5w@mail.gmail.com/

Sami

