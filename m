Return-Path: <linux-kbuild+bounces-8477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CBB27106
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 23:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B52C2160760
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 21:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8503F2749DA;
	Thu, 14 Aug 2025 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXJpknXi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FC1A238C;
	Thu, 14 Aug 2025 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755207992; cv=none; b=PG+iUuXdnOZeV3df47cfaTWh0upp5zE/ro6hIqaHCHtLcdJK+Tl5VgKnu1M0oCChw8Ho0t8tEsqF8T+KEvNj1l8mLB3o8s6NSV8e6xqz5RqxYit3b7jmpbw0ItFR96kL5nM8EjPeQJspP9UDO+KDjH4M/GPK7QTMXSVw3jG9lU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755207992; c=relaxed/simple;
	bh=H5t50i2Arx8cGLKWfYb6yZf07e2LtwSpP7PZAJqXp/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMJVvrElGdagDOXV97f2v/i2IpoQm5sxLLQgUD4lWyyM/OUsX3KcAf7BM9qNRr5jW6YTg3TMtLEcP/WKJKg6mKOXcQKHSbkhrJI0VydIz8t/OBW/xCReBua8LJeX8RDngbB4csRBMkDGFsNQ7fAkhUT2IbfjlZccGbjaWvwI7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXJpknXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECAAC4CEED;
	Thu, 14 Aug 2025 21:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755207991;
	bh=H5t50i2Arx8cGLKWfYb6yZf07e2LtwSpP7PZAJqXp/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXJpknXinO50P0+vSaRs7K7YYw4Wo4RbRFwUweNTAz5Nk84MifsScECN9mkqAPJfz
	 8SU0cz4tqZpvri04RpBLcInZpWOOi+L1LslTZUe5sAFUo/C4EPYzAi1oHFhzn5xPRf
	 78sBywQ+wpIeohQxeuP/86TNWP9NC5vqzt6SaG9atDJ+QaOAfVRmev1qNHTjLykCfB
	 17ZmC/qHErJa4+TdyyLg5CwJp5vN0S8EbmY75Q6FI0o2Qk4DouzT91XSOpPJB6HC6T
	 GAKUSJV8Z5yQ2roiQCffAaYgeSUI1qq19G8Eoj3Nb2l2NWOklMOdPLLysQp4aIPgAT
	 QMSL6YQQhwsfA==
Date: Thu, 14 Aug 2025 23:46:24 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Message-ID: <aJ5ZMJC4eCpDb5D8@example.org>
References: <cover.1755170493.git.legion@kernel.org>
 <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
 <DC26OG2L7OMH.31RE7460D4DHU@kernel.org>
 <aJ3qsonmvUUErQx9@example.org>
 <DC27G409IQGT.H9G83QDQ9V7R@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DC27G409IQGT.H9G83QDQ9V7R@kernel.org>

