Return-Path: <linux-kbuild+bounces-5140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F69F1EAD
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 14:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D18631889CF7
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Dec 2024 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB501917EB;
	Sat, 14 Dec 2024 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egjqH4a3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECC1CD2C;
	Sat, 14 Dec 2024 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734181500; cv=none; b=irX1J5rIttIVWdKFEAoAhea+THrSSFhWr7g1FhUZZg95eFE1zPLgpUbWcb0BekuQ3/c/T9TSHGDVd3BHbYATBErzIulcPufMdKCcGDSqZKPYKviRF4p2fNWh/cd92jRUTFpwqcaf+kXGJHODYh5iQZDEzwyLX0/zPsJmF3XSbl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734181500; c=relaxed/simple;
	bh=g7RkEQvxHCUgGPAPsXg09LHzWL9erwZn26Z+wYkeh+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezDqEYSVcnxwkmwFDuY2Z7juoA9eYvsQLaf6dFz9yYpOZWHl1NfwcUkpvnYdqk5pv7R8jbjQKqiMLIxQ1Sx2+z8u+vjN6TrIhs/ne180pekSb3ZGnntuKugGjVcUWpR9vN7ZH+K2fYuF7JOWBfVAh3e7uRDBG8Ab6k6JDk1d2Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egjqH4a3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54024aa9febso2585568e87.1;
        Sat, 14 Dec 2024 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734181496; x=1734786296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=smLP5LsKfh06xnFeNLi3B7TBCTXcGf3Y2qTyvmyCwTk=;
        b=egjqH4a37BEdsPQdttJ0Y92N4NBCRVZDUo0ZPKkO2a5PMlJpPz1IA3cStXEMOl9dvO
         z7WVEENHrdkwjt9qt8g64iEVEvXGEHyNqpHTUtNmB4R3ha1aM32mR0jL3VvWTZ+wU1zr
         frMmZNBBOf/Cb3WXK1Pq02AjzkeO9YIOSJ+xylA7UPTnsV2oxCLjdft/fQdlGleKqLzx
         YtSr8pyJXGBb6yhNtDBFV/b+6laZPnzNPXzfn6iCIxvYNzl0Y8ls9EAAinwfiad4j+h1
         MmJ2Me9ud8pSXfw2wFGfPToOFx9VmyPL5Fw31H860jrqPxkm77h0eGkQsPR9vQYVYeYV
         DqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734181496; x=1734786296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smLP5LsKfh06xnFeNLi3B7TBCTXcGf3Y2qTyvmyCwTk=;
        b=pegXUULKB5Q8dw6Srx2IhMPaCS2h/oXXCOmkvf+RlBRryWix2xyUAHJhgjJasnsfem
         Qx/7wdZlCSohOU816ZHzelagMDKydlePzq05y3VwlVGYJOpwsGf0WNQgesIB0gV1VhZg
         UCnrhgdy2wp6wkPVyctx3wJU/I9SVTCesllaEvbyleRd3+ay/oh8xH9Kqo25FXqYToyX
         BAn8B9ELgfP9VNgon4Gqyjj8YED7bT12JT8hZvHxDfgGeK5ITNuGeyM/JMI1nnJvOb2h
         isrISI5n+Jr+8B5nm/cG2UCJ6rBv15O8a6QMFQxCGrbvK2ZkFCGgchbLrEnL2QZwT1En
         1ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt6Qx5T16SqKPiW8lvA2hEKcp2QeZdRXEdiS4ZeQiHRXZEjGbVdAHSdgTjwO0swoBNF4Abn0pN0rsYmZ0=@vger.kernel.org, AJvYcCWSeqVvKp0HMGtgqK9EF4r9PP6v4W2dIAVX38wr5XQ7zbKaR7iw5nSL+LzEyiq4T9lDCdcyXSGsYO+kKnG9@vger.kernel.org, AJvYcCWV258hF8jrrtx2dqmXrhD3btljXNB7A1n1a1eX4CgnYZCQVGIeLnN+aoFjEdBrsxwasyBf0FL3NxSlRPWhbrY=@vger.kernel.org, AJvYcCWvBH/BMr0sqA5E8c1o58zOmllT9/opcJLDrDmu4ol1OvUf4RTNfG1NFb3+jKDz8TeGROKx+v/UsRoKENUAFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDt+8gQ6xRViItqG7pJfiU7jqIAmGUz1xYirkCBzwCDdlfTzt
	q63VKb0fUJ0c0CFNlarRYsDWWLyMzOhaZ+9L+jVBhLjJQvWT8o7Bsd3xxiJhYLAeAuC0K9z9Ovu
	CSTrsBdieWoJnB0Kn9ND6VV+qP+Y=
