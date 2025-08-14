Return-Path: <linux-kbuild+bounces-8471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9EB268F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 16:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A8F604C6C
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 14:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43A3212B31;
	Thu, 14 Aug 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/yrQwQe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCA21255F;
	Thu, 14 Aug 2025 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180186; cv=none; b=oO864Ov1ar50wdMG/6C1VCFlsd3M/To1RvZSyKg/0KHldyouoXDGoaFICXGcjCdidFaSGbsSXpW4fqgB9c4P86a9uaVsxrlGINQ6/A3b3nKtdpHNbBx5k5iqAP8XXSoi7Bt8Wwwqr7dBxEK7o7R8W6N9T/XBBIqMW71lZ/LjHcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180186; c=relaxed/simple;
	bh=fkuvnt/nhIsW4uFPf54kchcjyRpmPi2o2BwgdSR5hnI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=nWBM3PKrCWD7T9AXWgwg1m2EIH4rEjHvDeZgGeenxtcPhzdZ9q4Wn0jGEkq9rn13RrWCNenCO33GDKmC41c4I6nN+NUF76KW6S+BTabAcTcRWvnRT8dkmAsEr/ZFLdLM7vThRC/z3aQRDQgCTigtn8iwflTzFAj6DNQvnAMjnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/yrQwQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B321C4CEED;
	Thu, 14 Aug 2025 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755180186;
	bh=fkuvnt/nhIsW4uFPf54kchcjyRpmPi2o2BwgdSR5hnI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=J/yrQwQeD2hK6mnXREmbW4FpJfJihpyW/1NonyUrtiB+aWjWzHdAQdABNc7t7WOx2
	 9FC9s+4QLnvgR/pNReqjZ2ZHTLvrT9yv0YcNYDfFV6A85N7pu03tcsdyMKj8WrlZ3s
	 MbbtYy6hvPPKiY1awBXz1RAD3Nfhoufkl5K7MHGHVcVJlbXWSrD3rSuR563nD8P854
	 a0LEbyYYSinpH2iCsu7GF4cv12jWMJXxStjdzofDPhkkeSNq8ffDKYkUdy3iuXmAb4
	 LoSkOagbNnGxdtNWXrtFa02/1IHp5QA8eFiDZgLPk8a+2Tz56+ImyxXsK1qlnj082k
	 +0OEfGLGZiDUQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 16:03:01 +0200
Message-Id: <DC27G409IQGT.H9G83QDQ9V7R@kernel.org>
To: "Alexey Gladkov" <legion@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Masahiro Yamada" <masahiroy@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 <linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 <rust-for-linux@vger.kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
 <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
 <DC26OG2L7OMH.31RE7460D4DHU@kernel.org> <aJ3qsonmvUUErQx9@example.org>
In-Reply-To: <aJ3qsonmvUUErQx9@example.org>

On Thu Aug 14, 2025 at 3:54 PM CEST, Alexey Gladkov wrote:
> On Thu, Aug 14, 2025 at 03:26:53PM +0200, Danilo Krummrich wrote:
>> On Thu Aug 14, 2025 at 3:07 PM CEST, Alexey Gladkov wrote:
>> > At this point, if a symbol is compiled as part of the kernel,
>> > information about which module the symbol belongs to is lost.
>> >
>> > To save this it is possible to add the module name to the alias name.
>> > It's not very pretty, but it's possible for now.
>> >
>> > Cc: Miguel Ojeda <ojeda@kernel.org>
>> > Cc: Andreas Hindborg <a.hindborg@kernel.org>
>> > Cc: Danilo Krummrich <dakr@kernel.org>
>> > Cc: Alex Gaynor <alex.gaynor@gmail.com>
>> > Cc: rust-for-linux@vger.kernel.org
>> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
>> > ---
>> >  include/linux/module.h   | 14 +++++++++++++-
>> >  rust/kernel/device_id.rs |  8 ++++----
>> >  scripts/mod/file2alias.c | 18 ++++++++++++++----
>> >  3 files changed, 31 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/include/linux/module.h b/include/linux/module.h
>> > index 3319a5269d28..e31ee29fac6b 100644
>> > --- a/include/linux/module.h
>> > +++ b/include/linux/module.h
>> > @@ -244,10 +244,22 @@ struct module_kobject *lookup_or_create_module_k=
object(const char *name);
>> >  /* What your module does. */
>> >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _de=
scription)
>> > =20
>> > +/*
>> > + * Format: __mod_device_table__kmod_<modname>__<type>__<name>
>> > + * Parts of the string `__kmod_` and `__` are used as delimiters when=
 parsing
>> > + * a symbol in file2alias.c
>> > + */
>> > +#define __mod_device_table(type, name)	\
>> > +	__PASTE(__mod_device_table__,	\
>> > +	__PASTE(__KBUILD_MODNAME,	\
>> > +	__PASTE(__,			\
>> > +	__PASTE(type,			\
>> > +	__PASTE(__, name)))))
>> > +
>> >  #ifdef MODULE
>> >  /* Creates an alias so file2alias.c can find device table. */
>> >  #define MODULE_DEVICE_TABLE(type, name)					\
>> > -static typeof(name) __mod_device_table__##type##__##name		\
>> > +static typeof(name) __mod_device_table(type, name)			\
>> >    __attribute__ ((used, alias(__stringify(name))))
>> >  #else  /* !MODULE */
>> >  #define MODULE_DEVICE_TABLE(type, name)
>> > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
>> > index 70d57814ff79..62c42da12e9d 100644
>> > --- a/rust/kernel/device_id.rs
>> > +++ b/rust/kernel/device_id.rs
>> > @@ -195,10 +195,10 @@ macro_rules! module_device_table {
>> >      ($table_type: literal, $module_table_name:ident, $table_name:iden=
t) =3D> {
>> >          #[rustfmt::skip]
>> >          #[export_name =3D
>> > -            concat!("__mod_device_table__", $table_type,
>> > -                    "__", module_path!(),
>> > -                    "_", line!(),
>> > -                    "_", stringify!($table_name))
>> > +            concat!("__mod_device_table__", line!(),
>>=20
>> Why do we have line!() between "__mod_device_table__" and "__kmod_", whi=
le the
>> format is defined as "__mod_device_table__kmod_<modname>__<type>__<name>=
" above?
>
> The "__mod_device_table__" is used to filter symbols.
> The meaning part starts after "__kmod_" part. After that, order becomes
> important.
>
>> The previous logic was to create a unique name with
>> using "<module_path>_<line>_<table_name>" as "<name>". So, I think this =
should
>> actually be:
>>=20
>> 	concat!("__mod_device_table__kmod_",
>> 		module_path!(),
>> 		"__", $table_type,
>> 		"__", stringify!($table_name),
>> 		"_", line!())
>>=20
>> rather than the below.
>
> No. "stringify!($table_name)" should be the last thing in this string.
> This is the a symbol name that will be searched for in the elf to generat=
e
> modalias.

$table_name is not guaranteed to be unique for a certain module_path!(), he=
nce
we need line!() to guarantee uniqueness.

The symbol name will be unique no matter where you place line!() of course,=
 but
$table_name + line!() is the unique table name, which I think is what we wa=
nt?

>>=20
>> > +                    "__kmod_", module_path!(),
>> > +                    "__", $table_type,
>> > +                    "__", stringify!($table_name))
>> >          ]
>> >          static $module_table_name: [::core::mem::MaybeUninit<u8>; $ta=
ble_name.raw_ids().size()] =3D
>> >              unsafe { ::core::mem::transmute_copy($table_name.raw_ids(=
)) };
>>=20
>
> --=20
> Rgrds, legion


