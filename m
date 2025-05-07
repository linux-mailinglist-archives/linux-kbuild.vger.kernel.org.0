Return-Path: <linux-kbuild+bounces-6999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4872AADF30
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6BF29C0F0F
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BAE25EFBE;
	Wed,  7 May 2025 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbPwGefw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5214425E81D;
	Wed,  7 May 2025 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620904; cv=none; b=DYaycjWIHhkr8Lsad52tGA2rJg/lrZWl/sAPLfvwi3rFHkrt81kk5ZinFL9zImt+mI9rhWI+cA9k63ZWSI4j+l5xWQFVgwiSGzKFgqg48Vu6bz1LxeWLAcvKqNirqCerDBOCtRI4Mr2LRTDUcmdxr4buICZj8eJAxtPS+AJ2f1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620904; c=relaxed/simple;
	bh=OE8r8roK96uAKw4vsaj4b8alMxGkuxoqdOjfYJDmboo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aM/gOG8ZIrc4/kAXvEgdHfM5LJGTQSKslW7I/X4HDIqz1uDL7W/0I4bvLJotbFgfTul7ebWW9zjcMoc9u1LdO/lorYJ7RNJ5do2Vwl4awphA21xvD1T2qfUnZ0qbNno/0B0FQZl9omCFRDgbxkkgXxrUQNbKE9xrnIKK6ymzjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbPwGefw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CBEC4AF09;
	Wed,  7 May 2025 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620903;
	bh=OE8r8roK96uAKw4vsaj4b8alMxGkuxoqdOjfYJDmboo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lbPwGefwScSp3VnPzsm/H7G4nK1Cxh6ErTBjyEXijHU8jovXlTeHyJc5+1vYJg3Vn
	 SL0fBqcrRjJg6pQA7CEKy6lvM90lmKZ6yw6Li5gYosGTn0oi37/VVaLgQbN9FVRnne
	 uSO7CVFWQRkAu46xVlt+qLsk9wtgMpBZM68/qsxbG7uYVZRWhsdVyf/Prq5G7Sus5E
	 aF9rDkQZvxcGl5icc+v5DkPzHcS5UMdjDZsdacPcKTPGcYJXgTMwg/u5AKq3c4OLqi
	 Q+WS7u8zkn7tS+1JMC4TFRb2XcRckgUO/Lnv/XB2nlBEe2dI1DNP54+f8T5Ya6RrQ+
	 KNfKcfsc7ZP8Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so7799026e87.2;
        Wed, 07 May 2025 05:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU97jSthxWuAyaLBkUDvsTb2BqN2TsZQxTN2TmCeH5Vyu1caoVgYE0+OdMDP4b11C7gge7ufNkU09+UUpf55A==@vger.kernel.org, AJvYcCW4MbwGmVQ1FhMW7eh2iCjZNKmSON71+2y17+cYoJGHR4xbuY6RFkvY9NqO0C9gGUlgqfqypSQKb8o4XUmQ@vger.kernel.org, AJvYcCWZU6u94AwyYKcmBuWaDigP6wjQiCKnbk+9yUT3Cujj+7rWo5Q+YjQOE84umLi1x4FIHcKlf5fqaXsgB2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4vLGhRpzgTx4GAz+GcpzEtuiWsoT4AlxQUneSYqLluhoc4jR
	QYdzS7nTMSet46zCSCGPXmueeUNFINPeJ5srG73pFcWCiF+7tZP0UoMcnAizaF8X2TYcSxJanoh
	QX/G1DA5VRCCWYg+kMIma/c0kd3g=
X-Google-Smtp-Source: AGHT+IFgMAPq+hiKKe/7C3leO+9eXxhUQDBh3X5JkXUdD4isQhZxNaAVJ+XOOXQwgmx3BaKv6yQgC8QDsNaeXD/c5Ig=
X-Received: by 2002:a05:6512:10cc:b0:549:8db6:b2dd with SMTP id
 2adb3069b0e04-54fb92a3ac8mr1207849e87.31.1746620902419; Wed, 07 May 2025
 05:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505212401.3379699-6-samitolvanen@google.com> <20250505212401.3379699-10-samitolvanen@google.com>
In-Reply-To: <20250505212401.3379699-10-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 May 2025 21:27:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
X-Gm-Features: ATxdqUFN1YL8B_40y52RHamgoHz9_0Jw0cmMFy9Iiio91M2klLicBkuQDsXFblc
Message-ID: <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Documentation/kbuild: Add new gendwarfksyms kABI rules
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:24=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Document byte_size and type_string kABI stability rules. Also fix
> the section numbers while we're at it.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  Documentation/kbuild/gendwarfksyms.rst | 103 +++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuil=
d/gendwarfksyms.rst
> index e4beaae7e456..8b0d7ebbb084 100644
> --- a/Documentation/kbuild/gendwarfksyms.rst
> +++ b/Documentation/kbuild/gendwarfksyms.rst
> @@ -125,14 +125,17 @@ the rules. The fields are as follows:
>    qualified name of the DWARF Debugging Information Entry (DIE).
>  - `value`: Provides rule-specific data.
>
> -The following helper macro, for example, can be used to specify rules
> +The following helper macros, for example, can be used to specify rules
>  in the source code::
>
> -       #define __KABI_RULE(hint, target, value)                         =
    \