X-Gm-Gg: ASbGncu9DZ4YDbGJKOGrBIrGn6PGS/Tb+9hOC6+n5KBQchaWOZhwkCrApQ4/m/YHm28
	nkGRKjFLV97Dn6bhSyZDByLokTxQgCw8PslnEm+yA+XDymIsHNhUmEHNvAnMjRtFVHnNp
X-Google-Smtp-Source: AGHT+IEPHgyqAt1cX70wM6GRV4JVDyFqSzf59RAxPEnyLNBb6LyX8wtzB0NASqgmUnpv3CsW0s5bk6c37/J8K0cVLPk=
X-Received: by 2002:a05:6512:ea5:b0:540:2223:9b0b with SMTP id
 2adb3069b0e04-540905aae88mr1968894e87.35.1734181496120; Sat, 14 Dec 2024
 05:04:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-38-samitolvanen@google.com> <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
In-Reply-To: <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 14 Dec 2024 14:04:19 +0100
Message-ID: <CA+icZUX_actkO4Si2HNQiH6AcS=3aNXA1OOka7LZNtEBQCNTGA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] Documentation/kbuild: Add DWARF module versioning
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 12:34=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Fri, Nov 22, 2024 at 5:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Add documentation for gendwarfksyms changes, and the kABI stability
> > features that can be useful for distributions even though they're not
> > used in mainline kernels.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  Documentation/kbuild/gendwarfksyms.rst | 308 +++++++++++++++++++++++++
> >  Documentation/kbuild/index.rst         |   1 +
> >  2 files changed, 309 insertions(+)
> >  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
> >
> > diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbu=
ild/gendwarfksyms.rst
> > new file mode 100644
> > index 000000000000..7725d7f57131
> > --- /dev/null
> > +++ b/Documentation/kbuild/gendwarfksyms.rst
> > @@ -0,0 +1,308 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +DWARF module versioning
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +When CONFIG_MODVERSIONS is enabled, symbol versions for modules
> > +are typically calculated from preprocessed source code using the
> > +**genksyms** tool.  However, this is incompatible with languages such
> > +as Rust, where the source code has insufficient information about
> > +the resulting ABI. With CONFIG_GENDWARFKSYMS (and CONFIG_DEBUG_INFO)
> > +selected, **gendwarfksyms** is used instead to calculate symbol versio=
ns
> > +from the DWARF debugging information, which contains the necessary
> > +details about the final module ABI.
> > +
> > +1.1. Usage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +gendwarfksyms accepts a list of object files on the command line, and =
a
> > +list of symbol names (one per line) in standard input::
> > +
> > +        Usage: gendwarfksyms [options] elf-object-file ... < symbol-li=
st
> > +
> > +        Options:
> > +          -d, --debug          Print debugging information
> > +              --dump-dies      Dump DWARF DIE contents
> > +              --dump-die-map   Print debugging information about die_m=
ap changes
> > +              --dump-types     Dump type strings
> > +              --dump-versions  Dump expanded type strings used for sym=
bol versions
> > +          -s, --stable         Support kABI stability features
> > +          -T, --symtypes file  Write a symtypes file
> > +          -h, --help           Print this message
> > +
> > +
> > +2. Type information availability
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +While symbols are typically exported in the same translation unit (TU)
> > +where they're defined, it's also perfectly fine for a TU to export
> > +external symbols. For example, this is done when calculating symbol
> > +versions for exports in stand-alone assembly code.
> > +
> > +To ensure the compiler emits the necessary DWARF type information in t=
he
> > +TU where symbols are actually exported, gendwarfksyms adds a pointer
> > +to exported symbols in the `EXPORT_SYMBOL()` macro using the following
> > +macro::
> > +
> > +        #define __GENDWARFKSYMS_EXPORT(sym)                           =
  \
> > +                static typeof(sym) *__gendwarfksyms_ptr_##sym __used  =
  \
