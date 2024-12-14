Return-Path: <linux-kbuild+bounces-5139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A602C9F1E45
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 12:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8D3161800
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 11:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06B3187FE4;
	Sat, 14 Dec 2024 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bii8dE9M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03826AC3;
	Sat, 14 Dec 2024 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734176049; cv=none; b=o2UYzmtdaxPfj1RcA25qFYS06eRIMI05dZ201rvTqlaixIJng60/F1LiiXVZEoUSE1/OKbwiKMrgPniGKpc3UWcC37rPBX/Kib+BdMZNfDAyKORhKWskj6Jpd0sbzx4MbAWSff896IEx3M1JQP7c0cvRZpieFQITc2g530sg7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734176049; c=relaxed/simple;
	bh=3quS/XIB7rH26SfSQPeMF1msLJoEeJ017rW8wN32ubI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSy0XaXhNeDsm4D56Gwf3W+Bx/rlPkmRYZ6D43KGLX+VbUJ85C33xNZ/lvZKFnxEOkoUrUPUpHlc/7V3ahUg6Q0aV0Dp5CqrdXgIGpbA2DVI0d0sM5iUe/UBrTMCr+DIQBIpZBnnGZ5N87+Fut6D2IZco+12sHAb0CKu+tGCFwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bii8dE9M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E99FC4CED1;
	Sat, 14 Dec 2024 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734176049;
	bh=3quS/XIB7rH26SfSQPeMF1msLJoEeJ017rW8wN32ubI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bii8dE9M2TQ+vWMBJni9TQfgCH5FuVCqVRqPv+upVRkU0pInhEyDotltTtugofsTa
	 0KYq2alf+xYCrPkTM/Ej5nFe5Zhu30hCjoqVkTb2klj6tiDCxz2X6E7JxposqqykpL
	 dPs0PJFuN/THTDrGPZjYoqmNelKQRe6mPdCVYu0NCvFzZJe8AqPflLvU5otaQ8EWEl
	 LvdemwvbW7H1DBoBNP4k+zMl2HChEfSPgHPq7FMnXRmcXHrv7493FpgYfxvlc+WSag
	 L3BaDW1UaAJJJ3le+SX985quBAkONR8fbx3lgtlw2WjhVHiDOy5TKLo5a2csHm3q/g
	 MmoTMQa2ZWyjw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30229d5b1caso24441901fa.2;
        Sat, 14 Dec 2024 03:34:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+GpzdOwUGeG+5YDg8nEIbadBM7X4CwUa5kvISmawO/kIZY9jIWWGcJ4ELYvKtmxPRxqKqrqJg3Lq5mTE=@vger.kernel.org, AJvYcCVV9IAIR4NuNgi7RAFUADG0UUw2j2/NA4x7OReEeL+EACR/JZM4uH0/F2jyaAWm9wHLCl/t0PdhX4OhjpNHn1E=@vger.kernel.org, AJvYcCW1PhF3lc2f7ZaCsTmQQCE8gSRBIl517yQ4/GzEKnZZneHQwM9uNb5n7a+fmQmsRvHGAOKJikQjricsJyjm@vger.kernel.org, AJvYcCWC5fAR2Hel+BYuvafabZIAvdiaDG9rJrwJ3+Q1jsSS4LZqwCbWNz02bRN0Xku1rIgOkc4lRIGMUAPUvslt0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxE9QZUzHqrvR/0NBi636bAK/ZaRguI4Vr05A/gEuZW/aEq09
	Nb2aQh6em0SZd4WqFNoIvwYj2gnVVsgFDSYULI6zRx+7/w3QDMq75194b7sv1yhXMmyfA6ktcpM
	GmkZ9CseapG/Y0v4ih9PLS/gkgQQ=
X-Google-Smtp-Source: AGHT+IGs8H5W28XVuuYGgGnFWR7/ocRZiS56OOmZMZFgEsHNDhd7okr5VD2LfcNVVuu4kKqbeTDFIqhjQQ87QXGc3RU=
X-Received: by 2002:a05:651c:1990:b0:302:4a61:8bd3 with SMTP id
 38308e7fff4ca-302545206f8mr16701081fa.7.1734176047764; Sat, 14 Dec 2024
 03:34:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <20241121204220.2378181-38-samitolvanen@google.com>
In-Reply-To: <20241121204220.2378181-38-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Dec 2024 20:33:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
Message-ID: <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] Documentation/kbuild: Add DWARF module versioning
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 5:43=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Add documentation for gendwarfksyms changes, and the kABI stability
> features that can be useful for distributions even though they're not
> used in mainline kernels.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  Documentation/kbuild/gendwarfksyms.rst | 308 +++++++++++++++++++++++++
>  Documentation/kbuild/index.rst         |   1 +
>  2 files changed, 309 insertions(+)
>  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
>
> diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuil=
d/gendwarfksyms.rst
> new file mode 100644
> index 000000000000..7725d7f57131
> --- /dev/null
> +++ b/Documentation/kbuild/gendwarfksyms.rst
> @@ -0,0 +1,308 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DWARF module versioning
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +1. Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When CONFIG_MODVERSIONS is enabled, symbol versions for modules
> +are typically calculated from preprocessed source code using the
> +**genksyms** tool.  However, this is incompatible with languages such
> +as Rust, where the source code has insufficient information about
> +the resulting ABI. With CONFIG_GENDWARFKSYMS (and CONFIG_DEBUG_INFO)
> +selected, **gendwarfksyms** is used instead to calculate symbol versions
> +from the DWARF debugging information, which contains the necessary
> +details about the final module ABI.
> +
> +1.1. Usage
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +gendwarfksyms accepts a list of object files on the command line, and a
> +list of symbol names (one per line) in standard input::
> +
> +        Usage: gendwarfksyms [options] elf-object-file ... < symbol-list
> +
> +        Options:
> +          -d, --debug          Print debugging information
> +              --dump-dies      Dump DWARF DIE contents
> +              --dump-die-map   Print debugging information about die_map=
 changes