On Thu, Aug 14, 2025 at 04:03:01PM +0200, Danilo Krummrich wrote:
> On Thu Aug 14, 2025 at 3:54 PM CEST, Alexey Gladkov wrote:
> > On Thu, Aug 14, 2025 at 03:26:53PM +0200, Danilo Krummrich wrote:
> >> On Thu Aug 14, 2025 at 3:07 PM CEST, Alexey Gladkov wrote:
> >> > At this point, if a symbol is compiled as part of the kernel,
> >> > information about which module the symbol belongs to is lost.
> >> >
> >> > To save this it is possible to add the module name to the alias name.
> >> > It's not very pretty, but it's possible for now.
> >> >
> >> > Cc: Miguel Ojeda <ojeda@kernel.org>
> >> > Cc: Andreas Hindborg <a.hindborg@kernel.org>
> >> > Cc: Danilo Krummrich <dakr@kernel.org>
> >> > Cc: Alex Gaynor <alex.gaynor@gmail.com>
> >> > Cc: rust-for-linux@vger.kernel.org
> >> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> >> > ---
> >> >  include/linux/module.h   | 14 +++++++++++++-
> >> >  rust/kernel/device_id.rs |  8 ++++----
> >> >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> >> >  3 files changed, 31 insertions(+), 9 deletions(-)
> >> >
> >> > diff --git a/include/linux/module.h b/include/linux/module.h
> >> > index 3319a5269d28..e31ee29fac6b 100644
> >> > --- a/include/linux/module.h
> >> > +++ b/include/linux/module.h
> >> > @@ -244,10 +244,22 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> >> >  /* What your module does. */
> >> >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
> >> >  
> >> > +/*
> >> > + * Format: __mod_device_table__kmod_<modname>__<type>__<name>
> >> > + * Parts of the string `__kmod_` and `__` are used as delimiters when parsing
> >> > + * a symbol in file2alias.c
> >> > + */
> >> > +#define __mod_device_table(type, name)	\
> >> > +	__PASTE(__mod_device_table__,	\
> >> > +	__PASTE(__KBUILD_MODNAME,	\
> >> > +	__PASTE(__,			\
> >> > +	__PASTE(type,			\
> >> > +	__PASTE(__, name)))))
> >> > +
> >> >  #ifdef MODULE
> >> >  /* Creates an alias so file2alias.c can find device table. */
> >> >  #define MODULE_DEVICE_TABLE(type, name)					\
> >> > -static typeof(name) __mod_device_table__##type##__##name		\
> >> > +static typeof(name) __mod_device_table(type, name)			\
> >> >    __attribute__ ((used, alias(__stringify(name))))
> >> >  #else  /* !MODULE */
> >> >  #define MODULE_DEVICE_TABLE(type, name)
> >> > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> >> > index 70d57814ff79..62c42da12e9d 100644
> >> > --- a/rust/kernel/device_id.rs
> >> > +++ b/rust/kernel/device_id.rs
> >> > @@ -195,10 +195,10 @@ macro_rules! module_device_table {
> >> >      ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
> >> >          #[rustfmt::skip]
> >> >          #[export_name =
> >> > -            concat!("__mod_device_table__", $table_type,
> >> > -                    "__", module_path!(),
> >> > -                    "_", line!(),
> >> > -                    "_", stringify!($table_name))
> >> > +            concat!("__mod_device_table__", line!(),
> >> 
> >> Why do we have line!() between "__mod_device_table__" and "__kmod_", while the
> >> format is defined as "__mod_device_table__kmod_<modname>__<type>__<name>" above?
> >
> > The "__mod_device_table__" is used to filter symbols.
> > The meaning part starts after "__kmod_" part. After that, order becomes
> > important.
> >
> >> The previous logic was to create a unique name with
> >> using "<module_path>_<line>_<table_name>" as "<name>". So, I think this should
> >> actually be:
> >> 
> >> 	concat!("__mod_device_table__kmod_",
> >> 		module_path!(),
> >> 		"__", $table_type,
> >> 		"__", stringify!($table_name),
> >> 		"_", line!())
> >> 
> >> rather than the below.
> >
> > No. "stringify!($table_name)" should be the last thing in this string.
> > This is the a symbol name that will be searched for in the elf to generate
> > modalias.
> 
> $table_name is not guaranteed to be unique for a certain module_path!(), hence
> we need line!() to guarantee uniqueness.
> 
> The symbol name will be unique no matter where you place line!() of course, but
> $table_name + line!() is the unique table name, which I think is what we want?

Again, no. We need the entire symbol to be unique so that the linker
doesn't complain. In fact, this symbol will later be removed from the elf.
It is only needed for the modpost utility.

The modpost requires a format symbol:

__mod_device_table__<random>*__kmod_<modname>__<type>__<name>

"<random>*" may or may not exist. This is a place to add uniqueness if
needed.

The fields "<modname>”, "<type>" and "<name>" must be very specific and
must not be random. These values are used for generation.

> 
> >> 
> >> > +                    "__kmod_", module_path!(),
> >> > +                    "__", $table_type,
> >> > +                    "__", stringify!($table_name))
> >> >          ]
> >> >          static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
> >> >              unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
> >> 
> >
> > -- 
> > Rgrds, legion
> 

-- 
Rgrds, legion