> > +                        __section(".discard.gendwarfksyms") =3D &sym;
> > +
> > +
> > +When a symbol pointer is found in DWARF, gendwarfksyms can use its
> > +type for calculating symbol versions even if the symbol is defined
> > +elsewhere. The name of the symbol pointer is expected to start with
> > +`__gendwarfksyms_ptr_`, followed by the name of the exported symbol.
>
> I am interested in this sentence.
>
> __GENDWARFKSYMS_EXPORT() is primarily introduced to handle
> EXPORT_SYMBOL() in *.S files.
> In fact, .discard.gendwarfksyms is always output for EXPORT_SYMBOL()
> from *.c files.
>
> Can we make it faster by processing only symbol references in the
> .dscard.gendwarfksyms section, and skipping all other sections entirely?
>

Hi Masahiro,

I am interested in everything making my build faster.

v6 introduced a longer build-time for me.
Sami wanted to check after his vacancies see [1].

Just for the records.

Best regards,
-Sedat-

[1] https://lore.kernel.org/all/CABCJKudwpKX1_j46Tp6=3DeAJ0JU2zWE15+c8OFq9L=
MAnSqwesOw@mail.gmail.com/

>
>
> > +4.3. Adding structure members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +Perhaps the most common ABI compatible changeis adding a member to a
>
> changeis -> change is
>
>
>
>
>
>
>
> > +kernel data structure. When changes to a structure are anticipated,
> > +distribution maintainers can pre-emptively reserve space in the
> > +structure and take it into use later without breaking the ABI. If
> > +changes are needed to data structures without reserved space, existing
> > +alignment holes can potentially be used instead. While kABI rules coul=
d
> > +be added for these type of changes, using unions is typically a more
> > +natural method. This section describes gendwarfksyms support for using
> > +reserved space in data structures and hiding members that don't change
> > +the ABI when calculating symbol versions.
> > +
> > +4.3.1. Reserving space and replacing members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Space is typically reserved for later use by appending integer types, =
or
> > +arrays, to the end of the data structure, but any type can be used. Ea=
ch
> > +reserved member needs a unique name, but as the actual purpose is usua=
lly
> > +not known at the time the space is reserved, for convenience, names th=
at
> > +start with `__kabi_` are left out when calculating symbol versions::
> > +
> > +        struct s {
> > +                long a;
> > +                long __kabi_reserved_0; /* reserved for future use */
> > +        };
> > +
> > +The reserved space can be taken into use by wrapping the member in a
> > +union, which includes the original type and the replacement member::
> > +
> > +        struct s {
> > +                long a;
> > +                union {
> > +                        long __kabi_reserved_0; /* original type */
> > +                        struct b b; /* replaced field */
> > +                };
> > +        };
> > +
> > +If the `__kabi_` naming scheme was used when reserving space, the name
> > +of the first member of the union must start with `__kabi_reserved`. Th=
is
> > +ensures the original type is used when calculating versions, but the n=
ame
> > +is again left out. The rest of the union is ignored.
> > +
> > +If we're replacing a member that doesn't follow this naming convention=
,
> > +we also need to preserve the original name to avoid changing versions,
> > +which we can do by changing the first union member's name to start wit=
h
> > +`__kabi_renamed` followed by the original name.
> > +
> > +The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
> > +simplify the process and also ensure the replacement member is correct=
ly
> > +aligned and its size won't exceed the reserved space.
> > +
> > +4.3.2. Hiding members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Predicting which structures will require changes during the support
> > +timeframe isn't always possible, in which case one might have to resor=
t
> > +to placing new members into existing alignment holes::
> > +
> > +        struct s {
> > +                int a;
> > +                /* a 4-byte alignment hole */
> > +                unsigned long b;
> > +        };
> > +
> > +
> > +While this won't change the size of the data structure, one needs to
> > +be able to hide the added members from symbol versioning. Similarly
> > +to reserved fields, this can be accomplished by wrapping the added
> > +member to a union where one of the fields has a name starting with
> > +`__kabi_ignored`::
> > +
> > +        struct s {
> > +                int a;
> > +                union {
> > +                        char __kabi_ignored_0;
> > +                        int n;
> > +                };
> > +                unsigned long b;
> > +        };
> > +
> > +With **--stable**, both versions produce the same symbol version.
> > diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/inde=
x.rst
> > index cee2f99f734b..e82af05cd652 100644
> > --- a/Documentation/kbuild/index.rst
> > +++ b/Documentation/kbuild/index.rst
> > @@ -21,6 +21,7 @@ Kernel Build System
> >      reproducible-builds
> >      gcc-plugins
> >      llvm
> > +    gendwarfksyms
> >
> >  .. only::  subproject and html
> >
> > --
> > 2.47.0.371.ga323438b13-goog
> >
>
>
> --
> Best Regards
>
>
>
> Masahiro Yamada