> -               static const char __PASTE(__gendwarfksyms_rule_,         =
    \
> +       #define ___KABI_RULE(hint, target, value)                        =
   \
> +               static const char __PASTE(__gendwarfksyms_rule_,         =
    \
>                                           __COUNTER__)[] __used __aligned=
(1) \
>                         __section(".discard.gendwarfksyms.kabi_rules") =
=3D     \
> -                               "1\0" #hint "\0" #target "\0" #value
> +                               "1\0" #hint "\0" target "\0" value
> +
> +       #define __KABI_RULE(hint, target, value) \
> +               ___KABI_RULE(hint, #target, #value)
>
>
>  Currently, only the rules discussed in this section are supported, but
> @@ -223,7 +226,88 @@ Example usage::
>         KABI_ENUMERATOR_IGNORE(e, C);
>         KABI_ENUMERATOR_VALUE(e, LAST, 2);
>
> -4.3. Adding structure members
> +4.1.3. Managing structure size changes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A data structure can be partially opaque to modules if its allocation is
> +handled by the core kernel, and modules only need to access some of its
> +members. In this situation, it's possible to append new members to the
> +structure without breaking the ABI, as long as the layout for the origin=
al
> +members remains unchanged.
> +
> +To append new members, we can hide them from symbol versioning as
> +described in section :ref:`Hiding members <hiding_members>`, but we can'=
t
> +hide the increase in structure size. The `byte_size` rule allows us to
> +override the structure size used for symbol versioning.
> +
> +The rule fields are expected to be as follows:
> +
> +- `type`: "byte_size"
> +- `target`: The fully qualified name of the target data structure
> +  (as shown in **--dump-dies** output).
> +- `value`: A positive decimal number indicating the structure size
> +  in bytes.
> +
> +Using the `__KABI_RULE` macro, this rule can be defined as::
> +
> +        #define KABI_BYTE_SIZE(fqn, value) \
> +                __KABI_RULE(byte_size, fqn, value)
> +
> +Example usage::
> +
> +       struct s {
> +                /* Unchanged original members */
> +               unsigned long a;
> +                void *p;
> +
> +                /* Appended new members */
> +                KABI_IGNORE(0, unsigned long n);
> +       };
> +
> +       KABI_BYTE_SIZE(s, 16);
> +
> +4.1.4. Overriding type strings
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +In rare situations where distributions must make significant changes to
> +otherwise opaque data structures that have inadvertently been included
> +in the published ABI, keeping symbol versions stable using the more
> +targeted kABI rules can become tedious. The `type_string` rule allows us
> +to override the full type string for a type or a symbol, and even add
> +types for versioning that no longer exist in the kernel.
> +
> +The rule fields are expected to be as follows:
> +
> +- `type`: "type_string"
> +- `target`: The fully qualified name of the target data structure
> +  (as shown in **--dump-dies** output) or symbol.
> +- `value`: A valid type string (as shown in **--symtypes**) output)
> +  to use instead of the real type.
> +
> +Using the `__KABI_RULE` macro, this rule can be defined as::
> +
> +       #define KABI_TYPE_STRING(type, str) \
> +               ___KABI_RULE("type_string", type, str)
> +
> +Example usage::
> +
> +       /* Override type for a structure */
> +       KABI_TYPE_STRING("s#s",
> +               "structure_type s { "
> +                       "member base_type int byte_size(4) "
> +                               "encoding(5) n "
> +                       "data_member_location(0) "
> +               "} byte_size(8)");
> +
> +       /* Override type for a symbol */
> +       KABI_TYPE_STRING("my_symbol", "variable s#s");
> +
> +The `type_string` rule should be used only as a last resort if maintaini=
ng
> +a stable symbol versions cannot be reasonably achieved using other
> +means. Overriding a type string increases the risk of actual ABI breakag=
es
> +going unnoticed as it hides all changes to the type.
> +
> +4.2. Adding structure members
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
>  Perhaps the most common ABI compatible change is adding a member to a
> @@ -237,7 +321,7 @@ natural method. This section describes gendwarfksyms =
support for using
>  reserved space in data structures and hiding members that don't change
>  the ABI when calculating symbol versions.
>
> -4.3.1. Reserving space and replacing members
> +4.2.1. Reserving space and replacing members
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Hmm, renumbering is annoying.

Maybe, better to stop managing section numbers?

For example, see this commit
1a4c1c9df72ec266f94631edc59f9f2a9dc5aa8c



--=20
Best Regards
Masahiro Yamada