> +              --dump-types     Dump type strings
> +              --dump-versions  Dump expanded type strings used for symbo=
l versions
> +          -s, --stable         Support kABI stability features
> +          -T, --symtypes file  Write a symtypes file
> +          -h, --help           Print this message
> +
> +
> +2. Type information availability
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +While symbols are typically exported in the same translation unit (TU)
> +where they're defined, it's also perfectly fine for a TU to export
> +external symbols. For example, this is done when calculating symbol
> +versions for exports in stand-alone assembly code.
> +
> +To ensure the compiler emits the necessary DWARF type information in the
> +TU where symbols are actually exported, gendwarfksyms adds a pointer
> +to exported symbols in the `EXPORT_SYMBOL()` macro using the following
> +macro::
> +
> +        #define __GENDWARFKSYMS_EXPORT(sym)                             =
\
> +                static typeof(sym) *__gendwarfksyms_ptr_##sym __used    =
\
> +                        __section(".discard.gendwarfksyms") =3D &sym;
> +
> +
> +When a symbol pointer is found in DWARF, gendwarfksyms can use its
> +type for calculating symbol versions even if the symbol is defined
> +elsewhere. The name of the symbol pointer is expected to start with
> +`__gendwarfksyms_ptr_`, followed by the name of the exported symbol.

I am interested in this sentence.

__GENDWARFKSYMS_EXPORT() is primarily introduced to handle
EXPORT_SYMBOL() in *.S files.
In fact, .discard.gendwarfksyms is always output for EXPORT_SYMBOL()
from *.c files.

Can we make it faster by processing only symbol references in the
.dscard.gendwarfksyms section, and skipping all other sections entirely?




> +4.3. Adding structure members
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Perhaps the most common ABI compatible changeis adding a member to a

changeis -> change is







> +kernel data structure. When changes to a structure are anticipated,
> +distribution maintainers can pre-emptively reserve space in the
> +structure and take it into use later without breaking the ABI. If
> +changes are needed to data structures without reserved space, existing
> +alignment holes can potentially be used instead. While kABI rules could
> +be added for these type of changes, using unions is typically a more
> +natural method. This section describes gendwarfksyms support for using
> +reserved space in data structures and hiding members that don't change
> +the ABI when calculating symbol versions.
> +
> +4.3.1. Reserving space and replacing members
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Space is typically reserved for later use by appending integer types, or
> +arrays, to the end of the data structure, but any type can be used. Each
> +reserved member needs a unique name, but as the actual purpose is usuall=
y
> +not known at the time the space is reserved, for convenience, names that
> +start with `__kabi_` are left out when calculating symbol versions::
> +
> +        struct s {
> +                long a;
> +                long __kabi_reserved_0; /* reserved for future use */
> +        };
> +
> +The reserved space can be taken into use by wrapping the member in a
> +union, which includes the original type and the replacement member::
> +
> +        struct s {
> +                long a;
> +                union {
> +                        long __kabi_reserved_0; /* original type */
> +                        struct b b; /* replaced field */
> +                };
> +        };
> +
> +If the `__kabi_` naming scheme was used when reserving space, the name
> +of the first member of the union must start with `__kabi_reserved`. This
> +ensures the original type is used when calculating versions, but the nam=
e
> +is again left out. The rest of the union is ignored.
> +
> +If we're replacing a member that doesn't follow this naming convention,
> +we also need to preserve the original name to avoid changing versions,
> +which we can do by changing the first union member's name to start with
> +`__kabi_renamed` followed by the original name.
> +
> +The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
> +simplify the process and also ensure the replacement member is correctly
> +aligned and its size won't exceed the reserved space.
> +
> +4.3.2. Hiding members
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Predicting which structures will require changes during the support
> +timeframe isn't always possible, in which case one might have to resort
> +to placing new members into existing alignment holes::
> +
> +        struct s {
> +                int a;
> +                /* a 4-byte alignment hole */
> +                unsigned long b;
> +        };
> +
> +
> +While this won't change the size of the data structure, one needs to
> +be able to hide the added members from symbol versioning. Similarly
> +to reserved fields, this can be accomplished by wrapping the added
> +member to a union where one of the fields has a name starting with
> +`__kabi_ignored`::
> +
> +        struct s {
> +                int a;
> +                union {
> +                        char __kabi_ignored_0;
> +                        int n;
> +                };
> +                unsigned long b;
> +        };
> +
> +With **--stable**, both versions produce the same symbol version.
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.=
rst
> index cee2f99f734b..e82af05cd652 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -21,6 +21,7 @@ Kernel Build System
>      reproducible-builds
>      gcc-plugins
>      llvm
> +    gendwarfksyms
>
>  .. only::  subproject and html
>
> --
> 2.47.0.371.ga323438b13-goog
>


--
Best Regards



Masahiro Yamada

